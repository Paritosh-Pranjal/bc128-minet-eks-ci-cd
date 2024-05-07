-- Create the database
CREATE DATABASE IF NOT EXISTS  minet_bc_128;

-- Ensure the operations are targeting the correct database
USE minet_bc_128;

-- Create the 'user' table first as it has no foreign key dependencies
CREATE TABLE user (
    id INT PRIMARY KEY,
    first_name VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Create 'cryptocurrency' next as it also has no dependencies
CREATE TABLE cryptocurrency (
    id VARCHAR(45) PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    market_cap VARCHAR(45) NOT NULL,
    volume VARCHAR(45) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    circulating_supply BIGINT NOT NULL,
    abbreviation VARCHAR(45) NOT NULL,
    image VARCHAR(45) NOT NULL
);

-- Create 'wishlist' and 'holdings' tables; both refer to 'cryptocurrency' and 'user'
CREATE TABLE wishlist (
    id INT PRIMARY KEY,
    crypto_id VARCHAR(45) NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (crypto_id) REFERENCES cryptocurrency(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE holdings (
    id INT PRIMARY KEY,
    amount INT NOT NULL,
    crypto_id VARCHAR(45) NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (crypto_id) REFERENCES cryptocurrency(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- Create 'wallet' table, depends on 'user' table
CREATE TABLE wallet (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT UNIQUE,
    amount DOUBLE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- Lastly, create 'transaction' table, depends on both 'user' and 'cryptocurrency'
CREATE TABLE transaction (
    id INT PRIMARY KEY AUTO_INCREMENT,
    amount DOUBLE NOT NULL,
    quantity INT NOT NULL,
    coin_name VARCHAR(255),
    transaction_type ENUM('PURCHASED', 'SOLD') NOT NULL,
    transaction_status ENUM('FAILED', 'PROCESSING', 'SUCCESS') NOT NULL,
    transaction_date DATE NOT NULL,
    receiver_name VARCHAR(45),
    user_id INT NOT NULL,
    crypto_id VARCHAR(45) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (crypto_id) REFERENCES cryptocurrency(id)
);
