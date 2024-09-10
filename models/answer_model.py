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
    
    
def create_answer_table():
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.execute('''
      CREATE TABLE IF NOT EXISTS Answers
      ( 
        Content TEXT,  
        Answer_Id INT NOT NULL AUTO_INCREMENT, 
        Hunter_Id INT NOT NULL,
        Question_Id INT NOT NULL,
        PRIMARY KEY (Answer_Id),
        FOREIGN KEY (Hunter_Id) REFERENCES Hunters (Hunter_Id) ON DELETE CASCADE,
        FOREIGN KEY (Question_Id) REFERENCES Questions (Question_Id) ON DELETE CASCADE
      );
    ''')
    conn.commit()
    cursor.close()
    conn.close()
    

def add_answer(answer, hunter_id, question_id):
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.execute(f'''
      INSERT INTO Answers (Hunter_Id, Question_Id, Content)
      VALUES ({hunter_id}, {question_id}, '{answer}') 
    ''')
    answer_id = cursor.lastrowid
    conn.commit()
    cursor.close()
    conn.close()
    return answer_id

  
def fetch_answers():
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor(dictionary=True)  # Fetch rows as dictionaries
    cursor.execute('SELECT * FROM Answers')
    questions = cursor.fetchall()
    cursor.close()
    conn.close()
    return questions
  return []


def create_all_hunter_answer_view():
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.execute('''
      CREATE OR REPLACE VIEW All_Hunter_Answer AS
      SELECT h.Hunter_Id, h.Username, q.Statement, a.Content AS Answer, 
      a.Answer_Id, c.Card_Id, c.Description, cc.Card_Challenge_Id, b.Book_Id
      FROM Hunters h
      INNER JOIN Books b ON b.Hunter_Id = h.Hunter_Id
      INNER JOIN Answers a ON a.Hunter_Id = h.Hunter_Id
      INNER JOIN Card_Challenge_Answer cca ON cca.Answer_Id = a.Answer_Id
      INNER JOIN Questions q ON q.Question_Id = a.Question_Id
      INNER JOIN Card_Challenge cc ON cc.Card_Challenge_Id = cca.Card_Challenge_Id
      INNER JOIN Cards c ON c.Card_Id = cc.Card_Id;
    ''')
    conn.commit()
    cursor.close()
    conn.close()