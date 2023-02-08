CREATE TABLE KieuThue
(
    idKieuThue  int         NOT NULL
        PRIMARY KEY,
    tenKieuThue varchar(45) NULL,
    gia         int         NULL
);

INSERT INTO furama_resort.rent_type (rent_type_name, rent_type_cost) VALUES ('Hour', 100);
INSERT INTO furama_resort.rent_type (rent_type_name, rent_type_cost) VALUES ('Day', 2500);
INSERT INTO furama_resort.rent_type (rent_type_name, rent_type_cost) VALUES ('Month', 50000);
INSERT INTO furama_resort.rent_type (rent_type_name, rent_type_cost) VALUES ('Year', 500000);