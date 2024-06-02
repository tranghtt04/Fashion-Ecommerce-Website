Create database QLCuaHangThoiTrang_63133125
go
use QLCuaHangThoiTrang_63133125
go

/*TÀI KHOẢN*/
Create table TaiKhoan
(MaNguoiDung int IDENTITY(1,1) NOT NULL,
	HoTen nvarchar(50) NULL,
	Email varchar(50) NULL,
	Dienthoai varchar(50) NULL,
	Matkhau varchar(50) NULL,
	IDQuyen int NULL,
	Diachi nvarchar(100) NULL,
	primary key(MaNguoiDung));

/*PHÂN QUYỀN*/
Create table PhanQuyen
(IDQuyen int IDENTITY(1,1) NOT NULL,
	TenQuyen nvarchar(20) NULL,
	primary key(IDQuyen));

/*NHÀ CUNG CẤP*/
Create table NhaCungCap
(MaNCC int IDENTITY(1,1) NOT NULL, 
	TenNCC nvarchar(100) NULL, 
	primary key(MaNCC));

/*LOẠI HÀNG*/
Create table LoaiHang
(MaLoai int IDENTITY(1,1) NOT NULL,
	TenLoai nvarchar(100) DEFAULT NULL,
	Primary key(MaLoai));

/*SẢN PHẨM*/
CREATE TABLE SanPham(
	MaSP int IDENTITY(1,1) NOT NULL,
	TenSP nvarchar (100) NULL,
	GiaBan decimal(18,0) NULL,	
	Soluong int NULL,
	MoTa ntext NULL,
	MaLoai int NULL,
	MaNCC int NULL,
	AnhSP nvarchar(100) NULL,
	Primary key(MaSP));


/*ĐƠN HÀNG*/
CREATE TABLE DonHang(
	Madon int IDENTITY(1,1) NOT NULL,	
	NgayDat  datetime NULL,
	TinhTrang  int NULL,
	ThanhToan int NULL,
	DiaChiNhanHang Nvarchar(100) NULL,
	MaNguoiDung int NULL,
	TongTien decimal(18,0),
	Primary key(Madon));

/*CT ĐƠN HÀNG*/
CREATE TABLE ChiTietDonHang(
	CTMaDon int IDENTITY(1,1) NOT NULL,
	MaDon int NOT NULL,
	MaSP int NOT NULL,
	SoLuong int NULL,
	DonGia decimal(18,0) NULL,
	ThanhTien decimal(18,0)  NULL,
	PhuongThucThanhToan int Null,
	Primary key(CTMaDon));


/*Ràng buộc TÀI KHOẢN*/
alter table TaiKhoan
add constraint FK_tk_pq foreign key(IDQuyen) references PhanQuyen(IDQuyen);

/*Ràng buộc SẢN PHẨM*/
alter table SanPham
add constraint FK_sp_ncc foreign key(MaNCC) references NhaCungCap(MaNCC);
alter table SanPham
add constraint FK_sp_loai foreign key(MaLoai) references LoaiHang(Maloai);

/*Ràng buộc ĐƠN HÀNG*/
alter table DonHang
add constraint FK_hd_tk foreign key(MaNguoiDung) references taikhoan(MaNguoiDung);

/*Ràng buộc CHI TIẾT ĐƠN HÀNG*/
alter table ChiTietDonHang
add constraint FK_cthd_hd foreign key(MaDon) references DonHang(MaDon);
alter table ChiTietDonHang
add constraint FK_cthd_sp foreign key(MaSP) references SanPham(MaSP);

/*Phân quyền*/
insert into PhanQuyen values ('Adminstrator');
insert into PhanQuyen values ('Member');
	GO
