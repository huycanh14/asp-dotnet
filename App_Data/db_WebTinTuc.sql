USE [master]
GO
/****** Object:  Database [db_WebTinTuc]    Script Date: 13/01/2020 0:58:37 ******/
CREATE DATABASE [db_WebTinTuc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_WebTinTuc', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\db_WebTinTuc.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_WebTinTuc_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\db_WebTinTuc_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [db_WebTinTuc] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_WebTinTuc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_WebTinTuc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_WebTinTuc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_WebTinTuc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_WebTinTuc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_WebTinTuc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_WebTinTuc] SET  MULTI_USER 
GO
ALTER DATABASE [db_WebTinTuc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_WebTinTuc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_WebTinTuc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_WebTinTuc] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_WebTinTuc] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_WebTinTuc] SET QUERY_STORE = OFF
GO
USE [db_WebTinTuc]
GO
/****** Object:  Table [dbo].[DanhGias]    Script Date: 13/01/2020 0:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [ntext] NOT NULL,
	[IdTinTuc] [int] NOT NULL,
	[IdTaiKhoan] [int] NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_DanhGia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMucs]    Script Date: 13/01/2020 0:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoans]    Script Date: 13/01/2020 0:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](20) NOT NULL,
	[GioiTinh] [bit] NULL,
	[TenDangNhap] [nvarchar](20) NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[TrangThai] [bit] NULL,
	[Quyen] [bit] NOT NULL,
	[NgaySinh] [date] NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTucs]    Script Date: 13/01/2020 0:58:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTucs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](500) NOT NULL,
	[NoiDung] [ntext] NOT NULL,
	[HinhAnh] [text] NOT NULL,
	[IdDanhMuc] [int] NOT NULL,
	[NgayTao] [datetime] NOT NULL,
	[NgaySua] [datetime] NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DanhGias] ON 

INSERT [dbo].[DanhGias] ([Id], [NoiDung], [IdTinTuc], [IdTaiKhoan], [NgayTao], [NgaySua], [TrangThai]) VALUES (1, N'Rất hay', 1, 1, CAST(N'2020-01-12T17:56:55.063' AS DateTime), CAST(N'2020-01-12T17:56:55.063' AS DateTime), 1)
INSERT [dbo].[DanhGias] ([Id], [NoiDung], [IdTinTuc], [IdTaiKhoan], [NgayTao], [NgaySua], [TrangThai]) VALUES (2, N'Hay', 2, 1, CAST(N'2020-01-13T00:41:51.947' AS DateTime), CAST(N'2020-01-13T00:41:51.947' AS DateTime), 1)
INSERT [dbo].[DanhGias] ([Id], [NoiDung], [IdTinTuc], [IdTaiKhoan], [NgayTao], [NgaySua], [TrangThai]) VALUES (3, N'Hay
', 2, 1, CAST(N'2020-01-13T00:43:52.823' AS DateTime), CAST(N'2020-01-13T00:43:55.967' AS DateTime), 0)
INSERT [dbo].[DanhGias] ([Id], [NoiDung], [IdTinTuc], [IdTaiKhoan], [NgayTao], [NgaySua], [TrangThai]) VALUES (4, N'Nội dung rất hay', 2, 1, CAST(N'2020-01-13T00:46:52.483' AS DateTime), CAST(N'2020-01-13T00:46:52.483' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[DanhGias] OFF
SET IDENTITY_INSERT [dbo].[DanhMucs] ON 

INSERT [dbo].[DanhMucs] ([Id], [TenDanhMuc], [NgayTao], [NgaySua]) VALUES (1, N'Thể thao', CAST(N'2020-01-10T05:22:31.270' AS DateTime), CAST(N'2020-01-10T06:33:10.090' AS DateTime))
INSERT [dbo].[DanhMucs] ([Id], [TenDanhMuc], [NgayTao], [NgaySua]) VALUES (6, N'Chính trị', CAST(N'2020-01-11T11:04:27.463' AS DateTime), CAST(N'2020-01-11T11:04:27.463' AS DateTime))
SET IDENTITY_INSERT [dbo].[DanhMucs] OFF
SET IDENTITY_INSERT [dbo].[TaiKhoans] ON 

INSERT [dbo].[TaiKhoans] ([Id], [HoTen], [GioiTinh], [TenDangNhap], [MatKhau], [Email], [DiaChi], [TrangThai], [Quyen], [NgaySinh]) VALUES (1, N'Trần Chiến', 1, N'tranchien', N'1234567890', N'trien@gmail.com', N'Hà Nội', 1, 1, CAST(N'1998-03-12' AS Date))
INSERT [dbo].[TaiKhoans] ([Id], [HoTen], [GioiTinh], [TenDangNhap], [MatKhau], [Email], [DiaChi], [TrangThai], [Quyen], [NgaySinh]) VALUES (10, N'Trần Văn A', 1, N'tranvana', N'1234567890', N'tranvana@gmail.com', N'Hà Nội', 1, 0, CAST(N'1995-04-30' AS Date))
SET IDENTITY_INSERT [dbo].[TaiKhoans] OFF
SET IDENTITY_INSERT [dbo].[TinTucs] ON 

INSERT [dbo].[TinTucs] ([Id], [TieuDe], [NoiDung], [HinhAnh], [IdDanhMuc], [NgayTao], [NgaySua], [TrangThai]) VALUES (1, N'Bộ Chính trị kỷ luật ông Triệu Tài Vinh', N'<p>Tại cuộc họp ng&agrave;y 10/1, Bộ Ch&iacute;nh trị đ&atilde; xem x&eacute;t thi h&agrave;nh kỷ luật đối với &ocirc;ng Triệu T&agrave;i Vinh, Ph&oacute; Trưởng Ban Kinh tế T.Ư, nguy&ecirc;n B&iacute; thư Tỉnh ủy H&agrave; Giang.</p>

<p>Theo Bộ Ch&iacute;nh trị, trong thời gian giữ cương vị Ủy vi&ecirc;n Trung ương Đảng, B&iacute; thư Tỉnh uỷ H&agrave; Giang, &ocirc;ng Vinh đ&atilde; c&oacute; vi phạm, khuyết điểm nghi&ecirc;m trọng trong kỳ thi trung học phổ th&ocirc;ng quốc gia năm 2018 tại tỉnh H&agrave; Giang.</p>

<p>Cụ thể &ocirc;ng Vinh chịu tr&aacute;ch nhiệm người đứng đầu Ban Thường vụ Tỉnh ủy về để xảy ra những vi phạm nghi&ecirc;m trọng trong kỳ thi Trung học Phổ th&ocirc;ng quốc gia năm 2018 tại tỉnh H&agrave; Giang; một số c&aacute;n bộ, đảng vi&ecirc;n của tỉnh bị thi h&agrave;nh kỷ luật v&agrave; xử l&yacute; h&igrave;nh sự, trong đ&oacute; c&oacute; c&aacute;n bộ, đảng vi&ecirc;n thuộc diện Tỉnh ủy quản l&yacute;.</p>

<p>&Ocirc;ng Vinh cũng bị kết luận l&agrave; thiếu tr&aacute;ch nhiệm trong l&atilde;nh đạo, chỉ đạo thực hiện c&ocirc;ng t&aacute;c kiểm tra, gi&aacute;m s&aacute;t, xem x&eacute;t, ph&aacute;t hiện, xử l&yacute;; khi xảy ra vụ việc xử l&yacute; thiếu ki&ecirc;n quyết, thiếu kịp thời, kh&ocirc;ng nghi&ecirc;m minh đối với những tổ chức, c&aacute; nh&acirc;n c&oacute; vi phạm, khuyết điểm li&ecirc;n quan đến kỳ thi. Chấp h&agrave;nh kh&ocirc;ng nghi&ecirc;m quy định của Bộ Ch&iacute;nh trị về sự l&atilde;nh đạo của Đảng đối với c&aacute;c cơ quan bảo vệ ph&aacute;p luật.</p>

<p>Đặc biệt, &ocirc;ng Vinh c&oacute; em g&aacute;i vi phạm trong kỳ thi n&ecirc;u tr&ecirc;n. Sau khi bị ph&aacute;t hiện, c&ograve;n n&eacute; tr&aacute;nh tr&aacute;ch nhiệm, vi phạm tr&aacute;ch nhiệm n&ecirc;u gương của c&aacute;n bộ, đảng vi&ecirc;n theo Quy định của Trung ương Đảng.</p>

<p>Theo Bộ Ch&iacute;nh trị, những vi phạm, khuyết điểm của đồng ch&iacute; Triệu T&agrave;i Vinh đ&atilde; l&agrave;m ảnh hưởng xấu đến uy t&iacute;n của cấp ủy, ch&iacute;nh quyền địa phương v&agrave; c&aacute; nh&acirc;n đồng ch&iacute;.</p>

<p>X&eacute;t nội dung, t&iacute;nh chất, mức độ, nguy&ecirc;n nh&acirc;n, hậu quả vi phạm, căn cứ Quy định số 102-QĐ/TW, ng&agrave;y 15/11/2017 của Bộ Ch&iacute;nh trị về xử l&yacute; kỷ luật đảng vi&ecirc;n vi phạm, Bộ Ch&iacute;nh trị quyết định thi h&agrave;nh kỷ luật &ocirc;ng Triệu T&agrave;i Vinh bằng h&igrave;nh thức Khiển tr&aacute;ch.</p>

<div id="eJOY__extension_root" style="all:unset">&nbsp;</div>
', N'coffee-cafe-business-logo-vector-17041579.jpg', 6, CAST(N'2020-01-10T08:22:28.700' AS DateTime), CAST(N'2020-01-11T11:10:43.503' AS DateTime), 1)
INSERT [dbo].[TinTucs] ([Id], [TieuDe], [NoiDung], [HinhAnh], [IdDanhMuc], [NgayTao], [NgaySua], [TrangThai]) VALUES (2, N'Tin thể thao HOT 11/1: Nadal, Djokovic hẹn nhau chung kết ATP Cup', N'<p><strong>Nadal,&nbsp;<a href="https://www.24h.com.vn/novak-djokovic-c101e4417.html" title="Djokovic">Djokovic</a>&nbsp;c&ugrave;ng thắng, T&acirc;y Ban Nha hẹn Serbia chung kết ATP Cup</strong></p>

<p>Hai tay vợt h&agrave;ng đầu thế giới l&agrave; Nadal v&agrave; Djokovic đều đ&atilde; chứng tỏ được đẳng cấp khi đại diện cho 2 đội TBN, Serbia tranh t&agrave;i ở b&aacute;n kết giải ATP Cup 2020, lần lượt gặp Australia v&agrave; Nga.</p>

<p>Ở cặp đấu giữa TBN v&agrave; Australia, Nadal đ&aacute;nh đơn gặp đối thủ De Minaur. D&ugrave; vất vả nhưng tay vợt số 1 thế giới đ&atilde; chiến thắng sau 3 set với c&aacute;c tỷ số 4-6, 7-5, 6-1. Ở trận đ&aacute;nh đơn c&ograve;n lại, Bautista Agut vượt qua Nick Kyrgios kh&aacute; dễ d&agrave;ng chỉ sau 2 set 6-1, 6-4. Thắng 2-0 sau 2 trận đ&aacute;nh đơn, TBN ghi danh v&agrave;o chung kết, bất chấp kết quả trận đ&aacute;nh đ&ocirc;i cuối c&ugrave;ng ra sao.</p>

<p>Ở cặp đấu giữa Serbia v&agrave; Nga, Djokovic đ&aacute;nh đơn gặp đối thủ kh&oacute; chơi Medvedev. Trận đấu diễn ra hấp dẫn v&agrave; phải ph&acirc;n định sau 3 set. Nole chơi bản lĩnh hơn để thắng 6-1, 5-7, 6-4. Trước đ&oacute; Lajovic cũng đ&atilde; đ&aacute;nh bại Khachanov 7-5, 7-6 v&agrave; gi&uacute;p Serbia thắng 2-0, v&agrave; sẽ gặp TBN ở chung kết (diễn ra v&agrave;o ng&agrave;y 12/1).</p>

<p><strong>Thiem kết hợp thầy mới, nhắm v&ocirc; địch&nbsp;<a href="https://www.24h.com.vn/australian-open-2012-c101e2105.html" title="Australian Open">Australian Open</a>&nbsp;2020.&nbsp;</strong>Theo&nbsp;<a href="https://www.24h.com.vn/tennis-c119.html" title="tennis">tennis</a>&nbsp;magazine,<strong>&nbsp;</strong>Dominic Thiem hiện đang xếp thứ 4 l&agrave;ng tennis thế giới. Tay vợt 26 tuổi người &Aacute;o từng 2 lần lọt v&agrave;o đến chung kết Ph&aacute;p mở rộng 2018 v&agrave; 2019, nhưng rồi đều thất bại trước Nadal. Hiện Thiem bắt đầu l&agrave;m việc với HLV mới l&agrave; Thomas Muster - cựu số 1 thế giới v&agrave; cũng l&agrave; một tay vợt người &Aacute;o.</p>

<p>Ngo&agrave;i ra, Thiem vẫn sẽ l&agrave;m việc với HLV hiện tại l&agrave; Nicolas Massu, nhưng sự bổ sung mang t&ecirc;n Thomas Muster được kỳ vọng sẽ gi&uacute;p anh chinh phục Australian Open 2020 tới đ&acirc;y. Tại giải đấu n&agrave;y v&agrave;o năm ngo&aacute;i, Thiem bị loại ngay từ v&ograve;ng 2.</p>

<p><strong>McGregor phải thắng Cerrone bằng mọi gi&aacute;.&nbsp;</strong>Rất l&acirc;u rồi, kể từ trận thua trước Khabib, Conor McGregor mới trở lại s&agrave;n UFC. Theo đ&aacute;nh gi&aacute; của giới chuy&ecirc;n gia, &quot;G&atilde; đi&ecirc;n người Ireland&quot; sẽ bị ch&ocirc;n v&ugrave;i t&ecirc;n tuổi nếu thất bại trước Donald Cerrone - v&otilde; sỹ đ&atilde; 36 tuổi. Người h&acirc;m mộ kỳ vọng rằng McGregor sẽ t&igrave;m lại đẳng cấp vốn c&oacute;, đồng thời chuẩn bị cho cuộc t&aacute;i đấu với Khabib trong tương lai gần.</p>

<p><strong>Pacquiao sẽ kiếm bộn tiền trong năm 2020.</strong>&nbsp;Trong năm 2019, Manny Pacquiao chỉ thượng đ&agrave;i 2 lần, gi&agrave;nh 2 chiến thắng trước Keith Thurman v&agrave; Adrien Broner nhưng kh&ocirc;ng kiếm được nhiều tiền như kỳ vọng. Tuy nhi&ecirc;n, theo dự đo&aacute;n của giới boxing, v&otilde; sỹ người Philippines sẽ tiếp tục thượng đ&agrave;i, v&agrave; hứa hẹn sẽ kiếm bộn tiền trong năm 2020. Giới mộ điệu vẫn chờ đợi v&agrave;o cuộc t&aacute;i đấu kinh điển giữa Manny Pacquiao v&agrave; Floyd Mayweather.</p>

<p><strong>IBF x&aacute;c nhận &quot;quyền vương&quot; Joshua sắp đấu Pulev.</strong>&nbsp;Li&ecirc;n đo&agrave;n quyền Anh quốc tế (IBF) vừa l&ecirc;n tiếng x&aacute;c nhận về qu&aacute; tr&igrave;nh đ&agrave;m ph&aacute;n hợp đồng ăn chia, c&aacute;c điều khoản kh&aacute;c giữa đại diện hai v&otilde; sỹ Anthony Joshua v&agrave; Kubrat Pulev. Hai b&ecirc;n sẽ c&oacute; thời hạn đến ng&agrave;y 31/1 để x&aacute;c định cuộc đấu n&agrave;y c&oacute; diễn ra hay kh&ocirc;ng. Ng&agrave;y 7/12 vừa qua, &quot;quyền vương&quot; Joshua xuất sắc đ&aacute;nh bại Andy Ruiz Jr trong cuộc t&aacute;i đấu, trước đ&oacute; tay đấm người Anh đ&atilde; phải nếm trải thất bại đầu ti&ecirc;n trong sự nghiệp trước ch&iacute;nh Andy Ruiz Jr h&ocirc;m 1/7/2019.</p>

<p><strong>Hamilton nghĩa cử cao đẹp.&nbsp;</strong>Nh&agrave; v&ocirc; địch của l&agrave;ng đua xe c&ocirc;ng thức 1 thế giới năm 2019 - Lewis Hamilton vừa quyết định quy&ecirc;n g&oacute;p 500.000 USD cho c&aacute;c nạn nh&acirc;n bị thiệt hại trong vụ ch&aacute;y rừng ở Australia. Mới đ&acirc;y, Australia trải qua trận ch&aacute;y rừng tồi tệ nhất quốc gia n&agrave;y trong nhiều thập kỷ, v&agrave; con số thiệt hại cả về người, t&agrave;i sản cũng như c&aacute;c thiệt hại kh&aacute;c cho đến nay vẫn chưa c&oacute; ước t&iacute;nh ch&iacute;nh x&aacute;c.</p>

<p><strong>Nadal thua trận, T&acirc;y Ban Nha vẫn v&agrave;o b&aacute;n kết ATP Cup.&nbsp;</strong>Mặc d&ugrave; Rafa đ&atilde; để thua Goffin 4-6, 6-7 ở trận đ&aacute;nh đơn, c&aacute;c đồng đội của anh vẫn c&oacute; 2 chiến thắng quan trọng kh&aacute;c để gi&uacute;p T&acirc;y Ban Nha vượt qua Bỉ ở v&ograve;ng tứ kết. Agut vượt qua Coppejans v&agrave; ch&iacute;nh Nadal c&ugrave;ng Busta đ&atilde; thắng ở trận đ&aacute;nh đ&ocirc;i quyết định trước cặp Gille/Vliegen.</p>

<p>H&ocirc;m nay, T&acirc;y Ban Nha sẽ đụng &Uacute;c ở b&aacute;n kết c&ograve;n Serbia gặp Nga.</p>
', N'Tin-the-thao-HOT-11-1-Thiem-ket-hop-thay-moi-nham-vo-dich-Australian-Open-2020-2500985-51918410-2560-1440-1578647129-845-width660height370.jpg', 1, CAST(N'2020-01-11T22:25:16.543' AS DateTime), CAST(N'2020-01-11T22:25:16.543' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[TinTucs] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TaiKhoan]    Script Date: 13/01/2020 0:58:37 ******/
ALTER TABLE [dbo].[TaiKhoans] ADD  CONSTRAINT [IX_TaiKhoan] UNIQUE NONCLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TaiKhoan_1]    Script Date: 13/01/2020 0:58:37 ******/
ALTER TABLE [dbo].[TaiKhoans] ADD  CONSTRAINT [IX_TaiKhoan_1] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DanhGias] ADD  CONSTRAINT [DF_DanhGia_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[DanhGias] ADD  CONSTRAINT [DF_DanhGia_NgaySua]  DEFAULT (getdate()) FOR [NgaySua]
GO
ALTER TABLE [dbo].[DanhGias] ADD  CONSTRAINT [DF_DanhGia_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[DanhMucs] ADD  CONSTRAINT [DF_DanhMuc_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[DanhMucs] ADD  CONSTRAINT [DF_DanhMuc_NgaySua]  DEFAULT (getdate()) FOR [NgaySua]
GO
ALTER TABLE [dbo].[TinTucs] ADD  CONSTRAINT [DF_TinTuc_NgayTao]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[TinTucs] ADD  CONSTRAINT [DF_TinTuc_NgaySua]  DEFAULT (getdate()) FOR [NgaySua]
GO
ALTER TABLE [dbo].[TinTucs] ADD  CONSTRAINT [DF_TinTuc_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[DanhGias]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_TaiKhoan] FOREIGN KEY([IdTaiKhoan])
REFERENCES [dbo].[TaiKhoans] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhGias] CHECK CONSTRAINT [FK_DanhGia_TaiKhoan]
GO
ALTER TABLE [dbo].[DanhGias]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_TinTuc] FOREIGN KEY([IdTinTuc])
REFERENCES [dbo].[TinTucs] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DanhGias] CHECK CONSTRAINT [FK_DanhGia_TinTuc]
GO
ALTER TABLE [dbo].[TinTucs]  WITH CHECK ADD  CONSTRAINT [FK_TinTuc_DanhMuc] FOREIGN KEY([IdDanhMuc])
REFERENCES [dbo].[DanhMucs] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TinTucs] CHECK CONSTRAINT [FK_TinTuc_DanhMuc]
GO
ALTER TABLE [dbo].[DanhGias]  WITH CHECK ADD  CONSTRAINT [CK_DanhGia] CHECK  (([NgayTao]<=getdate()))
GO
ALTER TABLE [dbo].[DanhGias] CHECK CONSTRAINT [CK_DanhGia]
GO
ALTER TABLE [dbo].[DanhGias]  WITH CHECK ADD  CONSTRAINT [CK_DanhGia_1] CHECK  (([NgaySua]<=getdate()))
GO
ALTER TABLE [dbo].[DanhGias] CHECK CONSTRAINT [CK_DanhGia_1]
GO
ALTER TABLE [dbo].[DanhMucs]  WITH CHECK ADD  CONSTRAINT [CK_DanhMuc] CHECK  (([NgayTao]<=getdate()))
GO
ALTER TABLE [dbo].[DanhMucs] CHECK CONSTRAINT [CK_DanhMuc]
GO
ALTER TABLE [dbo].[DanhMucs]  WITH CHECK ADD  CONSTRAINT [CK_DanhMuc_1] CHECK  (([NgaySua]<=getdate()))
GO
ALTER TABLE [dbo].[DanhMucs] CHECK CONSTRAINT [CK_DanhMuc_1]
GO
ALTER TABLE [dbo].[TinTucs]  WITH CHECK ADD  CONSTRAINT [CK_TinTuc] CHECK  (([NgayTao]<=getdate()))
GO
ALTER TABLE [dbo].[TinTucs] CHECK CONSTRAINT [CK_TinTuc]
GO
ALTER TABLE [dbo].[TinTucs]  WITH CHECK ADD  CONSTRAINT [CK_TinTuc_1] CHECK  (([NgaySua]<=getdate()))
GO
ALTER TABLE [dbo].[TinTucs] CHECK CONSTRAINT [CK_TinTuc_1]
GO
USE [master]
GO
ALTER DATABASE [db_WebTinTuc] SET  READ_WRITE 
GO
