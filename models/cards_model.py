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

    def get_available_cards(self):
        """
        Retorna todas as cartas disponíveis no sistema com suas respectivas quantidades e detalhes.
        Isso inclui título, descrição, nível de dificuldade, quantidade, etc.
        """
        if self.conn:
            cursor = self.conn.cursor(dictionary=True)
            cursor.execute('SELECT * FROM Cards')
            cards = cursor.fetchall()
            cursor.close()
            return cards
        return []

    def add_card_to_book(self, hunter_id, card_id):
        """
        Adiciona uma carta ao Book do jogador (hunter_id) se houver quantidade disponível.
        Atualiza a tabela de `Books_Cards` para associar a carta ao Book (idbook) do Hunter.
        Diminui a quantidade da carta no banco de dados se adicionada com sucesso.
        """
        if self.conn:
            cursor = self.conn.cursor()

            # Verificar se a carta está disponível (quantidade > 0)
            cursor.execute('SELECT Quantity FROM Cards WHERE Card_Id = %s', (card_id,))
            card = cursor.fetchone()
            if card and card['Quantity'] > 0:
                # Diminuir a quantidade da carta no sistema
                cursor.execute('UPDATE Cards SET Quantity = Quantity - 1 WHERE Card_Id = %s', (card_id,))

                # Associar a carta ao Book do Hunter na tabela Books_Cards
                cursor.execute('''
                    INSERT INTO Books_Cards (idcard, idbook)
                    SELECT %s, Book_Id FROM Books WHERE Hunter_Id = %s
                ''', (card_id, hunter_id))

                self.conn.commit()
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
      print(hunter_id)
      """
      Retorna todas as cartas que o Hunter (hunter_id) possui em seu Book.
      Consulta a tabela associativa `Books_Cards` para verificar as cartas associadas ao Book de um Hunter.
      """
      if self.conn:
          cursor = self.conn.cursor(dictionary=True)
          cursor.execute('''
              SELECT c.* FROM Cards c
              JOIN Books_Cards bc ON c.Card_Id = bc.Card_Id
              JOIN Books b ON bc.Book_Id = b.Book_Id
              WHERE b.Hunter_Id = %s
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

                # Verificar a resposta da pergunta (associada à carta)
                cursor.execute('SELECT Answer FROM Questions WHERE Card_Id = %s', (card_id,))
                question = cursor.fetchone()

                if question and answer == question['Answer']:
                    # Adicionar a carta ao Book do Hunter
                    self.add_card_to_book(hunter_id, card_id)

                self.conn.commit()
            cursor.close()

    def trade_card_between_hunters(self, hunter_id_from, hunter_id_to, card_id):
        """
        Permite que dois Hunters troquem cartas entre si.
        Remove a carta do Hunter de origem (hunter_id_from) e a adiciona ao Hunter de destino (hunter_id_to).
        """
        if self.conn:
            try:
                cursor = self.conn.cursor()

                # Verificar se o Hunter de origem realmente possui a carta
                cursor.execute('''
                    SELECT idbook FROM Books_Cards 
                    WHERE idcard = %s AND idbook = (SELECT Book_Id FROM Books WHERE Hunter_Id = %s)
                ''', (card_id, hunter_id_from))
                if cursor.fetchone() is None:
                    return {"msg": "The source Hunter does not own this card."}

                # Remover carta do Hunter de origem
                cursor.execute('''
                    DELETE FROM Books_Cards 
                    WHERE idcard = %s AND idbook = (SELECT Book_Id FROM Books WHERE Hunter_Id = %s)
                ''', (card_id, hunter_id_from))

                # Adicionar carta ao Hunter de destino
                cursor.execute('''
                    INSERT INTO Books_Cards (idcard, idbook)
                    SELECT %s, Book_Id FROM Books WHERE Hunter_Id = %s
                ''', (card_id, hunter_id_to))

                # Confirmar as mudanças
                self.conn.commit()

                return {"msg": "Trade successful"}

            except Exception as e:
                self.conn.rollback()  # Reverter transações em caso de erro
                return {"msg": f"Error during trade: {str(e)}"}

            finally:
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
            Quantity INT NOT NULL,  
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