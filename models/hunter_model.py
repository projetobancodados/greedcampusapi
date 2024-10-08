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

# Create a table explicitly with SQL
def create_hunters_table():
  conn = get_db_connection()
  if conn:
      cursor = conn.cursor()
      cursor.execute('''
        CREATE TABLE IF NOT EXISTS Hunters 
        ( 
          Hunter_Id INT NOT NULL AUTO_INCREMENT,  
          Avatar LONGBLOB,  
          Username VARCHAR(255) NOT NULL,  
          Password VARCHAR(255) NOT NULL,  
          Email VARCHAR(255) NOT NULL,  
          Location_Id INT,  
          Type_Hunter_Id INT, 
          Type_Question_Id INT,
          UNIQUE (Username),
          UNIQUE(Email),
          PRIMARY KEY (Hunter_Id),
          FOREIGN KEY (Location_Id) REFERENCES Locations (Location_Id) ON DELETE CASCADE,
          FOREIGN KEY (Type_Hunter_Id) REFERENCES Types_Hunter (Type_Hunter_Id) ON DELETE CASCADE,
          FOREIGN KEY (Type_Question_Id) REFERENCES Types_Question (Type_Question_Id) ON DELETE CASCADE
        ); 
      ''')
      conn.commit()
      cursor.close()
      conn.close()


def create_types_hunter_table():
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.execute('''
      CREATE TABLE IF NOT EXISTS Types_Hunter 
      ( 
        Description VARCHAR(30) NOT NULL,  
        Type_Hunter_Id INT NOT NULL AUTO_INCREMENT, 
        PRIMARY KEY (Type_Hunter_Id)
      );
    ''')
    conn.commit()
    cursor.close()
    conn.close()


def create_hunter_stats_table():
  conn = get_db_connection()
  if conn:
      cursor = conn.cursor()
      cursor.execute('''
        CREATE TABLE IF NOT EXISTS Hunter_Stats 
        (
          Hunter_Stats_Id INT NOT NULL AUTO_INCREMENT,
          Jenny_Qtd BIGINT UNSIGNED,  
          Cards_Qtd INT,  
          Hunter_Id INT NOT NULL,
          PRIMARY KEY (Hunter_Stats_Id),
          FOREIGN KEY (Hunter_Id) REFERENCES Hunters (Hunter_Id) ON DELETE CASCADE
        );
      ''')
      conn.commit()
      cursor.close()
      conn.close()
      

def create_hunter_book_table():
  conn = get_db_connection()
  if conn:
      cursor = conn.cursor()
      cursor.execute('''
        CREATE TABLE IF NOT EXISTS Books
        ( 
          Book_Id INT NOT NULL AUTO_INCREMENT,
          Hunter_Id INT NOT NULL,
          PRIMARY KEY (Book_Id),
          FOREIGN KEY (Hunter_Id) REFERENCES Hunters (Hunter_Id) ON DELETE CASCADE
        );
      ''')
      conn.commit()
      cursor.close()
      conn.close()


def add_hunter(username, email, password):
  conn = get_db_connection()
  db_hunter = (username, email, password, 1, 2, 1)
  if conn:
    cursor = conn.cursor()
    cursor.execute('''
      INSERT INTO Hunters (Username, Email, 
      Password, Location_Id, Type_Hunter_Id, Type_Question_Id) 
      VALUES (%s, %s, %s, %s, %s, %s)
    ''', db_hunter)
    conn.commit()
    cursor.close()
    conn.close()


def add_hunter_stats(hunter_id):
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.execute('''
      INSERT INTO Hunter_Stats (Jenny_Qtd, Cards_Qtd, Hunter_Id)
      VALUES (0, 0, %s)
    ''', (hunter_id,))
    conn.commit()
    cursor.close()
    conn.close()


def add_hunter_book(hunter_id):
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.execute('''
      INSERT INTO Books (Hunter_Id) 
      VALUES (%s)
    ''', (hunter_id,))
    conn.commit()
    cursor.close()
    conn.close()
    

def create_all_hunter_info_view():
  conn = get_db_connection()
  if conn:
      cursor = conn.cursor()
      cursor.execute('''
        CREATE OR REPLACE VIEW All_Hunter_Info AS
        SELECT h.Hunter_Id, h.Type_Hunter_Id, h.Location_Id, h.Type_Question_Id AS Type_Question,
        hs.Jenny_Qtd, hs.Cards_Qtd, b.Book_Id
        FROM Hunters h
        INNER JOIN Types_Hunter th ON th.Type_Hunter_Id = h.Type_Hunter_Id
        INNER JOIN Hunter_Stats hs ON hs.Hunter_Id = h.Hunter_Id
        INNER JOIN Locations l ON l.Location_Id = h.Location_Id
        INNER JOIN Types_Question tq ON tq.Type_Question_Id = h.Type_Question_Id
        INNER JOIN Books b ON b.Hunter_Id = h.Hunter_Id;
      ''')
      conn.commit()
      cursor.close()
      conn.close()


