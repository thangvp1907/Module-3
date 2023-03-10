create database student_manager;


create table class(
id int,
full_Name varchar(255)
);

select * from class;
insert into class( id , full_Name)
value (1,'Thang');

create table teacher(
id int,
full_name varchar(255),
age int,
country varchar(255)
);

select* from class;
insert into teacher(id,full_name,age,country)
value(1,'thua',28,'Viet Nam')

