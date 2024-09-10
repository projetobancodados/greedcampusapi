# models/cards_model.py

import mysql.connector
from mysql.connector import Error

from config import DB_CONFIG

# Connect to MySQL database
def get_db_connection():
  try:
      conn = mysql.connector.connect(**DB_CONFIG)
      return conn
  except Error as e:
      print(f"Error connecting to MySQL: {e}")
      return None

class CardModel:
    """
    Classe responsável por gerenciar todas as transações relacionadas à entidade Cards.
    Interage com a tabela `Books_Cards`, que mapeia a relação entre Books (Hunter) e suas Cards.
    """

    def __init__(self):
        """
        Inicializa a classe com uma conexão ao banco de dados.
        """
        self.conn = get_db_connection()

    def get_available_cards(self, hunter_id):
        """
        Retorna todas as cartas disponíveis no sistema com suas respectivas quantidades e detalhes.
        Isso inclui título, descrição, nível de dificuldade, quantidade, etc.
        """
        if self.conn:
            cursor = self.conn.cursor(dictionary=True)
            cursor.execute(f'''
              SELECT c.Title, c.Quantity, c.Description,
              c.Card_Id, c.Card_Img, c.Slot_Number,
              c.Difficulty_Code, cd.Difficulty_Description,
              (20000000 - (1000 * c.Difficulty_Code)) AS Card_Value
              FROM Cards c
              INNER JOIN Cards_Difficulty cd ON cd.Difficulty_Code = c.Difficulty_Code
              WHERE (20000000 - (1000 * c.Difficulty_Code)) <= (SELECT Jenny_Qtd from Hunter_Stats WHERE Hunter_Id = {hunter_id})
              ORDER BY c.Slot_Number ASC
            ''')
            cards = cursor.fetchall()
            cursor.close()
            return cards
        return []

    def add_card_to_book(self, add_card_data):
        """
        Adiciona uma carta ao Book do jogador (hunter_id) se houver quantidade disponível.
        Atualiza a tabela de `Books_Cards` para associar a carta ao Book (idbook) do Hunter.
        Diminui a quantidade da carta no banco de dados se adicionada com sucesso.
        """
        if self.conn:
            cursor = self.conn.cursor()
            cursor.callproc('GrantCardToHunterByChallenge', add_card_data)
            cursor.close()

    def remove_card_from_book(self, hunter_id, card_id):
        """
        Remove uma carta do Book do Hunter (com base no Hunter_Id e no Card_Id), com restrições:
        - Não pode remover a carta 'J 10.000'
        - Não pode remover a última unidade de uma carta disponível no jogo
        """
        if self.conn:
            cursor = self.conn.cursor()

            # Verificar se a carta é a "J 10.000" ou se é a última unidade disponível
            cursor.execute('SELECT Title, Quantity FROM Cards WHERE Card_Id = %s', (card_id,))
            card = cursor.fetchone()

            if card and card['Title'] == 'J 10.000':
                return {"msg": "A carta 'J 10.000' não pode ser removida."}
            elif card and card['Quantity'] == 0:
                return {"msg": "A última unidade desta carta não pode ser removida."}
            else:
                # Remover a carta do Book do Hunter (via tabela associativa Books_Cards)
                cursor.execute('''
                    DELETE FROM Books_Cards 
                    WHERE idcard = %s AND idbook = (SELECT Book_Id FROM Books WHERE Hunter_Id = %s)
                ''', (card_id, hunter_id))

                # Aumentar a quantidade de cartas no sistema
                cursor.execute('UPDATE Cards SET Quantity = Quantity + 1 WHERE Card_Id = %s', (card_id,))

                self.conn.commit()
            cursor.close()

    def get_cards_in_book(self, hunter_id):
      
      """
      Retorna todas as cartas que o Hunter (hunter_id) possui em seu Book.
      Consulta a tabela associativa `Books_Cards` para verificar as cartas associadas ao Book de um Hunter.
      """
      if self.conn:
          cursor = self.conn.cursor(dictionary=True)
          cursor.execute('''
              SELECT c.Card_Id, c.Title, c.Description,
              c.Card_Img, c.Difficulty_Code, c.Quantity,
              cd.Difficulty_Description, c.Slot_Number,
              (20000000 - (1000 * c.Difficulty_Code)) AS Card_Value
              FROM Cards c
              JOIN Cards_Difficulty cd ON cd.Difficulty_Code = c.Difficulty_Code
              JOIN Books_Cards bc ON c.Card_Id = bc.Card_Id
              JOIN Books b ON bc.Book_Id = b.Book_Id
              WHERE b.Hunter_Id = %s
              ORDER BY c.Slot_Number ASC
          ''', (hunter_id,))
          cards = cursor.fetchall()
          cursor.close()
          return cards

    def buy_card_with_question(self, hunter_id, card_id, jenny_paid, answer):
        """
        Permite que o Hunter compre uma carta respondendo uma pergunta.
        - Verifica se o Hunter tem Jenny suficiente
        - Se a resposta estiver correta, adiciona a carta ao Book do jogador
        """
        if self.conn:
            cursor = self.conn.cursor()

            # Verificar se o Hunter tem Jenny suficiente
            cursor.execute('SELECT Jenny_Qtd FROM Hunter_Stats WHERE Hunter_Id = %s', (hunter_id,))
            hunter_stats = cursor.fetchone()

            if hunter_stats and hunter_stats['Jenny_Qtd'] >= jenny_paid:
                # Cobrar Jenny do jogador
                cursor.execute('UPDATE Hunter_Stats SET Jenny_Qtd = Jenny_Qtd - %s WHERE Hunter_Id = %s', (jenny_paid, hunter_id))

                self.conn.commit()
            cursor.close()

    def trade_card_between_hunters(self, hunter_id_from, hunter_id_to, card_id):
        """
        Permite que dois Hunters troquem cartas entre si.
        Remove a carta do Hunter de origem (hunter_id_from) e a adiciona ao Hunter de destino (hunter_id_to).
        """
        if self.conn:
          cursor = self.conn.cursor()
          cursor.callproc('GrantCardToHunterByBuying', (hunter_id_from, hunter_id_to, card_id))
          cursor.close()

    def __del__(self):
        """
        Método destrutor para garantir que a conexão com o banco de dados seja fechada.
        """
        if self.conn:
            self.conn.close()

