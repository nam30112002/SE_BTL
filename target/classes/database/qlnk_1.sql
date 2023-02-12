USE [master]
GO
/****** Object:  Database [quanlynhankhau]    Script Date: 1/30/2023 12:58:21 PM ******/
CREATE DATABASE [quanlynhankhau]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quanlynhankhau', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.NAM30112002\MSSQL\DATA\quanlynhankhau.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'quanlynhankhau_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.NAM30112002\MSSQL\DATA\quanlynhankhau_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [quanlynhankhau] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quanlynhankhau].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quanlynhankhau] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quanlynhankhau] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quanlynhankhau] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quanlynhankhau] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quanlynhankhau] SET ARITHABORT OFF 
GO
ALTER DATABASE [quanlynhankhau] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [quanlynhankhau] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quanlynhankhau] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quanlynhankhau] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quanlynhankhau] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quanlynhankhau] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quanlynhankhau] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quanlynhankhau] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quanlynhankhau] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quanlynhankhau] SET  DISABLE_BROKER 
GO
ALTER DATABASE [quanlynhankhau] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quanlynhankhau] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quanlynhankhau] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quanlynhankhau] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quanlynhankhau] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quanlynhankhau] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quanlynhankhau] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quanlynhankhau] SET RECOVERY FULL 
GO
ALTER DATABASE [quanlynhankhau] SET  MULTI_USER 
GO
ALTER DATABASE [quanlynhankhau] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quanlynhankhau] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quanlynhankhau] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quanlynhankhau] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [quanlynhankhau] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [quanlynhankhau] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'quanlynhankhau', N'ON'
GO
ALTER DATABASE [quanlynhankhau] SET QUERY_STORE = ON
GO
ALTER DATABASE [quanlynhankhau] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [quanlynhankhau]
GO
/****** Object:  Table [dbo].[nam_hoc]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nam_hoc](
	[namHoc] [nvarchar](10) NOT NULL,
	[motSuatQua] [nvarchar](100) NOT NULL,
	[tongGiaTriMotSuat] [decimal](15, 4) NOT NULL,
 CONSTRAINT [PK_nam_hoc_namHoc] PRIMARY KEY CLUSTERED 
(
	[namHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhan_khau]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhan_khau](
	[ID] [int] IDENTITY(39,1) NOT NULL,
	[maNhanKhau] [nvarchar](100) NULL,
	[hoTen] [nvarchar](100) NULL,
	[bietDanh] [nvarchar](100) NULL,
	[namSinh] [date] NULL,
	[gioiTinh] [nvarchar](100) NULL,
	[noiSinh] [nvarchar](100) NULL,
	[nguyenQuan] [nvarchar](100) NULL,
	[danToc] [nvarchar](100) NULL,
	[tonGiao] [nvarchar](100) NULL,
	[quocTich] [nvarchar](100) NULL,
	[soHoChieu] [nvarchar](100) NULL,
	[noiThuongTru] [nvarchar](100) NULL,
	[diaChiHienNay] [nvarchar](100) NULL,
	[trinhDoHocVan] [nvarchar](100) NULL,
	[TrinhDoChuyenMon] [nvarchar](100) NULL,
	[bietTiengDanToc] [nvarchar](100) NULL,
	[trinhDoNgoaiNgu] [nvarchar](100) NULL,
	[ngheNghiep] [nvarchar](100) NULL,
	[noiLamViec] [nvarchar](100) NULL,
	[tienAn] [nvarchar](100) NULL,
	[ngayChuyenDen] [date] NULL,
	[lyDoChuyenDen] [nvarchar](100) NULL,
	[ngayChuyenDi] [date] NULL,
	[lyDoChuyenDi] [nvarchar](100) NULL,
	[diaChiMoi] [nvarchar](100) NULL,
	[ngayTao] [date] NULL,
	[idNguoiTao] [int] NULL,
	[ngayXoa] [date] NULL,
	[idNguoiXoa] [int] NULL,
	[lyDoXoa] [nvarchar](100) NULL,
	[ghiChu] [nvarchar](100) NULL,
	[CCCD] [nvarchar](100) NULL,
 CONSTRAINT [PK_nhan_khau_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thanh_vien_cua_ho]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thanh_vien_cua_ho](
	[idNhanKhau] [int] NOT NULL,
	[idHoKhau] [int] NOT NULL,
	[quanHeVoiChuHo] [nvarchar](100) NULL,
 CONSTRAINT [PK_thanh_vien_cua_ho_idNhanKhau] PRIMARY KEY CLUSTERED 
(
	[idNhanKhau] ASC,
	[idHoKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trao_qua_hsg]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trao_qua_hsg](
	[idNhanKhau] [int] NOT NULL,
	[thanhTich] [nvarchar](100) NULL,
	[namHoc] [nvarchar](10) NOT NULL,
	[minhChung] [varbinary](max) NULL,
	[trangThai] [nvarchar](20) NULL,
	[ngayNhan] [date] NULL,
 CONSTRAINT [PK_trao_qua_hsg_idNhanKhau] PRIMARY KEY CLUSTERED 
(
	[idNhanKhau] ASC,
	[namHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[ds_hoc_sinh]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   ALGORITHM =  UNDEFINED.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*   M2SS0003: The following SQL clause was ignored during conversion:
*   SQL SECURITY DEFINER.
*/

CREATE VIEW [dbo].[ds_hoc_sinh] (
   [ID], 
   [hoTen], 
   [noiLamViec], 
   [idHoKhau], 
   [quanHeVoiChuHo], 
   [thanhTich], 
   [minhChung], 
   [trangThai], 
   [namHoc])
AS 
   SELECT 
      nhan_khau.ID AS ID, 
      nhan_khau.hoTen AS hoTen, 
      nhan_khau.noiLamViec AS noiLamViec, 
      thanh_vien_cua_ho.idHoKhau AS idHoKhau, 
      thanh_vien_cua_ho.quanHeVoiChuHo AS quanHeVoiChuHo, 
      trao_qua_hsg.thanhTich AS thanhTich, 
      trao_qua_hsg.minhChung AS minhChung, 
      trao_qua_hsg.trangThai AS trangThai, 
      trao_qua_hsg.namHoc AS namHoc
   FROM ((dbo.nhan_khau 
      LEFT JOIN dbo.thanh_vien_cua_ho 
      ON ((nhan_khau.ID = thanh_vien_cua_ho.idNhanKhau))) 
      LEFT JOIN dbo.trao_qua_hsg 
      ON ((nhan_khau.ID = trao_qua_hsg.idNhanKhau)))
   WHERE ((nhan_khau.ngheNghiep = 'Học sinh') AND (CAST(trao_qua_hsg.namHoc AS float(53)) = 
      (
         SELECT max(nam_hoc.namHoc)
         FROM dbo.nam_hoc
      )))
