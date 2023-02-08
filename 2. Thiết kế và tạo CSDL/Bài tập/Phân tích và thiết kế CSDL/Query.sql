CREATE DATABASE car_shop_management;

use car_shop_management;

CREATE TABLE Customer
(
    cusNumber int NOT NULL PRIMARY KEY ,
    cusName varchar(50) NOT NULL ,
    contactLastName varchar(50) NOT NULL ,
    contactFirstName varchar(50) NOT NULL ,
    phone varchar(50) NOT NULL ,
    addressLine1 varchar(50) NOT NULL ,
    addressLine2 varchar(50),
    city varchar(50) NOT NULL ,
    state varchar(50) NOT NULL ,
    postalCode varchar(15) NOT NULL ,
    country varchar(50) NOT NULL ,
    creditLimit double,
    salesRepEmployeeNumber int NOT NULL ,
    FOREIGN KEY (salesRepEmployeeNumber) REFERENCES Employee(employeeNumber)
);

CREATE TABLE ProductLine
(
    productLine varchar(50) NOT NULL PRIMARY KEY ,
    textDescription text,
    image text
);

CREATE TABLE Product
(
    productCode varchar(15) NOT NULL PRIMARY KEY ,
    productName varchar(70) NOT NULL ,
    productScale varchar(10) NOT NULL ,
    productLine varchar(50) NOT NULL ,
    productVendor varchar(50) NOT NULL ,
    productDescription text NOT NULL ,
    quantityInStock int NOT NULL ,
    butPrice double NOT NULL ,
    MSRP double NOT NULL,
    FOREIGN KEY (productLine) REFERENCES ProductLine(productLine)
);

CREATE TABLE `Order`
(
    orderNumber int NOT NULL PRIMARY KEY ,
    orderDate date NOT NULL ,
    requiredDate date NOT NULL ,
    shippedDate date,
    status varchar(15) NOT NULL ,
    comments text,
    quantityOrdered int NOT NULL ,
    priceEach double NOT NULL,
        cusNumber int NOT NULL,
        FOREIGN KEY `Order`(cusNumber) REFERENCES Customer(cusNumber)

);

CREATE TABLE Payment
(
    cusNumber int NOT NULL,
    checkNumber varchar(50) NOT NULL ,
    paymentDate date NOT NULL ,
    amount double NOT NULL,
    FOREIGN KEY (cusNumber) REFERENCES Customer(cusNumber)
);

CREATE TABLE Employee
(
    employeeNumber int NOT NULL PRIMARY KEY ,
    lastName varchar(50) NOT NULL ,
    firstName varchar(50) NOT NULL ,
    email varchar(100) NOT NULL ,
    jobTitle varchar(50) NOT NULL,
    reportTo int NOT NULL ,
    officeCode varchar(10) NOT NULL ,
    FOREIGN KEY (reportTo) REFERENCES Employee(employeeNumber),
    FOREIGN KEY (officeCode) REFERENCES Office(officeCode)
);

CREATE TABLE Office
(
    officeCode varchar(10) NOT NULL PRIMARY KEY ,
    city varchar(50) NOT NULL ,
    phone varchar(50) NOT NULL ,
    addressLine1 varchar(50) NOT NULL ,
    addressLine2 varchar(50) ,
    state varchar(50),
    country varchar(50) NOT NULL ,
    postalCode varchar(15) NOT NULL
);

CREATE TABLE OrderDetail
(
    orderNumber int NOT NULL,
    productCode varchar(15) NOT NULL ,
    FOREIGN KEY (orderNumber) REFERENCES `Order`(orderNumber),
    FOREIGN KEY (productCode) REFERENCES Product(productCode)
);