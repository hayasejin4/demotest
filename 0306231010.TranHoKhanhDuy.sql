CREATE DATABASE QuanLyDeAn;
GO
USE QuanLyDeAn;
GO
-- Tạo bảng Nhân Viên
create table NHANVIEN
(
	HONV nvarchar(15),
	TENLOT nvarchar(15),
	TENNV nvarchar(15),
	MANV char(9),
	NGSINH date,
	DCHI nvarchar(30),
	PHAI nvarchar(3),
	LUONG float,
	MA_NQL  char(9),
	PHG  int,
	PRIMARY KEY (MANV)
)

-- Tạo bảng Đề Án
create table DEAN
(
	TENDA nvarchar(15),
	MADA int,
	DDIEM_DA nvarchar(15),
	PHONG int,
	PRIMARY KEY (MADA)
)

-- Tạo bảng Công Việc
create table CONGVIEC
(
	MADA int,
	STT int,
	TEN_CONG_VIEC nvarchar(50),
	PRIMARY KEY (MADA, STT)
)

-- Tạo bảng Phòng Ban
create table PHONGBAN
(
	TENPHG nvarchar(15),
	MAPHG int,
	TRPHG char(9),
	NG_NHANCHUC date,
	PRIMARY KEY (MAPHG)
)

-- Tạo bảng Phân Công
create table PHANCONG
(
	MA_NVIEN  char(9),
	MADA int,
	STT int,
	THOIGIAN float,
	PRIMARY KEY (MA_NVIEN, MADA, STT)
)

-- Tạo bảng Thân Nhân
create table THANNHAN
(
	MA_NVIEN char(9),
	TENTN nvarchar(15),
	PHAI nvarchar(3),
	NGSINH date,
	QUANHE  nvarchar(15),
	PRIMARY KEY (MA_NVIEN, TENTN)
)

-- Tạo bảng Địa Điểm Phòng
create table DIADIEM_PHG
(
	MAPHG  int,
	DIADIEM nvarchar(15),
	PRIMARY KEY (MAPHG, DIADIEM)
)

-- Tạo khóa ngọai FK_NHANVIEN_NHANVIEN
alter table NHANVIEN 
	add constraint FK_NHANVIEN_NHANVIEN
		foreign key (MA_NQL)
			references NHANVIEN(MANV)

-- Tạo khóa ngọai FK_NHANVIEN_PHONGBAN
alter table NHANVIEN 
	add constraint FK_NHANVIEN_PHONGBAN
		foreign key (PHG)
			references PHONGBAN(MAPHG)

-- Tạo khóa ngọai FK_PHONGBAN_NHANVIEN
alter table PHONGBAN 
	add constraint FK_PHONGBAN_NHANVIEN
		foreign key (TRPHG)
			references NHANVIEN(MANV)

-- Tạo khóa ngọai FK_DEAN_PHONGBAN
alter table DEAN 
	add constraint FK_DEAN_PHONGBAN
		foreign key (PHONG)
			references PHONGBAN(MAPHG)

-- Tạo khóa ngọai FK_CONGVIEC_DEAN
alter table CONGVIEC 
	add constraint FK_CONGVIEC_DEAN
		foreign key (MADA)
			references DEAN(MADA)

-- Tạo khóa ngọai FK_PHANCONG_CONGVIEC
alter table PHANCONG 
	add constraint FK_PHANCONG_CONGVIEC
		foreign key (MADA, STT)
			references CONGVIEC(MADA, STT)

-- Tạo khóa ngọai FK_PHANCONG_NHANVIEN
alter table PHANCONG 
	add constraint FK_PHANCONG_NHANVIEN
		foreign key (MA_NVIEN)
			references NHANVIEN(MANV)

-- Tạo khóa ngọai FK_DIADIEM_PHG_PHONGBAN
alter table THANNHAN 
	add constraint FK_THANNHAN_NHANVIEN
		foreign key (MA_NVIEN)
			references NHANVIEN(MANV)

