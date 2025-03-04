USE [TKQClock]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 5/2/2023 3:58:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[TenDangNhap] [varchar](100) NOT NULL,
	[MatKhau] [varchar](100) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SDT] [varchar](50) NULL,
	[GioiTinh] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETDONDATHANG]    Script Date: 5/2/2023 3:58:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONDATHANG](
	[MaDDH] [int] NOT NULL,
	[MaDH] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [numeric](10, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC,
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 5/2/2023 3:58:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDDH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[NgayDat] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[Tinhtranggiaohang] [bit] NULL,
	[DaThanhToan] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DongHo]    Script Date: 5/2/2023 3:58:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DongHo](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[TenDH] [nvarchar](255) NOT NULL,
	[ImgUrl] [text] NULL,
	[MoTaNgan] [nvarchar](255) NULL,
	[SoLuongTon] [int] NULL,
	[NgayCapNhat] [datetime] NULL,
	[GiaBan] [numeric](10, 0) NULL,
	[MaHDH] [int] NULL,
	[MaLoai] [int] NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[ChatLieu] [nvarchar](50) NULL,
	[Dai] [nvarchar](50) NULL,
	[KichThuoc] [nvarchar](50) NULL,
	[Mausac] [nvarchar](50) NULL,
	[Maubanhxe] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HangDongHo]    Script Date: 5/2/2023 3:58:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangDongHo](
	[MaHDH] [int] IDENTITY(1,1) NOT NULL,
	[TenHang] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/2/2023 3:58:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [varchar](3) NULL,
	[SDT] [varchar](50) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[TenDangNhap] [varchar](100) NULL,
	[MatKhau] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiDongHo]    Script Date: 5/2/2023 3:58:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDongHo](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 5/2/2023 3:58:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTT] [int] IDENTITY(1,1) NOT NULL,
	[Img] [text] NULL,
	[TieuDe] [nvarchar](100) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([TenDangNhap], [MatKhau], [HoTen], [DiaChi], [SDT], [GioiTinh]) VALUES (N'admin', N'admin', N'tuan', N'Phú Yên', N'0123654789', N'Nam')
