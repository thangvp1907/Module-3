create database quan_ly_don_hang;

create table khach_hang (
ma_dh int,
ten_dh varchar(255),
dia_chi varchar(255),
dien_thoai int 
);

create table nguoi_dh (
ma_dh int,
ten_dh varchar(255)
);

create table nguoi_nhan (
ma_nn int,
ten_nn varchar(255)
);

create table hang (
ma_hang int,
ten_hang varchar(255),
don_vi_tinh varchar(255),
mo_ta_hang varchar(255) 
);

create table nguoi_giao (
ma_nguoi_giao int,
ten_nguoi_giao varchar(255) 
);

create table noi_giao(
ma_noi_giao int,
dia_chi_giao varchar(255) 
);






