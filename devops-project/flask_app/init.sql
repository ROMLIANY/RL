CREATE DATABASE IF NOT EXISTS gifs_db;

USE gifs_db;

CREATE TABLE IF NOT EXISTS gifs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- עדכון המשתמש 'user' לאימות 'mysql_native_password'
ALTER USER 'user'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
