create database quanliphongtro;


create table hinh_thuc_thanh_toan(
ma_hinh_thuc_thanh_toan int primary key not null,
kieu_thue varchar(20) not null
);
create table phong_tro(
ma_phong_tro int primary key,
ten_nguoi_thue varchar(40) not null,
sdt varchar(10) not null,
ngay_bat_dau date not null,
ma_hinh_thuc_thanh_toan int not null,
ghi_chu varchar(100),
foreign key(ma_hinh_thuc_thanh_toan) references hinh_thuc_thanh_toan(ma_hinh_thuc_thanh_toan)
);