/*Tài khoản*/
insert into TaiKhoan (HoTen, Email, Dienthoai, Matkhau, IDQuyen, Diachi)
values
  (N'Hồ Thị Thanh Trang', 'trangho254@gmail.com', '0123456789', '123456', 1, N'Khánh Hòa'),
  (N'Trần Thị Lụa', 'tranthilua@gmail.com', '0987654321', '123456', 2, N'Hồ Chí Minh'),
  (N'Hồ Thị Thanh Trang', 'trang.htt.63ttql@ntu.edu.vn', '0901122334', '123456', 1, N'Hà Nội'),
  (N'Admin', 'admin@gmail.com', '0902233445', '123456', 1, N'Hải Phòng'),
  (N'Lê Văn C', 'levanc@gmail.com', '0903344556', '123456', 2, N'Đà Nẵng'),
  (N'Nguyễn Thị D', 'nguyenthid@gmail.com', '0904455667', '123456', 2, N'Bình Dương'),
  (N'Trần Văn E', 'tranvane@gmail.com', '0905566778', '123456', 2, N'Đồng Nai'),
  (N'Hoàng Thị F', 'hoangthif@gmail.com', '0906677889', '123456', 2, N'Cần Thơ'),
  (N'Phạm Văn G', 'phamvang@gmail.com', '0907788990', '123456', 2, N'Quảng Ninh'),
  (N'Nguyễn Thị H', 'nguyenthih@gmail.com', '0908899001', '123456', 2, N'An Giang'),
  (N'Bùi Văn I', 'buivani@gmail.com', '0909900012', '123456', 2, N'Kiên Giang'),
  (N'Vũ Thị J', 'vuthij@gmail.com', '0910012345', '123456', 2, N'Lâm Đồng'),
  (N'Trần Văn K', 'tranvank@gmail.com', '0911123456', '123456', 2, N'Tây Ninh'),
  (N'Nguyễn Thị L', 'nguyenthil@gmail.com', '0912234567', '123456', 2, N'Bắc Ninh'),
  (N'Lê Văn M', 'levanm@gmail.com', '0913345678', '123456', 2, N'Vĩnh Phúc'),
  (N'Phạm Thị N', 'phamthin@gmail.com', '0914456789', '123456', 2, N'Hậu Giang'),
  (N'Trần Văn O', 'tranvano@gmail.com', '0915567890', '123456', 2, N'Nghệ An'),
  (N'Nguyễn Thị P', 'nguyenthilp@gmail.com', '0916678901', '123456', 2, N'Thừa Thiên Huế'),
  (N'Bùi Văn Q', 'buivanq@gmail.com', '0917789012', '123456', 2, N'Bình Phước'),
  (N'Vũ Thị R', 'vuthir@gmail.com', '0918890123', '123456', 2, N'Nam Định'),
  (N'Trần Văn S', 'tranvans@gmail.com', '0919901234', '123456', 2, N'Quảng Bình'),
  (N'Nguyễn Thị T', 'nguyenthit@gmail.com', '0920012345', '123456', 2, N'Tuyên Quang'),
  (N'Lê Văn U', 'levanu@gmail.com', '0921123456', '123456', 2, N'Lào Cai'),
  (N'Phạm Thị V', 'phamthiv@gmail.com', '0922234567', '123456', 2, N'Điện Biên'),
  (N'Trần Văn W', 'tranvanw@gmail.com', '0923345678', '123456', 2, N'Sơn La'),
  (N'Nguyễn Thị X', 'nguyenthix@gmail.com', '0924456789', '123456', 2, N'Lạng Sơn'),
  (N'Bùi Văn Y', 'buivany@gmail.com', '0925567890', '123456', 2, N'Bắc Giang'),
  (N'Vũ Thị Z', 'vuthiz@gmail.com', '0926678901', '123456', 2, N'Hòa Bình'),
  (N'Trần Văn AA', 'tranvanaa@gmail.com', '0927789012', '123456', 2, N'Kon Tum'),
  (N'Nguyễn Thị BB', 'nguyenthibb@gmail.com', '0928890123', '123456', 2, N'Ninh Bình');
GO

