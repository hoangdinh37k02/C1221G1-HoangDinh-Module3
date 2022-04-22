create database resort_management;
use resort_management;

create table vi_tri(
ma_vi_tri int auto_increment primary key,
ten_vi_tri varchar(45)
);

create table trinh_do(
ma_trinh_do int auto_increment primary key,
ten_trinh_do varchar(45)
);

create table bo_phan(
ma_bo_phan int auto_increment primary key,
ten_bo_phan varchar(45)
);

create table nhan_vien(
ma_nhan_vien int auto_increment primary key,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(20) not null,
luong double not null,
so_dt varchar(20) not null,
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int not null,
ma_trinh_do int not null,
ma_bo_phan int not null,
foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);

create table loai_khach(
ma_loai_khach int auto_increment primary key,
ten_loai_khach varchar(45)
);

create table khach_hang(
ma_khach_hang int auto_increment primary key,
ma_loai_khach int not null,
ho_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit(1) not null,
so_cmnd varchar(20) not null,
so_dt varchar(20) not null,
email varchar(45),
dia_chi varchar(45),
foreign key (ma_loai_khach) references loai_khach(ma_loai_khach)
);

create table kieu_thue(
ma_kieu_thue int auto_increment primary key,
ten_kieu_thue varchar(45)
);

create table loai_dich_vu(
ma_loai_dich_vu int auto_increment primary key,
ten_loai_dich_vu varchar(45)
);

create table dich_vu(
ma_dich_vu int auto_increment primary key,
ten_dich_vu varchar(45) not null,
dien_tich int,
chi_phi_thue double not null,
so_nguoi_toi_da int,
ma_kieu_thue int not null,
ma_loai_dich_vu int not null,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi varchar(45),
so_tang int,
foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);

create table hop_dong(
ma_hop_dong int auto_increment primary key,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc datetime not null,
tien_dat_coc double,
ma_nhan_vien int not null,
ma_khach_hang int not null,
ma_dich_vu int not null,
foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);

create table dich_vu_di_kem(
ma_dich_vu_di_kem int auto_increment primary key,
ten_dich_vu_di_kem varchar(45) not null,
gia double not null,
don_vi varchar(10) not null,
trang_thai varchar(45)
);

create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int auto_increment primary key,
ma_hop_dong int not null,
ma_dich_vu_di_kem int not null,
so_luong int not null,
foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);

