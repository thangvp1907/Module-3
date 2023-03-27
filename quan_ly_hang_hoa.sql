create database quan_ly_hang_hoa;

use quan_ly_hang_hoa;
create table customer(
id_customer int auto_increment primary key,
full_name varchar(50) NOT NULL,
age int
);

insert into customer
value(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);

create table orders(
id_orders int auto_increment primary key,
id_customer int,
orders_date date,
orders_total_prince varchar(255),
foreign key (id_customer) references customer(id_customer)
);

insert into orders
value(1,1,'2006-03-21',null),
(2,2,'2006-03-23',null),
(3,1,'2006-03-16',null);

create table product(
id_product int auto_increment primary key,
product_name varchar(255),
product_price int
); 

insert into product
value( 1,'may giat',3),
(2,'tu lanh',5),
(3,'dieu hoa',7),
(4,'quat',1),
(5,'bep dien',2);

create table orderdetail(
id_orders int,
id_product int,
so_luong int,
primary key(id_orders,id_product),
foreign key (id_orders) references orders(id_orders),
foreign key (id_product) references product(id_product)
);

insert into orderdetail
value(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

/*--bài 1:--*/
select id_orders,orders_date,orders_total_prince from orders;

/*--bài 2:--*/ 
/*cách 1*/
select full_name,product_name,orders_date,so_luong from product join
(select id_product,full_name,orders_date,so_luong from orderdetail  join
(select id_orders,full_name,orders_date,orders_total_prince from customer
join orders on orders.id_customer = customer.id_customer) as new_table
 on orderdetail.id_orders = new_table.id_orders) as table_2
 on product.id_product = table_2.id_product
 order by full_name ASC;
 
/*cách 2*/
select c.full_name,p.product_name,od.so_luong, o.orders_date
from customer c
join orders o on o.id_customer = c.id_customer
join orderdetail od on od.id_orders = o.id_orders
join product p on p.id_product = od.id_product
order by full_name ASC;

/*--bài 3:--*/
select c.id_customer,c.full_name
from customer c
where c.id_customer
not in( select o.id_customer from orders o);


select *from customer c
left join `orders` o on c.id_customer = o.id_customer
where o.id_customer is null;

/*--bài 4:--*/
select o.id_orders , o.orders_date , sum(so_luong*p.product_price) as gia_tien
from orders o
join orderdetail od on od.id_orders = o.id_orders
join product p on p.id_product = od.id_product
group by o.id_orders;






 
 