#criação das tables necessárias para execução de cards
def create_cards_difficulty_table():
  """
  Cria a tabela Cards_Difficulty no banco de dados
  """
  conn = get_db_connection()  # Inicializa a conexão com o banco de dados
  if conn:
      cursor = conn.cursor()
      cursor.execute('''
        CREATE TABLE IF NOT EXISTS Cards_Difficulty 
        ( 
        Difficulty_Code INT NOT NULL AUTO_INCREMENT,  
        Difficulty_Description Varchar(10),
        PRIMARY KEY (Difficulty_Code)
        );
      ''')
      conn.commit()  # Confirma a criação da tabela
      cursor.close()
      conn.close()


def create_cards_table():
    """
    Cria a tabela Cards no banco de dados.
    """
    conn = get_db_connection()  # Inicializa a conexão com o banco de dados
    if conn:
        cursor = conn.cursor()
        cursor.execute('''
          CREATE TABLE IF NOT EXISTS Cards 
          ( 
            Title Varchar(500) NOT NULL,  
            Quantity BIGINT UNSIGNED NOT NULL,  
            Description varchar(500) NOT NULL,  
            Card_Id INT NOT NULL AUTO_INCREMENT,  
            Card_Img LONGBLOB,  
            Slot_Number Varchar(20),
            Difficulty_Code INT NOT NULL,  
            PRIMARY KEY (Card_Id),
            FOREIGN KEY (Difficulty_Code) REFERENCES Cards_Difficulty (Difficulty_Code) ON DELETE CASCADE
          ); 
        ''')
        conn.commit()  # Confirma a criação da tabela
        cursor.close()
        conn.close()


def create_book_cards_table():
    """
    Cria a tabela associativa Books_Cards entre Books e Cards.
    """
    conn = get_db_connection()  # Inicializa a conexão com o banco de dados
    if conn:
        cursor = conn.cursor()
        cursor.execute('''
          CREATE TABLE IF NOT EXISTS Books_Cards 
          ( 
            Card_Id INT NOT NULL,  
            Book_Id INT NOT NULL,
            PRIMARY KEY (Card_Id, Book_Id),
            FOREIGN KEY (Card_Id) REFERENCES Cards(Card_Id),
            FOREIGN KEY (Book_Id) REFERENCES Books(Book_Id)
          );
        ''')
        conn.commit()  # Confirma a criação da tabela associativa
        cursor.close()
        conn.close()
        
        
def create_card_challenge_table():
    """
    Cria a tabela Card_Challenge.
    """
    conn = get_db_connection()  # Inicializa a conexão com o banco de dados
    if conn:
        cursor = conn.cursor()
        cursor.execute('''
          CREATE TABLE IF NOT EXISTS Card_Challenge 
          ( 
            Card_Challenge_Id INT NOT NULL AUTO_INCREMENT,  
            Card_Id INT NOT NULL,  
            PRIMARY KEY (Card_Challenge_Id),
            FOREIGN KEY (Card_Id) REFERENCES Cards (Card_Id) ON DELETE CASCADE
          );
        ''')
        conn.commit()  # Confirma a criação da tabela associativa
        cursor.close()
        conn.close()
        

def add_card_challenge(card_id):
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.execute(f'''
      INSERT INTO Card_Challenge (Card_Id) VALUES ({card_id})
    ''')
    card_challenge_id = cursor.lastrowid
    conn.commit()
    cursor.close()
    conn.close()
    return card_challenge_id
  

