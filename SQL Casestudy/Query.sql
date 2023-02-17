USE furamaproject;


#2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K”
# và có tối đa 15 ký tự.
SELECT * FROM employee
WHERE (`name` LIKE 'H%' OR `name` LIKE 'T%' OR `name` LIKE 'K%')
  AND LENGTH(`name`) <= 15;

#3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
-- hàm timestampdiff(giá trị muốn lấy, thời gian nhỏ hơn, thời gian lớn hơn) curdate cho ra ngày tháng hiện tại
SELECT id, `name`, TIMESTAMPDIFF(YEAR, birthday, CURDATE()) AS age, id_card, phone_number, email, address
FROM customer
WHERE   TIMESTAMPDIFF(YEAR, birthday, CURDATE()) between 18 and 50 and (address like '%Đà Nẵng%' or address like '%Quảng Trị%');


#4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
# Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
# Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
-- 
SELECT customer.name, customer_type.name, COUNT(contract.customer_id) AS used
FROM customer
         INNER JOIN customer_type ON customer.customer_type_id = customer_type.id
         INNER JOIN contract ON customer.id = contract.customer_id
WHERE customer_type.name = 'Diamond'
 GROUP BY contract.customer_id
 ORDER BY COUNT(customer_id);


#5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien 
# (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) 
# cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

#tinh gia tien dich vu di kem theo hop dong chi tiet

SELECT cus.id,
       cus.`name`,
       c_type.`name`,
       con.id as ID_contract,
       f_type.`name` as facility_name,
       con.start_date,
       con.end_date
FROM contract con
		  JOIN customer cus ON cus.id = con.customer_id
         INNER JOIN facility fac ON con.facility_id = fac.id
         INNER JOIN customer_type c_type ON cus.customer_type_id = c_type.id
         INNER JOIN contract_detail c_detail on con.id = c_detail.contract_id
         INNER JOIN facility_type f_type on fac.facility_type_id = f_type.id
         ;
		
        
       

#6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu 
# của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).

#chon ra nhung dich vu duoc KH su dung sau qui 1 nam 2019
#sau do in ra nhung dich vu khong nam trong ds do
SELECT fac.id, fac.`name`, fac.area, fac.cost, f_type.`name`
FROM facility fac
         INNER JOIN facility_type f_type ON fac.id = f_type.id
WHERE fac.id NOT IN (SELECT fac.id
                       FROM contract
                                INNER JOIN facility ON contract.facility_id = fac.id
                       WHERE start_date >= '2019-04-01');

#7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu
# của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018
# nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.

#chon ra nhung dich vu khong duoc dung trong nam 2019
#xong tim xem trong nhung dich vu do, dich vu nao duoc dung trong nam 2018

SELECT DISTINCT HD.idDichVu, tenDichVu, dienTich, soNguoiToiDa, chiPhiThue, tenLoaiDichVu
FROM DichVu
         INNER JOIN HopDong HD ON DichVu.idDichVu = HD.idDichVu
         INNER JOIN LoaiDichVu LDV ON DichVu.idLoaiDichVu = LDV.idLoaiDichVu
WHERE HD.idDichVu NOT IN (SELECT DISTINCT idDichVu
                          FROM HopDong
                          WHERE ngayLapHopDong BETWEEN '2019-01-01' AND '2019-12-31')
  AND ngayLapHopDong BETWEEN '2018-01-01' AND '2018-12-31';

#8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
#Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên

SELECT DISTINCT hoTen
FROM KhachHang
ORDER BY hoTen;

SELECT hoTen
FROM KhachHang
GROUP BY hoTen
ORDER BY hoTen;

SELECT hoTen
FROM KhachHang
UNION
SELECT hoTen
FROM KhachHang;

#9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019
# thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

SELECT MONTH(ngayLapHopDong) AS thang, COUNT(*) AS soLuongDV
FROM HopDong
WHERE ngayLapHopDong BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY MONTH(ngayLapHopDong);

#10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm.
# Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem
# (được tính dựa trên việc count các IDHopDongChiTiet).

SELECT HopDong.idHopDong, ngayLapHopDong, ngayKetThuc, tienDatCoc, COUNT(idHopDongChiTiet) AS soLuongDichVuDiKem
FROM HopDongChiTiet
         INNER JOIN HopDong ON HopDongChiTiet.idHopDong = HopDong.idHopDong
GROUP BY idHopDong;

#11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng
# có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.

#tim nhung khach hang Diamond va o Vinh hoac Quang Ngai
#tim hop dong cua nhung khach hang do, dua vao do lay duoc hop dong chi tiet va DVDK

SELECT idKhachHang, DVDK.idDichVuDiKem, tenDichVuDiKem, soLuong
FROM HopDong
         INNER JOIN HopDongChiTiet HDCT ON HopDong.idHopDong = HDCT.idHopDong
         INNER JOIN DichVuDiKem DVDK ON HDCT.idDichVuDiKem = DVDK.idDichVuDiKem
