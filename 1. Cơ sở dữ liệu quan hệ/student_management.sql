create database student_management;


create table student(
id int auto_increment not null,
`name` varchar(50) not null,
age int default  0,
country varchar(50)not null,
primary key(id)
);

create table class(
id int auto_increment primary key not null,
name varchar(50)not null
);

create table teacher(
id int auto_increment primary key not null,
`name` varchar(50) not null,
age int,
country varchar(50)not null
);

insert into student(name,age,country) values ('Huy',20,'Viet Nam'),('Hai',25,'Viet Nam');
insert into teacher(name,age,country) values ('Tai',40,'Viet Nam'),('Teo',35,'Viet Nam');
insert into class(name) values ('java'),('C#');


