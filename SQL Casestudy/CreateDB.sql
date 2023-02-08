CREATE DATABASE furama_resort;

USE furama_resort;

CREATE TABLE LoaiKhach
(
    idLoaiKhach int PRIMARY KEY,
    tenLoaiKhach varchar(45)
);

CREATE TABLE KhachHang
(
    idKhachHang int PRIMARY KEY,
    idLoaiKhach int,
    hoTen varchar(45),
    ngaySinh DATE,
    soCMND varchar(45),
    sdt varchar(45),
    email varchar(45),
    diaChi varchar(45),
    FOREIGN KEY (idLoaiKhach) REFERENCES LoaiKhach(idLoaiKhach)
);

CREATE TABLE KieuThue
(
    idKieuThue int PRIMARY KEY ,
    tenKieuThue varchar(45),
    gia int
);

CREATE TABLE LoaiDichVu
(
    idLoaiDichVu int PRIMARY KEY ,
    tenLoaiDichVu varchar(45)
);

CREATE TABLE DichVu
(
    idDichVu int PRIMARY KEY,
    tenDichVu varchar(45),
    dienTich int,
    soTang int,
    soNguoiToiDa int,
    chiPhiThue int,
    idKieuThue int,
    idLoaiDichVu int,
    trangThai varchar(45),
    FOREIGN KEY (idKieuThue) REFERENCES KieuThue(idKieuThue),
    FOREIGN KEY (idLoaiDichVu) REFERENCES LoaiDichVu(idLoaiDichVu)
);

CREATE TABLE ViTri
(
    idViTri int PRIMARY KEY,
    tenViTri varchar(45)
);

CREATE TABLE TrinhDo
(
    idTrinhDo int PRIMARY KEY ,
    trinhDo varchar(45)
);

CREATE TABLE BoPhan
(
    idBoPhan int PRIMARY KEY,
    tenBoPhan varchar(45)
);

CREATE TABLE NhanVien
(
    idNhanVien int PRIMARY KEY ,
    hoTen varchar(45),
    idViTri int,
    idTrinhDo int,
    idBoPhan int,
    ngaySinh date,
    soCMND varchar(45),
    luong int,
    sdt varchar(45),
    email varchar(45),
    diaChi varchar(45),
    FOREIGN KEY (idViTri) REFERENCES ViTri(idViTri),
    FOREIGN KEY (idTrinhDo) REFERENCES TrinhDo(idTrinhDo),
    FOREIGN KEY (idBoPhan) REFERENCES BoPhan(idBoPhan)
);

CREATE TABLE DichVuDiKem
(
    idDichViDiKem int PRIMARY KEY ,
    tenDichVuDiKem varchar(45)  ,
    gia int,
    donVi int,
    trangThaiKhaDung varchar(45)
);

CREATE TABLE HopDong
(
    idHopDong int PRIMARY KEY,
    idNhanVien int,
    idKhachHang int,
    idDichVu int,
    ngayLapHopDong date,
    ngayKetThuc date,
    tienDatCoc int,
    tongTien int,
    FOREIGN KEY (idNhanVien) REFERENCES NhanVien(idNhanVien),
    FOREIGN KEY (idKhachHang) REFERENCES KhachHang(idKhachHang),
    FOREIGN KEY (idDichVu) REFERENCES DichVu(idDichVu)
);

CREATE TABLE HopDongChiTiet
(
    idHopDongChiTiet int,
    idHopDong int,
    idDichVuDiKem int,
    soLuong int,
    FOREIGN KEY (idHopDong) REFERENCES HopDong(idHopDong),
    FOREIGN KEY (idDichVuDiKem) REFERENCES DichVuDiKem(idDichVuDiKem)
);