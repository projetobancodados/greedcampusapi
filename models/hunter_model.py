# models/database.py

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
          Avatar BLOB,  
          Username VARCHAR(255) NOT NULL,  
          Password VARCHAR(255) NOT NULL,  
          Email VARCHAR(255) NOT NULL,  
          Location_Id INT,  
          Type_Hunter_Id INT, 
          UNIQUE (Username),
          UNIQUE(Email),
          PRIMARY KEY (Hunter_Id),
          FOREIGN KEY (Location_Id) REFERENCES Locations (Location_Id),
          FOREIGN KEY (Type_Hunter_Id) REFERENCES Types_Hunter (Type_Hunter_Id)
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
          Jenny_Qtd BIGINT,  
          Cards_Qtd INT,  
          Hunter_Stats_Id INT NOT NULL AUTO_INCREMENT,
          Hunter_Id INT NOT NULL,
          PRIMARY KEY (Hunter_Stats_Id),
          FOREIGN KEY (Hunter_Id) REFERENCES Hunters (Hunter_Id)
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
          FOREIGN KEY (Hunter_Id) REFERENCES Hunters (Hunter_Id)
        );
      ''')
      conn.commit()
      cursor.close()
      conn.close()


def add_hunter(username, email, password):
  conn = get_db_connection()
  db_hunter = (username, email, password)
  if conn:
    cursor = conn.cursor()
    cursor.execute('''
      INSERT INTO Hunters (Username, Email, Password) 
      VALUES (%s, %s, %s)
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


def fetch_hunter(hunter_id):
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor(dictionary=True)
    cursor.execute(f'SELECT * FROM Hunters WHERE Hunter_Id = {hunter_id}')
    hunter = cursor.fetchone()
    cursor.close()
    conn.close()
    return hunter
  return {}    


def fetch_hunter_auth(username):
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor(dictionary=True)
    cursor.execute(f'SELECT Hunter_Id, Username, Password FROM Hunters WHERE Username LIKE \'{username}\'')
    hunter = cursor.fetchone()
    cursor.close()
    conn.close()
    return hunter
  return {}


def fetch_hunters():
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor(dictionary=True)  # Fetch rows as dictionaries
    cursor.execute('SELECT * FROM Hunters')
    hunters = cursor.fetchall()
    cursor.close()
    conn.close()
    return hunters
  return []
