
USE QuanLynghiduongFurama;


-- câu 1
select ma_nhan_vien,ho_ten,char_length(ho_ten) as length
from nhan_vien	
where (ho_ten like 'H%' or ho_ten like 'K%' or ho_ten like 'T%') and char_length (ho_ten) <=15;

-- câu 2
select ma_khach_hang,ho_ten
from khach_hang
where ( year (curdate()) - year(ngay_sinh)  between 18 and 50) and (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng trị');

-- câu 3
select k.ma_khach_hang,k.ho_ten,lk.ten_loai_khach,count(hd.ma_khach_hang) as soluong
from khach_hang k
join loai_khach lk on lk.ma_loai_khach = k.ma_loai_khach
join hop_dong hd on hd.ma_khach_hang = k.ma_khach_hang 
group by k.ma_khach_hang
having ten_loai_khach = 'Diamond'
order by soluong ASC;

-- câu 5

select kh.ma_khach_hang,kh.ho_ten,lk.ten_loai_khach,hd.ma_hop_dong,dv.ten_dich_vu,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,
sum(ifnull(chi_phi_thue,0) + ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0)) as tong_tien
from khach_hang kh
left join  loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd on  hd.ma_khach_hang = kh.ma_khach_hang 
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
-- group by kh.ho_ten;
group by hd.ma_hop_dong;


-- câu 6 
select hd.ma_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dich_vu, month(hd.ngay_lam_hop_dong) as tháng , year(hd.ngay_lam_hop_dong) as year
from dich_vu dv
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu 
join hop_dong hd on  hd.ma_dich_vu = dv.ma_dich_vu
where  hd.ma_dich_vu not in (select hd1.ma_dich_vu from hop_dong hd1 where quarter(hd1.ngay_lam_hop_dong) = 1 and year(hd1.ngay_lam_hop_dong) = 2021  ) 
group by dv.ma_dich_vu;

-- câu 7 
select hd.ma_dich_vu,dv.ten_dich_vu,dv.dien_tich,dv.so_nguoi_toi_da,dv.chi_phi_thue,ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu 
join hop_dong hd on  hd.ma_dich_vu = dv.ma_dich_vu
where year (hd.ngay_lam_hop_dong) = 2020 and (hd.ma_dich_vu not in (select ma_dich_vu from hop_dong hd1 where year(hd1.ngay_lam_hop_dong) =2021))
group by dv.ma_dich_vu;

-- câu 8
select distinct (kh.ho_ten) from khach_hang kh;

-- câu 9 
select  month(hd.ngay_lam_hop_dong) as tháng ,count(hd.ma_hop_dong) as số_lần_đặt
from hop_dong hd
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
group by  month(hd.ngay_lam_hop_dong)
order by month(hd.ngay_lam_hop_dong) ASC;

-- câu 10
select hd.ma_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,hd.tien_dat_coc,sum(ifnull(hdct.so_luong,0)) as số_lượng_đi_kèm
from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong;


-- câu 11
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet  hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = 'Diamond' and (kh.dia_chi like '%Vinh' or kh.dia_chi like '%Quảng Ngãi');


-- câu 12
select hd.ma_hop_dong,nv.ho_ten,kh.ho_ten,kh.so_dien_thoai,dv.ten_dich_vu,sum(ifnull(hdct.so_luong,0)) as số_lượng_đi_kèm,hd.tien_dat_coc
from hop_dong hd
left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang 
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong
having hd.ma_hop_dong IN (select hd1.ma_hop_dong from hop_dong hd1 where quarter(hd1.ngay_lam_hop_dong) = 4 and hd1.ma_hop_dong != 2021 );

  
-- câu 13
select dvdk.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem,sum(hdct.so_luong)
from dich_vu_di_kem dvdk 
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ten_dich_vu_di_kem
order by so_luong  DESC
limit 2;

-- câu 14
select hd.ma_hop_dong,ldv.ten_loai_dich_vu ,dvdk.ten_dich_vu_di_kem,count(hdct.so_luong) as su_dung
from hop_dong hd
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ten_dich_vu_di_kem
having su_dung = 1
order by hd.ma_hop_dong ASC;