INSERT [dbo].[Admin] ([TenDangNhap], [MatKhau], [HoTen], [DiaChi], [SDT], [GioiTinh]) VALUES (N'admin1', N'admin1', N'khoi', N'Đà Lạt', N'0124478536', N'Nam')
INSERT [dbo].[Admin] ([TenDangNhap], [MatKhau], [HoTen], [DiaChi], [SDT], [GioiTinh]) VALUES (N'admin2', N'admin2', N'quang', N'Sài Gòn', N'0123456789', N'Nam')
INSERT [dbo].[Admin] ([TenDangNhap], [MatKhau], [HoTen], [DiaChi], [SDT], [GioiTinh]) VALUES (N'admin3', N'admin3', N'truong', N'Hà Nội', N'0987465123', N'Nam')
GO
INSERT [dbo].[CHITIETDONDATHANG] ([MaDDH], [MaDH], [SoLuong], [DonGia]) VALUES (7, 14, 1, CAST(900 AS Numeric(10, 0)))
INSERT [dbo].[CHITIETDONDATHANG] ([MaDDH], [MaDH], [SoLuong], [DonGia]) VALUES (8, 14, 1, CAST(900 AS Numeric(10, 0)))
INSERT [dbo].[CHITIETDONDATHANG] ([MaDDH], [MaDH], [SoLuong], [DonGia]) VALUES (9, 14, 1, CAST(900 AS Numeric(10, 0)))
GO
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao], [Tinhtranggiaohang], [DaThanhToan]) VALUES (7, 6, CAST(N'2023-04-06T16:59:25.903' AS DateTime), CAST(N'2023-04-15T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao], [Tinhtranggiaohang], [DaThanhToan]) VALUES (8, 6, CAST(N'2023-04-06T18:25:53.813' AS DateTime), CAST(N'2023-04-29T00:00:00.000' AS DateTime), 0, 0)
INSERT [dbo].[DonDatHang] ([MaDDH], [MaKH], [NgayDat], [NgayGiao], [Tinhtranggiaohang], [DaThanhToan]) VALUES (9, 6, CAST(N'2023-04-06T18:56:16.560' AS DateTime), CAST(N'2023-04-22T00:00:00.000' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DongHo] ON 

INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (1, N'RE-AY0002S', N'RE-AY0002S.jpg', N'Đồng hồ cơ đương đại, dây đeo kim loại - 41.0mm', 10, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(100 AS Numeric(10, 0)), 1, 3, N'Mechanical Moon Phase mới vẫn đúng với thiết kế ban đầu của năm 2017, khi ORIENT STAR ra mắt chiếc đồng hồ cơ đầu tiên có chức năng pha mặt trăng trong bộ sưu tập cổ điển của mình, nhanh chóng trở thành lá cờ đầu của thương hiệu. Thiết kế mới, được chế tác tỉ mỉ này gợi lên hình ảnh của trái đất khi nhìn từ mặt trăng và tự hào có chất lượng tinh tế và sự khéo léo tỉ mỉ đồng nghĩa với ORIENT STAR.', N'Thép', N'Kim loại', N'41.0 mm', N'Trắng', N'Trắng')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (2, N'RA-AS0103A', N'RA-AS0103A.jpg', N'Đồng hồ cơ khí cổ điển, dây da - 41.5mm ', 5, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(150 AS Numeric(10, 0)), 1, 1, N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (3, N'RA-AC0M01S', N'RA-AC0M01S.jpg', N'Đồng hồ cơ khí cổ điển, dây da - 38.4mm', 2, CAST(N'2023-03-09T00:00:00.000' AS DateTime), CAST(500 AS Numeric(10, 0)), 1, 1, N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (4, N'RA-AC0M02B', N'RA-AC0M02B.jpg', N'Đồng hồ cơ khí cổ điển, dây đeo da - 38.4mm', 3, CAST(N'2023-03-09T00:00:00.000' AS DateTime), CAST(200 AS Numeric(10, 0)), 1, 1, N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (5, N'RA-AC0M03S', N'RA-AC0M03S.jpg', N'Đồng hồ cơ khí cổ điển, dây đeo da - 38.4mm', 2, CAST(N'2023-03-10T00:00:00.000' AS DateTime), CAST(300 AS Numeric(10, 0)), 1, 1, N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (6, N'RA-NB0104S', N'RA-NB0104S.jpg', N'Đồng hồ cơ khí đương đại, dây da - 32.0mm', 11, CAST(N'2023-03-11T00:00:00.000' AS DateTime), CAST(350 AS Numeric(10, 0)), 1, 3, N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (7, N'RA-NB0105S', N'RA-NB0105S.jpg', N'Đồng hồ cơ khí đương đại, dây da - 32.0mm', 6, CAST(N'2023-03-12T00:00:00.000' AS DateTime), CAST(400 AS Numeric(10, 0)), 1, 3, N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (8, N'RA-AC0K05G', N'RA-AC0K05G.jpg', N'Đồng hồ thể thao cơ khí, dây da - Giới hạn 43,4mm', 0, CAST(N'2023-03-04T00:00:00.000' AS DateTime), CAST(130 AS Numeric(10, 0)), 1, 2, N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (9, N'RA-AA0E06B', N'RA-AA0E06B.jpg', N'Đồng hồ thể thao cơ khí, dây da - 43.5mm', 1, CAST(N'2023-03-01T00:00:00.000' AS DateTime), CAST(200 AS Numeric(10, 0)), 1, 2, N'Classic and Simple Style 38 có các đặc điểm thiết kế truyền thống như mặt số lồi và kính mái vòm. Bộ truyện đã là một cuốn sách bán chạy nhất quán trong thập kỷ qua tại 70 quốc gia và khu vực trên thế giới. Cho đến nay, chúng chủ yếu có đường kính vỏ 40.5 mm, tuy nhiên những mẫu mới nhất này có vỏ 38 mm nhỏ gọn hơn. Xu hướng đồng hồ toàn cầu đang chuyển từ những chiếc đồng hồ lớn với sự hiện diện táo bạo sang những chiếc đồng hồ nhỏ hơn vừa vặn thoải mái trên cổ tay. Hơn nữa, đã có một xu hướng đặc biệt đối với những chiếc đồng hồ đơn giản chỉ hiển thị thời gian sử dụng thiết kế không tuổi với vẻ ngoài cổ điển. Nó có cả hai xu hướng này ở kích thước phù hợp với cả nam và nữ. Điều này được trang bị bộ chuyển động F46 cỡ nòng 6-F6724 tự động trong nhà của Orient mang lại hiệu suất và độ tin cậy cao. Sự hoàn thiện tuyệt đẹp trên bộ chuyển động có thể được chiêm ngưỡng thông qua mặt sau xuyên thấu, và mặt số kính mái vòm và mặt số lồi với các chỉ số thanh đơn giản tạo ra cảm giác cổ điển.', N'Thép', N'Dây da', N'38.4mm', N'Nâu', N'Trắng')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (10, N'RA-NR2005S', N'RA-NR2005S.jpg', N'Đồng hồ cơ đương đại, dây da - 32.0mm', 2, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(200 AS Numeric(10, 0)), 1, 3, N'Đây là chiếc đồng hồ cơ đương đại Orient với ngày dành cho phụ nữ. Được trang bị Calibre 55744 tự động được sản xuất trong nhà, chiếc đồng hồ mới này cân bằng một cách chuyên nghiệp giữa chuyển động cơ học chính xác với thiết kế hiện đại và sự kết hợp màu sắc thời trang. Mặt sau nhìn xuyên thấu hấp dẫn giúp tăng cường thiết kế thẩm mỹ tinh tế. Thiết kế đơn giản và sạch sẽ được trang bị tinh thể sapphire cung cấp một điểm nhấn hoàn hảo cho bất kỳ dịp nào.', N'Thép', N'Dây da', N'32.0 mm', N'Trắng', N'Trắng')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (11, N'RA-AR0004S', N'RA-AR0004S.jpg', N'Đồng hồ cơ đương đại, dây da - 40.8mm', 4, CAST(N'2023-03-05T00:00:00.000' AS DateTime), CAST(300 AS Numeric(10, 0)), 1, 3, N'Chiếc đồng hồ mới này "Contemporary Semi-skeleton with small second" được giới thiệu trong bộ sưu tập của chúng tôi như một mô hình mới, dứt khoát để dẫn đầu bộ sưu tập đương đại.

Để tăng cường bộ sưu tập Đương đại với mô hình thứ hai bán xương & nhỏ, chúng tôi đã phát triển "Cal. F6S" mới, bổ sung chức năng thứ hai nhỏ vào Cal.F6 tiêu chuẩn của chúng tôi. Calibre mới này cân bằng hoàn hảo từng yếu tố trên mặt số - khung xương ở vị trí 9 giờ, kim giây nhỏ ở số 6 và logo ORIENT &; Lion ở vị trí 12. Mặt số phụ nhỏ chồng chéo lên nhau bán bộ xương làm tăng thêm sự thú vị và cung cấp một cái nhìn thoáng qua về chuyển động của bánh xe thoát hiểm. Ngoài ra, mặt số được hai lớp để có cái nhìn sâu, ba chiều, thu hút ánh nhìn vào chuyển động của cả kim giờ và phút. Vỏ kích thước 40,8mm của nó có kính sapphire để tạo vẻ đẹp của chuyển động cơ học và RA-AR0004S hỗ trợ khả năng chống nước 50 mét.', N'Thép', N'Dây da', N'40.8 mm', N'Trắng ', N'Trắng')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (13, N'RA-AR0005Y', N'RA-AR0005Y.jpg', N'Đồng hồ cơ đương đại, dây da - 40.8mm', 21, CAST(N'2023-05-03T00:00:00.000' AS DateTime), CAST(150 AS Numeric(10, 0)), 1, 3, N'Chiếc đồng hồ mới này "Contemporary Semi-skeleton with small second" được giới thiệu trong bộ sưu tập của chúng tôi như một mô hình mới, dứt khoát để dẫn đầu bộ sưu tập đương đại.

Để tăng cường bộ sưu tập Đương đại với mô hình thứ hai bán xương & nhỏ, chúng tôi đã phát triển "Cal. F6S" mới, bổ sung chức năng thứ hai nhỏ vào Cal.F6 tiêu chuẩn của chúng tôi. Calibre mới này cân bằng hoàn hảo từng yếu tố trên mặt số - khung xương ở vị trí 9 giờ, kim giây nhỏ ở số 6 và logo ORIENT &; Lion ở vị trí 12. Mặt số phụ bán bộ xương chồng lên nhau vài giây nhỏ làm tăng thêm sự thú vị và cung cấp một cái nhìn thoáng qua về chuyển động của bánh xe thoát hiểm. Ngoài ra, mặt số được hai lớp để có cái nhìn sâu, ba chiều, thu hút ánh nhìn vào chuyển động của cả kim giờ và phút. Vỏ kích thước 40,8mm của nó có kính sapphire để tạo vẻ đẹp của chuyển động cơ học và RA-AR0005Y hỗ trợ khả năng chống nước 50 mét.', N'Thép', N'Dây da', N'40.8 mm', N'Trắng', N'Đen')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (14, N'RA-AA0E07B', N'RA-AA0E07B.jpg', N'Đồng hồ thể thao cơ, dây da - 43.5mm', 3, CAST(N'2023-05-02T00:00:00.000' AS DateTime), CAST(900 AS Numeric(10, 0)), 1, 2, N'Neo Classic Sports là mẫu xe mới nhất theo thiết kế đặc biệt của Orient từ những năm 1960 và 1970, nhưng với sự thay đổi hiện đại về chuyển động và khả năng chống nước. Nó tăng cường khả năng chống nước lên 20 bar, và bộ chuyển động tự động F6922 cỡ nòng trong nhà mang lại độ chính xác ổn định. Tận hưởng thiết kế retro phong phú cũng như chất lượng và hiệu suất cao đương đại, Neo Classic Sports là một thế hệ đồng hồ mang tính biểu tượng mới tự hào với tất cả các đặc điểm của Phương Đông.', N'Thép', N'Dây da', N'43.5 mm', N'Đen', N'Đen')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (15, N'RA-AC0K01B', N'RA-AC0K01B.jpg', N'Đồng hồ thể thao cơ, dây đeo kim loại - 43.4mm', 40, CAST(N'2023-03-21T00:00:00.000' AS DateTime), CAST(400 AS Numeric(10, 0)), 1, 2, N'Các mô hình thiết kế thợ lặn mang tính biểu tượng của ORIENT tự hào có hơn năm mươi năm lịch sử kể từ khi được giới thiệu vào năm 1964. Đồng hồ thiết kế thợ lặn mới này thể hiện tốt nhất các tính năng chức năng của ORIENT, chẳng hạn như vỏ đường kính 43,4mm và tinh thể sapphire. Núm vặn được đặt ở vị trí 4 giờ để chứa vỏ lớn được thiết kế để tạo sự thoải mái, dễ đeo và thao tác dễ dàng hơn trên cổ tay. Với khả năng chống nước 20 thanh, các mô hình thiết kế thợ lặn mới lý tưởng cho các môn thể thao dưới nước, lặn với ống thở hoặc lặn da.', N'Thép', N'Dây da', N'43.4 mm', N'Trắng ', N'Đen')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (16, N'RA-AC0K02E', N'RA-AC0K02E.jpg', N'Đồng hồ thể thao cơ, dây đeo kim loại - 43.4mm', 41, CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(320 AS Numeric(10, 0)), 1, 2, N'Các mô hình thiết kế thợ lặn mang tính biểu tượng của ORIENT tự hào có hơn năm mươi năm lịch sử kể từ khi được giới thiệu vào năm 1964. Đồng hồ thiết kế thợ lặn mới này thể hiện tốt nhất các tính năng chức năng của ORIENT, chẳng hạn như vỏ đường kính 43,4mm và tinh thể sapphire. Núm vặn được đặt ở vị trí 4 giờ để chứa vỏ lớn được thiết kế để tạo sự thoải mái, dễ đeo và thao tác dễ dàng hơn trên cổ tay. Với khả năng chống nước 20 thanh, các mô hình thiết kế thợ lặn mới lý tưởng cho các môn thể thao dưới nước, lặn với ống thở hoặc lặn da.', N'Thép', N'Kim loại', N'43.4 mm', N'Trắng', N'Xanh lá cây')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (17, N'RA-AC0K03L', N'RA-AC0K03L.jpg', N'Đồng hồ thể thao cơ, dây đeo kim loại - 43.4mm', 22, CAST(N'2023-03-21T00:00:00.000' AS DateTime), CAST(100 AS Numeric(10, 0)), 1, 2, N'Các mô hình thiết kế thợ lặn mang tính biểu tượng của ORIENT tự hào có hơn năm mươi năm lịch sử kể từ khi được giới thiệu vào năm 1964. Đồng hồ thiết kế thợ lặn mới này thể hiện tốt nhất các tính năng chức năng của ORIENT, chẳng hạn như vỏ đường kính 43,4mm và tinh thể sapphire. Núm vặn được đặt ở vị trí 4 giờ để chứa vỏ lớn được thiết kế để tạo sự thoải mái, dễ đeo và thao tác dễ dàng hơn trên cổ tay. Với khả năng chống nước 20 thanh, các mô hình thiết kế thợ lặn mới lý tưởng cho các môn thể thao dưới nước, lặn với ống thở hoặc lặn da.', N'Thép', N'Kim loại', N'43.4 mm', N'Trắng', N'Xanh pha đỏ')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (19, N'RA-AC0K04E', N'RA-AC0K04E.jpg', N'Đồng hồ thể thao cơ, dây đeo kim loại - 43.4mm', 17, CAST(N'2023-03-21T00:00:00.000' AS DateTime), CAST(402 AS Numeric(10, 0)), 1, 2, N'Các mô hình thiết kế thợ lặn mang tính biểu tượng của ORIENT tự hào có hơn năm mươi năm lịch sử kể từ khi được giới thiệu vào năm 1964. Đồng hồ thiết kế thợ lặn mới này thể hiện tốt nhất các tính năng chức năng của ORIENT, chẳng hạn như vỏ đường kính 43,4mm và tinh thể sapphire. Núm vặn được đặt ở vị trí 4 giờ để chứa vỏ lớn được thiết kế để tạo sự thoải mái, dễ đeo và thao tác dễ dàng hơn trên cổ tay. Với khả năng chống nước 20 thanh, các mô hình thiết kế thợ lặn mới lý tưởng cho các môn thể thao dưới nước, lặn với ống thở hoặc lặn da.', N'Thép', N'Kim loại', N'43.4 mm', N'Nâu nhạt', N'Xanh lá pha cam')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (20, N'RA-AA0E05B', N'RA-AA0E05B.jpg', N'Đồng hồ thể thao cơ, dây đeo kim loại - 43.5mm', 3, CAST(N'2023-03-11T00:00:00.000' AS DateTime), CAST(201 AS Numeric(10, 0)), 1, 2, N'Neo Classic Sports là mẫu xe mới nhất theo thiết kế đặc biệt của Orient từ những năm 1960 và 1970, nhưng với sự thay đổi hiện đại về chuyển động và khả năng chống nước. Nó tăng cường khả năng chống nước lên 20 bar, và bộ chuyển động tự động F6922 cỡ nòng trong nhà mang lại độ chính xác ổn định. Tận hưởng thiết kế retro phong phú cũng như chất lượng và hiệu suất cao đương đại, Neo Classic Sports là một thế hệ đồng hồ mang tính biểu tượng mới tự hào với tất cả các đặc điểm của Phương Đông.', N'Thép', N'Kim loại', N'43.5 mm', N'Trắng', N'Trắng')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (21, N'RA-AA0912B', N'RA-AA0912B.jpg', N'Đồng hồ thể thao cơ, dây đeo kim loại - 43.6mm', 2, CAST(N'2023-03-10T00:00:00.000' AS DateTime), CAST(129 AS Numeric(10, 0)), 1, 2, N'Các mẫu thể thao phổ biến kết hợp các tính năng đặc biệt của đồng hồ thợ lặn chuyên nghiệp như chức năng chống thấm nước cao, khung xoay và thiết kế mặt số với khả năng hiển thị cao. Mô hình này có vỏ thép không gỉ 44mm, có khả năng chống nước đến 20 bar, phổ biến cho đồng hồ thiết kế thợ lặn của ORIENT và kết hợp chuyển động tự động trong nhà. Cùng với thiết kế bắt mắt, những chiếc đồng hồ này được chế tạo chắc chắn với các chức năng đáng tin cậy. Không cần phải nói, những biến thể phong cách, nhiều màu sắc này có thể được thưởng thức trong một loạt các thiết lập, từ bãi biển đến thành phố bận rộn.', N'Thép', N'Kim loại', N'43.6 mm', N'Trắng', N'Xanh đậm pha đỏ')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (22, N'SKY-DWELLER', N'OIP.jpg', N'PHIÊN BẢN OYSTER PERPETUAL SKY-DWELLER, TRANG BỊ DÂY ĐEO OYSTERFLEX.', 11, CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(3900 AS Numeric(10, 0)), 2, 1, N'Rolex trân trọng giới thiệu phiên bản Oyster Perpetual Sky-Dweller bằng vàng vàng 18 ct, trang bị dây đeo Oysterflex. Đây là chiếc đồng hồ đầu tiên trong danh mục Cổ điển với dây đeo cách tân, được chế tác bằng chất liệu đàn hồi hiệu suất cao. Đồng thời, nó tích hợp thêm mặt số họa tiết tia mặt trời màu đen sáng với kim và vạch dấu giờ bằng vàng vàng 18 ct. Ánh sáng phản chiếu từ mặt bên và vấu làm nổi bật cấu hình thanh lịch của vỏ Oyster 42 mm.', N'Thép', N'Kim loại', N'42 mm', N'Vàng ', N'Vàng')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (25, N'DAY - DATE', N'RL1.jpg', N'Day-Date là chiếc đồng hồ đeo tay chronometer không thấm nước, lên dây tự động đầu tiên ghi rõ các thứ trong tuần trên hai cửa sổ riêng biệt.', 34, CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(1000 AS Numeric(10, 0)), 2, 1, N'Day-Date ban đầu được thiết kế để trở thành một công cụ quý cho mục đích sử dụng hàng ngày. Nhờ kỹ năng chế tác đồng hồ chưa từng có vào thời điểm đó, nó cung cấp giải pháp cho những người cần hoàn toàn làm chủ thời gian cá nhân của mình: Day-Date là chiếc đồng hồ đeo tay chronometer không thấm nước, lên dây tự động đầu tiên ghi rõ các thứ trong tuần trên hai cửa sổ riêng biệt. Cả ngày và thứ trên hai cửa sổ đó đều đồng thời thay đổi vào đúng thời khắc nửa đêm. Sự chuyển đổi mang tính cách mạng này tiếp tục thu hút công chúng trong suốt gần bảy thập kỷ sau đó.', N'Thép', N'Kim loại', N'41 mm', N'Trắng ', N'Trắng')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (26, N'DATEJUST', N'OIPP.jpg', N'Datejust là chiếc đồng hồ chronometer đeo tay chống thấm nước tự lên dây đầu tiên có màn hình cửa sổ hiển thị ngày tại điểm 3 giờ trên mặt số. ', 60, CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(650 AS Numeric(10, 0)), 2, 1, N'Kể từ khi được tạo ra vào năm 1945, Oyster Perpetual Datejust đã không ngừng được cải tiến nhưng vẫn luôn là biểu tượng cho sự thanh lịch cổ điển. Là cột mốc quan trọng trong lịch sử chế tạo đồng hồ, đây là chiếc đồng hồ chronometer đeo tay tự lên dây đầu tiên có khả năng chống thấm nước, hiển thị ngày trong cửa sổ tại điểm 3 giờ trên mặt số. Nổi bật nhờ ống kính Cyclops, những con số này là lời nhắc nhở rằng 24 giờ không chỉ tạo nên một ngày mà còn đánh dấu một ngày định mệnh.', N'Thép', N'Kim loại', N'28 mm', N'Trắng ', N'Xanh da trời ')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (28, N'OYSTER PERPETUAL', N'OIP2.jpg', N'Rolex trân trọng giới thiệu đồng hồ Oyster Perpetual thế hệ mới và một sản phẩm cách tân của dòng đồng hồ Oyster, mang tên Oyster Perpetual 41, nổi bật với thiết kế mặt số màu sắc sống động tương tự như các phiên bản Oyster Perpetual 36. ', 40, CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(1022 AS Numeric(10, 0)), 2, 1, N'Những chiếc đồng hồ này hội tụ mọi tính năng của bộ sưu tập Oyster Perpetual - độ chính xác vượt trội, vỏ Oyster chống thấm nước và bộ chuyển động tự lên dây thông qua rotor Perpetual. Hiển thị giờ, phút và giây, được chế tác độc quyền bằng chất liệu thép Oyster, lớp phủ bề mặt tinh xảo, đây là những chiếc đồng hồ đeo tay chronometer mang thiết kế đặc trưng nhất. Đồng hồ Oyster Perpetual thế hệ mới với lớp phủ chống phản xạ trên mặt sau của tinh thể sapphire đảm bảo độ dễ đọc tối ưu cho mặt số.', N'Thép', N'Kim loại', N'41 mm', N'Trắng', N'Bạc')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (32, N'LADY- DATEJUTST', N'OIP3.jpg', N'Vào đầu thế kỷ 20, người ta tin rằng đồng hồ đeo tay nên được hưởng lợi từ công nghệ tiên tiến nhất, và nên có độ tin cậy và tính chính xác cao như đồng hồ bỏ túi, sau đó là đồng hồ cá nhân tiêu chuẩn.', 2, CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(1033 AS Numeric(10, 0)), 2, 1, N'Lady-Datejust mang đến rất nhiều sự lựa chọn để người đeo có thể luôn thể hiện bản sắc của mình. Dòng đồng hồ được làm từ chất liệu thép Oystersteel, vàng vàng, vàng trắng, hoặc vàng Everose 18 ct, hay phiên bản Rolesor là kết hợp giữa thép Oystersteel với một trong ba loại vàng (vàng trắng, vàng vàng hoặc vàng Everose).', N'Thép', N'Kim loại', N'28 mm', N'Trắng', N'Trắng')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (33, N'AIR - KING', N'OIP4.jpg', N'Đồng hồ Rolex Air-King tôn vinh những người tiên phong của chuyến bay và vai trò của Oyster trong câu chuyện kỳ diệu về hàng không.', 9, CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(123 AS Numeric(10, 0)), 2, 4, N'Air-King có mặt số màu đen đặc biệt với sự kết hợp của các chữ số lớn 3, 6 và 9 đánh dấu giờ và thang phút nổi bật để đọc thời gian điều hướng tối ưu. Vỏ của nó, với đường kính 40 mm, được làm bằng thép Oystersteel. Từ năm 2022, nó bao gồm một bộ phận bảo vệ vương miện và có các cạnh thẳng giống như phần lớn các mẫu xe hạng mục Chuyên nghiệp.', N'Thép', N'Kim loại', N'40 mm', N'Trắng ', N'Đen')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (35, N'GMT - MASTER II', N'OIP5.jpg', N'Đồng hồ OYSTER PERPETUAL GMT - MASTER II bằng OYSTERSTEEL với dây đeo OYSTER', 7, CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(7775 AS Numeric(10, 0)), 2, 4, N'Được thiết kế để hiển thị thời gian theo hai múi giờ cùng một lúc, mẫu đồng hồ GMT-Master, ra mắt vào năm 1955, ban đầu được phát triển như một dụng cụ điều hướng dành cho các chuyên gia trên khắp thế giới. Là thế hệ sau của mẫu đồng hồ nguyên bản, Oyster Perpetual GMT-Master II ra mắt vào năm 1982, được trang bị một bộ chuyển động mới dễ sử dụng. Sự kết hợp của tính năng vượt trội, mạnh mẽ và vẻ đẹp thẩm mỹ nổi bật có thể nhận biết ngay lập tức đã thu hút được các nhà du hành trên khắp thế giới.', N'Thép', N'Kim loại', N'40 mm', N'Trắng ', N'Đen')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (36, N'YACHT - MASTER', N'5067A_023.jpg', N'Yacht-Master kết hợp giữa tính năng và phong cách, trong khi Yacht-Master II kết hợp công nghệ Rolex tối tân để tạo ra một chiếc chronograph regatta cho những cuộc thi đấu đua thuyền.', 6, CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(1200 AS Numeric(10, 0)), 2, 4, N'Yacht-Master 42 ra mắt phiên bản vàng kim – một sự cải tiến đầy cảm hứng và nguyên bản cho mẫu đồng hồ thuyền buồm biểu tượng mà không làm thay đổi phong cách của nó.Các vạch dấu giờ và kim được làm đầy hoặc phủ một lớp vật liệu phát quang mới, độc quyền của Rolex, đảm bảo độ phát sáng mạnh mẽ, kéo dài hơn. Trong ánh sáng ban ngày, các thành phần hiển thị này cũng mang màu trắng sáng hơn. ', N'Thép', N'Dây da', N'42 mm', N'Trắng ', N'Xám')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (37, N'SUBMARINER', N'OIP6.jpg', N'Oyster Perpetual Submariner là một tài liệu tham khảo trong số các đồng hồ thợ lặn', 5, CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(2312 AS Numeric(10, 0)), 2, 4, N'Ra mắt vào năm 1953, Submariner là chiếc đồng hồ đeo tay thợ lặn đầu tiên không thấm nước ở độ sâu 100 mét (330 feet). Đây là bước đột phá lớn thứ hai trong việc làm chủ kỹ thuật chống thấm nước, sau khi phát minh ra Oyster, đồng hồ đeo tay chống thấm nước đầu tiên trên thế giới, vào năm 1926. Trong chế tác đồng hồ, Submariner đại diện cho một bước ngoặt lịch sử; Nó đặt ra tiêu chuẩn cho đồng hồ của thợ lặn. Ngày nay, Submariner có khả năng chống thấm nước ở độ sâu 300 mét ', N'Thép', N'Kim loại', N'41 mm', N'Bạc', N'Đen')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (39, N'COSMOGRAPH DAYTONA', N'R.jpg', N'Oyster Perpetual Cosmograph Daytona là chiếc đồng hồ công cụ tối ưu dành cho những người có niềm đam mê lái xe và tốc độ.', 4, CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(9096 AS Numeric(10, 0)), 2, 4, N'Được giới thiệu vào năm 1963, Cosmograph Daytona được thiết kế để đáp ứng nhu cầu của các tay đua chuyên nghiệp. Nó là một biểu tượng mãi mãi gắn liền với tên tuổi và chức năng của thế giới đua xe thể thao hiệu suất cao. Hơn 50 năm sau khi được tạo ra, Cosmograph Daytona vẫn ở trong một đẳng cấp của riêng mình trong số các đồng hồ bấm giờ thể thao và tiếp tục vượt thời gian.', N'Thép', N'Dây da', N'40mm', N'Trắng', N'Đen')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (41, N'5327G-001', N'5327G_001_1.jpg', N'Giới thiệu đồng hồ Patek Philippe Grand Complications 5327G-001', 3, CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(2383 AS Numeric(10, 0)), 3, 1, N'Cho tới thời điểm hiện tại, Patek Philippe vẫn là nhà sản xuất đồng hồ cơ học có tính năng Lịch Vạn niên nổi tiếng nhất kể từ năm 1925. Với cỗ máy Patek Philippe mang số hiệu 97975, thương hiệu đình đám này đã mở ra một trào lưu mới trong giới chế tác, đem đến những chiếc đồng hồ có khả năng báo đủ mọi chức năng của thời gian không chỉ giờ, phút, giây mà còn là tháng, ngày, năm nhuận. Tuy nhiên với việc yêu cầu cao về kỹ nghệ chế tác, trên thế giới chỉ có số ít thương hiệu tên tuổi mới có đủ khả năng đem đến đồng hồ có chức năng Lịch Vạn niên.', N'Thép', N'Dây da', N'39 mm', N'Trắng ', N'Xanh da trời')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (42, N'5327R-001', N'5327R_001_1.jpg', N' ĐỒNG HỒ PATEK PHILIPPE GRAND COMPLICATIONS 5327R-001 – PERPETUAL CALENDAR', 24, CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(172500 AS Numeric(10, 0)), 3, 1, N'Kể từ khi được giới thiệu tại Baselworld 2016, 5327 Perpetual Calendar đã được người hâm mộ chào đón nhiệt tình nhờ thiết kế mẫu mực và hiệu suất cực kỳ chính xác. Hôm nay, mời quý độc giả hãy cùng chúng tôi tìm hiểu mẫu đồng hồ Patek Philippe Grand Complications Perpetual Calendar 5327R-001 vô cùng lịch lãm và cuốn hút.', N'Thép', N'Dây da', N'39 mm', N'Vàng', N'Trắng')
INSERT [dbo].[DongHo] ([MaDH], [TenDH], [ImgUrl], [MoTaNgan], [SoLuongTon], [NgayCapNhat], [GiaBan], [MaHDH], [MaLoai], [NoiDung], [ChatLieu], [Dai], [KichThuoc], [Mausac], [Maubanhxe]) VALUES (43, N'5236P-001', N'5236P_001_1.jpg', N'Đồng hồ Patek Philippe Grand Complications 5236P-001', 29, CAST(N'2023-03-22T00:00:00.000' AS DateTime), CAST(317200 AS Numeric(10, 0)), 3, 1, N'Patek Philippe đang bổ sung một lịch vạn niên hoàn toàn mới với màn hình hiển thị nội tuyến ban đầu cho phạm vi đồng hồ lịch phong phú của mình. Ngày, ngày và tháng xuất hiện trong một khẩu độ lớn duy nhất vào lúc 12 giờ. Để kết hợp tính nguyên bản, dễ đọc và độ tin cậy, các kỹ sư thiết kế đồng hồ đã phát triển bộ chuyển động tự lên dây mới 31-260 PS QL với một mô-đun hiển thị nội tuyến bổ sung, trong đó ba ứng dụng bằng sáng chế đã được nộp.', N'Thép', N'Dây da', N'41 mm', N'Trắng', N'Xanh đậm')
SET IDENTITY_INSERT [dbo].[DongHo] OFF
GO
SET IDENTITY_INSERT [dbo].[HangDongHo] ON 

INSERT [dbo].[HangDongHo] ([MaHDH], [TenHang]) VALUES (1, N'ORIENT')
INSERT [dbo].[HangDongHo] ([MaHDH], [TenHang]) VALUES (2, N'ROLEX')
INSERT [dbo].[HangDongHo] ([MaHDH], [TenHang]) VALUES (3, N'PATEK PHILIPPE')
SET IDENTITY_INSERT [dbo].[HangDongHo] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SDT], [DiaChi], [TenDangNhap], [MatKhau]) VALUES (1, N'tuan', CAST(N'2001-04-03T00:00:00.000' AS DateTime), N'Nam', N'1234567890', N'Quận 7', N'tuan', N'123')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SDT], [DiaChi], [TenDangNhap], [MatKhau]) VALUES (3, N'quang ', CAST(N'2003-02-02T00:00:00.000' AS DateTime), N'Nam', N'0123456789', N'Long xuyên', N'quang', N'321')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SDT], [DiaChi], [TenDangNhap], [MatKhau]) VALUES (4, N'Thieu Anh Khoi', CAST(N'2002-09-28T00:00:00.000' AS DateTime), N'Nam', N'0523448966', N'Quan 7', N'khoi123@gmail.com', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SDT], [DiaChi], [TenDangNhap], [MatKhau]) VALUES (5, N'Luu Tuan', CAST(N'2000-06-22T00:00:00.000' AS DateTime), N'Nam', N'0789456321', N'Quan Binh Thanh', N'tuan123@gmail.com', N'202cb962ac59075b964b07152d234b70')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [NgaySinh], [GioiTinh], [SDT], [DiaChi], [TenDangNhap], [MatKhau]) VALUES (6, N'Minh Quang', CAST(N'2002-10-13T00:00:00.000' AS DateTime), N'Nam', N'0987456321', N'13 D5 phường 25 quận Bình Thạnh Tp. HCM', N'quang.tkq@gmail.com', N'202cb962ac59075b964b07152d234b70')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiDongHo] ON 

INSERT [dbo].[LoaiDongHo] ([MaLoai], [TenLoai]) VALUES (1, N'Cổ điển')
INSERT [dbo].[LoaiDongHo] ([MaLoai], [TenLoai]) VALUES (2, N'Thể Thao')
INSERT [dbo].[LoaiDongHo] ([MaLoai], [TenLoai]) VALUES (3, N'Đương đại')
INSERT [dbo].[LoaiDongHo] ([MaLoai], [TenLoai]) VALUES (4, N'Chuyên dụng')
SET IDENTITY_INSERT [dbo].[LoaiDongHo] OFF
GO
SET IDENTITY_INSERT [dbo].[TinTuc] ON 

INSERT [dbo].[TinTuc] ([MaTT], [Img], [TieuDe], [NoiDung], [NgayTao]) VALUES (1, N'Co nen choi the thao khong.jpg', N'Có nên đeo đồng hồ cơ khi chơi thể thaoo?', N'Các bộ môn như tennis và golf cần lực giật ở cánh tay để tạo cú đánh, gây ra quán tính mạnh lên chiếc đồng hồ, hậu quả có thể làm bung kim, thậm chí cả phần mặt. Đặc biệt với những chiếc đồng hồ automatic (có bộ phận rotor lên cót tự động) còn nguy hại hơn khi có thể gãy trụ, trục máy, văng rotor.', CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[TinTuc] ([MaTT], [Img], [TieuDe], [NoiDung], [NgayTao]) VALUES (2, N'Dang Quang giam gia nhan dip khai truong.jpg', N'Đăng Quang Watch giảm giá nhân dịp khai trương', N'Đăng Quang Watch cam kết 100% sản phẩm có tại hệ thống là chính hãng. Khách hàng mua đồng hồ, kính mắt trong dịp khai trương tại cửa hàng mới không chỉ nhận được ưu đãi giảm giá lên tới 20% mà còn nhiều phần quà giá trị.Showroom mới với hàng nghìn sản phẩm đồng hồ, kính mắt đa dạng về mẫu mã và kiểu dáng. Không gian đẳng cấp, được thiết kế tỉ mỉ hứa hẹn đem lại trải nghiệm tốt nhất cho khách mua hàng.', CAST(N'2023-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[TinTuc] ([MaTT], [Img], [TieuDe], [NoiDung], [NgayTao]) VALUES (3, N'loat dong ho noi bat cua hublot nhan dip valentine.jpg', N'Loạt đồng hồ nổi bật của Hublot dịp Valentine', N'Theo đại diện hãng, mẫu Classic Fusion Titanium Blue giao thoa giữa khí chất cổ điển với phong cách hiện đại. Từng nhịp thời gian lướt bên trong "chiếc áo" titanium cấp 5 cùng vành bezel chải xước, đánh bóng tỉ mỉ. Đồng hồ được vận hành bởi bộ máy cơ HUB1110, có khả năng dự trữ năng lượng đến 42 giờ.

Phiên bản Classic Fusion Titanium Blue và Classic Fusion Titanium Blue Diamonds gồm hai kích cỡ - 42 mm và 38 mm, phù hợp với các cặp tình nhân, nhất là người chuộng phong cách minimalism, vẻ tối giản và thanh lịch.

"Đơn giản nhưng hút mắt, thiết kế có thể giúp các đôi khẳng định cá tính mùa Valentine, là trung tâm của mọi ánh nhìn", đại diện nhà chế tác cho hay.', CAST(N'2023-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[TinTuc] ([MaTT], [Img], [TieuDe], [NoiDung], [NgayTao]) VALUES (4, N'qua tang dong ho.jpg', N'Quà tặng đồng hồ, trang sức dịp Valentine', N'Polo và Possession - hai bộ sưu tập mang tính biểu tượng của Piaget - là gợi ý quà tặng cho các cặp tình nhân. Từng phiên bản thể hiện sức sáng tạo, bền bỉ, vượt giới hạn của đội ngũ thiết kế lẫn nghệ nhân chế tác. Đồng hồ vỏ thép Polo Date được giới sưu tầm đánh giá thanh lịch, chăm chút tỉ mỉ từng đường nét và chi tiết nhỏ nhất. Thiết kế dành cho nam có vẻ ngoài mạnh mẽ, trong khi phiên bản Polo Date cho nữ nạm thêm kim cương trên vành bezel.', CAST(N'2023-03-30T00:00:00.000' AS DateTime))
INSERT [dbo].[TinTuc] ([MaTT], [Img], [TieuDe], [NoiDung], [NgayTao]) VALUES (5, N'dong ho brietling.jpg', N'Những bộ sưu tập đồng hồ biểu tượng của Breitling', N'Bộ sưu tập Navitimer, SuperOcean hay Premier của Breitling có công năng đặc biệt phục vụ hành trình khám phá bầu trời, đất liền và đại dương.

Thương hiệu đồng hồ 139 năm tuổi hướng đến những bộ sưu tập bền bỉ, chính xác, đề cao công năng và hiệu suất. Trong kỷ nguyên hiện đại, Breitling ghi dấu với những bộ sưu tập nổi tiếng như: Navitimer, Premier, Chronomat, SuperOcean, Emergency hay Endurance. Một số mẫu đã song hành với nhiều lính phi công khi chiến tranh nổ ra, từng hỗ trợ các nhà thám hiềm nhờ trang bị tính năng đặc biệt.', CAST(N'2023-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[TinTuc] ([MaTT], [Img], [TieuDe], [NoiDung], [NgayTao]) VALUES (6, N'dong ho audermars.jpg', N'147 năm tôn vinh phái nữ của đồng hồ Audemars Piguet', N'Khi khoa học kỹ thuật phát triển, các nhà sưu tầm dần thay đổi nhận thức, tạo tác dành cho quý cô của Audemars Piguet cũng trải qua nhiều lần lột xác - từ cỗ máy cổ điển đến thiết kế đương đại. Vốn được đeo như dây chuyền ban đầu, đồng hồ biến hóa thành trâm cài hoặc nhẫn. Các mẫu mã của thương hiệu thời ấy đều mang phong cách chiết trung, chú trọng lớp hoàn thiện mặt số và kỹ thuật nạm đá quý.

Không chỉ đóng vai trò thiết yếu trong chặng đường phát triển của đồng hồ đeo tay đầu thế kỷ 20, những tạo phẩm cho nữ còn phản ánh thách thức về kỹ thuật chế tác và vẻ thẩm mỹ đặc trưng ở từng thời đại tương ứng.', CAST(N'2023-04-05T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
GO
ALTER TABLE [dbo].[CHITIETDONDATHANG]  WITH CHECK ADD  CONSTRAINT [PK_MaDDH_CT] FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonDatHang] ([MaDDH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CHITIETDONDATHANG] CHECK CONSTRAINT [PK_MaDDH_CT]
GO
ALTER TABLE [dbo].[CHITIETDONDATHANG]  WITH CHECK ADD  CONSTRAINT [PK_MaDH_CT] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DongHo] ([MaDH])
GO
ALTER TABLE [dbo].[CHITIETDONDATHANG] CHECK CONSTRAINT [PK_MaDH_CT]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [PK_MaKH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [PK_MaKH]
GO
ALTER TABLE [dbo].[DongHo]  WITH CHECK ADD  CONSTRAINT [PK_MaDH] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiDongHo] ([MaLoai])
GO
ALTER TABLE [dbo].[DongHo] CHECK CONSTRAINT [PK_MaDH]
GO
ALTER TABLE [dbo].[DongHo]  WITH CHECK ADD  CONSTRAINT [PK_MaHDH] FOREIGN KEY([MaHDH])
REFERENCES [dbo].[HangDongHo] ([MaHDH])
GO
ALTER TABLE [dbo].[DongHo] CHECK CONSTRAINT [PK_MaHDH]
GO
ALTER TABLE [dbo].[CHITIETDONDATHANG]  WITH CHECK ADD CHECK  (([DonGia]>=(0)))
GO
ALTER TABLE [dbo].[CHITIETDONDATHANG]  WITH CHECK ADD CHECK  (([SoLuong]>(0)))
GO
ALTER TABLE [dbo].[DongHo]  WITH CHECK ADD CHECK  (([GiaBan]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[Dangkitaikhoan]    Script Date: 5/2/2023 3:58:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Dangkitaikhoan]
@MaKH 	int ,
@TenKH 	nvarchar(50),
@NgaySinh 	datetime,
@GioiTinh	varchar(3),
@SDT		varchar(50),
@DiaChi	nvarchar(255),
@TenDangNhap varchar(100),
@MatKhau varchar(100)
as
begin
insert into KhachHang values(@TenKH,@NgaySinh,@GioiTinh,@SDT,@DiaChi,@TenDangNhap,@MatKhau)
end
GO
/****** Object:  StoredProcedure [dbo].[Suamatkhau_Customers]    Script Date: 5/2/2023 3:58:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Suamatkhau_Customers]

@TenDangNhap varchar(100),
@MatKhau varchar(100)
as
begin
	Update KhachHang 
	set MatKhau = @MatKhau
	where TenDangNhap = @TenDangNhap
end
GO
/****** Object:  StoredProcedure [dbo].[SuaThongTinKhachHang]    Script Date: 5/2/2023 3:58:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[SuaThongTinKhachHang]
@MaKH 	int ,
@TenKH 	nvarchar(50),
@NgaySinh 	datetime,
@GioiTinh	varchar(3),
@SDT		varchar(50),
@DiaChi	nvarchar(255),
@TenDangNhap varchar(100),
@MatKhau varchar(100)
as
begin
update KhachHang
Set TenKH = @TenKH, NgaySinh =@NgaySinh, GioiTinh= @GioiTinh,SDT = @SDT,DiaChi = @DiaChi, MatKhau= @MatKhau
where TenDangNhap = @TenDangNhap
end
GO
/****** Object:  StoredProcedure [dbo].[TimKiemDonDatHang]    Script Date: 5/2/2023 3:58:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[TimKiemDonDatHang]
	@chuoitimkiem nvarchar(50)
as
begin
	select * 
	from DonDatHang
	Where MaDDH like '%'+@chuoitimkiem+'%' or MaKH like '%'+@chuoitimkiem+'%'  or
	NgayDat like '%'+@chuoitimkiem+'%' or NgayGiao like '%'+@chuoitimkiem+'%' or Tinhtranggiaohang like '%'+@chuoitimkiem+'%' or DaThanhToan like '%'+@chuoitimkiem+'%' 

end
GO
/****** Object:  StoredProcedure [dbo].[TimKiemDongHo]    Script Date: 5/2/2023 3:58:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[TimKiemDongHo]
	@chuoitimkiem nvarchar(50)
as
begin
	select * 
	from DongHo
	where MaDH like '%'+@chuoitimkiem+'%'  or TenDH like '%'+@chuoitimkiem+'%'  or
	ImgUrl like '%'+@chuoitimkiem+'%' or MoTaNgan like '%'+@chuoitimkiem+'%'   or
	SoLuongTon like '%'+@chuoitimkiem+'%'  or NgayCapNhat like '%'+@chuoitimkiem+'%' or
	GiaBan like '%'+@chuoitimkiem+'%' or MaHDH like '%'+@chuoitimkiem+'%' or MaLoai like '%'+@chuoitimkiem+'%'
end 
GO
/****** Object:  StoredProcedure [dbo].[TimKiemThongTinKhachHang]    Script Date: 5/2/2023 3:58:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[TimKiemThongTinKhachHang]
	@chuoitimkiem	nvarchar(50)
as
begin
	select *
	from KhachHang
	where MaKH like '%'+@chuoitimkiem+'%' or TenKH  like '%'+@chuoitimkiem+'%' or NgaySinh  like '%'+@chuoitimkiem+'%' or GioiTinh  like '%'+@chuoitimkiem+'%' or 
	   SDT  like '%'+@chuoitimkiem+'%' or DiaChi  like '%'+@chuoitimkiem++'%' or TenDangNhap like '%'+@chuoitimkiem++'%' 
end
GO
