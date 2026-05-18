CREATE DATABASE shoppingsite_koga;
USE shoppingsite_koga;



DROP TABLE IF EXISTS users;

CREATE TABLE users (
    userId      VARCHAR(50)  NOT NULL,
    password    VARCHAR(255) NOT NULL,
    firstName   VARCHAR(100) NOT NULL,
    lastName    VARCHAR(100) NOT NULL,
    address     VARCHAR(255) NOT NULL,
    mailAddress VARCHAR(255) NOT NULL,
    created_at  TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (userId)
);

INSERT INTO users (userId, password, firstName, lastName, address, mailAddress)
VALUES ('testuser', 'password123', 'テスト', 'ユーザー', '東京都渋谷区1-1-1', 'test@example.com');




DROP TABLE IF EXISTS users;