create database product;

use product;

create  table product(
id_product int auto_increment primary key,
product_code int,
product_name varchar(50),
product_price double,
product_amount varchar(100),
product_description varchar(100),
product_status varchar(20) 
);

insert into product
value(id_product,1,'Bet88',20.000,1,'nhà cái uy tín hàng đầu','Đang hoạt động'),
(id_product,1,'HappyLuck',50.000,1,'nhà cái hay sập hàng đầu','không hoạt động');

update product set product_code = 2
where product_name like 'HappyLuck';

-- index
create  unique INDEX index_product_name on product (product_name);
select * from product;

create INDEX  index_product on product (product_name,product_price);
select * from product;

drop index index_product on product;

explain select* from product;

-- View
create or replace view view_product as
select id_product, product_name, product_price,product_status from product;
update view_product set product_status = 'Đang hoạt động'
where product_name ='HappyLuck';
drop view view_product;
select* from view_product;

-- store procedure
Delimiter $$
create procedure products()
begin 
   select * from product;
end $$
Delimiter ;
call products();

drop procedure products;

Delimiter $$
create procedure new_product(
product_name varchar(50),
product_price double,
product_amount varchar(100),
product_description varchar(100),
product_status varchar(20)
) 
begin
select *from product;
insert into product
value(3,3,'FactBet',40,1,'Nhà cái pha ke','Không hoạt động'); 
end $$
Delimiter ;
call new_product();
drop procedure new_product;


 


