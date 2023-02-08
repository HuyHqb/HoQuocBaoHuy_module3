CREATE TABLE HopDongChiTiet
(
    idHopDongChiTiet int NOT NULL
        PRIMARY KEY,
    idHopDong        int NULL,
    idDichVuDiKem    int NULL,
    soLuong          int NULL,
    CONSTRAINT HopDongChiTiet_ibfk_1
        FOREIGN KEY (idHopDong) REFERENCES HopDong (idHopDong),
    CONSTRAINT HopDongChiTiet_ibfk_2
        FOREIGN KEY (idDichVuDiKem) REFERENCES DichVuDiKem (idDichVuDiKem)
);

CREATE INDEX idDichVuDiKem
    ON HopDongChiTiet (idDichVuDiKem);

CREATE INDEX idHopDong
    ON HopDongChiTiet (idHopDong);

INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (1, 19, 1, 8);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (2, 4, 1, 8);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (3, 9, 3, 7);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (4, 25, 3, 4);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (5, 26, 1, 7);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (6, 26, 2, 5);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (7, 22, 3, 3);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (8, 46, 4, 3);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (9, 47, 4, 5);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (10, 32, 1, 9);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (11, 25, 3, 5);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (12, 13, 4, 9);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (13, 12, 2, 10);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (14, 48, 2, 4);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (15, 9, 3, 4);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (16, 29, 1, 10);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (17, 1, 2, 6);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (18, 42, 4, 4);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (19, 33, 3, 3);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (20, 39, 1, 2);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (21, 7, 1, 4);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (22, 6, 1, 7);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (23, 30, 1, 5);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (24, 24, 2, 2);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (25, 32, 2, 10);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (26, 12, 3, 6);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (27, 22, 1, 6);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (28, 43, 3, 1);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (29, 17, 4, 6);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (30, 23, 3, 5);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (31, 33, 1, 5);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (32, 24, 2, 7);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (33, 50, 4, 5);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (34, 3, 1, 9);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (35, 45, 2, 9);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (36, 20, 2, 6);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (37, 23, 5, 1);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (38, 31, 4, 8);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (39, 9, 2, 6);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (40, 21, 1, 4);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (41, 24, 4, 2);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (42, 41, 3, 5);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (43, 21, 4, 10);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (44, 43, 4, 9);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (45, 28, 4, 9);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (46, 17, 4, 8);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (47, 48, 1, 2);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (48, 16, 3, 8);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (49, 48, 3, 6);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (50, 35, 4, 8);
INSERT INTO furama_resort.HopDongChiTiet (idHopDongChiTiet, idHopDong, idDichVuDiKem, soLuong) VALUES (51, 44, 2, 10);