-- Tạo khóa ngọai FK_DIADIEM_PHG_PHONGBAN
alter table DIADIEM_PHG 
	add constraint FK_DIADIEM_PHG_PHONGBAN
		foreign key (MAPHG)
			references PHONGBAN(MAPHG)

-- Thêm dữ liệu cho NHANVIEN với MA_NQL = NULL và PHG = NULL Vì ràng buộc khóa ngoại
insert into NHANVIEN values (N'Đinh', N'Bá', N'Tiên','009', convert(date,'11/02/1960',103), N'119 Cống Quỳnh, Tp HCM', N'Nam', '30000', NULL, NULL)
insert into NHANVIEN values (N'Nguyễn', N'Thanh', N'Tùng', '005', convert(date,'20/08/1962',103), N'222 Nguyễn Văn Cừ, Tp HCM', N'Nam', '40000', NULL, NULL) 
insert into NHANVIEN values (N'Bùi', N'Ngọc', N'Hằng', '007', convert(date,'11/03/1954',103), N'332 Nguyễn Thái Học, Tp HCM', N'Nam', '25000', NULL, NULL) 
insert into NHANVIEN values (N'Lê', N'Quỳnh', N'Như', '001', convert(date,'01/02/1967',103), N'291 Hồ Văn Huê,  Tp HCM', N'Nữ', '43000', NULL, NULL)
insert into NHANVIEN values (N'Nguyễn', N'Mạnh', N'Hùng', '004', convert(date,'04/03/1967',103), N'95 Bà Rịa, Vũng Tàu', N'Nam', '38000', NULL, NULL)
insert into NHANVIEN values (N'Trần', N'Thanh', N'Tâm', '003', convert(date,'04/05/1957',103), N'34 Mai Thị Lự, Tp HCM', N'Nam', '25000', NULL, NULL)
insert into NHANVIEN values (N'Trần', N'Hồng', N'Quang', '008', convert(date,'01/09/1967',103), N'80 Lê Hồng Phong, Tp HCM', N'Nam', '25000', NULL, NULL)
insert into NHANVIEN values (N'Phạm', N'Văn', N'Vinh', '006', convert(date,'01/01/1965',103), N'45 Trưng Vương, Hà Nội', N'Nữ', '55000', NULL, NULL)

-- Update MA_NQL cho  NHANVIEN
update NHANVIEN set MA_NQL = '005' where MANV = '009'
update NHANVIEN set MA_NQL = '006' where MANV = '005'
update NHANVIEN set MA_NQL = '001' where MANV = '007'
update NHANVIEN set MA_NQL = '006' where MANV = '001'
update NHANVIEN set MA_NQL = '005' where MANV = '004'
update NHANVIEN set MA_NQL = '005' where MANV = '003'
update NHANVIEN set MA_NQL = '001' where MANV = '008'

-- Thêm dữ liệu cho PHONGBAN
insert into PHONGBAN values (N'Nghiên cứu',  '5',  '005',  convert(date,'22/05/1978',103))
insert into PHONGBAN values (N'Điều hành',  '4',  '008',  convert(date,'01/01/1985',103))
insert into PHONGBAN values (N'Quản lý',  '1',  '006',  convert(date,'19/06/1971',103))

-- Update PHG cho NHANVIEN
update NHANVIEN set PHG = '5' where MANV = '009'
update NHANVIEN set PHG = '5' where MANV = '005'
update NHANVIEN set PHG = '4' where MANV = '007'
update NHANVIEN set PHG = '4' where MANV = '001'
update NHANVIEN set PHG = '5' where MANV = '004'
update NHANVIEN set PHG = '5' where MANV = '003'
update NHANVIEN set PHG = '4' where MANV = '008'
update NHANVIEN set PHG = '1' where MANV = '006'


-- Thêm dữ liệu cho DIADIEM_PHG
insert into DIADIEM_PHG values ('1',  N'TP HCM')
insert into DIADIEM_PHG values ('4',  N'Hà Nội')
insert into DIADIEM_PHG values ('5',  N'Vũng Tàu')
insert into DIADIEM_PHG values ('5',  N'NHA TRANG')
insert into DIADIEM_PHG values ('5',  N'TP HCM')

