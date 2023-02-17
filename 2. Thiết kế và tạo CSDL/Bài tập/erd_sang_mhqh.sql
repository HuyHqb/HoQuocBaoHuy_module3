create database chuyen_doi_erd_sang_mhqh;
use chuyen_doi_erd_sang_mhqh;

create table vattu(
mavtu int auto_increment primary key,
tenvtu varchar(50)
);

create table phieuxuat(
sopx int primary key,
ngayxuat date
);

create table chitietpx(
sopx_chitiet int,
mavtu_chitiet int auto_increment,
dgxuat float,
slxuat int,
primary key(sopx_chitiet,mavtu_chitiet),
foreign key(sopx_chitiet) references phieuxuat(sopx),
foreign key(mavtu_chitiet) references vattu(mavtu)
);

create table phieunhap(
sopn int auto_increment primary key,
ngaynhap date
);

create table chitietpn(
sopn_chitiet int ,
mavtu_chitiet int auto_increment,
dgnhap float,
slnhap int,
primary key(sopn_chitiet,mavtu_chitiet),
foreign key(sopn_chitiet) references phieunhap(sopn),
foreign key(mavtu_chitiet) references vattu(mavtu)
);

create table nhacc(
manhacc int primary key,
tenncc varchar(50),
diachi varchar(50) 
);

create table sdt_nhacc(
masdt int auto_increment primary key,
sdt int,
foreign key(sdt) references nhacc(manhacc)
);

create table dondh(
sodh int auto_increment primary key,
ngaydh date,
manhacc_dondh int,
foreign key(manhacc_dondh) references nhacc(manhacc)
);

create table chitietdh(
sodh_chitiet int ,
mavtu_chitiet int auto_increment,
dgnhap float,
slnhap int,
primary key(sodh_chitiet,mavtu_chitiet),
foreign key(sodh_chitiet) references dondh(sodh),
foreign key(mavtu_chitiet) references vattu(mavtu)
);



