from dotenv import load_dotenv
import os

load_dotenv()

# MySQL Database configuration
DB_CONFIG = {
  'host': f'{os.getenv("MYSQL_HOST")}',       # Replace with your MySQL host
  'user': f'{os.getenv("MYSQL_USER")}',   # Replace with your MySQL username
  'password': f'{os.getenv("MYSQL_PASSWORD")}',  # Replace with your MySQL password
  'database': f'{os.getenv("MYSQL_DATABASE")}'  # Replace with your MySQL database name
}