CREATE TABLE DichVuDiKem
(
    idDichVuDiKem    int         NOT NULL
        PRIMARY KEY,
    tenDichVuDiKem   varchar(45) NULL,
    gia              int         NULL,
    donVi            int         NULL,
    trangThaiKhaDung varchar(45) NULL
);

INSERT INTO furama_resort.attach_service (attach_service_name, attach_service_cost, attach_service_unit, attach_service_status) VALUES ('Massage', 50, 1, 'Ready');
INSERT INTO furama_resort.attach_service (attach_service_name, attach_service_cost, attach_service_unit, attach_service_status) VALUES ('Karaoke', 20, 1, 'Ready');
INSERT INTO furama_resort.attach_service (attach_service_name, attach_service_cost, attach_service_unit, attach_service_status) VALUES ('Food', 50, 1, 'Not Ready');
INSERT INTO furama_resort.attach_service (attach_service_name, attach_service_cost, attach_service_unit, attach_service_status) VALUES ('Car', 70, 1, 'Under Maintenance');
INSERT INTO furama_resort.attach_service (attach_service_name, attach_service_cost, attach_service_unit, attach_service_status) VALUES ('Computer', 10, 1, 'Updating');