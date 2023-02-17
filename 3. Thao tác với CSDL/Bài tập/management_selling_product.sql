create database management_product;
use management_product;
create table customer(
c_id int auto_increment primary key,
c_name varchar(50),
c_age int
);

create table order1(
o_id int auto_increment primary key,
c_id int,
o_date date,
o_total_price float,
foreign key(c_id) references customer(c_id)
);

create table product(
p_id int auto_increment primary key,
p_name varchar(50),
p_price float
);

create table order_detail(
o_id int ,
p_id int ,
odqty int,
primary key(o_id,p_id),
foreign key(o_id) references order1(o_id),
foreign key(p_id) references product(p_id)
);

insert into customer(c_id,c_name,c_age)
values(1,'Minh Quan',10),(2,'Ngoc Anh',20),(3,'hong ha',50);

insert into order1(o_id,c_id,o_date,o_total_price)
values(1,1,'2006/3/21',null),(2,2,'2006/3/23',null),(3,3,'2006/3/16',null);

insert into product(p_id,p_name,p_price)
values(1,'May giat',3),(2,'Tu Lanh',5),(3,'Dieu hoa',7),(4,'quat',1),(5,'bep dien',2);

insert into order_detail(o_id,p_id,odqty)
values(1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o_id,o_date,o_total_price from order1;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c_name , p_name from (
customer inner join order1 inner join order_detail inner join product
on customer.c_id = order1.c_id and order1.o_id = order_detail.o_id and order_detail.p_id = product.p_id);

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

select c_name from customer 
where customer.c_id not in (select c_id from order1);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn).

select o.o_id, o.o_date, sum(odt.odqty*p.p_price) as total_price from (
order1 o join order_detail odt join product p
on o.o_id = odt.o_id and odt.p_id = p.p_id
);
