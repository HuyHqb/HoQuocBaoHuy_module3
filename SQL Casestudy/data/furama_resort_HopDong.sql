CREATE TABLE HopDong
(
    idHopDong      int  NOT NULL
        PRIMARY KEY,
    idNhanVien     int  NULL,
    idKhachHang    int  NULL,
    idDichVu       int  NULL,
    ngayLapHopDong date NULL,
    ngayKetThuc    date NULL,
    tienDatCoc     int  NULL,
    tongTien       int  NULL,
    CONSTRAINT HopDong_ibfk_1
        FOREIGN KEY (idNhanVien) REFERENCES NhanVien (idNhanVien),
    CONSTRAINT HopDong_ibfk_2
        FOREIGN KEY (idKhachHang) REFERENCES KhachHang (idKhachHang),
    CONSTRAINT HopDong_ibfk_3
        FOREIGN KEY (idDichVu) REFERENCES DichVu (idDichVu)
);

CREATE INDEX idDichVu
    ON HopDong (idDichVu);

CREATE INDEX idKhachHang
    ON HopDong (idKhachHang);

CREATE INDEX idNhanVien
    ON HopDong (idNhanVien);

INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (1, 70, 88, 39, '2019-02-14', '2020-11-02', 497, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (2, 1, 19, 15, '2017-08-04', '2020-08-19', 689, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (3, 95, 15, 4, '2018-07-24', '2019-10-20', 522, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (4, 37, 93, 40, '2018-08-07', '2020-11-22', 735, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (5, 1, 82, 36, '2018-07-18', '2019-11-22', 997, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (6, 49, 96, 19, '2017-08-02', '2019-11-04', 731, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (7, 1, 61, 12, '2017-11-28', '2020-08-27', 804, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (8, 91, 31, 8, '2019-01-08', '2019-09-23', 148, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (9, 52, 1, 31, '2018-06-22', '2020-06-07', 839, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (10, 43, 67, 18, '2019-02-17', '2020-01-11', 586, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (11, 100, 33, 18, '2021-05-16', '2021-05-11', 995, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (12, 9, 14, 19, '2020-02-03', '2019-11-10', 298, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (13, 15, 38, 45, '2018-09-09', '2021-05-10', 564, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (14, 4, 37, 27, '2020-04-28', '2019-08-21', 258, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (15, 35, 40, 41, '2018-11-07', '2019-07-26', 164, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (16, 70, 48, 31, '2019-06-09', '2020-12-23', 460, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (17, 4, 9, 14, '2021-05-19', '2020-02-25', 930, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (18, 70, 69, 3, '2019-04-18', '2020-06-30', 599, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (19, 29, 63, 4, '2018-01-12', '2020-03-01', 447, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (20, 45, 36, 25, '2017-11-25', '2020-12-31', 150, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (21, 49, 9, 38, '2017-12-28', '2021-07-07', 147, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (22, 21, 68, 15, '2020-02-22', '2021-06-20', 583, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (23, 79, 40, 7, '2017-11-19', '2021-06-27', 864, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (24, 70, 9, 31, '2019-01-30', '2020-10-17', 451, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (25, 95, 27, 29, '2019-06-21', '2020-09-06', 928, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (26, 49, 12, 40, '2018-09-07', '2019-09-30', 238, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (27, 91, 71, 42, '2018-08-09', '2021-03-29', 461, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (28, 53, 26, 4, '2019-01-10', '2019-08-23', 822, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (29, 91, 3, 16, '2018-07-04', '2019-07-27', 186, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (30, 70, 55, 47, '2018-12-22', '2020-09-01', 258, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (31, 70, 4, 18, '2018-11-27', '2019-08-15', null, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (32, 96, 12, 43, '2019-11-26', '2021-02-20', 877, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (33, 56, 77, 14, '2017-08-22', '2020-11-01', 661, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (34, 15, 91, 35, '2018-12-04', '2020-04-16', 751, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (35, 41, 31, 25, '2017-10-05', '2020-01-18', 677, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (36, 40, 9, 44, '2018-06-13', '2020-04-15', 931, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (37, 30, 60, 20, '2020-02-28', '2020-02-19', 344, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (38, 4, 32, 18, '2019-10-17', '2020-09-11', 346, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (39, 96, 9, 26, '2019-10-12', '2019-09-23', 326, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (40, 49, 53, 48, '2017-11-05', '2019-11-26', 857, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (41, 43, 18, 35, '2018-10-17', '2020-06-28', 232, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (42, 43, 13, 35, '2019-05-03', '2020-08-03', 841, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (43, 40, 87, 28, '2019-04-16', '2021-07-11', null, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (44, 96, 1, 33, '2019-06-12', '2020-03-11', 660, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (45, 35, 18, 48, '2017-11-28', '2020-07-10', 596, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (46, 32, 1, 27, '2021-05-17', '2020-10-18', 337, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (47, 96, 23, 35, '2019-04-26', '2020-12-23', 144, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (48, 4, 35, 15, '2018-10-09', '2019-08-08', 857, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (49, 4, 30, 3, '2019-12-17', '2021-06-06', 777, 0);
INSERT INTO furama_resort.HopDong (idHopDong, idNhanVien, idKhachHang, idDichVu, ngayLapHopDong, ngayKetThuc, tienDatCoc, tongTien) VALUES (50, 29, 13, 9, '2018-09-27', '2019-11-29', 354, 0);