def fetch_hunter(hunter_id):
  create_all_hunter_info_view()
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor(dictionary=True)
    cursor.execute(f'''
      SELECT * FROM All_Hunter_Info
      WHERE Hunter_Id = {hunter_id}
    ''')
    hunter = cursor.fetchone()
    cursor.close()
    conn.close()
    return hunter
  return {}    


def fetch_hunter_auth(username):
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor(dictionary=True)
    cursor.execute(f'''
      SELECT Hunter_Id, Username, Password, Email,
      CAST(Avatar AS CHAR) AS Avatar,
      l.Location_Id AS Location,
      tq.Type_Question_Id AS Type_Question,
      th.Type_Hunter_Id AS Type_Hunter
      FROM Hunters h 
      INNER JOIN Locations l ON l.Location_Id = h.Location_Id
      INNER JOIN Types_Question tq ON tq.Type_Question_Id = h.Type_Question_Id
      INNER JOIN Types_Hunter th ON th.Type_Hunter_Id = h.Type_Hunter_Id
      WHERE Username LIKE \'{username}\'
    ''')
    hunter = cursor.fetchone()
    cursor.close()
    conn.close()
    return hunter
  return {}


def fetch_hunters():
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor(dictionary=True)  # Fetch rows as dictionaries
    cursor.execute('''
      SELECT h.Hunter_Id, h.Username,
      CAST(h.Avatar AS CHAR) AS Avatar, hs.Jenny_Qtd, hs.Cards_Qtd,
      Location_Id
      From Hunters h
      INNER JOIN Hunter_Stats hs ON hs.Hunter_Id = h.Hunter_Id
      ORDER BY hs.Cards_Qtd DESC, hs.Jenny_Qtd DESC
    ''')
    hunters = cursor.fetchall()
    cursor.close()
    conn.close()
    return hunters
  return []


def update_hunter(hunter_id, content):
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    query = f'''
      UPDATE Hunters SET Username = '{content['Username']}',
      Password = '{content['Password']}', Email = '{content['Email']}'
    '''
    if content['Avatar']:
      query += f", Avatar = '{content['Avatar']}'"
    
    if content['Location']:
      query += f", Location_Id = {content['Location']}"
      
    if content['Type_Question']:
      query += f", Type_Question_Id = {content['Type_Question']}"
      
    query += f" WHERE Hunter_Id = {hunter_id}"
    
    cursor.execute(query)
    conn.commit()
    cursor.close()
    conn.close()


def create_ban_or_remove_hunter_procedure():
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.execute('''
      CREATE OR REPLACE PROCEDURE BanOrRemoveHunter (
        IN hunterId INT
      )
      BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION 
        BEGIN
          ROLLBACK;
        END;
        START TRANSACTION;
        
        UPDATE Cards c SET c.Quantity = c.Quantity + (
        SELECT COUNT(bc.Card_Id) FROM Books_Cards bc
        WHERE bc.Book_Id = (SELECT b.Book_Id FROM Books b WHERE Hunter_Id = hunterId)
        AND bc.Card_Id = c.Card_Id);

        DELETE FROM Books_Cards WHERE Book_Id = (SELECT Book_Id FROM Books WHERE Hunter_Id = hunterId);
        DELETE FROM Hunter_Stats WHERE Hunter_Id = hunterId;
        DELETE FROM Books WHERE Hunter_Id = hunterId;
        DELETE FROM Answers WHERE Hunter_Id = hunterId;
        DELETE FROM Hunters WHERE Hunter_Id = hunterId;

        COMMIT;
      END               
    ''')
    cursor.close()
    conn.close()


def delete_hunter(hunter_id):
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.callproc('BanOrRemoveHunter', (hunter_id, ))
    cursor.close()
    conn.close()
    
    
def update_hunter_stats_jenny(hunter_id, jenny_value):
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.execute(f'''
      UPDATE Hunter_Stats SET Jenny_Qtd = Jenny_Qtd + ({jenny_value})
      WHERE Hunter_Id = {hunter_id}
    ''')
    conn.commit()
    cursor.close()
    conn.close()