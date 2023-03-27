create database quan_ly_hoc_sinh;

use quan_ly_hoc_sinh;
create table class(
id_class int auto_increment primary key,
class_name varchar(255) NOT NULL,
start_date date,
status int
);

insert into class
value(id_class,'A1','2008-12-20',1),
(id_class,'A2','2008-12-22',1),
(id_class,'B3',current_date(),0);

create table student(
id_students int auto_increment primary key,
student_name varchar(50) NOT NULL,
address varchar(255) NOT NULL,
phone int,
status int,
id_class int,
foreign key (id_class) references class(id_class)
);

insert into student
value(id_students,' Hung ','Ha noi', 0912113113 , 1 , 1),
     (id_students,' Hoa ','Hai phong', null ,1,1),
     (id_students,' Manh ','HCM',0123123123,0,2),
     (id_students,' Thang ','Da nang',086868688,1,2);
     
create table subjects(
id_sub int auto_increment primary key,
sub_name varchar(255) NOT NULL,
credit int NOT NULL,
status int
);

insert into subjects
value(id_sub,'CF',5,1),
(id_sub,'FIFA',6,1),
(id_sub,'CSGO',5,1),
(id_sub,'Bet88',10,1);

create table mark(
id_mark int auto_increment primary key,
id_sub int NOT NULL,
id_student int NOT NULL,
mark int,
exam_time int NOT NULL,
foreign key(id_sub) references subjects(id_sub),
foreign key(id_student) references student(id_students)
);

insert into mark
value(1,1,1,8,1),
(2,1,2,10,2),
(3,2,1,12,1);


SELECT * FROM student
where student_name like '% H%';

select * from class
where month(start_date) = 12;

select * from subjects
where credit >3 and credit <= 6 ;

update student set id_class = 2
where student_name like '_Hung%';

select student_name,mark,sub_name from student join
(select sub_name,mark,id_student from mark join subjects 
on mark.id_sub = subjects.id_sub) as new_table
where student.id_students = new_table.id_student
order by mark.mark DESC,student.student_name ASC;


-- thao tác hàm --
-- bài 1
select  address ,count(student_name) as so_luong
from student s
group by address;
-- bài 2
select id_students,student_name,avg(mark) as diem_trung_binh
from student s
 join mark m on m.id_student = s.id_students
group by id_students,student_name;
-- bài 3
select id_students,student_name,avg(mark) as diem_trung_binh
from student s
join mark m on m.id_student = s.id_students
group by id_students,student_name
having diem_trung_binh > 15;
-- bài 4
select s.*,avg(mark) as diem_trung_binh
from student s
join mark m on m.id_student = s.id_students
group by m.id_student
having avg(mark) >= (select avg(mark) from mark);

use quan_ly_hoc_sinh;
select id_students,student_name,mark as diem_trung_binh
from student s
join mark m on m.id_student = s.id_students
where mark >= (select avg(mark) from mark);





-- bài tập 5
select * from subjects
where credit>=(select max(credit) from subjects);

select sub.*,max(credit)
from subjects sub
group by id_sub
having credit =(select max(credit) from subjects);
-- bài 6
select s.*,max(mark) from subjects s
join mark m on s.id_sub = m.id_sub
group by id_sub 
having max(mark) >= (select max(mark) from mark);
-- bài 7
select s.*,sub_name,avg(mark) as diem_trung_binh from student s
join mark m on s.id_students = m.id_student
join subjects sub on sub.id_sub = m.id_sub
group by id_student,sub.id_sub
order by avg(mark) DESC;





-- hiện học sinh có số điểm cao nhất 
use quan_ly_hoc_sinh;
select s.*,mark
from student s
join mark m on m.id_student = s.id_students
where mark >=(select max(mark) from mark);

select s.*,max(mark)
from student s
join mark m on m.id_student = s.id_students
group by id_student
having max(mark) >= (select max(mark) from mark);