GO
/****** Object:  Table [dbo].[chung_minh_thu]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chung_minh_thu](
	[ID] [int] IDENTITY(26,1) NOT NULL,
	[idNhanKhau] [int] NULL,
	[soCMT] [nvarchar](12) NOT NULL,
	[ngayCap] [date] NULL,
	[noiCap] [nvarchar](100) NULL,
 CONSTRAINT [PK_chung_minh_thu_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[danh_sach_nhan_qua_cac_nam]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[danh_sach_nhan_qua_cac_nam](
	[idNhanKhau] [int] NOT NULL,
	[namHoc] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_danh_sach_nhan_qua_cac_nam_idNhanKhau] PRIMARY KEY CLUSTERED 
(
	[idNhanKhau] ASC,
	[namHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dinh_chinh]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dinh_chinh](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idHoKhau] [int] NULL,
	[thongTinThayDoi] [nvarchar](100) NULL,
	[thayDoiTu] [nvarchar](100) NULL,
	[thayDoiThanh] [nvarchar](100) NULL,
	[ngayThayDoi] [date] NULL,
	[nguoiThayDoi] [int] NULL,
 CONSTRAINT [PK_dinh_chinh_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gia_dinh]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gia_dinh](
	[ID] [int] IDENTITY(34,1) NOT NULL,
	[idNhanKhau] [int] NULL,
	[hoTen] [nvarchar](100) NULL,
	[namSinh] [date] NULL,
	[gioiTinh] [nvarchar](100) NULL,
	[quanHeVoiNhanKhau] [nvarchar](100) NULL,
	[ngheNghiep] [nvarchar](100) NULL,
	[diaChiHienTai] [nvarchar](100) NULL,
 CONSTRAINT [PK_gia_dinh_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ho_khau]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ho_khau](
	[ID] [int] IDENTITY(17,1) NOT NULL,
	[maHoKhau] [nvarchar](100) NULL,
	[idChuHo] [int] NULL,
	[maKhuVuc] [nvarchar](100) NULL,
	[diaChi] [nvarchar](100) NULL,
	[ngayLap] [date] NULL,
	[ngayChuyenDi] [date] NULL,
	[lyDoChuyen] [nvarchar](max) NULL,
	[nguoiThucHien] [int] NULL,
 CONSTRAINT [PK_ho_khau_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khai_tu]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khai_tu](
	[ID] [int] IDENTITY(2,1) NOT NULL,
	[soGiayKhaiTu] [nvarchar](100) NULL,
	[idNguoiKhai] [int] NULL,
	[idNguoiChet] [int] NULL,
	[ngayKhai] [date] NULL,
	[ngayChet] [date] NULL,
	[lyDoChet] [nvarchar](100) NULL,
 CONSTRAINT [PK_khai_tu_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[le_tet]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[le_tet](
	[idSuKien] [int] IDENTITY(7,1) NOT NULL,
	[thoiGian] [date] NOT NULL,
	[tenSuKien] [nvarchar](100) NOT NULL,
	[motSuatQua] [nvarchar](100) NOT NULL,
	[tongGiaTriMotSuat] [decimal](15, 2) NOT NULL,
	[ngayTao] [date] NOT NULL,
	[idNguoiTao] [int] NOT NULL,
 CONSTRAINT [PK_le_tet_idSuKien] PRIMARY KEY CLUSTERED 
(
	[idSuKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lich_su_thay_doink]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lich_su_thay_doink](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[idHoKhauMoi] [nvarchar](50) NOT NULL,
	[idNhanKhau] [int] NOT NULL,
	[suKien] [nvarchar](100) NULL,
	[ngay] [date] NULL,
 CONSTRAINT [PK_lich_su_thay_doink_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qua_hsg]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qua_hsg](
	[thanhTich] [nvarchar](100) NOT NULL,
	[namHoc] [nvarchar](10) NOT NULL,
	[soLuongSuatQua] [int] NOT NULL,
 CONSTRAINT [PK_qua_hsg_thanhTich] PRIMARY KEY CLUSTERED 
(
	[thanhTich] ASC,
	[namHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tam_tru]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tam_tru](
	[ID] [int] IDENTITY(2,1) NOT NULL,
	[idNhanKhau] [int] NULL,
	[maGiayTamtru] [nvarchar](100) NULL,
	[soDienThoaiNguoiDangKy] [nvarchar](100) NULL,
	[tuNgay] [date] NOT NULL,
	[denNgay] [date] NOT NULL,
	[lyDo] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tam_tru_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tam_vang]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tam_vang](
	[ID] [int] IDENTITY(3,1) NOT NULL,
	[idNhanKhau] [int] NULL,
	[maGiayTamVang] [nvarchar](100) NULL,
	[noiTamtru] [nvarchar](100) NULL,
	[tuNgay] [date] NULL,
	[denNgay] [date] NULL,
	[lyDo] [nvarchar](100) NULL,
 CONSTRAINT [PK_tam_vang_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tieu_su]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tieu_su](
	[ID] [int] IDENTITY(13,1) NOT NULL,
	[idNhanKhau] [int] NULL,
	[tuNgay] [date] NULL,
	[denNgay] [date] NULL,
	[diaChi] [nvarchar](100) NULL,
	[ngheNghiep] [nvarchar](100) NULL,
	[noiLamViec] [nvarchar](100) NULL,
 CONSTRAINT [PK_tieu_su_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trao_qua_le_tet]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trao_qua_le_tet](
	[idHoKhau] [int] NOT NULL,
	[idSuKien] [int] NOT NULL,
	[soLuongQua] [int] NOT NULL,
	[trangThai] [nvarchar](20) NOT NULL,
	[ngayNhanQua] [date] NULL,
	[idNguoiGhiNhan] [int] NULL,
	[thoiGianGhiNhan] [date] NULL,
 CONSTRAINT [PK_trao_qua_le_tet_idHoKhau] PRIMARY KEY CLUSTERED 
(
	[idHoKhau] ASC,
	[idSuKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 1/30/2023 12:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[ID] [int] IDENTITY(4,1) NOT NULL,
	[userName] [nvarchar](100) NULL,
	[passwd] [nvarchar](100) NULL,
 CONSTRAINT [PK_users_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[chung_minh_thu] ON 

INSERT [dbo].[chung_minh_thu] ([ID], [idNhanKhau], [soCMT], [ngayCap], [noiCap]) VALUES (13, 26, N'000000000001', NULL, NULL)
INSERT [dbo].[chung_minh_thu] ([ID], [idNhanKhau], [soCMT], [ngayCap], [noiCap]) VALUES (14, 27, N'000000000002', NULL, NULL)
INSERT [dbo].[chung_minh_thu] ([ID], [idNhanKhau], [soCMT], [ngayCap], [noiCap]) VALUES (15, 28, N'000000000003', NULL, NULL)
INSERT [dbo].[chung_minh_thu] ([ID], [idNhanKhau], [soCMT], [ngayCap], [noiCap]) VALUES (16, 29, N'000000000004', NULL, NULL)
INSERT [dbo].[chung_minh_thu] ([ID], [idNhanKhau], [soCMT], [ngayCap], [noiCap]) VALUES (17, 30, N'000000000005', NULL, NULL)
INSERT [dbo].[chung_minh_thu] ([ID], [idNhanKhau], [soCMT], [ngayCap], [noiCap]) VALUES (18, 31, N'000000000006', NULL, NULL)
INSERT [dbo].[chung_minh_thu] ([ID], [idNhanKhau], [soCMT], [ngayCap], [noiCap]) VALUES (19, 32, N'000000000007', NULL, NULL)
INSERT [dbo].[chung_minh_thu] ([ID], [idNhanKhau], [soCMT], [ngayCap], [noiCap]) VALUES (20, 33, N'000000000008', NULL, NULL)
INSERT [dbo].[chung_minh_thu] ([ID], [idNhanKhau], [soCMT], [ngayCap], [noiCap]) VALUES (21, 34, N'000000000009', NULL, NULL)
INSERT [dbo].[chung_minh_thu] ([ID], [idNhanKhau], [soCMT], [ngayCap], [noiCap]) VALUES (22, 35, N'100000000001', NULL, NULL)
INSERT [dbo].[chung_minh_thu] ([ID], [idNhanKhau], [soCMT], [ngayCap], [noiCap]) VALUES (23, 36, N'100000000002', NULL, NULL)
INSERT [dbo].[chung_minh_thu] ([ID], [idNhanKhau], [soCMT], [ngayCap], [noiCap]) VALUES (24, 37, N'000000000010', NULL, NULL)
INSERT [dbo].[chung_minh_thu] ([ID], [idNhanKhau], [soCMT], [ngayCap], [noiCap]) VALUES (25, 38, N'000000000011', NULL, NULL)
SET IDENTITY_INSERT [dbo].[chung_minh_thu] OFF
GO
INSERT [dbo].[danh_sach_nhan_qua_cac_nam] ([idNhanKhau], [namHoc]) VALUES (35, N'2018-2019')
INSERT [dbo].[danh_sach_nhan_qua_cac_nam] ([idNhanKhau], [namHoc]) VALUES (36, N'2018-2019')
INSERT [dbo].[danh_sach_nhan_qua_cac_nam] ([idNhanKhau], [namHoc]) VALUES (35, N'2019-2020')
INSERT [dbo].[danh_sach_nhan_qua_cac_nam] ([idNhanKhau], [namHoc]) VALUES (36, N'2019-2020')
INSERT [dbo].[danh_sach_nhan_qua_cac_nam] ([idNhanKhau], [namHoc]) VALUES (35, N'2020-2021')
INSERT [dbo].[danh_sach_nhan_qua_cac_nam] ([idNhanKhau], [namHoc]) VALUES (36, N'2020-2021')
INSERT [dbo].[danh_sach_nhan_qua_cac_nam] ([idNhanKhau], [namHoc]) VALUES (35, N'2021-2022')
INSERT [dbo].[danh_sach_nhan_qua_cac_nam] ([idNhanKhau], [namHoc]) VALUES (36, N'2021-2022')
GO
SET IDENTITY_INSERT [dbo].[gia_dinh] ON 

INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (2, 27, N'Nguyễn Minh Quân', CAST(N'1995-05-31' AS Date), N'Nam', N'Chồng', N'Kỹ sư', N'Số 2 Tạ Quang Bửu, Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (3, 28, N'Trần Thanh Duyên', CAST(N'1997-12-23' AS Date), N'Nữ', N'Vợ', N'Nhân viên văn phòng', N'Số 2 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (4, 29, N'Vũ Mỹ Linh', CAST(N'1965-12-06' AS Date), N'Nữ', N'Vợ', N'Nội trợ', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (5, 29, N'Nguyễn Tiến Đạt', CAST(N'1990-09-09' AS Date), N'Nam', N'Con trai', N'Kỹ sư điện', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (6, 29, N'Nguyễn Trà My', CAST(N'1997-12-12' AS Date), N'Nữ', N'Con gái', N'Luật sư', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (7, 30, N'Nguyễn Tiến Dũng', CAST(N'1964-06-03' AS Date), N'Nam', N'Chồng', N'Phó giám đốc', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (8, 30, N'Nguyễn Tiến Đạt', CAST(N'1990-09-09' AS Date), N'Nam', N'Con trai', N'Kỹ sư điện', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (9, 30, N'Nguyễn Trà My', CAST(N'1997-12-12' AS Date), N'Nữ', N'Con Gái', N'Luật sư', N'')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (10, 31, N'Nguyễn Tiến Dũng', CAST(N'1964-06-03' AS Date), N'Nam', N'Bố', N'Phó giám đốc', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (11, 31, N'Vũ Mỹ Linh', CAST(N'1965-12-06' AS Date), N'Nữ', N'Mẹ', N'Nội trợ', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (12, 31, N'Nguyễn Trà My', CAST(N'1997-12-12' AS Date), N'Nữ', N'Em gái', N'Luật sư', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (13, 32, N'Nguyễn Tiến Dũng', CAST(N'1964-06-03' AS Date), N'Nam', N'Bố', N'Phó giám đốc', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (14, 32, N'Vũ Mỹ Linh', CAST(N'1965-12-06' AS Date), N'Nữ', N'Mẹ', N'Nội trợ', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (15, 32, N'Nguyễn Tiến Đạt', CAST(N'1990-09-09' AS Date), N'Nam', N'Anh trai', N'Kỹ sư điện', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (16, 33, N'Nguyễn Minh Tuyết', CAST(N'1985-09-02' AS Date), N'Nữ', N'Vợ', N'Bác sĩ', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (17, 33, N'Trần Trung Kiên', CAST(N'2008-12-25' AS Date), N'Nam', N'Con trai', N'Học sinh', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (18, 33, N'Trần Thúy Ngọc', CAST(N'2013-01-15' AS Date), N'Nữ', N'Con gái', N'Học sinh', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (19, 34, N'Trần Trung Kiên', CAST(N'2008-12-25' AS Date), N'Nam', N'Con trai', N'Học sinh', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (20, 34, N'Trần Thúy Ngọc', CAST(N'2013-01-15' AS Date), N'Nữ', N'Con gái', N'Học sinh', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (21, 34, N'Trần Văn Nam', CAST(N'1980-07-09' AS Date), N'Nam', N'Chồng', N'Giảng viên đại học', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (22, 35, N'Trần Văn Nam', CAST(N'1980-07-09' AS Date), N'Nam', N'Bố', N'Giảng viên đại học', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (23, 35, N'Nguyễn Minh Tuyết', CAST(N'1985-09-02' AS Date), N'Nữ', N'Mẹ', N'Bác sĩ', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (24, 35, N'Trần Thúy Ngọc', CAST(N'2013-01-15' AS Date), N'Nữ', N'Em gái', N'Học sinh', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (25, 36, N'Trần Văn Nam', CAST(N'1980-07-09' AS Date), N'Nam', N'Bố', N'Giảng viên đại học', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (26, 36, N'Nguyễn Minh Tuyết', CAST(N'1985-09-02' AS Date), N'Nữ ', N'Mẹ', N'Bác sĩ', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (27, 36, N'Trần Trung Kiên', CAST(N'2008-12-25' AS Date), N'Nam', N'Anh trai', N'Học sinh', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (28, 37, N'Bùi Thị Hà', CAST(N'1948-02-03' AS Date), N'Nữ', N'Vợ', N'Nội trợ', N'Số 5 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (29, 37, N'Lý Thành Nam', CAST(N'1968-06-12' AS Date), N'Nam', N'Con Trai', N'Công nhân', N'Số 89, ngõ 98 Trường Chinh, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (30, 37, N'Lý Thu Thủy', CAST(N'1971-03-05' AS Date), N'Nữ', N'Con Gái', N'Nhân viên văn phòng', N'Số 3, ngõ 568 Đường Láng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (31, 38, N'Lý Văn Công', CAST(N'1945-06-04' AS Date), N'Nam', N'Chồng', N'Bộ đội về hưu', N'Số 5 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (32, 38, N'Lý Thành Nam', CAST(N'1968-06-12' AS Date), N'Nam', N'Con trai', N'Công nhân', N'Số 89, ngõ 98 Trường Chinh, Hà Nội')
INSERT [dbo].[gia_dinh] ([ID], [idNhanKhau], [hoTen], [namSinh], [gioiTinh], [quanHeVoiNhanKhau], [ngheNghiep], [diaChiHienTai]) VALUES (33, 38, N'Lý Thu Thủy', CAST(N'1971-03-05' AS Date), N'Nữ', N'Con gái', N'Nhân viên văn phòng', N'Số 3, ngõ 568 Đường Láng, Hà Nội')
SET IDENTITY_INSERT [dbo].[gia_dinh] OFF
GO
SET IDENTITY_INSERT [dbo].[ho_khau] ON 

INSERT [dbo].[ho_khau] ([ID], [maHoKhau], [idChuHo], [maKhuVuc], [diaChi], [ngayLap], [ngayChuyenDi], [lyDoChuyen], [nguoiThucHien]) VALUES (13, N'TQB002', 28, N'HN03', N'Số 2 Tạ Quang Bửu, quần Hai Bà Trưng, Hà Nội', CAST(N'2019-12-08' AS Date), NULL, NULL, NULL)
INSERT [dbo].[ho_khau] ([ID], [maHoKhau], [idChuHo], [maKhuVuc], [diaChi], [ngayLap], [ngayChuyenDi], [lyDoChuyen], [nguoiThucHien]) VALUES (14, N'TQB001', 26, N'HN03', N'Số 1 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', CAST(N'2019-12-08' AS Date), NULL, NULL, NULL)
INSERT [dbo].[ho_khau] ([ID], [maHoKhau], [idChuHo], [maKhuVuc], [diaChi], [ngayLap], [ngayChuyenDi], [lyDoChuyen], [nguoiThucHien]) VALUES (15, N'TQB003', 29, N'HN03', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', CAST(N'2019-12-08' AS Date), NULL, NULL, NULL)
INSERT [dbo].[ho_khau] ([ID], [maHoKhau], [idChuHo], [maKhuVuc], [diaChi], [ngayLap], [ngayChuyenDi], [lyDoChuyen], [nguoiThucHien]) VALUES (16, N'TQB004', 33, N'HN03', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', CAST(N'2019-12-08' AS Date), NULL, NULL, NULL)
INSERT [dbo].[ho_khau] ([ID], [maHoKhau], [idChuHo], [maKhuVuc], [diaChi], [ngayLap], [ngayChuyenDi], [lyDoChuyen], [nguoiThucHien]) VALUES (23, N'TH106', 42, N'TH', N'Thanh Hóa', CAST(N'2023-01-28' AS Date), NULL, NULL, NULL)
INSERT [dbo].[ho_khau] ([ID], [maHoKhau], [idChuHo], [maKhuVuc], [diaChi], [ngayLap], [ngayChuyenDi], [lyDoChuyen], [nguoiThucHien]) VALUES (24, N'TH102', 43, N'TH', N'Thanh Hóa', CAST(N'2023-01-28' AS Date), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ho_khau] OFF
GO
SET IDENTITY_INSERT [dbo].[khai_tu] ON 

INSERT [dbo].[khai_tu] ([ID], [soGiayKhaiTu], [idNguoiKhai], [idNguoiChet], [ngayKhai], [ngayChet], [lyDoChet]) VALUES (1, N'12', 26, 27, CAST(N'2021-12-25' AS Date), CAST(N'2021-12-25' AS Date), N'no')
INSERT [dbo].[khai_tu] ([ID], [soGiayKhaiTu], [idNguoiKhai], [idNguoiChet], [ngayKhai], [ngayChet], [lyDoChet]) VALUES (3, N'1234', 44, 45, CAST(N'2023-01-30' AS Date), CAST(N'2023-02-04' AS Date), N'a')
SET IDENTITY_INSERT [dbo].[khai_tu] OFF
GO
SET IDENTITY_INSERT [dbo].[le_tet] ON 

INSERT [dbo].[le_tet] ([idSuKien], [thoiGian], [tenSuKien], [motSuatQua], [tongGiaTriMotSuat], [ngayTao], [idNguoiTao]) VALUES (1, CAST(N'2019-06-01' AS Date), N'Tết thiếu nhi', N'1 toy và 2 gói bim bim', CAST(40000.00 AS Decimal(15, 2)), CAST(N'2019-05-29' AS Date), 1)
INSERT [dbo].[le_tet] ([idSuKien], [thoiGian], [tenSuKien], [motSuatQua], [tongGiaTriMotSuat], [ngayTao], [idNguoiTao]) VALUES (2, CAST(N'2019-09-15' AS Date), N'Tết trung thu', N'1 đèn lồng và 1 bánh trung thu', CAST(50000.00 AS Decimal(15, 2)), CAST(N'2019-09-10' AS Date), 1)
INSERT [dbo].[le_tet] ([idSuKien], [thoiGian], [tenSuKien], [motSuatQua], [tongGiaTriMotSuat], [ngayTao], [idNguoiTao]) VALUES (3, CAST(N'2019-09-15' AS Date), N'Khai giảng', N'2 quyển vở', CAST(10000.00 AS Decimal(15, 2)), CAST(N'2019-09-05' AS Date), 1)
INSERT [dbo].[le_tet] ([idSuKien], [thoiGian], [tenSuKien], [motSuatQua], [tongGiaTriMotSuat], [ngayTao], [idNguoiTao]) VALUES (6, CAST(N'2022-02-06' AS Date), N'Tết 2022', N'Lì xì x 20', CAST(23000.00 AS Decimal(15, 2)), CAST(N'2022-01-06' AS Date), 3)
SET IDENTITY_INSERT [dbo].[le_tet] OFF
GO
INSERT [dbo].[nam_hoc] ([namHoc], [motSuatQua], [tongGiaTriMotSuat]) VALUES (N'2018-2019', N'5 quyển vở', CAST(25000.0000 AS Decimal(15, 4)))
INSERT [dbo].[nam_hoc] ([namHoc], [motSuatQua], [tongGiaTriMotSuat]) VALUES (N'2019-2020', N'4 quyển vở', CAST(20000.0000 AS Decimal(15, 4)))
INSERT [dbo].[nam_hoc] ([namHoc], [motSuatQua], [tongGiaTriMotSuat]) VALUES (N'2020-2021', N'2 con dao Thái', CAST(90000.0000 AS Decimal(15, 4)))
INSERT [dbo].[nam_hoc] ([namHoc], [motSuatQua], [tongGiaTriMotSuat]) VALUES (N'2021-2022', N'5 bút', CAST(10000.0000 AS Decimal(15, 4)))
GO
SET IDENTITY_INSERT [dbo].[nhan_khau] ON 

INSERT [dbo].[nhan_khau] ([ID], [maNhanKhau], [hoTen], [bietDanh], [namSinh], [gioiTinh], [noiSinh], [nguyenQuan], [danToc], [tonGiao], [quocTich], [soHoChieu], [noiThuongTru], [diaChiHienNay], [trinhDoHocVan], [TrinhDoChuyenMon], [bietTiengDanToc], [trinhDoNgoaiNgu], [ngheNghiep], [noiLamViec], [tienAn], [ngayChuyenDen], [lyDoChuyenDen], [ngayChuyenDi], [lyDoChuyenDi], [diaChiMoi], [ngayTao], [idNguoiTao], [ngayXoa], [idNguoiXoa], [lyDoXoa], [ghiChu], [CCCD]) VALUES (26, NULL, N'Trinh Văn An', N'', CAST(N'1990-12-07' AS Date), N'Nam', NULL, N'Hà Nội', N'Kinh', N'Không', N'Việt Nam', N'', N'Số 1 Tạ Quang Bưu, Hai Bà Trưng, Hà Nội', N'Số 1 Tạ Quang Bưu, Hai Bà Trưng, Hà Nội', N'12/12 chính quy', N'Thạc sĩ', N'Không', N'Anh trình đọ B', N'Giáo Viên', N'Trường THCS Chu Văn An', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-08' AS Date), 1, NULL, NULL, NULL, NULL, N'787062396055')
INSERT [dbo].[nhan_khau] ([ID], [maNhanKhau], [hoTen], [bietDanh], [namSinh], [gioiTinh], [noiSinh], [nguyenQuan], [danToc], [tonGiao], [quocTich], [soHoChieu], [noiThuongTru], [diaChiHienNay], [trinhDoHocVan], [TrinhDoChuyenMon], [bietTiengDanToc], [trinhDoNgoaiNgu], [ngheNghiep], [noiLamViec], [tienAn], [ngayChuyenDen], [lyDoChuyenDen], [ngayChuyenDi], [lyDoChuyenDi], [diaChiMoi], [ngayTao], [idNguoiTao], [ngayXoa], [idNguoiXoa], [lyDoXoa], [ghiChu], [CCCD]) VALUES (27, NULL, N'Trần Thanh Duyên', N'', CAST(N'1997-12-23' AS Date), N'Nữ', NULL, N'Hải Phòng', N'Kinh', N'Không', N'Việt Nam', N'', N'Số 3, đường Đình Đông, phường Đình Đông, quận Ngô Quyền, Hải Phòng', N'Số 2 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'12/12 chính quy', N'Thạc sĩ', N'Không', N'Anh trình độ D', N'Nhân viên văn phòng', N'Công ty ABC', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-08' AS Date), 1, NULL, NULL, NULL, NULL, N'812194552112')
INSERT [dbo].[nhan_khau] ([ID], [maNhanKhau], [hoTen], [bietDanh], [namSinh], [gioiTinh], [noiSinh], [nguyenQuan], [danToc], [tonGiao], [quocTich], [soHoChieu], [noiThuongTru], [diaChiHienNay], [trinhDoHocVan], [TrinhDoChuyenMon], [bietTiengDanToc], [trinhDoNgoaiNgu], [ngheNghiep], [noiLamViec], [tienAn], [ngayChuyenDen], [lyDoChuyenDen], [ngayChuyenDi], [lyDoChuyenDi], [diaChiMoi], [ngayTao], [idNguoiTao], [ngayXoa], [idNguoiXoa], [lyDoXoa], [ghiChu], [CCCD]) VALUES (28, NULL, N'Nguyễn Minh Quân', N'', CAST(N'1995-05-31' AS Date), N'Nam', NULL, N'Hà Nội', N'Kinh', N'Không', N'Việt Nam', N'', N'Số 2 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'Số 2 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'12/12 chính quy', N'Thạc sĩ', N'Không', N'Anh trình độ D', N'Kỹ sư', N'Viettel', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-08' AS Date), 1, NULL, NULL, NULL, NULL, N'277013600793')
INSERT [dbo].[nhan_khau] ([ID], [maNhanKhau], [hoTen], [bietDanh], [namSinh], [gioiTinh], [noiSinh], [nguyenQuan], [danToc], [tonGiao], [quocTich], [soHoChieu], [noiThuongTru], [diaChiHienNay], [trinhDoHocVan], [TrinhDoChuyenMon], [bietTiengDanToc], [trinhDoNgoaiNgu], [ngheNghiep], [noiLamViec], [tienAn], [ngayChuyenDen], [lyDoChuyenDen], [ngayChuyenDi], [lyDoChuyenDi], [diaChiMoi], [ngayTao], [idNguoiTao], [ngayXoa], [idNguoiXoa], [lyDoXoa], [ghiChu], [CCCD]) VALUES (29, NULL, N'Nguyễn Tiến Dũng', N'', CAST(N'1964-06-03' AS Date), N'Nam', NULL, N'Hải Dương', N'Kinh', N'Thiên chúa giáo', N'Việt Nam', N'', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'12/12 chính quy', N'Kỹ sư', N'Không', N'Không', N'Phó giám đốc', N'Công ty EXE', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-08' AS Date), 1, NULL, NULL, NULL, NULL, N'512805913397')
INSERT [dbo].[nhan_khau] ([ID], [maNhanKhau], [hoTen], [bietDanh], [namSinh], [gioiTinh], [noiSinh], [nguyenQuan], [danToc], [tonGiao], [quocTich], [soHoChieu], [noiThuongTru], [diaChiHienNay], [trinhDoHocVan], [TrinhDoChuyenMon], [bietTiengDanToc], [trinhDoNgoaiNgu], [ngheNghiep], [noiLamViec], [tienAn], [ngayChuyenDen], [lyDoChuyenDen], [ngayChuyenDi], [lyDoChuyenDi], [diaChiMoi], [ngayTao], [idNguoiTao], [ngayXoa], [idNguoiXoa], [lyDoXoa], [ghiChu], [CCCD]) VALUES (30, NULL, N'Vũ Mỹ Linh', N'', CAST(N'1965-12-06' AS Date), N'Nữ', NULL, N'Hà Nội', N'Kinh', N'Không', N'Việt Nam', N'', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'12/12', N'Cử Nhân', N'Không', N'Không', N'Nội trợ', N'Tại nhà', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-08' AS Date), 1, NULL, NULL, NULL, NULL, N'617660132209')
INSERT [dbo].[nhan_khau] ([ID], [maNhanKhau], [hoTen], [bietDanh], [namSinh], [gioiTinh], [noiSinh], [nguyenQuan], [danToc], [tonGiao], [quocTich], [soHoChieu], [noiThuongTru], [diaChiHienNay], [trinhDoHocVan], [TrinhDoChuyenMon], [bietTiengDanToc], [trinhDoNgoaiNgu], [ngheNghiep], [noiLamViec], [tienAn], [ngayChuyenDen], [lyDoChuyenDen], [ngayChuyenDi], [lyDoChuyenDi], [diaChiMoi], [ngayTao], [idNguoiTao], [ngayXoa], [idNguoiXoa], [lyDoXoa], [ghiChu], [CCCD]) VALUES (31, NULL, N'Nguyễn Tiến Đạt', N'', CAST(N'1990-09-09' AS Date), N'Nam', NULL, N'Hải Dương', N'Kinh', N'Thiên chúa giáo', N'Việt Nam', N'', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'12/12 chính quy', N'Kỹ sư', N'không', N'Anh trình độ C', N'Kỹ sư điện', N'Công ty điện EVN', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-08' AS Date), 1, NULL, NULL, NULL, NULL, N'244812162939')
INSERT [dbo].[nhan_khau] ([ID], [maNhanKhau], [hoTen], [bietDanh], [namSinh], [gioiTinh], [noiSinh], [nguyenQuan], [danToc], [tonGiao], [quocTich], [soHoChieu], [noiThuongTru], [diaChiHienNay], [trinhDoHocVan], [TrinhDoChuyenMon], [bietTiengDanToc], [trinhDoNgoaiNgu], [ngheNghiep], [noiLamViec], [tienAn], [ngayChuyenDen], [lyDoChuyenDen], [ngayChuyenDi], [lyDoChuyenDi], [diaChiMoi], [ngayTao], [idNguoiTao], [ngayXoa], [idNguoiXoa], [lyDoXoa], [ghiChu], [CCCD]) VALUES (32, NULL, N'Nguyễn Trà My', N'', CAST(N'1997-12-12' AS Date), N'Nữ', NULL, N'Hải Dương', N'Kinh', N'Thiên chúa giáo', N'Việt Nam', N'', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'12/12 chính quy', N'Thạc sĩ', N'không', N'Anh trình đố D', N'Luật sư', N'Văn phòng luật sư 123', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-08' AS Date), 1, NULL, NULL, NULL, NULL, N'742769774973')
INSERT [dbo].[nhan_khau] ([ID], [maNhanKhau], [hoTen], [bietDanh], [namSinh], [gioiTinh], [noiSinh], [nguyenQuan], [danToc], [tonGiao], [quocTich], [soHoChieu], [noiThuongTru], [diaChiHienNay], [trinhDoHocVan], [TrinhDoChuyenMon], [bietTiengDanToc], [trinhDoNgoaiNgu], [ngheNghiep], [noiLamViec], [tienAn], [ngayChuyenDen], [lyDoChuyenDen], [ngayChuyenDi], [lyDoChuyenDi], [diaChiMoi], [ngayTao], [idNguoiTao], [ngayXoa], [idNguoiXoa], [lyDoXoa], [ghiChu], [CCCD]) VALUES (33, NULL, N'Trần Văn Nam', N'', CAST(N'1980-07-09' AS Date), N'Nam', NULL, N'Hà Nội', N'Kinh', N'Không', N'Việt Nam', N'', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'12/12 chính quy', N'Tiến sĩ', N'Không', N'Anh trình độ D', N'Giảng viên đại học', N'Đại học Bách khoa Hà Nội', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-08' AS Date), 1, NULL, NULL, NULL, NULL, N'743448058400')
INSERT [dbo].[nhan_khau] ([ID], [maNhanKhau], [hoTen], [bietDanh], [namSinh], [gioiTinh], [noiSinh], [nguyenQuan], [danToc], [tonGiao], [quocTich], [soHoChieu], [noiThuongTru], [diaChiHienNay], [trinhDoHocVan], [TrinhDoChuyenMon], [bietTiengDanToc], [trinhDoNgoaiNgu], [ngheNghiep], [noiLamViec], [tienAn], [ngayChuyenDen], [lyDoChuyenDen], [ngayChuyenDi], [lyDoChuyenDi], [diaChiMoi], [ngayTao], [idNguoiTao], [ngayXoa], [idNguoiXoa], [lyDoXoa], [ghiChu], [CCCD]) VALUES (34, NULL, N'Nguyễn Minh Tuyết', N'', CAST(N'1985-09-02' AS Date), N'Nữ', NULL, N'Nam Định', N'Kinh', N'Không', N'Việt Nam', N'', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'12/12 chính quy', N'Thạc sĩ', N'Không', N'Anh trình độ D', N'Bác sĩ', N'Bệnh viện quốc tế HJK', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-08' AS Date), 1, NULL, NULL, NULL, NULL, N'482830795133')
INSERT [dbo].[nhan_khau] ([ID], [maNhanKhau], [hoTen], [bietDanh], [namSinh], [gioiTinh], [noiSinh], [nguyenQuan], [danToc], [tonGiao], [quocTich], [soHoChieu], [noiThuongTru], [diaChiHienNay], [trinhDoHocVan], [TrinhDoChuyenMon], [bietTiengDanToc], [trinhDoNgoaiNgu], [ngheNghiep], [noiLamViec], [tienAn], [ngayChuyenDen], [lyDoChuyenDen], [ngayChuyenDi], [lyDoChuyenDi], [diaChiMoi], [ngayTao], [idNguoiTao], [ngayXoa], [idNguoiXoa], [lyDoXoa], [ghiChu], [CCCD]) VALUES (35, NULL, N'Trần Trung Kiên', N'', CAST(N'2008-12-25' AS Date), N'Nam', NULL, N'Hà Nội', N'Kinh', N'Không', N'Việt Nam', N'', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'6/12 chính quy', N'Không', N'Không', N'Không', N'Học sinh', N'Trường THCS Chu Văn An', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-08' AS Date), 1, NULL, NULL, NULL, NULL, N'703147897249')
INSERT [dbo].[nhan_khau] ([ID], [maNhanKhau], [hoTen], [bietDanh], [namSinh], [gioiTinh], [noiSinh], [nguyenQuan], [danToc], [tonGiao], [quocTich], [soHoChieu], [noiThuongTru], [diaChiHienNay], [trinhDoHocVan], [TrinhDoChuyenMon], [bietTiengDanToc], [trinhDoNgoaiNgu], [ngheNghiep], [noiLamViec], [tienAn], [ngayChuyenDen], [lyDoChuyenDen], [ngayChuyenDi], [lyDoChuyenDi], [diaChiMoi], [ngayTao], [idNguoiTao], [ngayXoa], [idNguoiXoa], [lyDoXoa], [ghiChu], [CCCD]) VALUES (36, NULL, N'Trần Thúy Ngọc', N'', CAST(N'2013-01-15' AS Date), N'Nữ', NULL, N'Hà Nội', N'Kinh', N'Không', N'Việt Nam', N'', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'1/12 chính quy', N'Không', N'Không', N'Không', N'Học sinh', N'Trường tiểu học Chu Văn An', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-08' AS Date), 1, NULL, NULL, NULL, NULL, N'344392212450')
INSERT [dbo].[nhan_khau] ([ID], [maNhanKhau], [hoTen], [bietDanh], [namSinh], [gioiTinh], [noiSinh], [nguyenQuan], [danToc], [tonGiao], [quocTich], [soHoChieu], [noiThuongTru], [diaChiHienNay], [trinhDoHocVan], [TrinhDoChuyenMon], [bietTiengDanToc], [trinhDoNgoaiNgu], [ngheNghiep], [noiLamViec], [tienAn], [ngayChuyenDen], [lyDoChuyenDen], [ngayChuyenDi], [lyDoChuyenDi], [diaChiMoi], [ngayTao], [idNguoiTao], [ngayXoa], [idNguoiXoa], [lyDoXoa], [ghiChu], [CCCD]) VALUES (37, NULL, N'Lý Văn Công', N'', CAST(N'1945-06-04' AS Date), N'Nam', NULL, N'Hà Nội', N'Kinh', N'Không', N'Việt Nam', N'', N'Số 5 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'Số 5 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'10/12 chính quy', N'Không', N'Không', N'Không', N'Về hưu', N'Không', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-08' AS Date), 1, NULL, NULL, NULL, NULL, N'359043428152')
INSERT [dbo].[nhan_khau] ([ID], [maNhanKhau], [hoTen], [bietDanh], [namSinh], [gioiTinh], [noiSinh], [nguyenQuan], [danToc], [tonGiao], [quocTich], [soHoChieu], [noiThuongTru], [diaChiHienNay], [trinhDoHocVan], [TrinhDoChuyenMon], [bietTiengDanToc], [trinhDoNgoaiNgu], [ngheNghiep], [noiLamViec], [tienAn], [ngayChuyenDen], [lyDoChuyenDen], [ngayChuyenDi], [lyDoChuyenDi], [diaChiMoi], [ngayTao], [idNguoiTao], [ngayXoa], [idNguoiXoa], [lyDoXoa], [ghiChu], [CCCD]) VALUES (38, NULL, N'Bùi Thị Hà', N'', CAST(N'1948-02-03' AS Date), N'Nữ', NULL, N'Hải Phòng', N'Kinh', N'Không', N'Việt Nam', N'', N'Số 5 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'Số 5 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'10/12', N'Không', N'Không', N'Không', N'Nội trợ', N'Tại nhà', NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2019-12-08' AS Date), 1, NULL, NULL, NULL, NULL, N'514827685358')
INSERT [dbo].[nhan_khau] ([ID], [maNhanKhau], [hoTen], [bietDanh], [namSinh], [gioiTinh], [noiSinh], [nguyenQuan], [danToc], [tonGiao], [quocTich], [soHoChieu], [noiThuongTru], [diaChiHienNay], [trinhDoHocVan], [TrinhDoChuyenMon], [bietTiengDanToc], [trinhDoNgoaiNgu], [ngheNghiep], [noiLamViec], [tienAn], [ngayChuyenDen], [lyDoChuyenDen], [ngayChuyenDi], [lyDoChuyenDi], [diaChiMoi], [ngayTao], [idNguoiTao], [ngayXoa], [idNguoiXoa], [lyDoXoa], [ghiChu], [CCCD]) VALUES (42, NULL, N'Nguyễn Văn Nam', N'', CAST(N'2002-11-30' AS Date), N'Nam', NULL, N'Thanh Hóa', N'Kinh', N'', N'Việt Nam', N'', N'Thanh Hóa', N'Hà Nội', N'12', N'', N'', N'A1', N'', N'ĐH Bách Khoa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'038202000110')
INSERT [dbo].[nhan_khau] ([ID], [maNhanKhau], [hoTen], [bietDanh], [namSinh], [gioiTinh], [noiSinh], [nguyenQuan], [danToc], [tonGiao], [quocTich], [soHoChieu], [noiThuongTru], [diaChiHienNay], [trinhDoHocVan], [TrinhDoChuyenMon], [bietTiengDanToc], [trinhDoNgoaiNgu], [ngheNghiep], [noiLamViec], [tienAn], [ngayChuyenDen], [lyDoChuyenDen], [ngayChuyenDi], [lyDoChuyenDi], [diaChiMoi], [ngayTao], [idNguoiTao], [ngayXoa], [idNguoiXoa], [lyDoXoa], [ghiChu], [CCCD]) VALUES (43, NULL, N'Nguyễn Văn Hưng', N'', CAST(N'2004-01-15' AS Date), N'Nam', NULL, N'Việt Nam', N'Kinh', N'', N'Việt Nam', N'', N'Thanh Hóa', N'Thanh Hóa', N'', N'', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'038204001234')
INSERT [dbo].[nhan_khau] ([ID], [maNhanKhau], [hoTen], [bietDanh], [namSinh], [gioiTinh], [noiSinh], [nguyenQuan], [danToc], [tonGiao], [quocTich], [soHoChieu], [noiThuongTru], [diaChiHienNay], [trinhDoHocVan], [TrinhDoChuyenMon], [bietTiengDanToc], [trinhDoNgoaiNgu], [ngheNghiep], [noiLamViec], [tienAn], [ngayChuyenDen], [lyDoChuyenDen], [ngayChuyenDi], [lyDoChuyenDi], [diaChiMoi], [ngayTao], [idNguoiTao], [ngayXoa], [idNguoiXoa], [lyDoXoa], [ghiChu], [CCCD]) VALUES (44, NULL, N'Nguyễn Văn Hoàng', N'', CAST(N'2005-01-13' AS Date), N'Nam', NULL, N'Thanh Hóa', N'Kinh', N'', N'Việt Nam', N'', N'Thanh Hóa', N'Thanh Hóa', N'', N'', N'', N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'038202001396')
SET IDENTITY_INSERT [dbo].[nhan_khau] OFF
GO
INSERT [dbo].[qua_hsg] ([thanhTich], [namHoc], [soLuongSuatQua]) VALUES (N'Học sinh giỏi', N'2018-2019', 4)
INSERT [dbo].[qua_hsg] ([thanhTich], [namHoc], [soLuongSuatQua]) VALUES (N'Học sinh giỏi', N'2019-2020', 5)
INSERT [dbo].[qua_hsg] ([thanhTich], [namHoc], [soLuongSuatQua]) VALUES (N'Học sinh giỏi', N'2020-2021', 3)
INSERT [dbo].[qua_hsg] ([thanhTich], [namHoc], [soLuongSuatQua]) VALUES (N'Học sinh giỏi', N'2021-2022', 3)
INSERT [dbo].[qua_hsg] ([thanhTich], [namHoc], [soLuongSuatQua]) VALUES (N'Học sinh khá', N'2018-2019', 2)
INSERT [dbo].[qua_hsg] ([thanhTich], [namHoc], [soLuongSuatQua]) VALUES (N'Học sinh khá', N'2019-2020', 3)
INSERT [dbo].[qua_hsg] ([thanhTich], [namHoc], [soLuongSuatQua]) VALUES (N'Học sinh khá', N'2020-2021', 2)
INSERT [dbo].[qua_hsg] ([thanhTich], [namHoc], [soLuongSuatQua]) VALUES (N'Học sinh khá', N'2021-2022', 2)
INSERT [dbo].[qua_hsg] ([thanhTich], [namHoc], [soLuongSuatQua]) VALUES (N'Học sinh trung bình', N'2018-2019', 1)
INSERT [dbo].[qua_hsg] ([thanhTich], [namHoc], [soLuongSuatQua]) VALUES (N'Học sinh trung bình', N'2019-2020', 1)
INSERT [dbo].[qua_hsg] ([thanhTich], [namHoc], [soLuongSuatQua]) VALUES (N'Học sinh trung bình', N'2020-2021', 1)
INSERT [dbo].[qua_hsg] ([thanhTich], [namHoc], [soLuongSuatQua]) VALUES (N'Học sinh trung bình', N'2021-2022', 1)
GO
INSERT [dbo].[thanh_vien_cua_ho] ([idNhanKhau], [idHoKhau], [quanHeVoiChuHo]) VALUES (27, 13, N'Vợ')
INSERT [dbo].[thanh_vien_cua_ho] ([idNhanKhau], [idHoKhau], [quanHeVoiChuHo]) VALUES (30, 15, N'Vợ')
INSERT [dbo].[thanh_vien_cua_ho] ([idNhanKhau], [idHoKhau], [quanHeVoiChuHo]) VALUES (31, 15, N'Con trai')
INSERT [dbo].[thanh_vien_cua_ho] ([idNhanKhau], [idHoKhau], [quanHeVoiChuHo]) VALUES (32, 15, N'Con gái')
INSERT [dbo].[thanh_vien_cua_ho] ([idNhanKhau], [idHoKhau], [quanHeVoiChuHo]) VALUES (34, 16, N'Vợ')
INSERT [dbo].[thanh_vien_cua_ho] ([idNhanKhau], [idHoKhau], [quanHeVoiChuHo]) VALUES (35, 16, N'Con trai')
INSERT [dbo].[thanh_vien_cua_ho] ([idNhanKhau], [idHoKhau], [quanHeVoiChuHo]) VALUES (36, 16, N'Con gái')
INSERT [dbo].[thanh_vien_cua_ho] ([idNhanKhau], [idHoKhau], [quanHeVoiChuHo]) VALUES (44, 24, N'Em')
GO
SET IDENTITY_INSERT [dbo].[tieu_su] ON 

INSERT [dbo].[tieu_su] ([ID], [idNhanKhau], [tuNgay], [denNgay], [diaChi], [ngheNghiep], [noiLamViec]) VALUES (2, 27, CAST(N'2015-09-05' AS Date), CAST(N'2015-09-05' AS Date), N'Số 45, ngõ 56, Nguyễn Khang, Cầu Giấy, Hà Nội', N'Sinh viên', N'Đại học Thương mại')
INSERT [dbo].[tieu_su] ([ID], [idNhanKhau], [tuNgay], [denNgay], [diaChi], [ngheNghiep], [noiLamViec]) VALUES (3, 28, CAST(N'2012-09-05' AS Date), CAST(N'2017-09-05' AS Date), N'556 La Thành, Hà Nội', N'Sinh viên', N'Đại học Bách khoa Hà Nội')
INSERT [dbo].[tieu_su] ([ID], [idNhanKhau], [tuNgay], [denNgay], [diaChi], [ngheNghiep], [noiLamViec]) VALUES (4, 29, CAST(N'1989-05-10' AS Date), CAST(N'2000-08-25' AS Date), N'Số 5 Nguyễn Khuyến, Hà Nội', N'Quản lý nhận sự', N'Công ty BCC')
INSERT [dbo].[tieu_su] ([ID], [idNhanKhau], [tuNgay], [denNgay], [diaChi], [ngheNghiep], [noiLamViec]) VALUES (5, 30, CAST(N'1987-05-23' AS Date), CAST(N'1997-03-01' AS Date), N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'Nhân viên văn phòng', N'Công ty Zezs')
INSERT [dbo].[tieu_su] ([ID], [idNhanKhau], [tuNgay], [denNgay], [diaChi], [ngheNghiep], [noiLamViec]) VALUES (6, 31, CAST(N'2008-09-05' AS Date), CAST(N'2013-09-05' AS Date), N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'Sinh viên', N'Đại học Bách khoa Hà Nội')
INSERT [dbo].[tieu_su] ([ID], [idNhanKhau], [tuNgay], [denNgay], [diaChi], [ngheNghiep], [noiLamViec]) VALUES (7, 32, CAST(N'2015-09-05' AS Date), CAST(N'2019-09-05' AS Date), N'Số 3 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'Sinh viên', N'Đại học Luật Hà Nội')
INSERT [dbo].[tieu_su] ([ID], [idNhanKhau], [tuNgay], [denNgay], [diaChi], [ngheNghiep], [noiLamViec]) VALUES (8, 33, CAST(N'1998-09-05' AS Date), CAST(N'2003-09-05' AS Date), N'Số 66, ngõ 445 Nguyễn Khang, Cầu Giấy, Hà Nội', N'Sinh viên', N'Đại học Bách khoa Hà Nội')
INSERT [dbo].[tieu_su] ([ID], [idNhanKhau], [tuNgay], [denNgay], [diaChi], [ngheNghiep], [noiLamViec]) VALUES (9, 33, CAST(N'2003-10-03' AS Date), CAST(N'2018-08-06' AS Date), N'Số 4 Tạ Quang Bửu, quận Hai Bà Trưng, Hà Nội', N'Giảng viên', N'Đại học Công ngiệp Hà Nội')
INSERT [dbo].[tieu_su] ([ID], [idNhanKhau], [tuNgay], [denNgay], [diaChi], [ngheNghiep], [noiLamViec]) VALUES (10, 34, CAST(N'2003-09-05' AS Date), CAST(N'2011-09-05' AS Date), N'Số 8 Tôn Thất Tùng, Hà Nội', N'Sinh viên', N'Đại học Y Hà Nội')
INSERT [dbo].[tieu_su] ([ID], [idNhanKhau], [tuNgay], [denNgay], [diaChi], [ngheNghiep], [noiLamViec]) VALUES (11, 34, CAST(N'2011-10-03' AS Date), CAST(N'2015-08-09' AS Date), N'Số 8 Tôn Thất Tùng, Hà Nội', N'Bác sĩ nội trú', N'Bệnh viện Bạch Mai')
INSERT [dbo].[tieu_su] ([ID], [idNhanKhau], [tuNgay], [denNgay], [diaChi], [ngheNghiep], [noiLamViec]) VALUES (12, 37, CAST(N'1961-01-01' AS Date), CAST(N'1963-01-01' AS Date), N'Không rõ', N'Bộ đội', N'Hà Nội')
SET IDENTITY_INSERT [dbo].[tieu_su] OFF
GO
INSERT [dbo].[trao_qua_hsg] ([idNhanKhau], [thanhTich], [namHoc], [minhChung], [trangThai], [ngayNhan]) VALUES (35, N'Học sinh giỏi', N'2018-2019', NULL, N'Đã nhận', CAST(N'2019-10-20' AS Date))
INSERT [dbo].[trao_qua_hsg] ([idNhanKhau], [thanhTich], [namHoc], [minhChung], [trangThai], [ngayNhan]) VALUES (35, N'Học sinh giỏi', N'2019-2020', NULL, N'Đã nhận', CAST(N'2020-10-20' AS Date))
INSERT [dbo].[trao_qua_hsg] ([idNhanKhau], [thanhTich], [namHoc], [minhChung], [trangThai], [ngayNhan]) VALUES (35, N'Học sinh giỏi', N'2020-2021', NULL, N'Đã nhận', CAST(N'2022-01-07' AS Date))
INSERT [dbo].[trao_qua_hsg] ([idNhanKhau], [thanhTich], [namHoc], [minhChung], [trangThai], [ngayNhan]) VALUES (35, N'Học sinh khá', N'2021-2022', NULL, N'Đã nhận', CAST(N'2022-01-07' AS Date))
INSERT [dbo].[trao_qua_hsg] ([idNhanKhau], [thanhTich], [namHoc], [minhChung], [trangThai], [ngayNhan]) VALUES (36, N'Học sinh giỏi', N'2018-2019', NULL, N'Đã nhận', CAST(N'2019-10-20' AS Date))
INSERT [dbo].[trao_qua_hsg] ([idNhanKhau], [thanhTich], [namHoc], [minhChung], [trangThai], [ngayNhan]) VALUES (36, N'Học sinh trung bình', N'2019-2020', NULL, N'Đã nhận', CAST(N'2020-10-20' AS Date))
INSERT [dbo].[trao_qua_hsg] ([idNhanKhau], [thanhTich], [namHoc], [minhChung], [trangThai], [ngayNhan]) VALUES (36, N'Học sinh giỏi', N'2020-2021', NULL, N'Đã nhận', CAST(N'2022-01-07' AS Date))
INSERT [dbo].[trao_qua_hsg] ([idNhanKhau], [thanhTich], [namHoc], [minhChung], [trangThai], [ngayNhan]) VALUES (36, N'Học sinh giỏi', N'2021-2022', NULL, N'Đã nhận', CAST(N'2022-01-07' AS Date))
GO
INSERT [dbo].[trao_qua_le_tet] ([idHoKhau], [idSuKien], [soLuongQua], [trangThai], [ngayNhanQua], [idNguoiGhiNhan], [thoiGianGhiNhan]) VALUES (13, 6, 1, N'Đã nhận', CAST(N'2022-01-06' AS Date), 1, CAST(N'2022-01-06' AS Date))
INSERT [dbo].[trao_qua_le_tet] ([idHoKhau], [idSuKien], [soLuongQua], [trangThai], [ngayNhanQua], [idNguoiGhiNhan], [thoiGianGhiNhan]) VALUES (14, 6, 1, N'Đã nhận', CAST(N'2022-01-06' AS Date), 1, CAST(N'2022-01-06' AS Date))
INSERT [dbo].[trao_qua_le_tet] ([idHoKhau], [idSuKien], [soLuongQua], [trangThai], [ngayNhanQua], [idNguoiGhiNhan], [thoiGianGhiNhan]) VALUES (15, 6, 4, N'Đã nhận', CAST(N'2022-03-06' AS Date), 1, CAST(N'2022-01-06' AS Date))
INSERT [dbo].[trao_qua_le_tet] ([idHoKhau], [idSuKien], [soLuongQua], [trangThai], [ngayNhanQua], [idNguoiGhiNhan], [thoiGianGhiNhan]) VALUES (16, 1, 2, N'Đã nhận', CAST(N'2019-06-01' AS Date), 1, CAST(N'2019-06-02' AS Date))
INSERT [dbo].[trao_qua_le_tet] ([idHoKhau], [idSuKien], [soLuongQua], [trangThai], [ngayNhanQua], [idNguoiGhiNhan], [thoiGianGhiNhan]) VALUES (16, 2, 2, N'Đã nhận', CAST(N'2019-09-14' AS Date), 1, CAST(N'2019-09-15' AS Date))
INSERT [dbo].[trao_qua_le_tet] ([idHoKhau], [idSuKien], [soLuongQua], [trangThai], [ngayNhanQua], [idNguoiGhiNhan], [thoiGianGhiNhan]) VALUES (16, 3, 2, N'Đã nhận', CAST(N'2019-09-15' AS Date), 1, CAST(N'2019-09-15' AS Date))
INSERT [dbo].[trao_qua_le_tet] ([idHoKhau], [idSuKien], [soLuongQua], [trangThai], [ngayNhanQua], [idNguoiGhiNhan], [thoiGianGhiNhan]) VALUES (16, 6, 4, N'Đã nhận', CAST(N'2022-01-06' AS Date), 1, CAST(N'2022-01-06' AS Date))
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([ID], [userName], [passwd]) VALUES (0, N'system', NULL)
INSERT [dbo].[users] ([ID], [userName], [passwd]) VALUES (1, N'totruong', N'1')
INSERT [dbo].[users] ([ID], [userName], [passwd]) VALUES (2, N'topho', N'1')
INSERT [dbo].[users] ([ID], [userName], [passwd]) VALUES (3, N'thuki', N'1')
INSERT [dbo].[users] ([ID], [userName], [passwd]) VALUES (4, N'1', N'1')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
/****** Object:  Index [idNhanKhau]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [idNhanKhau] ON [dbo].[chung_minh_thu]
(
	[idNhanKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [danh_sach_hoc_sinh_nam_hoc_fk2_idx]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [danh_sach_hoc_sinh_nam_hoc_fk2_idx] ON [dbo].[danh_sach_nhan_qua_cac_nam]
(
	[namHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idHoKhau]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [idHoKhau] ON [dbo].[dinh_chinh]
(
	[idHoKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nguoiThayDoi]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [nguoiThayDoi] ON [dbo].[dinh_chinh]
(
	[nguoiThayDoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idNhanKhau]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [idNhanKhau] ON [dbo].[gia_dinh]
(
	[idNhanKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idChuHo]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [idChuHo] ON [dbo].[ho_khau]
(
	[idChuHo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idNguoiChet]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [idNguoiChet] ON [dbo].[khai_tu]
(
	[idNguoiChet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idNguoiKhai]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [idNguoiKhai] ON [dbo].[khai_tu]
(
	[idNguoiKhai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [le_tet$idSuKien_UNIQUE]    Script Date: 1/30/2023 12:58:22 PM ******/
