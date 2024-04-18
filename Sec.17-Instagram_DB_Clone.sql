-- Section 17: Instagram Database Clone
-- ------------------------------------

-- Users Schema
-- ------------------------------------
CREATE DATABASE instagram_clone;
USE instagram_clone;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);

DESC users;

INSERT INTO users (username)
VALUES ('Jane Smith'), ('Michael Johnson'), ('Sarah Williams');

SELECT * FROM users;
-- ------------------------------------

-- Photos Schema
-- ------------------------------------
CREATE TABLE photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);
DESC photos;

INSERT INTO photos (image_url, user_id) VALUES
('/alsde789.com', 1),
('/alasdfads89.com', 2),
('/jisdjfie9.com', 2),
('/aklj;lsifjwe.com', 3);

SELECT * FROM photos;

SELECT * FROM photos
JOIN users ON photos.user_id = users.id;

SELECT photos.image_url, users.username FROM photos
JOIN users ON photos.user_id = users.id;
-- ------------------------------------

-- Comments Schema
-- ------------------------------------
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

SHOW TABLES;

INSERT INTO comments(comment_text, user_id, photo_id) VALUES
('Wow! Cool pic!', 1, 2),
('Amazing shot!', 3, 2),
('I <3 this', 2, 1);

SELECT * FROM comments;
-- ------------------------------------

-- Likes Schema
-- ------------------------------------

-- We don't need an id because we are not using a table to store data on likes
CREATE TABLE likes (
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

-- Adding likes data
INSERT INTO likes(user_id, photo_id) VALUES
(1,1),
(2,1),
(1,2),
(1,3),
(3,3);

-- Error: Duplicate entry '1-1' for key 'likes.PRIMARY'
-- INSERT INTO likes(user_id, photo_id) VALUE (1,1);
-- ------------------------------------

-- Followers Schema
-- ------------------------------------
CREATE TABLE follows (
    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

INSERT INTO follows(follower_id, followee_id) VALUES
(1,2),
(1,3),
(3,1),
(2,3);

SELECT * FROM follows;

-- Displaying who is following whom
SELECT follows.follower_id, follower.username AS follower_username,
    follows.followee_id, followee.username AS followee_username FROM follows
JOIN users AS follower ON follows.follower_id = follower.id
JOIN users AS followee ON follows.followee_id = followee.id;
-- ------------------------------------

-- Tags Schema
-- ------------------------------------
CREATE TABLE tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

SHOW TABLES;

INSERT INTO tags(tag_name) VALUES
('adorable'),
('cute'),
('sunrise');

SELECT * FROM tags;

INSERT INTO photo_tags(photo_id, tag_id)
VALUES (1,1),
       (1,2),
       (2,3),
       (3,2);

SELECT * FROM photo_tags;

-- Trying to do what we did above
SELECT tags.id,

SELECT follows.follower_id, follower.username AS follower_username,
    follows.followee_id, followee.username AS followee_username FROM follows
JOIN users AS follower ON follows.follower_id = follower.id
JOIN users AS followee ON follows.followee_id = followee.id;