-- Thêm dữ liệu cho DEAN
insert into DEAN values (N'Sản phẩm X',  '1',  N'Vũng Tàu',  '5')
insert into DEAN values (N'Sản phẩm Y',  '2',  N'Nha Trang',  '5') 
insert into DEAN values (N'Sản phẩm Z',  '3',  N'TP HCM',  '5')
insert into DEAN values (N'Tin học hoá',  '10',  N'Hà Nội',  '4') 
insert into DEAN values (N'Cáp quang',  '20',  N'TP HCM',  '1')
insert into DEAN values (N'Đào tạo',  '30',  N'Hà Nội',  '4')

-- Thêm dữ liệu cho THANNHAN
insert into THANNHAN values ('005',  N'Trinh',  N'Nữ',  convert(date,'05/04/1976',103),  N'Con gái')
insert into THANNHAN values ('005',  N'Khang',  N'Nam',  convert(date,'25/10/1973',103),  N'Con trai') 
insert into THANNHAN values ('005',  N'Phương',  N'Nữ',  convert(date,'03/05/1948',103),  N'Vợ chồng')
insert into THANNHAN values ('001',  N'Minh',  N'Nam',  convert(date,'29/02/1932',103),  N'Vợ chồng')
insert into THANNHAN values ('009',  N'Tiến',  N'Nam',  convert(date,'01/01/1978',103),  N'Con trai')
insert into THANNHAN values ('009',  N'Châu',  N'Nữ',  convert(date,'30/12/1978',103),  N'Con gái')
insert into THANNHAN values ('009',  N'Phương',  N'Nữ',  convert(date,'05/05/1957',103),  N'Vợ chồng')

-- Thêm dữ liệu cho CONGVIEC
insert into CONGVIEC values ('1',  '1',  N'Thiết kế sản phẩm X')
insert into CONGVIEC values ('1',  '2',  N'Thử nghiệm sản phẩm X')
insert into CONGVIEC values ('2',  '1',  N'Sản xuất sản phẩm Y')
insert into CONGVIEC values ('2',  '2',  N'Quảng cáo sản phẩm Y')
insert into CONGVIEC values ('3',  '1',  N'Khuyến mãi sản phẩm Z')
insert into CONGVIEC values ('10',  '1',  N'Tin học hoá phòng nhân sự')
insert into CONGVIEC values ('10',  '2',  N'Tin học hoá phòng kinh doanh') 
insert into CONGVIEC values ('20',  '1',  N'Lắp đặt cáp quang')
insert into CONGVIEC values ('30',  '1',  N'Đào tạo nhân viên Marketing')
insert into CONGVIEC values ('30',  '2',  N'Đào tạo chuyên viên thiết kế')

-- Thêm dữ liệu cho PHANCONG
insert into PHANCONG values ('009',  '1',  '1',  '32')
insert into PHANCONG values ('009',  '2',  '2',  '8')
insert into PHANCONG values ('004',  '3',  '1',  '40')
insert into PHANCONG values ('003',  '1',  '2',  '20.0')
insert into PHANCONG values ('003',  '2',  '1',  '20.0')
insert into PHANCONG values ('008',  '10',  '1',  '35')
insert into PHANCONG values ('008',  '30',  '2',  '5')
insert into PHANCONG values ('001',  '30',  '1',  '20')
insert into PHANCONG values ('001',  '20',  '1',  '15')
insert into PHANCONG values ('006',  '20',  '1',  '30')
insert into PHANCONG values ('005',  '3',  '1',  '10')
insert into PHANCONG values ('005',  '10',  '2',  '10')
insert into PHANCONG values ('005',  '20',  '1',  '10')
insert into PHANCONG values ('007',  '30',  '2',  '30')
insert into PHANCONG values ('007',  '10',  '2',  '10')

-- Xuất các bảng
select * from NHANVIEN
select * from PHONGBAN
select * from DIADIEM_PHG
select * from DEAN
select * from THANNHAN
select * from CONGVIEC
select * from PHANCONG