ALTER TABLE [dbo].[le_tet] ADD  CONSTRAINT [le_tet$idSuKien_UNIQUE] UNIQUE NONCLUSTERED 
(
	[idSuKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [le_tet_fk1]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [le_tet_fk1] ON [dbo].[le_tet]
(
	[idNguoiTao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idNguoiTao]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [idNguoiTao] ON [dbo].[nhan_khau]
(
	[idNguoiTao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idNguoiXoa]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [idNguoiXoa] ON [dbo].[nhan_khau]
(
	[idNguoiXoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [qua_hsg_fk1_idx]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [qua_hsg_fk1_idx] ON [dbo].[qua_hsg]
(
	[namHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idNhanKhau]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [idNhanKhau] ON [dbo].[tam_tru]
(
	[idNhanKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idNhanKhau]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [idNhanKhau] ON [dbo].[tam_vang]
(
	[idNhanKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idHoKhau]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [idHoKhau] ON [dbo].[thanh_vien_cua_ho]
(
	[idHoKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idNhanKhau]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [idNhanKhau] ON [dbo].[tieu_su]
(
	[idNhanKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [s_idx]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [s_idx] ON [dbo].[trao_qua_hsg]
(
	[thanhTich] ASC,
	[namHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [qua_le_tet_fk2_idx]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [qua_le_tet_fk2_idx] ON [dbo].[trao_qua_le_tet]
(
	[idSuKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [trao_qua_le_tet_fk3]    Script Date: 1/30/2023 12:58:22 PM ******/
CREATE NONCLUSTERED INDEX [trao_qua_le_tet_fk3] ON [dbo].[trao_qua_le_tet]
(
	[idNguoiGhiNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[chung_minh_thu] ADD  DEFAULT (NULL) FOR [idNhanKhau]
GO
ALTER TABLE [dbo].[chung_minh_thu] ADD  DEFAULT (NULL) FOR [ngayCap]
GO
ALTER TABLE [dbo].[chung_minh_thu] ADD  DEFAULT (NULL) FOR [noiCap]
GO
ALTER TABLE [dbo].[dinh_chinh] ADD  DEFAULT (NULL) FOR [idHoKhau]
GO
ALTER TABLE [dbo].[dinh_chinh] ADD  DEFAULT (NULL) FOR [thongTinThayDoi]
GO
ALTER TABLE [dbo].[dinh_chinh] ADD  DEFAULT (NULL) FOR [thayDoiTu]
GO
ALTER TABLE [dbo].[dinh_chinh] ADD  DEFAULT (NULL) FOR [thayDoiThanh]
GO
ALTER TABLE [dbo].[dinh_chinh] ADD  DEFAULT (NULL) FOR [ngayThayDoi]
GO
ALTER TABLE [dbo].[dinh_chinh] ADD  DEFAULT (NULL) FOR [nguoiThayDoi]
GO
ALTER TABLE [dbo].[gia_dinh] ADD  DEFAULT (NULL) FOR [idNhanKhau]
GO
ALTER TABLE [dbo].[gia_dinh] ADD  DEFAULT (NULL) FOR [hoTen]
GO
ALTER TABLE [dbo].[gia_dinh] ADD  DEFAULT (NULL) FOR [namSinh]
GO
ALTER TABLE [dbo].[gia_dinh] ADD  DEFAULT (NULL) FOR [gioiTinh]
GO
ALTER TABLE [dbo].[gia_dinh] ADD  DEFAULT (NULL) FOR [quanHeVoiNhanKhau]
GO
ALTER TABLE [dbo].[gia_dinh] ADD  DEFAULT (NULL) FOR [ngheNghiep]
GO
ALTER TABLE [dbo].[gia_dinh] ADD  DEFAULT (NULL) FOR [diaChiHienTai]
GO
ALTER TABLE [dbo].[ho_khau] ADD  DEFAULT (NULL) FOR [maHoKhau]
GO
ALTER TABLE [dbo].[ho_khau] ADD  DEFAULT (NULL) FOR [idChuHo]
GO
ALTER TABLE [dbo].[ho_khau] ADD  DEFAULT (NULL) FOR [maKhuVuc]
GO
ALTER TABLE [dbo].[ho_khau] ADD  DEFAULT (NULL) FOR [diaChi]
GO
ALTER TABLE [dbo].[ho_khau] ADD  DEFAULT (NULL) FOR [ngayLap]
GO
ALTER TABLE [dbo].[ho_khau] ADD  DEFAULT (NULL) FOR [ngayChuyenDi]
GO
ALTER TABLE [dbo].[ho_khau] ADD  DEFAULT (NULL) FOR [nguoiThucHien]
GO
ALTER TABLE [dbo].[khai_tu] ADD  DEFAULT (NULL) FOR [soGiayKhaiTu]
GO
ALTER TABLE [dbo].[khai_tu] ADD  DEFAULT (NULL) FOR [idNguoiKhai]
GO
ALTER TABLE [dbo].[khai_tu] ADD  DEFAULT (NULL) FOR [idNguoiChet]
GO
ALTER TABLE [dbo].[khai_tu] ADD  DEFAULT (NULL) FOR [ngayKhai]
GO
ALTER TABLE [dbo].[khai_tu] ADD  DEFAULT (NULL) FOR [ngayChet]
GO
ALTER TABLE [dbo].[khai_tu] ADD  DEFAULT (NULL) FOR [lyDoChet]
GO
ALTER TABLE [dbo].[lich_su_thay_doink] ADD  DEFAULT (NULL) FOR [suKien]
GO
ALTER TABLE [dbo].[lich_su_thay_doink] ADD  DEFAULT (NULL) FOR [ngay]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [maNhanKhau]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [hoTen]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [bietDanh]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [namSinh]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [gioiTinh]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [noiSinh]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [nguyenQuan]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [danToc]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [tonGiao]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [quocTich]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [soHoChieu]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [noiThuongTru]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [diaChiHienNay]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [trinhDoHocVan]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [TrinhDoChuyenMon]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [bietTiengDanToc]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [trinhDoNgoaiNgu]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [ngheNghiep]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [noiLamViec]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [tienAn]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [ngayChuyenDen]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [lyDoChuyenDen]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [ngayChuyenDi]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [lyDoChuyenDi]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [diaChiMoi]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [ngayTao]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [idNguoiTao]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [ngayXoa]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [idNguoiXoa]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [lyDoXoa]
GO
ALTER TABLE [dbo].[nhan_khau] ADD  DEFAULT (NULL) FOR [ghiChu]
GO
ALTER TABLE [dbo].[tam_tru] ADD  DEFAULT (NULL) FOR [idNhanKhau]
GO
ALTER TABLE [dbo].[tam_tru] ADD  DEFAULT (NULL) FOR [maGiayTamtru]
GO
ALTER TABLE [dbo].[tam_tru] ADD  DEFAULT (NULL) FOR [soDienThoaiNguoiDangKy]
GO
ALTER TABLE [dbo].[tam_vang] ADD  DEFAULT (NULL) FOR [idNhanKhau]
GO
ALTER TABLE [dbo].[tam_vang] ADD  DEFAULT (NULL) FOR [maGiayTamVang]
GO
ALTER TABLE [dbo].[tam_vang] ADD  DEFAULT (NULL) FOR [noiTamtru]
GO
ALTER TABLE [dbo].[tam_vang] ADD  DEFAULT (NULL) FOR [tuNgay]
GO
ALTER TABLE [dbo].[tam_vang] ADD  DEFAULT (NULL) FOR [denNgay]
GO
ALTER TABLE [dbo].[tam_vang] ADD  DEFAULT (NULL) FOR [lyDo]
GO
ALTER TABLE [dbo].[thanh_vien_cua_ho] ADD  DEFAULT (NULL) FOR [quanHeVoiChuHo]
GO
ALTER TABLE [dbo].[tieu_su] ADD  DEFAULT (NULL) FOR [idNhanKhau]
GO
ALTER TABLE [dbo].[tieu_su] ADD  DEFAULT (NULL) FOR [tuNgay]
GO
ALTER TABLE [dbo].[tieu_su] ADD  DEFAULT (NULL) FOR [denNgay]
GO
ALTER TABLE [dbo].[tieu_su] ADD  DEFAULT (NULL) FOR [diaChi]
GO
ALTER TABLE [dbo].[tieu_su] ADD  DEFAULT (NULL) FOR [ngheNghiep]
GO
ALTER TABLE [dbo].[tieu_su] ADD  DEFAULT (NULL) FOR [noiLamViec]
GO
ALTER TABLE [dbo].[trao_qua_hsg] ADD  DEFAULT (NULL) FOR [thanhTich]
GO
ALTER TABLE [dbo].[trao_qua_hsg] ADD  DEFAULT (NULL) FOR [trangThai]
GO
ALTER TABLE [dbo].[trao_qua_hsg] ADD  DEFAULT (NULL) FOR [ngayNhan]
GO
ALTER TABLE [dbo].[trao_qua_le_tet] ADD  DEFAULT (NULL) FOR [ngayNhanQua]
GO
ALTER TABLE [dbo].[trao_qua_le_tet] ADD  DEFAULT (NULL) FOR [idNguoiGhiNhan]
GO
ALTER TABLE [dbo].[trao_qua_le_tet] ADD  DEFAULT (NULL) FOR [thoiGianGhiNhan]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [userName]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [passwd]
GO
ALTER TABLE [dbo].[chung_minh_thu]  WITH NOCHECK ADD  CONSTRAINT [chung_minh_thu$chung_minh_thu_ibfk_1] FOREIGN KEY([idNhanKhau])
REFERENCES [dbo].[nhan_khau] ([ID])
GO
ALTER TABLE [dbo].[chung_minh_thu] CHECK CONSTRAINT [chung_minh_thu$chung_minh_thu_ibfk_1]
GO
ALTER TABLE [dbo].[danh_sach_nhan_qua_cac_nam]  WITH NOCHECK ADD  CONSTRAINT [danh_sach_nhan_qua_cac_nam$danh_sach_hoc_sinh_nam_hoc_fk1] FOREIGN KEY([idNhanKhau])
REFERENCES [dbo].[nhan_khau] ([ID])
GO
ALTER TABLE [dbo].[danh_sach_nhan_qua_cac_nam] CHECK CONSTRAINT [danh_sach_nhan_qua_cac_nam$danh_sach_hoc_sinh_nam_hoc_fk1]
GO
ALTER TABLE [dbo].[danh_sach_nhan_qua_cac_nam]  WITH NOCHECK ADD  CONSTRAINT [danh_sach_nhan_qua_cac_nam$danh_sach_hoc_sinh_nam_hoc_fk2] FOREIGN KEY([namHoc])
REFERENCES [dbo].[nam_hoc] ([namHoc])
GO
ALTER TABLE [dbo].[danh_sach_nhan_qua_cac_nam] CHECK CONSTRAINT [danh_sach_nhan_qua_cac_nam$danh_sach_hoc_sinh_nam_hoc_fk2]
GO
ALTER TABLE [dbo].[dinh_chinh]  WITH NOCHECK ADD  CONSTRAINT [dinh_chinh$dinh_chinh_ibfk_1] FOREIGN KEY([idHoKhau])
REFERENCES [dbo].[ho_khau] ([ID])
GO
ALTER TABLE [dbo].[dinh_chinh] CHECK CONSTRAINT [dinh_chinh$dinh_chinh_ibfk_1]
GO
ALTER TABLE [dbo].[dinh_chinh]  WITH NOCHECK ADD  CONSTRAINT [dinh_chinh$dinh_chinh_ibfk_2] FOREIGN KEY([nguoiThayDoi])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[dinh_chinh] CHECK CONSTRAINT [dinh_chinh$dinh_chinh_ibfk_2]
GO
ALTER TABLE [dbo].[gia_dinh]  WITH NOCHECK ADD  CONSTRAINT [gia_dinh$gia_dinh_ibfk_1] FOREIGN KEY([idNhanKhau])
REFERENCES [dbo].[nhan_khau] ([ID])
GO
ALTER TABLE [dbo].[gia_dinh] CHECK CONSTRAINT [gia_dinh$gia_dinh_ibfk_1]
GO
ALTER TABLE [dbo].[ho_khau]  WITH NOCHECK ADD  CONSTRAINT [ho_khau$ho_khau_ibfk_1] FOREIGN KEY([idChuHo])
REFERENCES [dbo].[nhan_khau] ([ID])
GO
ALTER TABLE [dbo].[ho_khau] CHECK CONSTRAINT [ho_khau$ho_khau_ibfk_1]
GO
ALTER TABLE [dbo].[khai_tu]  WITH NOCHECK ADD  CONSTRAINT [khai_tu$khai_tu_ibfk_1] FOREIGN KEY([idNguoiKhai])
REFERENCES [dbo].[nhan_khau] ([ID])
GO
ALTER TABLE [dbo].[khai_tu] CHECK CONSTRAINT [khai_tu$khai_tu_ibfk_1]
GO
ALTER TABLE [dbo].[le_tet]  WITH NOCHECK ADD  CONSTRAINT [le_tet$le_tet_fk1] FOREIGN KEY([idNguoiTao])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[le_tet] CHECK CONSTRAINT [le_tet$le_tet_fk1]
GO
ALTER TABLE [dbo].[nhan_khau]  WITH NOCHECK ADD  CONSTRAINT [nhan_khau$nhan_khau_ibfk_1] FOREIGN KEY([idNguoiTao])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[nhan_khau] CHECK CONSTRAINT [nhan_khau$nhan_khau_ibfk_1]
GO
ALTER TABLE [dbo].[nhan_khau]  WITH NOCHECK ADD  CONSTRAINT [nhan_khau$nhan_khau_ibfk_2] FOREIGN KEY([idNguoiXoa])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[nhan_khau] CHECK CONSTRAINT [nhan_khau$nhan_khau_ibfk_2]
GO
ALTER TABLE [dbo].[qua_hsg]  WITH NOCHECK ADD  CONSTRAINT [qua_hsg$qua_hsg_fk1] FOREIGN KEY([namHoc])
REFERENCES [dbo].[nam_hoc] ([namHoc])
GO
ALTER TABLE [dbo].[qua_hsg] CHECK CONSTRAINT [qua_hsg$qua_hsg_fk1]
GO
ALTER TABLE [dbo].[tam_tru]  WITH NOCHECK ADD  CONSTRAINT [tam_tru$tam_tru_ibfk_1] FOREIGN KEY([idNhanKhau])
REFERENCES [dbo].[nhan_khau] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tam_tru] CHECK CONSTRAINT [tam_tru$tam_tru_ibfk_1]
GO
ALTER TABLE [dbo].[tam_vang]  WITH NOCHECK ADD  CONSTRAINT [tam_vang$tam_vang_ibfk_1] FOREIGN KEY([idNhanKhau])
REFERENCES [dbo].[nhan_khau] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tam_vang] CHECK CONSTRAINT [tam_vang$tam_vang_ibfk_1]
GO
ALTER TABLE [dbo].[thanh_vien_cua_ho]  WITH NOCHECK ADD  CONSTRAINT [thanh_vien_cua_ho$thanh_vien_cua_ho_ibfk_1] FOREIGN KEY([idNhanKhau])
REFERENCES [dbo].[nhan_khau] ([ID])
GO
ALTER TABLE [dbo].[thanh_vien_cua_ho] CHECK CONSTRAINT [thanh_vien_cua_ho$thanh_vien_cua_ho_ibfk_1]
GO
ALTER TABLE [dbo].[thanh_vien_cua_ho]  WITH NOCHECK ADD  CONSTRAINT [thanh_vien_cua_ho$thanh_vien_cua_ho_ibfk_2] FOREIGN KEY([idHoKhau])
REFERENCES [dbo].[ho_khau] ([ID])
GO
ALTER TABLE [dbo].[thanh_vien_cua_ho] CHECK CONSTRAINT [thanh_vien_cua_ho$thanh_vien_cua_ho_ibfk_2]
GO
ALTER TABLE [dbo].[tieu_su]  WITH NOCHECK ADD  CONSTRAINT [tieu_su$tieu_su_ibfk_1] FOREIGN KEY([idNhanKhau])
REFERENCES [dbo].[nhan_khau] ([ID])
GO
ALTER TABLE [dbo].[tieu_su] CHECK CONSTRAINT [tieu_su$tieu_su_ibfk_1]
GO
ALTER TABLE [dbo].[trao_qua_hsg]  WITH NOCHECK ADD  CONSTRAINT [trao_qua_hsg$thanh_tich_hoc_sinh_fk1] FOREIGN KEY([idNhanKhau])
REFERENCES [dbo].[nhan_khau] ([ID])
GO
ALTER TABLE [dbo].[trao_qua_hsg] CHECK CONSTRAINT [trao_qua_hsg$thanh_tich_hoc_sinh_fk1]
GO
ALTER TABLE [dbo].[trao_qua_hsg]  WITH NOCHECK ADD  CONSTRAINT [trao_qua_hsg$thanh_tich_hoc_sinh_fk2] FOREIGN KEY([thanhTich], [namHoc])
REFERENCES [dbo].[qua_hsg] ([thanhTich], [namHoc])
GO
ALTER TABLE [dbo].[trao_qua_hsg] CHECK CONSTRAINT [trao_qua_hsg$thanh_tich_hoc_sinh_fk2]
GO
ALTER TABLE [dbo].[trao_qua_le_tet]  WITH NOCHECK ADD  CONSTRAINT [trao_qua_le_tet$trao_qua_le_tet_fk1] FOREIGN KEY([idHoKhau])
REFERENCES [dbo].[ho_khau] ([ID])
GO
ALTER TABLE [dbo].[trao_qua_le_tet] CHECK CONSTRAINT [trao_qua_le_tet$trao_qua_le_tet_fk1]
GO
ALTER TABLE [dbo].[trao_qua_le_tet]  WITH NOCHECK ADD  CONSTRAINT [trao_qua_le_tet$trao_qua_le_tet_fk2] FOREIGN KEY([idSuKien])
REFERENCES [dbo].[le_tet] ([idSuKien])
GO
ALTER TABLE [dbo].[trao_qua_le_tet] CHECK CONSTRAINT [trao_qua_le_tet$trao_qua_le_tet_fk2]
GO
ALTER TABLE [dbo].[trao_qua_le_tet]  WITH NOCHECK ADD  CONSTRAINT [trao_qua_le_tet$trao_qua_le_tet_fk3] FOREIGN KEY([idNguoiGhiNhan])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[trao_qua_le_tet] CHECK CONSTRAINT [trao_qua_le_tet$trao_qua_le_tet_fk3]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.chung_minh_thu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'chung_minh_thu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.danh_sach_nhan_qua_cac_nam' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'danh_sach_nhan_qua_cac_nam'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.dinh_chinh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'dinh_chinh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.gia_dinh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'gia_dinh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.ho_khau' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ho_khau'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.khai_tu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'khai_tu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.le_tet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'le_tet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.lich_su_thay_doink' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lich_su_thay_doink'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.nam_hoc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'nam_hoc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.nhan_khau' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'nhan_khau'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.qua_hsg' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'qua_hsg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.tam_tru' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tam_tru'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.tam_vang' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tam_vang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.thanh_vien_cua_ho' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'thanh_vien_cua_ho'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.tieu_su' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tieu_su'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.trao_qua_hsg' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'trao_qua_hsg'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.trao_qua_le_tet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'trao_qua_le_tet'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.users' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'users'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'quanlynhankhau.ds_hoc_sinh' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ds_hoc_sinh'
GO
USE [master]
GO
ALTER DATABASE [quanlynhankhau] SET  READ_WRITE 
GO
