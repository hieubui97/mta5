CREATE DATABASE QLNV
GO
USE QLNV

CREATE TABLE phongban(
mapb CHAR(10) PRIMARY KEY,
tenpb NVARCHAR(50),
matp CHAR(10),
diadiem NTEXT
)

CREATE TABLE duan(
mada CHAR(10) PRIMARY KEY,
tenda NVARCHAR(50),
mapb CHAR(10) REFERENCES dbo.phongban(mapb)
)

CREATE TABLE nhanvien(
manv CHAR(10) PRIMARY KEY,
tennv NVARCHAR(50),
ngaysinh DATETIME,
diachi TEXT,
gioitinh CHAR(3) CHECK(gioitinh IN('nam','nu')),
luong INT DEFAULT(1000000),
mangs CHAR(10),
mapb CHAR(10) REFERENCES dbo.phongban(mapb)
)

CREATE TABLE phancong(
manv CHAR(10) REFERENCES dbo.nhanvien(manv),
mada CHAR(10) REFERENCES dbo.duan(mada),
sogio INT,
CONSTRAINT pk_phancong PRIMARY KEY(manv,mada)
)

CREATE TABLE thannhan(
manv CHAR(10) REFERENCES dbo.nhanvien(manv),
tentn NVARCHAR(50),
ngaysinh DATETIME,
gioitinh CHAR(3) CHECK(gioitinh IN('nam','nu')),
diachi NTEXT,
quanhe NTEXT,
CONSTRAINT pk_thannhan PRIMARY KEY(manv,tentn)
)

GO
DROP TABLE dbo.duan
ALTER TABLE dbo.duan ADD tien MONEY 
ALTER TABLE dbo.duan DROP COLUMN tien
ALTER TABLE dbo.phongban ALTER COLUMN diadiem NVARCHAR(50)
ALTER TABLE dbo.nhanvien ALTER COLUMN diachi NVARCHAR(50)
ALTER TABLE dbo.thannhan ALTER COLUMN diachi NVARCHAR(50)
ALTER TABLE dbo.thannhan ALTER COLUMN quanhe NVARCHAR(50)
ALTER TABLE dbo.phongban drop  FOREIGN KEY(matp) REFERENCES dbo.nhanvien(manv)
TRUNCATE TABLE dbo.phongban --xoa tat ca data van giu lai table

INSERT INTO dbo.phongban
        ( mapb, tenpb, matp, diadiem )
VALUES  ( '1', -- mapb - char(10)
          'Hành Chính', -- tenpb - varchar(50)
          '1', -- matp - char(10)
          'Hà Nội'  -- diadiem - text
          )
INSERT INTO dbo.phongban
        ( mapb, tenpb, matp, diadiem )
VALUES  ( '2', -- mapb - char(10)
          'Nhân Sự', -- tenpb - varchar(50)
          '5', -- matp - char(10)
          'TPHCM'  -- diadiem - text
          )
INSERT INTO dbo.phongban
        ( mapb, tenpb, matp, diadiem )
VALUES  ( '3', -- mapb - char(10)
          'Ý Tưởng', -- tenpb - varchar(50)
          '10', -- matp - char(10)
          'Đà Nẵng'  -- diadiem - text
          )
INSERT INTO dbo.phongban
        ( mapb, tenpb, matp, diadiem )