--1. Nhân viên phòng số 4, thông tin gồm họ tên nhân viên, mã nhân viên sắp theo tên,
--tên lót, họ và ngày sinh tăng dần
SELECT HONV, TENLOT, TENNV, MAPHG
FROM NHANVIEN
JOIN PHONGBAN ON NHANVIEN.PHG = PHONGBAN.MAPHG
WHERE PHONGBAN.MAPHG = 4
ORDER BY NHANVIEN.TENLOT, NHANVIEN.HONV, NHANVIEN.NGSINH;
--2. Nhân viên có ngày sinh trong tháng hiện tại, thông tin gồm họ tên nhân viên viết
--chung 1 cột, mã nhân viên và ngày tháng năm sinh
SELECT CONCAT(NHANVIEN.HONV, ' ', NHANVIEN.TENLOT, ' ', NHANVIEN.TENNV) AS HoTen,
       NHANVIEN.MANV,
       NHANVIEN.NGSINH
FROM NHANVIEN
WHERE MONTH(NHANVIEN.NGSINH) = MONTH(GETDATE()) AND YEAR(NHANVIEN.NGSINH) = YEAR(GETDATE());
--3. Nhân viên phòng nghiên cứu, thông tin gồm họ tên nhân viên, mã nhân viên sắp
--theo mã nhân viên giảm dần
SELECT NHANVIEN.HONV, NHANVIEN.TENLOT, NHANVIEN.TENNV, NHANVIEN.MANV
FROM NHANVIEN
JOIN PHONGBAN ON NHANVIEN.PHG = PHONGBAN.MAPHG
WHERE PHONGBAN.TENPHG = N'Nghiên cứu'
ORDER BY NHANVIEN.MANV DESC;
--4. Nhân viên tham gia dự án số 10, thông tin gồm họ tên nhân viên viết chung 1 cột,
--mã nhân viên và sắp thep mã nhân viên tăng dần
SELECT CONCAT(NHANVIEN.HONV, ' ', NHANVIEN.TENLOT, ' ', NHANVIEN.TENNV) AS HoTen,
       NHANVIEN.MANV
FROM NHANVIEN
JOIN PHANCONG ON NHANVIEN.MANV = PHANCONG.MA_NVIEN
WHERE PHANCONG.MADA = 10
ORDER BY NHANVIEN.MANV ASC;
--5. 2 nhân viên phòng nghiên cứu tham gia dự án ‘tin học hóa’, thông tin gồm họ tên
--nhân viên, mã nhân viên
SELECT CONCAT(NHANVIEN.HONV, ' ', NHANVIEN.TENLOT, ' ', NHANVIEN.TENNV) AS HoTen,
       NHANVIEN.MANV
FROM NHANVIEN
JOIN PHONGBAN ON NHANVIEN.PHG = PHONGBAN.MAPHG
JOIN PHANCONG ON NHANVIEN.MANV = PHANCONG.MA_NVIEN
JOIN DEAN ON PHANCONG.MADA = DEAN.MADA
WHERE PHONGBAN.TENPHG = N'Nghiên cứu' AND DEAN.TENDA = N'Tin học hoá'
--6. 3 nhân viên có lương cao nhất, thông tin gồm họ tên nhân viên, mã nhân viên|
SELECT TOP 3 CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HoTen, MANV
FROM NHANVIEN
ORDER BY LUONG DESC;
--7. 2 nhân viên phòng nghiên cứu có lương thấp nhất
SELECT TOP 2 CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HoTen, MANV
FROM NHANVIEN
JOIN PHONGBAN ON NHANVIEN.PHG = PHONGBAN.MAPHG
WHERE PHONGBAN.TENPHG = N'Nghiên cứu'
ORDER BY LUONG;
--8. Lương cao nhất, lương trung bình và lương thấp nhất
SELECT 
    MAX(LUONG) AS LuongCaoNhat,
    AVG(LUONG) AS LuongTrungBinh,
    MIN(LUONG) AS LuongThapNhat