def check_card_challenge(card_id, hunter_id):
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor(dictionary=True)
    cursor.execute(f'''
      SELECT cc.Card_Challenge_Id FROM Card_Challenge cc
      INNER JOIN Card_Challenge_Answer cca ON cca.Card_Challenge_Id = cc.Card_Challenge_Id
      INNER JOIN Answers a ON a.Answer_Id = cca.Answer_Id
      WHERE cc.Card_Id = {card_id} AND a.Hunter_Id = {hunter_id}
    ''')
    card_challenge = cursor.fetchone()
    cursor.close()
    conn.close()
    return card_challenge


def remove_card_challenge(card_challenge_id):
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.execute(f'''
      DELETE FROM Card_Challenge WHERE Card_Challenge_Id = {card_challenge_id}
    ''')
    conn.commit()
    cursor.close()
    conn.close()


def create_card_challenge_answer_table():
    """
    Cria a tabela associativa Card_Challenge_Answer, entre Card_Challenge e Answer.
    """
    conn = get_db_connection()  # Inicializa a conexão com o banco de dados
    if conn:
        cursor = conn.cursor()
        cursor.execute('''
          CREATE TABLE IF NOT EXISTS Card_Challenge_Answer 
          ( 
            Card_Challenge_Id INT NOT NULL,  
            Answer_Id INT NOT NULL,
            PRIMARY KEY (Card_Challenge_Id, Answer_Id),
            FOREIGN KEY (Card_Challenge_Id) REFERENCES Card_Challenge (Card_Challenge_Id) ON DELETE CASCADE,
            FOREIGN KEY (Answer_Id) REFERENCES Answers (Answer_Id) ON DELETE CASCADE
          );
        ''')
        conn.commit()  # Confirma a criação da tabela associativa
        cursor.close()
        conn.close()
        
def add_card_challenge_answer(answer_id, card_challenge_id):
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.execute('''
      INSERT INTO Card_Challenge_Answer (Answer_Id, Card_Challenge_Id) VALUES (%s, %s)               
    ''', (answer_id, card_challenge_id))
    conn.commit()
    cursor.close()
    conn.close()
    
    
def create_grant_card_by_challenge_procedure():
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.execute('''
      CREATE OR REPLACE PROCEDURE GrantCardToHunterByChallenge(
        IN cardId INT,
        IN bookId INT,
        IN hunterId INT,
        IN answerId INT,
        IN cardChallengeId INT
      )
      BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION 
        BEGIN
          ROLLBACK;
        END;
        START TRANSACTION;
        INSERT INTO Books_Cards (Card_Id, Book_Id) VALUES (cardId, bookId);
        UPDATE Hunter_Stats 
        SET Cards_Qtd = (
          SELECT COUNT(DISTINCT Card_Id) FROM Books_Cards
          WHERE Book_Id = bookId
        )
        WHERE Hunter_Id = hunterId;
        UPDATE Cards SET Quantity = Quantity - 1 WHERE Card_Id = cardId;
        DELETE FROM Answers WHERE Answer_Id = answerId;
        DELETE FROM Card_Challenge WHERE Card_Challenge_Id = cardChallengeId;
        COMMIT;
      END            
    ''')
    cursor.close()
    conn.close()
    
    
def create_grant_card_by_buying_procedure():
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.execute('''
      CREATE OR REPLACE PROCEDURE GrantCardToHunterByBuying(
        IN ownerHunterId INT,
        IN buyerHunterId INT,
        IN cardId INT
      )
      BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
          ROLLBACK;
        END;
        START TRANSACTION;

        INSERT INTO Books_Cards (Card_Id, Book_Id) VALUES (cardId,
        (SELECT Book_Id FROM Books WHERE Hunter_Id = buyerHunterId));

        UPDATE Hunter_Stats SET Jenny_Qtd = Jenny_Qtd - (
          SELECT (20000000 - (Difficulty_Code * 1000)) FROM Cards WHERE Card_Id = cardId
        ) WHERE Hunter_Id = buyerHunterId;

        DELETE FROM Books_Cards WHERE (Card_Id = cardId AND Book_Id = (
          SELECT Book_Id FROM Books WHERE Hunter_Id = ownerHunterId)
        );

        UPDATE Hunter_Stats 
        SET Cards_Qtd = (
          SELECT COUNT(DISTINCT Card_Id) FROM Books_Cards
          WHERE Book_Id = (SELECT Book_Id FROM Books WHERE Hunter_Id = buyerHunterId)
        )
        WHERE Hunter_Id = buyerHunterId;

        UPDATE Hunter_Stats 
        SET Cards_Qtd = (
          SELECT COUNT(DISTINCT Card_Id) FROM Books_Cards
          WHERE Book_Id = (SELECT Book_Id FROM Books WHERE Hunter_Id = ownerHunterId)
        )
        WHERE Hunter_Id = ownerHunterId;
        COMMIT;
      END      
    ''')
    cursor.close()
    conn.close()