/*Loại hàng*/
INSERT INTO LoaiHang (TenLoai)
VALUES
  (N'Váy đầm'),
  (N'Áo Polo'),
  (N'Quần Jean'),
  (N'Túi Xách'),
  (N'Giày Thể Thao'),
  (N'Áo Thun'),
  (N'Quần Short'),
  (N'Đầm Maxi'),
  (N'Áo Khoác'),
  (N'Balo'),
  (N'Mũ Nón'),
  (N'Áo Sơ Mi'),
  (N'Giày Cao Gót'),
  (N'Quần Tây'),
  (N'Váy Ngắn'),
  (N'Tất Vớ'),
  (N'Áo Hoodie'),
  (N'Quần Legging'),
  (N'Kính Mát'),
  (N'Bikini'),
  (N'Giày Da'),
  (N'Váy Midi'),
  (N'Áo Len'),
  (N'Áo Khoác Dù'),
  (N'Khăn Choàng'),
  (N'Áo Lót'),
  (N'Đồ Bộ'),
  (N'Áo Khoác Jeans'),
  (N'Giày Sneaker'),
  (N'Váy Dài');
GO

/*Nhà cung cấp*/
INSERT INTO NhaCungCap (TenNCC)
VALUES
  (N'Lovito'),
  (N'Chanel'),
  (N'Gucci'),
  (N'Dior'),
  (N'Burberry'),
  (N'Louis Vuitton'),
  (N'Prada'),
  (N'H&M'),
  (N'Zara'),
  (N'Uniqlo'),
  (N'Nike'),
  (N'Adidas'),
  (N'Puma'),
  (N'Under Armour'),
  (N'New Balance'),
  (N'Fila'),
  (N'Levis'),
  (N'GAP'),
  (N'Bershka'),
  (N'Mango'),
  (N'Supreme'),
  (N'Converse'),
  (N'Reebok'),
  (N'Vans'),
  (N'Calvin Klein'),
  (N'Armani'),
  (N'Guess'),
  (N'Tommy Hilfiger'),
  (N'Ralph Lauren'),
  (N'DKNY');
GO

