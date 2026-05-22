CREATE DATABASE shoppingsite_koga;
USE shoppingsite_koga;



DROP TABLE IF EXISTS users;

CREATE TABLE users (
    userId      VARCHAR(50)  NOT NULL,
    password    VARCHAR(255) NOT NULL,
    lastName    VARCHAR(100) NOT NULL,
    firstName   VARCHAR(100) NOT NULL,
    address     VARCHAR(255) NOT NULL,
    mailAddress VARCHAR(255) NOT NULL,
    registDate  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updateDate  TIMESTAMP    NULL     DEFAULT NULL,
    PRIMARY KEY (userId)
);

INSERT INTO users (userId, password, lastName, firstName, address, mailAddress)
VALUES ('testuser', 'password123', '姓', '名', '東京都渋谷区1-1-1', 'test@example.com');