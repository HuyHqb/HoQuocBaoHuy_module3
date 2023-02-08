CREATE TABLE LoaiDichVu
(
    idLoaiDichVu  int         NOT NULL
        PRIMARY KEY,
    tenLoaiDichVu varchar(45) NULL
);

INSERT INTO furama_resort.service_type (service_type_name) VALUES ('Room');
INSERT INTO furama_resort.service_type (service_type_name) VALUES ('House');
INSERT INTO furama_resort.service_type (service_type_name) VALUES ('Villa');