/*Sản phẩm*/
INSERT INTO SanPham (TenSP, GiaBan, Soluong, MoTa, MaLoai, MaNCC, AnhSP)
VALUES
  (N'Váy 2 Dây Nữ Dáng Xòe', 190000, 10, N'Váy 2 dây được may với chất vải thân trên thun tăm gân, thân dưới chất tuyết mưa siêu mát và mềm mại, tôn dáng.', 1, 1, N'product1.jpg'),
  (N'Áo Polo Thêu Unisex Nam Nữ Oversize', 290000, 70, N'Được chăm chút từ chất liệu, form dáng, đường may, hình in cho đến khâu đóng gói và hậu mãi, chiếc áo polo xinh xẻo này sẽ làm hài lòng cả những vị khách khó tính nhất', 2, 4, N'product2.jpg'),
  (N'Quần Jean Skinny Nữ', 350000, 30, N'Quần jean skinny với chất vải co giãn tốt, form dáng ôm sát cơ thể, phù hợp cho nhiều hoàn cảnh.', 3, 7, N'product3.jpg'),
  (N'Túi Xách Da Đeo Chéo', 450000, 20, N'Túi xách da thời trang, phù hợp cho cả nam và nữ, dễ dàng kết hợp với nhiều loại trang phục.', 4, 3, N'product4.jpg'),
  (N'Giày Thể Thao Nữ', 500000, 50, N'Giày thể thao với chất liệu vải thoáng khí, đế cao su chống trượt, mang lại sự thoải mái khi di chuyển.', 5, 2, N'product5.jpg'),
  (N'Áo Thun Cổ Tròn Nam', 200000, 40, N'Áo thun cổ tròn với chất liệu cotton mềm mại, thấm hút mồ hôi tốt, thích hợp cho mùa hè.', 6, 8, N'product6.jpg'),
  (N'Quần Short Jeans Nữ', 280000, 25, N'Quần short jeans trẻ trung, năng động, phù hợp cho các hoạt động ngoài trời.', 7, 5, N'product7.jpg'),
  (N'Đầm Maxi Dài Nữ', 600000, 15, N'Đầm maxi dài với thiết kế thanh lịch, tôn dáng, phù hợp cho các buổi dạ tiệc.', 8, 6, N'product8.jpg'),
  (N'Áo Khoác Bomber Nam', 700000, 18, N'Áo khoác bomber với chất liệu dù, thiết kế năng động, phù hợp cho thời tiết se lạnh.', 9, 9, N'product9.jpg'),
  (N'Balo Laptop Chống Thấm', 350000, 22, N'Balo laptop chống thấm nước, thiết kế nhiều ngăn tiện lợi, phù hợp cho sinh viên và nhân viên văn phòng.', 10, 4, N'product10.jpg'),
  (N'Mũ Lưỡi Trai Nữ', 150000, 35, N'Mũ lưỡi trai với thiết kế thời trang, chất liệu vải thoáng mát, phù hợp cho các hoạt động ngoài trời.', 11, 11, N'product11.jpg'),
  (N'Áo Sơ Mi Dài Tay Nam', 400000, 28, N'Áo sơ mi dài tay với chất liệu vải thoáng mát, thiết kế lịch sự, phù hợp cho công sở.', 12, 3, N'product12.jpg'),
  (N'Giày Cao Gót Nữ', 600000, 10, N'Giày cao gót với thiết kế sang trọng, chất liệu da mềm mại, giúp tôn lên vóc dáng phái đẹp.', 13, 12, N'product13.jpg'),
  (N'Quần Tây Công Sở Nam', 500000, 12, N'Quần tây công sở với chất liệu vải cao cấp, thiết kế lịch lãm, phù hợp cho môi trường công sở.', 14, 10, N'product14.jpg'),
  (N'Váy Ngắn Dạ Hội Nữ', 700000, 8, N'Váy ngắn dạ hội với thiết kế quyến rũ, chất liệu vải mềm mại, giúp tôn lên vóc dáng phái đẹp.', 15, 2, N'product15.jpg'),
  (N'Tất Vớ Nam', 80000, 50, N'Tất vớ với chất liệu cotton mềm mại, co giãn tốt, thấm hút mồ hôi, phù hợp cho mọi hoạt động.', 16, 13, N'product16.jpg'),
  (N'Áo Hoodie Nam Nữ Unisex', 450000, 45, N'Áo hoodie với thiết kế unisex, chất liệu nỉ ấm áp, phù hợp cho cả nam và nữ.', 17, 9, N'product17.jpg'),
  (N'Quần Legging Tập Gym Nữ', 350000, 30, N'Quần legging với chất liệu co giãn tốt, thiết kế ôm sát cơ thể, phù hợp cho các hoạt động thể thao.', 18, 6, N'product18.jpg'),
  (N'Kính Mát Thời Trang', 250000, 40, N'Kính mát với thiết kế thời trang, chống tia UV, bảo vệ mắt khỏi ánh nắng mặt trời.', 19, 7, N'product19.jpg'),
  (N'Bikini 2 Mảnh Nữ', 300000, 20, N'Bikini 2 mảnh với thiết kế gợi cảm, chất liệu vải mềm mại, phù hợp cho các chuyến du lịch biển.', 20, 5, N'product20.jpg'),
  (N'Giày Da Công Sở Nam', 700000, 15, N'Giày da công sở với thiết kế lịch lãm, chất liệu da cao cấp, phù hợp cho môi trường công sở.', 21, 4, N'product21.jpg'),
  (N'Váy Midi Nữ', 400000, 18, N'Váy midi với thiết kế thanh lịch, chất liệu vải mềm mại, phù hợp cho các buổi dạo phố.', 22, 8, N'product22.jpg'),
  (N'Áo Len Dài Tay Nữ', 300000, 25, N'Áo len dài tay với chất liệu len mềm mại, thiết kế ấm áp, phù hợp cho mùa đông.', 23, 3, N'product23.jpg'),
  (N'Áo Khoác Dù Nam', 500000, 20, N'Áo khoác dù với thiết kế thời trang, chất liệu chống thấm nước, phù hợp cho các hoạt động ngoài trời.', 24, 10, N'product24.jpg'),
  (N'Khăn Choàng Cổ Nữ', 200000, 30, N'Khăn choàng cổ với chất liệu len mềm mại, thiết kế ấm áp, phù hợp cho mùa đông.', 25, 6, N'product25.jpg'),
  (N'Áo Lót Nữ', 150000, 40, N'Áo lót với chất liệu vải mềm mại, thiết kế ôm sát cơ thể, phù hợp cho mọi hoạt động hàng ngày.', 26, 11, N'product26.jpg'),
  (N'Đồ Bộ Mặc Nhà Nữ', 350000, 25, N'Đồ bộ mặc nhà với chất liệu cotton mềm mại, thiết kế thoải mái, phù hợp cho các hoạt động hàng ngày.', 27, 13, N'product27.jpg'),
  (N'Áo Khoác Jeans Nữ', 600000, 12, N'Áo khoác jeans với thiết kế năng động, chất liệu bền bỉ, phù hợp cho các buổi dạo phố.', 28, 12, N'product28.jpg'),
  (N'Giày Sneaker Nam', 500000, 22, N'Giày sneaker với thiết kế trẻ trung, chất liệu vải thoáng khí, phù hợp cho các hoạt động hàng ngày.', 29, 5, N'product29.jpg'),
  (N'Váy Dài Dự Tiệc Nữ', 700000, 8, N'Váy dài dự tiệc với thiết kế sang trọng, chất liệu vải mềm mại, phù hợp cho các buổi dạ tiệc.', 30, 2, N'product30.jpg');