FROM NHANVIEN;
--9. Số nhân viên
SELECT COUNT(*) AS SoNhanVien
FROM NHANVIEN;
--10. Số nhân viên phòng điều hành
SELECT COUNT(*) AS SoNhanVienDieuHanh
FROM NHANVIEN
JOIN PHONGBAN ON NHANVIEN.PHG = PHONGBAN.MAPHG
WHERE PHONGBAN.TENPHG = N'Điều hành';
--11. Số nhân viên tham gia dự án Tin học hóa
SELECT COUNT(DISTINCT MA_NVIEN) AS SoNhanVienThamGia
FROM PHANCONG
WHERE MADA = (
    SELECT MADA
    FROM DEAN
    WHERE TENDA = N'Tin học hoá'
);
--12. Nhân viên có lương cao nhất, thông tin gồm họ tên nhân viên, mã nhân viên và
--lương
SELECT TOP 1 CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HoTen, MANV, LUONG
FROM NHANVIEN
ORDER BY LUONG DESC;
--13. Nhân viên phòng nghiên cứu có lương cao nhất, , thông tin gồm họ tên nhân viên,
--mã nhân viên và lương
SELECT TOP 1 CONCAT(NV.HONV, ' ', NV.TENLOT, ' ', NV.TENNV) AS HoTen, NV.MANV, NV.LUONG
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.PHG = PB.MAPHG
WHERE PB.TENPHG = N'Nghiên cứu'
ORDER BY NV.LUONG DESC;
--14. Lương TB
SELECT AVG(LUONG) AS LuongTrungBinh
FROM NHANVIEN;
--15. Nhân viên có lương > = lương trung bình, thông tin gồm họ tên nhân viên, mã
--nhân viên và lương
SELECT CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HoTen, MANV, LUONG
FROM NHANVIEN
WHERE LUONG >= (
    SELECT AVG(LUONG)
    FROM NHANVIEN
);
--16. Nhân viên phòng điều hành có lương trung bình >= lương trung bình phòng điều
--hành, thông tin gồm họ tên nhân viên, mã nhân viên và lương
SELECT CONCAT(NV.HONV, ' ', NV.TENLOT, ' ', NV.TENNV) AS HoTen, NV.MANV, NV.LUONG
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.PHG = PB.MAPHG
WHERE PB.TENPHG = N'Điều hành'
AND NV.LUONG >= (
    SELECT AVG(NV2.LUONG)
    FROM NHANVIEN NV2
    JOIN PHONGBAN PB2 ON NV2.PHG = PB2.MAPHG
    WHERE PB2.TENPHG = N'Điều hành'
);
--17. Lương TB của từng phòng, thông tin gồm tên phòng, mã phòng và lương trung
--bình
SELECT PB.TENPHG AS TenPhong, PB.MAPHG AS MaPhong, AVG(NV.LUONG) AS LuongTrungBinh
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.PHG = PB.MAPHG
GROUP BY PB.TENPHG, PB.MAPHG;
--18. Phòng có lương tb > 40000, thông tin gồm tên phòng, mã phòng và lương trung
--bình
SELECT PB.TENPHG AS TenPhong, PB.MAPHG AS MaPhong, AVG(NV.LUONG) AS LuongTrungBinh
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.PHG = PB.MAPHG
GROUP BY PB.TENPHG, PB.MAPHG
HAVING AVG(NV.LUONG) > 40000;
--19. Phòng có lương trung bình cao nhất, thông tin gồm tên phòng, mã phòng và lương
--trung bình
SELECT TOP 1 WITH TIES PB.TENPHG AS TenPhong, PB.MAPHG AS MaPhong, AVG(NV.LUONG) AS LuongTrungBinh
FROM NHANVIEN NV
JOIN PHONGBAN PB ON NV.PHG = PB.MAPHG
GROUP BY PB.TENPHG, PB.MAPHG
ORDER BY AVG(NV.LUONG) DESC;
--20. Tổng giờ làm của nhân viên
SELECT SUM(THOIGIAN) AS TongGioLam
FROM PHANCONG;
--21. Tổng giờ làm của từng nhân viên, thông tin gồm họ tên nhân viên, mã nhân viên
--và tổng giờ làm
SELECT NV.MANV, CONCAT(NV.HONV, ' ', NV.TENLOT, ' ', NV.TENNV) AS HoTen, SUM(PC.THOIGIAN) AS TongGioLam
FROM NHANVIEN NV
JOIN PHANCONG PC ON NV.MANV = PC.MA_NVIEN
GROUP BY NV.MANV, NV.HONV, NV.TENLOT, NV.TENNV;
--22. Nhân viên có tổng giờ làm > = 50, thông tin gồm họ tên nhân viên, mã nhân viên
--và tổng giờ làm
SELECT NV.MANV, CONCAT(NV.HONV, ' ', NV.TENLOT, ' ', NV.TENNV) AS HoTen, SUM(PC.THOIGIAN) AS TongGioLam
FROM NHANVIEN NV
JOIN PHANCONG PC ON NV.MANV = PC.MA_NVIEN
GROUP BY NV.MANV, NV.HONV, NV.TENLOT, NV.TENNV
HAVING SUM(PC.THOIGIAN) >= 50;
--23. Tổng giờ làm của từng đề án, thông tin gồm tên đề án, mã đề án và tổng giờ làm
SELECT MADA, SUM(THOIGIAN) AS TongGioLam
FROM PHANCONG
GROUP BY MADA;
--24. Đề án có tổng giờ làm <=60, thông tin gồm tên đề án, mã đề án và tổng giờ làm25. Tổng giờ làm của từng công việc, thông tin gồm tên đề án, tên công việc, mã đề
--án, số thứ tự và tổng giờ làm
SELECT MADA, SUM(THOIGIAN) AS TongGioLam
FROM PHANCONG
GROUP BY MADA
HAVING SUM(THOIGIAN) <= 60;
--25. Tổng giờ làm của từng công việc, thông tin gồm tên đề án, tên công việc, mã đề
--án, số thứ tự và tổng giờ làm
SELECT MADA, STT, SUM(THOIGIAN) AS TongGioLam
FROM PHANCONG
GROUP BY MADA, STT;
--26. Công việc có tổng giờ làm > 70, thông tin gồm tên đề án, tên công việc, mã đề án,
--số thứ tự và tổng giờ làm
SELECT MADA, STT, SUM(THOIGIAN) AS TongGioLam
FROM PHANCONG
GROUP BY MADA, STT
HAVING SUM(THOIGIAN) > 70;
--27. Nhân viên có tổng giờ làm cao nhất
SELECT TOP 1 WITH TIES NV.MANV, CONCAT(NV.HONV, ' ', NV.TENLOT, ' ', NV.TENNV) AS HoTen, SUM(PC.THOIGIAN) AS TongGioLam
FROM NHANVIEN NV
JOIN PHANCONG PC ON NV.MANV = PC.MA_NVIEN
GROUP BY NV.MANV, NV.HONV, NV.TENLOT, NV.TENNV
ORDER BY SUM(PC.THOIGIAN) DESC;
--28. Nhân viên có tổng giờ làm ít nhất
SELECT TOP 1 CONCAT(HONV, ' ', TENLOT, ' ', TENNV) AS HoTen, MANV, SUM(THOIGIAN) AS TongGioLam
FROM PHANCONG PC
JOIN NHANVIEN NV ON PC.MA_NVIEN = NV.MANV
GROUP BY NV.MANV, HONV, TENLOT, TENNV
ORDER BY TongGioLam;
--29. Đề án có tổng giờ làm cao nhất
SELECT TOP 1 TENDA, DEAN.MADA, SUM(THOIGIAN) AS TongGioLam
FROM PHANCONG
JOIN DEAN ON PHANCONG.MADA = DEAN.MADA
GROUP BY DEAN.MADA, TENDA
ORDER BY TongGioLam DESC;

