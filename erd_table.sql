create database erd;

use erd;
create table phieu_xuat(
so_phieu_xuat int auto_increment primary key,
ngay_xuat date
);
create table vat_tu(
ma_vat_tu int auto_increment primary key,
ten_vat_tu varchar(255)
);
create table chi_tiet_phieu_xuat(
so_phieu_xuat int,
ma_vat_tu int,
dg_xuat varchar(255),
so_luong_xuat int,
primary key(so_phieu_xuat,ma_vat_tu),
foreign key(so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table phieu_nhap(
so_phieu_nhap int auto_increment primary key,
ngay_nhap date
);

create table chi_tiet_phieu_nhap(
ma_vat_tu int,
so_phieu_nhap int,
dg_nhap varchar(255),
so_luong_nhap int,
primary key(ma_vat_tu,so_phieu_nhap),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);


create table nha_cung_cap(
ma_nha_cung_cap int auto_increment primary key,
ten_nha_cung_cap varchar(255),
dia_chi varchar(255)
);

create table don_dat_hang(
so_don_hang int auto_increment primary key,
ma_nha_cung_cap int,	
ngay_dat_hang date,
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table chi_tiet_don_dat_hang(
so_don_hang int,
ma_vat_tu int,
primary key(so_don_hang,ma_vat_tu),
foreign key(so_don_hang) references don_dat_hang(so_don_hang),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table so_dien_thoai(
ma_nha_cung_cap int primary key,
so_dien_thoai varchar(255),
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

