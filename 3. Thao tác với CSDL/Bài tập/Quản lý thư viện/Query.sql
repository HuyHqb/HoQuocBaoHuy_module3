CREATE DATABASE library_management;

USE library_management;

CREATE TABLE Student
(
    id int PRIMARY KEY ,
    name nvarchar(50),
    age int,
    phone varchar(10)
);

CREATE TABLE Book
(
    id int PRIMARY KEY,
    name nvarchar(50),
    categoryID int,
    moreInfo text,
    FOREIGN KEY (categoryID) REFERENCES Category(id)
);

CREATE TABLE Category
(
    id int PRIMARY KEY,
    name nvarchar(50),
    moreInfo text
);

CREATE TABLE OrderDetail
(
    id int PRIMARY KEY,
    idStudent int,
    idBook int,
    borrowDay DATE,
    returnDate DATE,
    FOREIGN KEY (idStudent) REFERENCES Student(id),
    FOREIGN KEY (idBook) REFERENCES Book(id)
);