insert into vi_tri(ten_vi_tri) value("Nhân viên"),("Quản lý");
insert into trinh_do(ten_trinh_do) value("Trung Cấp"),("Cao Đẳng"),("Đại Học"),("Sau Đại Học");
insert into bo_phan(ten_bo_phan) value("Sale-Marketing"),("Hành chính"),("Phục vụ"),("Quản lý");
INSERT INTO `resort_management`.`nhan_vien` (`ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dt`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES 
('Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1'),
('Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2'),
('Hồ Thị Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2'),
('Võ Công Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4'),
('Nguyễn Bỉnh Phát', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1'),
('Khúc Nguyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3'),
('Nguyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2'),
('Nguyễn Hà Đông', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', '2', '4', '4'),
('Tòng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', '2', '4', '4'),
('Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', '2', '3', '2');
insert into loai_khach(ten_loai_khach) value("Diamond"),("Platinium"),("Gold"),("Silver"),("Member");
INSERT INTO khach_hang (`ma_loai_khach`,`ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dt`, `email`, `dia_chi`) VALUES 
('5', 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng'),
('3', 'Phạm Xuân Diệu', '1992-08-08', 1,'865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị'),
('1', 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh'),
('1', 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng'),
('4', 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai'),
('4', 'Tôn Nữ Mộc Châu', '2005-12-06',0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng'),
('1', 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh'),
('3', 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum'),
('1', 'Trần Đại Danh', '1994-07-01', 1,'432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi'),
('2', 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');

insert into kieu_thue(ten_kieu_thue) value("year"),("month"),("day"),("hour");
insert into loai_dich_vu(ten_loai_dich_vu) value("Villa"),("House"),("Room");

INSERT INTO dich_vu (`ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`) VALUES 
('Villa Beach Front', '25000', '10000000', '10', '3', '1', 'vip', 'Có hồ bơi', '500', '4'),
('House Princess 01', '14000', '5000000', '7', '2', '2', 'vip', 'Có thêm bếp nướng', 'null', '3'),
('Room Twin 01', '5000', '1000000', '2', '4', '3', 'normal', 'Có tivi', 'null', null),
('Villa No Beach Front', '22000', '9000000', '8', '3', '1', 'normal', 'Có hồ bơi', '300', '3'),
('House Princess 02', '10000', '4000000', '5', '3', '2', 'normal', 'Có thêm bếp nướng', 'null', '2'),
('Room Twin 02', '3000', '900000', '2', '4', '3', 'normal', 'Có tivi', 'null', null);

insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) value 
("Karaoke",10000,"giờ","tiện nghi, hiện tại"),
("Thuê xe máy",10000,"chiếc","hỏng 1 xe"),
("Thuê xe máy",20000,"chiếc","tốt"),
("Buffet buổi sáng",15000,"suất","đầy đủ đồ ăn, tráng miệng"),
("Buffet buổi sáng",90000,"suất","đầy đủ đồ ăn, tráng miệng"),
("Buffet buổi sáng",16000,"suất","đầy đủ đồ ăn, tráng miệng");

insert into hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) value
('2020-12-08','2020-12-08',0,3,1,3),
('2020-07-14','2020-07-21',20000,7,3,1),
('2021-03-15','2021-03-17',5000,3,4,2),
('2021-01-14','2021-01-18',100000,7,5,5),
('2021-07-14','2021-07-15',0,7,2,6),
('2021-06-01','2021-06-03',0,7,7,6),
('2021-09-02','2021-09-05',100000,7,4,4),
('2021-06-17','2021-06-18',150000,3,4,1),
('2020-11-19','2020-11-19',0,3,4,3),
('2021-04-12','2021-04-14',0,10,3,5),
('2021-04-25','2021-04-25',0,2,2,1),
('2021-05-25','2021-05-27',0,7,10,1);

insert into hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem) value
(5,2,4),
(8,2,5),
(15,2,6),
(1,3,1),
(11,3,2),
(1,1,3),
(2,1,2),
(2,12,2);

-- task 2 
select * from nhan_vien where (ho_ten like "H%" and length(ho_ten)<15)or (ho_ten like"K%"and length(ho_ten)<15)or (ho_ten like"T%"and length(ho_ten)<15);
-- task 3 
select * from khach_hang 
where ((datediff(now(), khach_hang.ngay_sinh)/365 between 18 and 50) and ((dia_chi like "%Đà Nẵng")or (dia_chi like "%Quảng Trị")));
-- task 4
select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(hop_dong.ma_khach_hang) as so_lan_dat
from khach_hang inner join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where khach_hang.ma_loai_khach=1
group by hop_dong.ma_khach_hang
order by so_lan_dat;
-- task 5
 select khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ten_loai_khach, hop_dong.ma_hop_dong,
 hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, dich_vu.ten_dich_vu, 
 sum(dich_vu.chi_phi_thue+coalesce(hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia,0)) as tong_tien
 from loai_khach left join khach_hang on loai_khach.ma_loai_khach=khach_hang.ma_loai_khach
 left join hop_dong on khach_hang.ma_khach_hang=hop_dong.ma_khach_hang
 left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
 left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
 left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem=dich_vu_di_kem.ma_dich_vu_di_kem
 group by khach_hang.ma_khach_hang, hop_dong.ma_hop_dong;
 
 -- task 6
 select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
 from dich_vu left join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
 left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
where  dich_vu.ten_dich_vu not in 
 (select dich_vu.ten_dich_vu
 from dich_vu inner join  hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
  where hop_dong.ngay_lam_hop_dong between '2021-01-01' and '2021-03-31')
group by dich_vu.ma_dich_vu;
 
 -- task 7
 select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da, loai_dich_vu.ten_loai_dich_vu, dich_vu.chi_phi_thue
 from dich_vu left join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
 left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
 where (year(hop_dong.ngay_lam_hop_dong)='2020') and dich_vu.ma_dich_vu not in 
 (select dich_vu.ma_dich_vu
 from dich_vu left join loai_dich_vu on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
 left join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
 where (year(hop_dong.ngay_lam_hop_dong)='2021')
 )
 group by dich_vu.ma_dich_vu;
 
 -- task 8
 -- cach 1
select distinct ho_ten from khach_hang;
-- cach 2
select ho_ten from khach_hang group by ho_ten;
-- cach 3
select ho_ten from khach_hang union
select ho_ten from khach_hang;

-- task 9
select month(hop_dong.ngay_lam_hop_dong) as thang, count(hop_dong.ma_hop_dong) as tong_so_hop_dong
from hop_dong
where year(hop_dong.ngay_lam_hop_dong)=2021
group by month(hop_dong.ngay_lam_hop_dong);

-- task 10
select hop_dong.ma_hop_dong, hop_dong.ngay_lam_hop_dong, hop_dong.ngay_ket_thuc, hop_dong.tien_dat_coc, 
sum(coalesce(hop_dong_chi_tiet.so_luong,0)) as so_luong_dich_vu_di_kem
from hop_dong left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
left join dich_vu_di_kem on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
group by hop_dong.ma_hop_dong;

-- task 11
select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem
from dich_vu_di_kem inner join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
inner join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
inner join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
inner join loai_khach on khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
where (loai_khach.ten_loai_khach="Diamond" and ((khach_hang.dia_chi like "%Vinh") or (khach_hang.dia_chi like "%Quảng Ngãi")));

 -- task 12 inprogress
 select hop_dong.ma_hop_dong, nhan_vien.ho_ten  as "Nhan vien", khach_hang.ho_ten as "Khach hang", dich_vu.ten_dich_vu,
 sum(coalesce(hop_dong_chi_tiet.so_luong,0)) as so_luong_dich_vu_di_kem, hop_dong.tien_dat_coc as dat_coc
 from hop_dong left join nhan_vien on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
 left join khach_hang on hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
 left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
 left join hop_dong_chi_tiet on hop_dong.ma_hop_dong=hop_dong_chi_tiet.ma_hop_dong
 where dich_vu.ten_dich_vu in
 (select dich_vu.ten_dich_vu from
 dich_vu inner join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
 where hop_dong.ngay_lam_hop_dong between '2020-10-01 00:00:00' and '2020-12-31 23:59:59') 
 group by hop_dong.ma_hop_dong
 having dich_vu.ten_dich_vu not in
 (select dich_vu.ten_dich_vu from
 dich_vu inner join hop_dong on dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
 where hop_dong.ngay_lam_hop_dong between '2021-01-01 00:00:00' and '2021-06-30 23:59:59');
 
-- task 13
 select dich_vu_di_kem.ma_dich_vu_di_kem, dich_vu_di_kem.ten_dich_vu_di_kem,
 sum(hop_dong_chi_tiet.so_luong) as so_lan_dung_nhieu_nhat
 from dich_vu_di_kem join hop_dong_chi_tiet on dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
 join hop_dong on hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
 group by hop_dong_chi_tiet.ma_dich_vu_di_kem
having so_lan_dung_nhieu_nhat>= all (select sum(hop_dong_chi_tiet.so_luong) from hop_dong_chi_tiet group by hop_dong_chi_tiet.ma_dich_vu_di_kem);

-- task 14
select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) as so_lan_dat
from hop_dong hd inner join hop_dong_chi_tiet hdct on hd.ma_hop_dong=hdct.ma_hop_dong
inner join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem=dvdk.ma_dich_vu_di_kem
inner join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
inner join loai_dich_vu ldv on dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
group by dvdk.ma_dich_vu_di_kem
having count(hdct.ma_dich_vu_di_kem)=1;

-- task 15
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dt, nv.dia_chi, count(hd.ma_nhan_vien) from
nhan_vien nv inner join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
inner join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
inner join hop_dong hd on nv.ma_nhan_vien=hd.ma_nhan_vien
group by hd.ma_nhan_vien
having count(hd.ma_nhan_vien)<=3;

-- task 16
set sql_safe_updates = 0;
delete from nhan_vien
where nhan_vien.ma_nhan_vien not in 
(select distinct ma_nhan_vien from hop_dong
where year(ngay_lam_hop_dong) between 2020 and 2021);
set sql_safe_updates = 1;
select * from nhan_vien;

-- task 18
set sql_safe_updates = 0;
set foreign_key_checks =0;
delete from khach_hang 
where ma_khach_hang in
 (select ma_khach_hang from 
  hop_dong 
 where year(hop_dong.ngay_lam_hop_dong)<'2021');
set foreign_key_checks =1;
set sql_safe_updates = 1;
select * from khach_hang;

-- task 17
set sql_safe_updates = 0;
update khach_hang set ma_loai_khach = 1
where ma_khach_hang in (select khach_hang.ma_khach_hang from 
(select khach_hang.ma_khach_hang, khach_hang.ho_ten
 from loai_khach left join khach_hang on loai_khach.ma_loai_khach=khach_hang.ma_loai_khach
 left join hop_dong on khach_hang.ma_khach_hang=hop_dong.ma_khach_hang
 left join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
 left join dich_vu on hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
 left join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem=dich_vu_di_kem.ma_dich_vu_di_kem
 group by khach_hang.ma_loai_khach
 having khach_hang.ma_loai_khach = 2 and  sum(dich_vu.chi_phi_thue+coalesce(hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia,0))>10000000) as t);
set sql_safe_updates = 1;

-- task 19
set sql_safe_updates = 0;
update dich_vu_di_kem set gia = gia*2
where ma_dich_vu_di_kem in (select * from 
(select dich_vu_di_kem.ma_dich_vu_di_kem
from hop_dong inner join hop_dong_chi_tiet on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
inner join dich_vu_di_kem on hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
where year(hop_dong.ngay_lam_hop_dong)=2020
group by  hop_dong_chi_tiet.ma_dich_vu_di_kem
having sum(hop_dong_chi_tiet.so_luong) >10) as temp);
set sql_safe_updates = 1;

-- task 20
select ma_nhan_vien, ho_ten, email, so_dt, ngay_sinh, dia_chi, "nhan vien" as loai
from nhan_vien
union
select ma_khach_hang, ho_ten, email, so_dt, ngay_sinh, dia_chi, "khach hang" 
from khach_hang;

-- task 21 
create view v_nhanvien as
select nhan_vien.* from nhan_vien inner join
hop_dong on nhan_vien.ma_nhan_vien=hop_dong.ma_hop_dong
where nhan_vien.dia_chi = "Hải Châu" and date(hop_dong.ngay_lam_hop_dong)="2019-12-12";
select * from v_nhanvien;

-- task 22
set sql_safe_updates = 0;
update nhan_vien set nhan_vien.dia_chi="Liên Chiểu" where nhan_vien.ma_nhan_vien in
(select * from (select ma_nhan_vien from v_nhanvien) as t);

-- task 23

delimiter //
create procedure sp_1(in ma_khach_hang int)
begin
	delete khach_hang from khach_hang where khach_hang.ma_khach_hang=ma_khach_hang;
end //
delimiter 
call sp_1(6);

-- task 24
 delimiter //
 create procedure sp_2(in ma_hop_dong int, in ngay_lam_hop_dong datetime,
 in ngay_ket_thuc datetime, in tien_dat_coc double, in ma_nhan_vien int,
 in ma_khach_hang int, in ma_dich_vu int)
 begin
 set @x = (select count(ma_hop_dong) from hop_dong where hop_dong.ma_hop_dong=ma_hop_dong
 group by hop_dong.ma_hop_dong);
 if((@x is null)
 and (select ma_nhan_vien from nhan_vien where nhan_vien.ma_nhan_vien=ma_nhan_vien)
 and (select ma_khach_hang from khach_hang where khach_hang.ma_khach_hang=ma_khach_hang)
 and (select ma_dich_vu from dich_vu where dich_vu.ma_dich_vu=ma_dich_vu)
 and (ngay_ket_thuc>ngay_lam_hop_dong )) then
 insert into hop_dong values(ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc,
 tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu);
 else 
 signal sqlstate "45000" set message_text = 'Dữ liệu sai';
 end if;
 end //
  delimiter;
  
  -- task 25
  delimiter //
  drop trigger if exists tr_1 //
  create trigger tr_1 after delete on hop_dong for each row
  begin
	set @x = (select count(*) as count from hop_dong );
  end; //

  set @x=0;
  delete from hop_dong where hop_dong.ma_hop_dong =11;
  select @x as 'total amount';
  
  -- task 26
    delimiter //
  drop trigger if exists tr_2 //
  create trigger tr_2 after update on hop_dong for each row
  begin
  if datediff(new.ngay_ket_thuc,old.ngay_lam_hop_dong)<2 then
  signal sqlstate '45000' set message_text =
  'ngày ket thúc hợp đồng phải lớn hơn ngày làm hợp đồng 2 ngày';
  end if;
  end; //

update hop_dong set ngay_ket_thuc = '2022-03-05 00:00:00' where ma_hop_dong =14;






