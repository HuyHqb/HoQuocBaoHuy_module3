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
