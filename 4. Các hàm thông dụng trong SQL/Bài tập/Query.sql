CREATE DATABASE EX4;

CREATE TABLE Fee
(
    id int PRIMARY KEY ,
    name varchar(50),
    age varchar(50),
    course varchar(50),
    amount int
);

INSERT INTO EX4.Fee (id, name, age, course, amount) VALUES (1, 'Hoang', '21', 'CNTT', 400000);
INSERT INTO EX4.Fee (id, name, age, course, amount) VALUES (2, 'Viet', '19', 'DTVT', 320000);
INSERT INTO EX4.Fee (id, name, age, course, amount) VALUES (3, 'Thanh', '18', 'KTDN', 400000);
INSERT INTO EX4.Fee (id, name, age, course, amount) VALUES (4, 'Nhan', '19', 'CK', 450000);
INSERT INTO EX4.Fee (id, name, age, course, amount) VALUES (5, 'Huong', '20', 'TCNH', 500000);
INSERT INTO EX4.Fee (id, name, age, course, amount) VALUES (6, 'Huong', '21', 'DTVT', 200000);

SELECT *
FROM Fee
WHERE name = 'Huong';

SELECT sum(amount)
FROM Fee
WHERE name = 'Huong'
GROUP BY name;

SELECT name
FROM Fee
GROUP BY 1;

