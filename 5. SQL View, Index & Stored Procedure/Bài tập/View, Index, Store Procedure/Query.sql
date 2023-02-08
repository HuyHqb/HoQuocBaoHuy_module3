CREATE DATABASE demo;

USE demo;

CREATE TABLE Products
(
    id                 int PRIMARY KEY,
    productCode        varchar(10),
    productName        varchar(50),
    productPrice       int,
    productAmount      int,
    productDescription text,
    productStatus      varchar(50)
);

# create index
CREATE UNIQUE INDEX proCode
    ON Products (productCode);

CREATE INDEX price
    ON Products (productName, productPrice);

#create view
CREATE VIEW show_products AS
SELECT productCode, productName, productPrice, productStatus
FROM Products;

SELECT *
FROM show_products;

#creat procedure show products
CREATE PROCEDURE showAllProducts()
BEGIN
    SELECT * FROM Products;
END;

CALL showAllProducts;

#create procedure add product
CREATE PROCEDURE addProduct(
    IN proID int,
    IN proCode varchar(10),
    IN proName varchar(50),
    IN proPrice int,
    IN proAmount int,
    IN description text,
    IN proStatus varchar(50))
BEGIN
    INSERT INTO Products () VALUES (proID,proCode,proName,proPrice,proAmount,description,proStatus);
END;

CALL addProduct(4,'P004','Nokia',100,10,NULL,NULL);

SELECT *
FROM Products;

#edit name of product by id
CREATE PROCEDURE editNameProductById(IN idP int, IN name varchar(50))
BEGIN
    UPDATE Products SET productName = name WHERE id = idP;
END;

CALL editNameProductById(1,'Iphone 7 Plus');

SELECT *
FROM Products;

#remove product by id
CREATE PROCEDURE removeProductById(IN idP int)
BEGIN
    DELETE FROM Products WHERE id = idP;
END;

CALL removeProductById(1);