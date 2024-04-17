-- Section 17: Instagram Database Clone
-- ------------------------------------

CREATE DATABASE instagram_clone;
USE instagram_clone;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

DESC users;