WHERE idKhachHang IN (SELECT idKhachHang
                      FROM KhachHang
                               INNER JOIN LoaiKhach LK ON KhachHang.idLoaiKhach = LK.idLoaiKhach
                      WHERE tenLoaiKhach = 'Diamond'
                        AND diaChi IN ('Vinh', 'Quang Ngai'));

#12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem
# (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã
# từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.

#tim cac dich vu khong duoc dat vao 6 thang dau nam 2019
#sao do tim xem trong cac dich vu do, dich vu duoc dat vao 3 thang cuoi nam 2019
SELECT HopDong.idHopDong,
       NV.hoTen                AS tenNV,
       KH.hoTen                AS tenKH,
       KH.sdt                  AS sdtKH,
       tenDichVu,
       COUNT(idHopDongChiTiet) AS soLuongDVDK,
       tienDatCoc
FROM HopDong
         INNER JOIN NhanVien NV ON HopDong.idNhanVien = NV.idNhanVien
         INNER JOIN KhachHang KH ON HopDong.idKhachHang = KH.idKhachHang
         INNER JOIN DichVu DV ON HopDong.idDichVu = DV.idDichVu
         INNER JOIN HopDongChiTiet HDCT ON HopDong.idHopDong = HDCT.idHopDong
WHERE DV.idDichVu NOT IN (SELECT idDichVu
                          FROM HopDong
                          WHERE ngayLapHopDong BETWEEN '2019-01-01' AND '2019-06-30')
  AND ngayLapHopDong BETWEEN '2019-10-01' AND '2019-12-31'
GROUP BY HopDong.idHopDong;

#13.    Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
# (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

SELECT HDCT.idDichVuDiKem, tenDichVuDiKem, SUM(soLuong) AS soLanSuDung
FROM DichVuDiKem
         INNER JOIN HopDongChiTiet HDCT ON DichVuDiKem.idDichVuDiKem = HDCT.idDichVuDiKem
GROUP BY HDCT.idDichVuDiKem
HAVING SUM(soLuong) = (SELECT MAX(soLuong)
                       FROM (SELECT SUM(soLuong) AS soLuong
                             FROM HopDongChiTiet
                             GROUP BY idDichVuDiKem) AS thongKeDVDK);

#14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
# Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.

#tim dich vu duoc su dung 1 lan
SELECT HopDongChiTiet.idHopDong, tenLoaiDichVu, tenDichVuDiKem
FROM HopDongChiTiet
         INNER JOIN DichVuDiKem ON HopDongChiTiet.idDichVuDiKem = DichVuDiKem.idDichVuDiKem
         INNER JOIN HopDong ON HopDongChiTiet.idHopDong = HopDong.idHopDong
         INNER JOIN DichVu DV ON HopDong.idDichVu = DV.idDichVu
         INNER JOIN LoaiDichVu LDV ON DV.idLoaiDichVu = LDV.idLoaiDichVu
WHERE DichVuDiKem.idDichVuDiKem = (SELECT idDichVuDiKem
                                   FROM HopDongChiTiet
                                   GROUP BY idDichVuDiKem
                                   HAVING SUM(soLuong) = 1);

#15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi
# mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.

SELECT HopDong.idNhanVien, hoTen, trinhDo, tenBoPhan, sdt, diaChi, COUNT(idDichVu)
FROM HopDong
         INNER JOIN NhanVien NV ON HopDong.idNhanVien = NV.idNhanVien
         INNER JOIN TrinhDo TD ON NV.idTrinhDo = TD.idTrinhDo
         INNER JOIN BoPhan BP ON NV.idBoPhan = BP.idBoPhan
WHERE YEAR(ngayLapHopDong) BETWEEN 2018 AND 2019
GROUP BY idNhanVien
HAVING COUNT(idDichVu) <= 3;

#16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
DELETE
FROM NhanVien
WHERE idNhanVien NOT IN
      (SELECT HopDong.idNhanVien
       FROM HopDong
       WHERE YEAR(ngayLapHopDong) BETWEEN 2017 AND 2019
       GROUP BY HopDong.idNhanVien);

#17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang (từ  Platinium)lên Diamond,
# chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000

#tim ra nhung khach hang loai Platinum co tong tien thanh toan nam 2019 >10000
SELECT HopDong.idKhachHang
FROM HopDong
         INNER JOIN KhachHang KH ON HopDong.idKhachHang = KH.idKhachHang
WHERE idLoaiKhach = (SELECT idLoaiKhach
                     FROM LoaiKhach
                     WHERE tenLoaiKhach = 'Platinum')
  AND YEAR(ngayKetThuc) = 2019
GROUP BY idKhachHang
HAVING SUM(tongTien) > 10000;

#nang cap nhung khach hang o tren len Diamond
UPDATE KhachHang
SET idLoaiKhach = (SELECT idLoaiKhach FROM LoaiKhach WHERE tenLoaiKhach = 'Diamond')
WHERE idKhachHang IN (
    SELECT idKhachHang
    FROM (SELECT HopDong.idKhachHang
          FROM HopDong
                   INNER JOIN KhachHang KH ON HopDong.idKhachHang = KH.idKhachHang
          WHERE idLoaiKhach = (SELECT idLoaiKhach
                               FROM LoaiKhach
                               WHERE tenLoaiKhach = 'Platinum')
            AND YEAR(ngayKetThuc) = 2019
          GROUP BY idKhachHang
          HAVING SUM(tongTien) > 10000) AS updateList);

