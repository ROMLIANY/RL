import os
from flask import Flask
from dotenv import load_dotenv
import mysql.connector

# טוען את משתני הסביבה מתוך קובץ ה-.env
load_dotenv()

# משתמש במשתני הסביבה שנמצאים בקובץ .env
mysql_user = os.getenv('MYSQL_USER')
mysql_password = os.getenv('MYSQL_PASSWORD')
mysql_host = os.getenv('MYSQL_HOST')
mysql_port = os.getenv('MYSQL_PORT')
mysql_db = os.getenv('MYSQL_DB')

# יצירת אובייקט Flask
app = Flask(__name__)

# חיבור ל-MySQL
def get_db_connection():
    connection = mysql.connector.connect(
        user=mysql_user,
        password=mysql_password,
        host=mysql_host,
        port=mysql_port,
        database=mysql_db
    )
    return connection

# דף ראשי של האפליקציה
@app.route('/')
def home():
    return "Hello, World!"

# דף נוסף שמבצע פעולה על מאגר הנתונים
@app.route('/connect-db')
def connect_db():
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute('SELECT DATABASE();')
    result = cursor.fetchone()
    cursor.close()
    connection.close()
    return f"Connected to database: {result[0]}"

# הפעלת השרת
if __name__ == '__main__':
    app.run(debug=True)
