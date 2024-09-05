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
    

def create_location_table():
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor.execute('''
      CREATE TABLE IF NOT EXISTS Locations
      ( 
        Description varchar(500) NOT NULL,  
        Location_Id INT NOT NULL AUTO_INCREMENT,  
        PRIMARY KEY (Location_Id)
      );
    ''')
    conn.commit()
    cursor.close()
    conn.close()
      
      
def fetch_locations():
  conn = get_db_connection()
  if conn:
    cursor = conn.cursor()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('''
      SELECT * FROM Locations
    ''')
    locations = cursor.fetchall()
    cursor.close()
    conn.close()
    return locations
  return []