#18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràng buộc giữa các bảng).

ALTER TABLE HopDong
    DROP FOREIGN KEY HopDong_ibfk_2;

ALTER TABLE HopDongChiTiet
    DROP FOREIGN KEY HopDongChiTiet_ibfk_1;

ALTER TABLE HopDong
    ADD CONSTRAINT FOREIGN KEY (idKhachHang) REFERENCES KhachHang (idKhachHang)
        ON DELETE CASCADE;

ALTER TABLE HopDongChiTiet
    ADD CONSTRAINT FOREIGN KEY (idHopDong) REFERENCES HopDong (idHopDong)
        ON DELETE CASCADE;

DELETE
FROM KhachHang
WHERE idKhachHang IN (SELECT HopDong.idKhachHang FROM HopDong WHERE YEAR(ngayLapHopDong) < 2016);

#19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
#chon ra nhung dich vu di kem duoc su dong tren 10 lan trong nam 2019

SELECT idDichVuDiKem, SUM(soLuong) AS soLuong
FROM HopDongChiTiet
         INNER JOIN HopDong HD ON HopDongChiTiet.idHopDong = HD.idHopDong
WHERE YEAR(ngayLapHopDong) = 2019
GROUP BY idDichVuDiKem
HAVING SUM(soLuong) > 10;

#Update gia
UPDATE DichVuDiKem
SET gia = gia * 2
WHERE idDichVuDiKem IN (SELECT idDichVuDiKem
                        FROM HopDongChiTiet
                                 INNER JOIN HopDong HD ON HopDongChiTiet.idHopDong = HD.idHopDong
                        WHERE YEAR(ngayLapHopDong) = 2019
                        GROUP BY idDichVuDiKem
                        HAVING SUM(soLuong) > 10);

#20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống,
# thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.

SELECT idKhachHang, hoTen, email, sdt, ngaySinh, diaChi
FROM KhachHang
UNION ALL
SELECT idNhanVien, hoTen, email, sdt, ngaySinh, diaChi
FROM NhanVien;

#21.	Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên
# có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho 1 hoặc nhiều Khách hàng bất kỳ
# với ngày lập hợp đồng là “12/12/2019”

CREATE VIEW V_NHANVIEN AS
SELECT NhanVien.idNhanVien,
       hoTen,
       idViTri,
       idTrinhDo,
       idBoPhan,
       ngaySinh,
       soCMND,
       luong,
       sdt,
       email,
       diaChi
FROM NhanVien
         INNER JOIN HopDong HD ON NhanVien.idNhanVien = HD.idNhanVien
WHERE ngayLapHopDong = '2019-12-12'
  AND diaChi = 'Hai Chau';

#22.	Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật địa chỉ thành “Liên Chiểu”
# đối với tất cả các Nhân viên được nhìn thấy bởi khung nhìn này.

UPDATE V_NHANVIEN
SET diaChi = 'Lien Chieu'
WHERE idNhanVien IN (SELECT idNhanVien
                     FROM (SELECT * FROM V_NHANVIEN) AS view);

#23.	Tạo Clustered Index có tên là IX_KHACHHANG trên bảng Khách hàng.
#Giải thích lý do và thực hiện kiểm tra tính hiệu quả của việc sử dụng INDEX
EXPLAIN SELECT * FROM KhachHang WHERE idLoaiKhach = 2;

CREATE INDEX IX_KHACHHANG ON KhachHang(idKhachHang);

#24.	Tạo Non-Clustered Index có tên là IX_SoDT_DiaChi trên các cột SODIENTHOAI và DIACHI trên bảng KHACH HANG
# và kiểm tra tính hiệu quả tìm kiếm sau khi tạo Index.
EXPLAIN
SELECT *
FROM KhachHang KH
WHERE KH.diaChi = 'Da Nang'AND sdt = '143 863 2218';

CREATE INDEX IX_SoDT_DiaChi ON KhachHang(sdt,diaChi);
EXPLAIN
SELECT *
FROM KhachHang KH
WHERE KH.diaChi = 'Da Nang' AND sdt = '143 863 2218';

#25.	Tạo Store procedure Sp_1 Dùng để xóa thông tin của một Khách hàng nào đó
# với Id Khách hàng được truyền vào như là 1 tham số của Sp_1

DELIMITER \\
CREATE PROCEDURE Sp_1(IN id int)
BEGIN
    DELETE FROM KhachHang WHERE idKhachHang = id;
END; \\
DELIMITER ;

CALL Sp_1(1);

#26.	Em xin phép k làm nữa để còn làm bài tập trên trường ạ :v

select count(IDKhachHang)
from HopDong
inner join KhachHang on HopDong.IDKhachHang = KhachHang.IDKhachHang
where KhachHang.IDLoaiKhach=(
								select IDLoaiKhach
								from LoaiKhach
								where TenLoaiKhach='Diamond')
group by IDKhachHang