VALUES  ( '4', -- mapb - char(10)
          'Nghiên cứu', -- tenpb - varchar(50)
          '15', -- matp - char(10)
          'Phú Thọ'  -- diadiem - text
          )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '1' , -- manv - char(10)
          N'Bùi Minh Hiếu' , -- tennv - nvarchar(50)
          '19970806' , -- ngaysinh - datetime
          'Phú Thọ' , -- diachi - text
          'nam' , -- gioitinh - char(3)
          0 , -- luong - int
          '1' , -- mangs - char(10)
          '1'  -- mapb - char(10)
        )		  
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '2' , -- manv - char(10)
          N'Nguyễn Thị Loan' , -- tennv - nvarchar(50)
          '19980907' , -- ngaysinh - datetime
          N'Phú Thọ' , -- diachi - nvarchar(50)
          'nu' , -- gioitinh - char(3)
          15000000 , -- luong - int
          '1' , -- mangs - char(10)
          '1'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '3' , -- manv - char(10)
          N'Bùi Văn Chí' , -- tennv - nvarchar(50)
          GETDATE() , -- ngaysinh - datetime
          N'Hà Nội' , -- diachi - nvarchar(50)
          'nam' , -- gioitinh - char(3)
          20000000 , -- luong - int
          '1' , -- mangs - char(10)
          '1'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '4' , -- manv - char(10)
          N'Nguyễn Tuấn Minh' , -- tennv - nvarchar(50)
          GETDATE() , -- ngaysinh - datetime
          N'Cẩm Khê' , -- diachi - nvarchar(50)
          'nam' , -- gioitinh - char(3)
          1500000 , -- luong - int
          '1' , -- mangs - char(10)
          '1'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '5' , -- manv - char(10)
          N'Nguyễn Thị Hồng Ánh' , -- tennv - nvarchar(50)
          GETDATE() , -- ngaysinh - datetime
          N'' , -- diachi - nvarchar(50)
          'nu' , -- gioitinh - char(3)
          50000000 , -- luong - int
          '5' , -- mangs - char(10)
          '2'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '6' , -- manv - char(10)
          N'Nguyễn Trung Nghĩa' , -- tennv - nvarchar(50)
          '19980601' , -- ngaysinh - datetime
          N'Phú Thọ' , -- diachi - nvarchar(50)
          'nam' , -- gioitinh - char(3)
          20000000 , -- luong - int
          '5' , -- mangs - char(10)
          '2'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '7' , -- manv - char(10)
          N'Nguyễn Thị Ngọc Anh' , -- tennv - nvarchar(50)
          '19980917' , -- ngaysinh - datetime
          N'Phú Thọ' , -- diachi - nvarchar(50)
          'nu' , -- gioitinh - char(3)
          40000000 , -- luong - int
          '5' , -- mangs - char(10)
          '2'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '8' , -- manv - char(10)
          N'Nguyễn Công Hùng' , -- tennv - nvarchar(50)
          '19970501' , -- ngaysinh - datetime
          N'Phú Thọ' , -- diachi - nvarchar(50)
          'nam' , -- gioitinh - char(3)
          6000000 , -- luong - int
          '5' , -- mangs - char(10)
          '2'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '9' , -- manv - char(10)
          N'Nguyễn Văn Toàn' , -- tennv - nvarchar(50)
          '19970509' , -- ngaysinh - datetime
          N'CON TUM' , -- diachi - nvarchar(50)
          'nam' , -- gioitinh - char(3)
          60000000 , -- luong - int
          '5' , -- mangs - char(10)
          '2'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '10' , -- manv - char(10)
          N'Vũ Quang Linh' , -- tennv - nvarchar(50)
          '19980101' , -- ngaysinh - datetime
          N'Hà Nội' , -- diachi - nvarchar(50)
          'nam' , -- gioitinh - char(3)
          8000000 , -- luong - int
          '10' , -- mangs - char(10)
          '3'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '11' , -- manv - char(10)
          N'Đào Văn Hảo' , -- tennv - nvarchar(50)
          '19980222' , -- ngaysinh - datetime
          N'Hải Dương' , -- diachi - nvarchar(50)
          'nam' , -- gioitinh - char(3)
          7000000 , -- luong - int
          '10' , -- mangs - char(10)
          '3'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '12' , -- manv - char(10)
          N'Phan Anh Đức' , -- tennv - nvarchar(50)
          '19910408' , -- ngaysinh - datetime
          N'Đà Nẵng' , -- diachi - nvarchar(50)
          'nam' , -- gioitinh - char(3)
          8000000 , -- luong - int
          '10' , -- mangs - char(10)
          '3'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '13' , -- manv - char(10)
          N'Bùi Tiến Dũng' , -- tennv - nvarchar(50)
          '19970101' , -- ngaysinh - datetime
          N'Thanh Hóa' , -- diachi - nvarchar(50)
          'nam' , -- gioitinh - char(3)
          8000000 , -- luong - int
          '10' , -- mangs - char(10)
          '3'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '14' , -- manv - char(10)
          N'Nguyễn Xuân Mạnh' , -- tennv - nvarchar(50)
          '19950101' , -- ngaysinh - datetime
          N'TPHCM' , -- diachi - nvarchar(50)
          'nam' , -- gioitinh - char(3)
          8000000 , -- luong - int
          '10' , -- mangs - char(10)
          '3'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '15' , -- manv - char(10)
          N'Nguyễn Thị Kiều Trang' , -- tennv - nvarchar(50)
          '19980414' , -- ngaysinh - datetime
          N'Phú Thọ' , -- diachi - nvarchar(50)
          'nu' , -- gioitinh - char(3)
          8000000 , -- luong - int
          '15' , -- mangs - char(10)
          '4'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '16' , -- manv - char(10)
          N'Nguyễn Thị Hằng' , -- tennv - nvarchar(50)
          '19981010' , -- ngaysinh - datetime
          N'Tuyên Quang' , -- diachi - nvarchar(50)
          'nu' , -- gioitinh - char(3)
          8000000 , -- luong - int
          '15' , -- mangs - char(10)
          '4'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '17' , -- manv - char(10)
          N'ĐInh Thị Bích Loan' , -- tennv - nvarchar(50)
          '19980907' , -- ngaysinh - datetime
          N'Tuyên Quang' , -- diachi - nvarchar(50)
          'nu' , -- gioitinh - char(3)
          80000000 , -- luong - int
          '15' , -- mangs - char(10)
          '4'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '18' , -- manv - char(10)
          N'Nguyễn Thị Thu Hiền' , -- tennv - nvarchar(50)
          '19970707' , -- ngaysinh - datetime
          N'Tuyên Quang' , -- diachi - nvarchar(50)
          'nu' , -- gioitinh - char(3)
          4000000 , -- luong - int
          '15' , -- mangs - char(10)
          '4'  -- mapb - char(10)
        )
