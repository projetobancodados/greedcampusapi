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
    
    
def create_question_table():
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.execute('''
      CREATE TABLE IF NOT EXISTS Questions 
      ( 
        Question_Id INT NOT NULL AUTO_INCREMENT,  
        Statement LONGTEXT,  
        Type_Question_Id INT,
        Difficulty_Code INT,
        PRIMARY KEY (Question_Id),
        FOREIGN KEY (Type_Question_Id) REFERENCES Types_Question (Type_Question_Id) ON DELETE CASCADE,
        FOREIGN KEY (Difficulty_Code) REFERENCES Cards_Difficulty (Difficulty_Code) ON DELETE CASCADE
      );
    ''')
    conn.commit()
    cursor.close()
    conn.close()


def create_types_question_table():
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.execute('''
      CREATE TABLE IF NOT EXISTS Types_Question 
      ( 
        Type_Question_Id INT NOT NULL AUTO_INCREMENT,  
        Description varchar(30) NOT NULL,
        PRIMARY KEY (Type_Question_Id)
      );
    ''')
    conn.commit()
    cursor.close()
    conn.close()


def fetch_questions():
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor(dictionary=True)  # Fetch rows as dictionaries
    cursor.execute('SELECT * FROM Questions')
    questions = cursor.fetchall()
    cursor.close()
    conn.close()
    return questions
  return []


def fetch_types_question():
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor(dictionary=True)  # Fetch rows as dictionaries
    cursor.execute('SELECT * FROM Types_Question')
    types_question = cursor.fetchall()
    cursor.close()
    conn.close()
    return types_question
  return []