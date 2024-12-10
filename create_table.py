import mysql.connector
import os

db = mysql.connector.connect(
    host=os.getenv("MYSQL_HOST", "db"),
    user=os.getenv("MYSQL_USER", "root"),
    password=os.getenv("MYSQL_PASSWORD", "root"),
    database=os.getenv("MYSQL_DB", "images_db")
)

cursor = db.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255)
)
""")

cursor.execute("""
INSERT INTO images (image_url) VALUES
('https://c.tenor.com/8S_h8HihHoUAAAAM/cat-cats.gif'),
('https://c.tenor.com/qUyYOYoh0FAAAAAM/cat-cats.gif')
""")

db.commit()

cursor.close()
db.close()