GO

/*Đơn Hàng*/
INSERT INTO DonHang (NgayDat, TinhTrang, ThanhToan, DiaChiNhanHang, MaNguoiDung, TongTien)
VALUES
    ('2024-06-02', 1, 1, N'Nha Trang', 2, 730000),
    ('2024-06-02', 1, 1, N'Hà Nội', 2, 730000),
    ('2024-06-02', 1, 2, N'Hà Nội', 5, 870000),
    ('2024-06-02', 1, 1, N'Hà Nội', 5, 870000),
    ('2024-06-02', NULL, 1, N'Cần Thơ', 6, 190000),
    ('2024-06-02', 1, 1, N'Cần Thơ', 8, 1390000),
    ('2024-06-02', 1, 1, N'Nha Trang', 8, 1390000),
    ('2024-06-02', 1, 1, N'Nha Trang', 8, 1390000),
    ('2024-06-02', 1, 1, N'Nha Trang', 8, 1390000);
		GO


/*CT Đơn Hàng*/
INSERT INTO ChiTietDonHang (MaDon, MaSP, SoLuong, DonGia, ThanhTien, PhuongThucThanhToan)
VALUES
    (1, 1, 2, 190000, 380000, 1),
    (2, 3, 1, 350000, 350000, 1),
    (3, 2, 3, 290000, 870000, 1),
    (4, 2, 3, 290000, 870000, 1),
    (5, 1, 1, 190000, 190000, 1),
    (6, 1, 1, 190000, 190000, 1);
		GO

select *
from DonHang dh join ChiTietDonHang ct 
on dh.Madon=ct.MaDon 




CREATE PROCEDURE SanPham_TimKiem
	@TenSP nvarchar(100)=NULL,
	@TenLoai nvarchar(100)= NULL,
	@TenNCC nvarchar(100)=NULL
AS
BEGIN
DECLARE @SqlStr NVARCHAR(4000),
		@ParamList nvarchar(2000)
SELECT @SqlStr = '
       SELECT SP.*, LH.TenLoai,NCC.TenNCC
       FROM from SanPham SP
			join LoaiHang LH on SP.MaLoai=LH.MaLoai
			JOIN NhaCungCap NCC ON SP.MaNCC=NCC.MaNCC
       WHERE  (1=1)
       '
IF @TenSP IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (TenSP LIKE ''%'+@TenSP+'%'')
              '
IF @TenLoai IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (TenSP LIKE ''%'+@TenLoai+'%'')
			  '
IF @TenNCC IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (TenSP LIKE ''%'+@TenNCC+'%'')
			  '
	EXEC SP_EXECUTESQL @SqlStr
END

