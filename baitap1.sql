 SELECT * FROM student_manager.new_table;
 
 
 use student_manager;
 insert into new_table
 value (1,'thang');
 
 
 update new_table
 set name = 'tan'
 where id = 1;
 
 alter table new_table
 add column diem int;
 
 update new_table
 set diem = 10
 where id = 1;
 
 alter table new_table
 change name fullName varchar(100)
 
 