use master
go
create database quanlykhachsan5
go
use quanlykhachsan5
go
create table tb1_chucvu
(
MACHUCVU varchar (5) primary key,
TENCHUCVU nvarchar (30),
)
create table tb1_khachhang
(
MAKHACHHANG varchar(5) primary key,
TENKHACHHANG nvarchar(30),
DIACHI nvarchar(50),
GIOITINH nvarchar(5),
CMND varchar(10),
SDT char(13),
QUOCTICH nvarchar(20),
)
create table tb1_loaiphong
(
MALOAIPHONG varchar(2) primary key,
TENLOAIPHONG nvarchar(30),
TRANGBI nvarchar(100),
)
create table tb1_nhanvien
(
MANHANVIEN varchar(5) primary key,
TENNHANVIEN nvarchar(30),
MACHUCVU varchar(5),
GIOITINH nvarchar(3),
NGAYSINH smalldatetime,
DIACHI nvarchar(50),
SDT char(15),
constraint fk_tb1_nhanvien_tb1_chucvu foreign key(MACHUCVU) references tb1_chucvu(MACHUCVU),
)
create table tb1_phong
(
MAPHONG varchar(6) primary key,
TENPHONG nvarchar(20),
TINHTRANG nvarchar(15),
MALOAIPHONG varchar(2),
GIAPHONG int,
DONVI varchar(10),
constraint fk_tb1_phong_tb1_loaiphong foreign key(MALOAIPHONG) references tb1_loaiphong(MALOAIPHONG),
)
create table tb1_hoadon
(
MAHOADON varchar(5),
NGAYTHANHTOAN smalldatetime,
SOTIENDATTRUOC int,
DONVI varchar(5),
MANHANVIEN varchar(5),
constraint fk_tb1_hoadon_tb1_nhanvien foreign key(MANHANVIEN) references tb1_nhanvien(MANHANVIEN),
)
create table tb1_phieudangky
(
MAPHIEUDANGKY varchar(5) primary key,
MAKHACHHANG varchar(5),
MANHANVIEN varchar(5),
NGAYLAP smalldatetime,
NGAYDI smalldatetime,
MAPHONG varchar(6),
TRATRUOC int,
DONVI varchar(5),
MAPHIEUDICHVU varchar(5),
constraint fk_tb1_phieudangky_tb1_khachhang foreign key(MAKHACHHANG) references tb1_khachhang(MAKHACHHANG),
constraint fk_tb1_phieudangky_tb1_nhanvien foreign key(MANHANVIEN) references tb1_nhanvien(MANHANVIEN),
constraint fk_tb1_phieudangky_tb1_phong foreign key(MAPHONG) references tb1_phong(MAPHONG),
)
create table tb1_phieudichvu
(
MAPHIEUDICHVU varchar(5) primary key,
MAPHIEUDANGKY varchar(5),
TENDICHVU nvarchar(30),
GIADICHVU int,
constraint fk_tb1_phieudichvu_tb1_phieudangky foreign key(MAPHIEUDANGKY) references tb1_phieudangky(MAPHIEUDANGKY),
)


Select maphieudangky, tennhanvien from tb1_phieudangky pdk, tb1_nhanvien nv where pdk.manhanvien = nv.manhanvien