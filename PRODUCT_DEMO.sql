create database product_management;
use product_management;
create table category(
id int primary key,
name varchar(30)
);
create table product(
id int primary key auto_increment,
`name` varchar(30),
price varchar(30) not null,
quantity varchar(30) not null,
color varchar(30) not null,
`description` varchar(30) not null,
categoryId int not null,
constraint fk_product_category foreign key (categoryId) references Category(id)
);
insert into category value (1,'Phone'),(2,'Television'),(3,'Ipad'),(4,'Laptop');
insert into product (`name`,price,quantity,color,`description`,categoryId) value ('IPhone 12','700','10','Black, White, Gold','New',1),
('IPhone 13','900','44','Black, White, Gold','New',1),
('LG TV 145','1500','10','Black','New',2),
('SS TV 145','1500','1','Ground','New',2),
('Dell I22','800','10','Black','New',4);

select * from product p join category c on p.categoryid = c.id;	
