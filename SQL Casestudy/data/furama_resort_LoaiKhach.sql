CREATE TABLE LoaiKhach
(
    idLoaiKhach  int         NOT NULL
        PRIMARY KEY,
    tenLoaiKhach varchar(45) NULL
);

INSERT INTO furama_resort.customer_type (customer_type_name) VALUES ('Member');
INSERT INTO furama_resort.customer_type (customer_type_name) VALUES ('Silver');
INSERT INTO furama_resort.customer_type (customer_type_name) VALUES ('Gold');
INSERT INTO furama_resort.customer_type (customer_type_name) VALUES ('Platinum');
INSERT INTO furama_resort.customer_type (customer_type_name) VALUES ('Diamond');