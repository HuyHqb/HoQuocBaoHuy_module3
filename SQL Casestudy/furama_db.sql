
create database furamaproject;

use furamaproject;

create table `position`(
id int auto_increment auto_increment primary key, 
`type` varchar(45)
);

create table division(
id int auto_increment primary key, 
`type` varchar(45));

create table education_degree(
id int auto_increment primary key, 
`type` varchar(45));

create table employee(
id int auto_increment primary key, 
`name` varchar(45), 
birthday date, 
id_card varchar(25), 
salary double, 
phone_number varchar(11), 
email varchar(45), 
address varchar(45), 
position_id int, 
education_degree_id int, 
division_id int,
foreign key(position_id) references `position`(id),
foreign key(education_degree_id) references education_degree(id),
foreign key(division_id) references division(id)
);

create table customer_type(
id int auto_increment primary key, 
`type` varchar(45)
);

create table customer(
id int auto_increment primary key, 

`name` varchar(45), 
birthday date, 
gender bit(1), 
id_card varchar(25),
phone_number varchar(11), 
email varchar(45),
address varchar(45),
customer_type_id int, 
foreign key(customer_type_id) references customer_type(id)

);

create table rent_type(
id int auto_increment primary key, 
`type` varchar(45)
);

create table facility_type(
id int auto_increment primary key, 
`type` varchar(45)
);

create table facility(
id int auto_increment primary key, 
`name` varchar(45),
area int,
cost double,
max_people int,
standard_room varchar(45),
other_service_description varchar(45),
pool_area double,
floor int,
facility_free text,
rent_type_id int,
facility_type_id int,

foreign key(rent_type_id) references rent_type(id),
foreign key(facility_type_id) references facility_type(id)
);

create table contract(
id int auto_increment primary key, 
start_date date, 
end_date date, 
deposit double, 
employee_id int, 
customer_id int, 
facility_id int,
foreign key(employee_id) references employee(id),
foreign key(customer_id) references customer(id),
foreign key(facility_id) references facility(id)
);

create table attach_facility(
id int auto_increment primary key, 
`name` varchar(45), 
cost double, 
unit varchar(10), 
`status` varchar(45)
);

create table contract_detail(
id int auto_increment primary key,  
quantity int,
contract_id int, 
attach_facility_id int, 
foreign key(contract_id) references contract(id),
foreign key(attach_facility_id) references attach_facility(id)
);

delimiter //
create procedure delete_facility_by_id(in id int)
begin 

delete from facility  
where facility.id = id;

end//
delimiter ;

delimiter //
create procedure delete_customer_by_id(in id int)
begin 

delete from customer
where customer.id = id;

end//
delimiter ;phong_tro

delimiter //
create procedure delete_employee_by_id(in id int)
begin 

delete from employee
where employee.id = id;

end//
delimiter ;
select c.*, c_type.type from customer c join customer_type c_type on c.customer_type_id = c_type.id
