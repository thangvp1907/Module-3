create database customer;

use customer;
create table customer(
idc int auto_increment Primary key,
full_name varchar(255),
age int NOT NULL check(age >18)
);

create table orders(
ido int auto_increment primary key ,
id int NOT NULL,
odate datetime,
ototalprice double,
foreign key(id) references customer(idc)
);

create table products(
idp int auto_increment primary key,
namep varchar(255),
price double
);

create table order_detail(
ido int,
idp int,
odqtv varchar(255),
primary key(ido,idp),
foreign key (ido) references orders(ido),
foreign key (idp) references products(idp)
);

insert into customer
value(1,'thang',20),
	(2,'tan',25),
    (3,'tuan',30);

insert into products
value (1,1,20.000),
(2,2,30.000),
(3,2,40.000),
(4,3,50.000);