-- câu 15
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv
join hop_dong hd using(ma_nhan_vien)
join trinh_do td using(ma_trinh_do)
join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
where  year(hd.ngay_lam_hop_dong)in(2020,2021)
group by ma_nhan_vien
having count(hd.ma_nhan_vien) <=3 
order by nv.ma_nhan_vien;

-- câu 16 
-- xóa vật lý
delete from nhan_vien
where nhan_vien.ho_ten not in(select * from( select nv2.ho_ten from nhan_vien nv2 join hop_dong hd1 on hd1.ma_nhan_vien = nv2.ma_nhan_vien) as nt);
select*from nhan_vien;

-- xóa logic
alter table nhan_vien
add column so_hop_dong boolean NOT NULL default  1;
update nhan_vien set so_hop_dong = 0 where ma_nhan_vien not in (
select ma_nhan_vien
from hop_dong
where year(ngay_lam_hop_dong)between 2019 and 2021);
CREATE VIEW nhan_vien_view AS 
SELECT *FROM nhan_vien
where nhan_vien.so_hop_dong =0;
   


-- câu 17

create view v_khach_hang as 
select kh.ma_khach_hang, kh.ho_ten, sum(ifnull(dv.chi_phi_thue,0)+(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0)))as tong_tien 
from khach_hang as kh
 join loai_khach as lk on lk.ma_loai_khach=kh.ma_loai_khach
 join hop_dong as hd on hd.ma_khach_hang=kh.ma_khach_hang
join dich_vu as dv on dv.ma_dich_vu=hd.ma_dich_vu
 join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
 join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
where year(ngay_lam_hop_dong)=2021
group by hd.ma_hop_dong,hd.ma_khach_hang;
update khach_hang set ma_loai_khach = (select ma_loai_khach from loai_khach where ten_loai_khach ='Diamond')
where ma_khach_hang in(select ma_khach_hang from v_khach_hang where tong_tien>10000000); 

update khach_hang,
(select sum(ifnull(dv.chi_phi_thue,0)+(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0)))as tong_tien  from hop_dong hd
join 
where year(hd.ngay_lam_hop_dong) = 2021
group by hd.ma_hop_dong
having tong_tien >10000000) as temp set khach_hang.ma_khach_hang = (select loai_khach.ma_loai_khach from loai_khach where loai_khach.ten_loai_khach = 'Diamond')
where khach_hang.ma_loai_khach = (select loai_khach.ma_loai_khach from loai_khach where loai_khach.ten_loai_khach = 'Platinum');

-- câu 18
alter table khach_hang
add column is_delete boolean NOT NULL default 1;
update khach_hang set is_delete = 0 where ma_khach_hang not in 
(select new_tab.ma_khach_hang from (
select kh.ma_khach_hang
from khach_hang kh
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang 
where year(hd.ngay_lam_hop_dong) < 2021) as new_tab
);
create view xoa_khac_hang_hop_dong_2020 as
select * from khach_hang kh
where kh.is_delete = 1;

-- câu 19 
update dich_vu_di_kem set gia = gia*2 where  ma_dich_vu_di_kem  in (
select hdct.ma_dich_vu_di_kem,sum(hdct.so_luong) AS so
from hop_dong_chi_tiet hdct
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
where year(hd.ngay_lam_hop_dong) = 2020
group by hdct.ma_dich_vu_di_kem
having so > 10 );
select*from dich_vu_di_kem;


-- câu 20
select nv.ma_nhan_vien as id, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi
from nhan_vien nv
union all
select kh.ma_khach_hang as id, kh.ho_ten, kh.email, kh.so_dien_thoai,kh.ngay_sinh, kh.dia_chi
from khach_hang kh;



-- câu 21
create view cau_21 as
select nv.ho_ten
from nhan_vien nv
left join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where nv.dia_chi like '% Đà Nẵng' and hd.ngay_lam_hop_dong ='12/12/2019';




 
 
 
         
         