INSERT INTO dbo.nhanvien
        ( manv ,
          tennv ,
          ngaysinh ,
          diachi ,
          gioitinh ,
          luong ,
          mangs ,
          mapb
        )
VALUES  ( '19' , -- manv - char(10)
          N'Nguyễn Tuân Anh' , -- tennv - nvarchar(50)
          '19980414' , -- ngaysinh - datetime
          N'Thanh Hóa' , -- diachi - nvarchar(50)
          'nam' , -- gioitinh - char(3)
          35000000 , -- luong - int
          '15' , -- mangs - char(10)
          '4'  -- mapb - char(10)
        )
INSERT INTO dbo.duan
        ( mada, tenda, mapb )
VALUES  ( '1', -- mada - char(10)
          N'A', -- tenda - nvarchar(50)
          '1'  -- mapb - char(10)
          )
INSERT INTO dbo.duan
        ( mada, tenda, mapb )
VALUES  ( '2', -- mada - char(10)
          N'B', -- tenda - nvarchar(50)
          '1'  -- mapb - char(10)
          )	
INSERT INTO dbo.duan
        ( mada, tenda, mapb )
VALUES  ( '3', -- mada - char(10)
          N'C', -- tenda - nvarchar(50)
          '2'  -- mapb - char(10)
          )
INSERT INTO dbo.duan
        ( mada, tenda, mapb )
VALUES  ( '4', -- mada - char(10)
          N'D', -- tenda - nvarchar(50)
          '2'  -- mapb - char(10)
          )	
INSERT INTO dbo.duan
        ( mada, tenda, mapb )
VALUES  ( '5', -- mada - char(10)
          N'E', -- tenda - nvarchar(50)
          '3'  -- mapb - char(10)
          )	
INSERT INTO dbo.duan
        ( mada, tenda, mapb )
VALUES  ( '6', -- mada - char(10)
          N'F', -- tenda - nvarchar(50)
          '3'  -- mapb - char(10)
          )	
INSERT INTO dbo.duan
        ( mada, tenda, mapb )
VALUES  ( '7', -- mada - char(10)
          N'G', -- tenda - nvarchar(50)
          '4'  -- mapb - char(10)
          )	
INSERT INTO dbo.duan
        ( mada, tenda, mapb )
VALUES  ( '8', -- mada - char(10)
          N'H', -- tenda - nvarchar(50)
          '4'  -- mapb - char(10)
          )		
INSERT INTO dbo.duan
        ( mada, tenda, mapb )
VALUES  ( '9', -- mada - char(10)
          N'I', -- tenda - nvarchar(50)
          '4'  -- mapb - char(10)
          )		
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '1', -- manv - char(10)
          '1', -- mada - char(10)
          50  -- sogio - int
          )	
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '2', -- manv - char(10)
          '2', -- mada - char(10)
          60  -- sogio - int
          )	
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '3', -- manv - char(10)
          '3', -- mada - char(10)
          70  -- sogio - int
          )	
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '4', -- manv - char(10)
          '4', -- mada - char(10)
          80  -- sogio - int
          )			  
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '5', -- manv - char(10)
          '5', -- mada - char(10)
          90  -- sogio - int
          )			  
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '6', -- manv - char(10)
          '6', -- mada - char(10)
          80  -- sogio - int
          )			  
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '7', -- manv - char(10)
          '7', -- mada - char(10)
          100  -- sogio - int
          )			  
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '8', -- manv - char(10)
          '8', -- mada - char(10)
          90  -- sogio - int
          )			  
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '9', -- manv - char(10)
          '9', -- mada - char(10)
          80  -- sogio - int
          )	
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '10', -- manv - char(10)
          '9', -- mada - char(10)
          70  -- sogio - int
          )	
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '11', -- manv - char(10)
          '8', -- mada - char(10)
          110  -- sogio - int
          )	
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '12', -- manv - char(10)
          '7', -- mada - char(10)
          120  -- sogio - int
          )	
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '13', -- manv - char(10)
          '6', -- mada - char(10)
          130  -- sogio - int
          )	
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '14', -- manv - char(10)
          '5', -- mada - char(10)
          80  -- sogio - int
          )	
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '15', -- manv - char(10)
          '4', -- mada - char(10)
          70  -- sogio - int
          )
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '16', -- manv - char(10)
          '3', -- mada - char(10)
          110  -- sogio - int
          )			  
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '17', -- manv - char(10)
          '2', -- mada - char(10)
          110  -- sogio - int
          )			  
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '18', -- manv - char(10)
          '1', -- mada - char(10)
          90  -- sogio - int
          )			  
