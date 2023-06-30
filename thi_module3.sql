
create database benh_vien;
use benh_vien;
create table benh_an(
ma_benh_an varchar(255) primary key,
ten_benh_an varchar(255),
cap_do_benh varchar(40)
);
create table benh_nhan(
ma_benh_nhan varchar(255) primary key,
loai_benh_nhan varchar(255)
);
create table thong_tin_chi_tiet_benh_an(
ma_benh_an varchar(255) primary key,
ma_benh_nhan varchar(255) ,
ten_benh_nhan varchar(255) ,
ngay_nhap_vien varchar(255) ,
ngay_ra_vien varchar(255) ,
ly_do_nhap_vien varchar(255) ,
foreign key (ma_benh_an) references benh_an(ma_benh_an),
foreign key (ma_benh_nhan) references benh_nhan(ma_benh_nhan));
insert into benh_an(ma_benh_an)
value('BA-001'),
('BA-112'),
('BA-223'),
('BA-444');
	insert into benh_nhan(ma_benh_nhan)
value('BN-435'),
('BN-123'),
('BN-984'),
('BN-153');	
select * from benh_nhan;
insert into thong_tin_chi_tiet_benh_an ( ma_benh_an,ma_benh_nhan,ten_benh_nhan,ngay_nhap_vien,ngay_ra_vien,ly_do_nhap_vien) values
('BA-001','BN-435', 'Nguyen Van A','07-08-2016','08-08-2019','Ung thư gan giai đoạn cuối'),
( 'BA-112','BN-123','Nguyen Van C','10-08-2019','10-08-2020','Suy Thận mạn'),
( 'BA-223','BN-984','Ton Nu D','11-01-2020','08-08-2020','Covid-2019'),
('BA-444','BN-153','Doan THi E','07-08-2017','08-08-2018','Ung thư phổi giai đoạn cuối');
select * from thong_tin_chi_tiet_benh_an;


alter table thong_tin_chi_tiet_benh_an
add column display int default 1;

