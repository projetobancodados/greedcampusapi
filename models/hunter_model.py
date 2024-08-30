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
def create_hunter_table():
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
          Book_Id INT,  
          Location_Id INT,  
          Type_Hunter_Id INT, 
          UNIQUE (Username),
          UNIQUE (Email),
          PRIMARY KEY (Hunter_Id)
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
  
  return db_hunter


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
    cursor.execute(f'SELECT Username, Password FROM Hunters WHERE Username LIKE \'{username}\'')
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