INSERT INTO dbo.phancong
        ( manv, mada, sogio )
VALUES  ( '19', -- manv - char(10)
          '1', -- mada - char(10)
          111  -- sogio - int
          )			  
INSERT INTO dbo.thannhan
        ( manv ,
          tentn ,
          ngaysinh ,
          gioitinh ,
          diachi ,
          quanhe
        )
VALUES  ( '1' , -- manv - char(10)
          N'Bùi  Quang Việt' , -- tentn - nvarchar(50)
          '19720109' , -- ngaysinh - datetime
          'nam' , -- gioitinh - char(3)
          N'Phú Thọ' , -- diachi - nvarchar(50)
          N'Bố'  -- quanhe - nvarchar(50)
        )	
INSERT INTO dbo.thannhan
        ( manv ,
          tentn ,
          ngaysinh ,
          gioitinh ,
          diachi ,
          quanhe
        )
VALUES  ( '5' , -- manv - char(10)
          N'Nguyễn Trang Linh' , -- tentn - nvarchar(50)
          GETDATE() , -- ngaysinh - datetime
          'nu' , -- gioitinh - char(3)
          N'Hải Dương' , -- diachi - nvarchar(50)
          N'Chị gái'  -- quanhe - nvarchar(50)
        )		
INSERT INTO dbo.thannhan
        ( manv ,
          tentn ,
          ngaysinh ,
          gioitinh ,
          diachi ,
          quanhe
        )
VALUES  ( '10' , -- manv - char(10)
          N'Trần Đình Hùng' , -- tentn - nvarchar(50)
          GETDATE() , -- ngaysinh - datetime
          'nam' , -- gioitinh - char(3)
          N'TPHCM' , -- diachi - nvarchar(50)
          N'Hàng xóm'  -- quanhe - nvarchar(50)
        )		
INSERT INTO dbo.thannhan
        ( manv ,
          tentn ,
          ngaysinh ,
          gioitinh ,
          diachi ,
          quanhe
        )
VALUES  ( '15' , -- manv - char(10)
          N'Định Nhân Kiệt' , -- tentn - nvarchar(50)
          GETDATE() , -- ngaysinh - datetime
          'nam' , -- gioitinh - char(3)
          N'Sài gòn' , -- diachi - nvarchar(50)
          N'Hàng xóm'  -- quanhe - nvarchar(50)
        )
-- Truy Vấn

-- COUNT tính tổng
SELECT COUNT(*) AS 'số nhân viên'
FROM dbo.nhanvien

SELECT COUNT(*) AS 'số thân nhân'
FROM dbo.thannhan
WHERE manv=1

-- AVG tính trung bình
SELECT AVG(luong) AS 'lương tb'
FROM dbo.nhanvien
WHERE gioitinh like 'nam'
 	
-- SUM tính tổng
SELECT SUM(luong) AS 'tổng lương'
FROM dbo.nhanvien
WHERE gioitinh LIKE 'nam' AND YEAR(ngaysinh)<= 1997 


-- lấy ra nhân viên có tuổi >18		
SELECT manv,tennv, YEAR(GETDATE())-YEAR(ngaysinh) AS tuoi
FROM dbo.nhanvien
WHERE YEAR(GETDATE())-YEAR(ngaysinh)>18 

-- 	lấy ra nhân viên làm ngs
SELECT *
FROM dbo.nhanvien
WHERE manv=mangs

-- lấy ra nhân viên làm tp
SELECT*
FROM dbo.nhanvien n,dbo.phongban p
WHERE n.manv=p.matp	  	

--Lấy ra tên nv và tên da nv đó tham gia
SELECT n.tennv,d.tenda
FROM dbo.nhanvien n,dbo.duan d,dbo.phancong p
WHERE n.manv =p.manv AND d.mada=p.mada	  	 

-- lấy manv tên nv làm ở phòng nghiên cứu
SELECT manv,tennv,mapb
FROM dbo.nhanvien
WHERE mapb IN(SELECT mapb FROM dbo.phongban WHERE tenpb LIKE 'Nghiên Cứu' )
 		  			  			  	  	  		  	  		