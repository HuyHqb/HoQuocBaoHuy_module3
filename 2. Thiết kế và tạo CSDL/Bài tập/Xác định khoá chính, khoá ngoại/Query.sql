CREATE DATABASE customer_bank_account;

USE customer_bank_account;

CREATE TABLE Customer
(
    customer_number int(10) NOT NULL PRIMARY KEY ,
    full_name nvarchar(20),
    address varchar(50),
    email varchar(50),
    phone varchar(10)
);

CREATE TABLE Account
(
    account_number int(10) NOT NULL PRIMARY KEY ,
    account_type varchar(10),
    date DATE,
    balance double
);

CREATE TABLE Transaction
(
    tran_number int(10) NOT NULL PRIMARY KEY ,
    account_number int(10) NOT NULL ,
    amounts double,
    descriptions nvarchar(100),
    FOREIGN KEY (account_number) REFERENCES Account(account_number)
);

ALTER TABLE Account
ADD customer_number int(10) NOT NULL,
    ADD FOREIGN KEY (customer_number) REFERENCES Customer(customer_number);
