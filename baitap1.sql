create database student_manager;


create table class(
id int,
full_name varchar(255)
);

select * from class;
insert into class( id , full_Name)
value (1,'Thang');

create table teacher(
id int,
full_name varchar(255),
age int,check (age > 18),
country varchar(255)
);

use student_manager;
insert into teacher(id,full_name,age,country)
value(1,'thang',19,'Viet Nam');


select* from student_manager.teacher;

