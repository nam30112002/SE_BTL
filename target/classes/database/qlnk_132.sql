USE [master]
GO
/****** Object:  Database [quanlynhankhau]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE DATABASE [quanlynhankhau]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quanlynhankhau', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MAYAO\MSSQL\DATA\quanlynhankhau.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'quanlynhankhau_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MAYAO\MSSQL\DATA\quanlynhankhau_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [quanlynhankhau] SET COMPATIBILITY_LEVEL = 150
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
/****** Object:  Table [dbo].[nam_hoc]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Table [dbo].[nhan_khau]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Table [dbo].[thanh_vien_cua_ho]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Table [dbo].[trao_qua_hsg]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  View [dbo].[ds_hoc_sinh]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Table [dbo].[chung_minh_thu]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Table [dbo].[danh_sach_nhan_qua_cac_nam]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Table [dbo].[dinh_chinh]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Table [dbo].[gia_dinh]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Table [dbo].[ho_khau]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Table [dbo].[hoc_sinh]    Script Date: 2/13/2023 11:41:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoc_sinh](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CCCD] [nvarchar](100) NOT NULL,
	[thanhtich] [nvarchar](100) NULL,
	[mpt_tre_em] [nvarchar](100) NULL,
	[mpt_thanh_tich] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CCCD] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khai_tu]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Table [dbo].[le_tet]    Script Date: 2/13/2023 11:41:39 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [le_tet$idSuKien_UNIQUE] UNIQUE NONCLUSTERED 
(
	[idSuKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lich_su]    Script Date: 2/13/2023 11:41:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lich_su](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[thoigian] [nvarchar](100) NULL,
	[noidung] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lich_su_thay_doink]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Table [dbo].[phan_thuong]    Script Date: 2/13/2023 11:41:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phan_thuong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maphanthuong] [nvarchar](100) NOT NULL,
	[tenphanthuong] [nvarchar](100) NULL,
	[dongia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[maphanthuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qua_hsg]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Table [dbo].[tam_tru]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Table [dbo].[tam_vang]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Table [dbo].[tieu_su]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Table [dbo].[trao_qua_le_tet]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Table [dbo].[tre_em]    Script Date: 2/13/2023 11:41:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tre_em](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CCCD] [nvarchar](100) NOT NULL,
	[mpt_tre_em] [nvarchar](100) NULL,
	[mpt_thanh_tich] [nvarchar](100) NULL,
	[sl_pt_tre_em] [int] NULL,
	[sl_pt_thanh_tich] [int] NULL,
	[thanh_tich] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CCCD] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2/13/2023 11:41:39 PM ******/
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
/****** Object:  Index [idNhanKhau]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [idNhanKhau] ON [dbo].[chung_minh_thu]
(
	[idNhanKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [danh_sach_hoc_sinh_nam_hoc_fk2_idx]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [danh_sach_hoc_sinh_nam_hoc_fk2_idx] ON [dbo].[danh_sach_nhan_qua_cac_nam]
(
	[namHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idHoKhau]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [idHoKhau] ON [dbo].[dinh_chinh]
(
	[idHoKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [nguoiThayDoi]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [nguoiThayDoi] ON [dbo].[dinh_chinh]
(
	[nguoiThayDoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idNhanKhau]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [idNhanKhau] ON [dbo].[gia_dinh]
(
	[idNhanKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idChuHo]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [idChuHo] ON [dbo].[ho_khau]
(
	[idChuHo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idNguoiChet]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [idNguoiChet] ON [dbo].[khai_tu]
(
	[idNguoiChet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idNguoiKhai]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [idNguoiKhai] ON [dbo].[khai_tu]
(
	[idNguoiKhai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [le_tet_fk1]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [le_tet_fk1] ON [dbo].[le_tet]
(
	[idNguoiTao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idNguoiTao]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [idNguoiTao] ON [dbo].[nhan_khau]
(
	[idNguoiTao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idNguoiXoa]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [idNguoiXoa] ON [dbo].[nhan_khau]
(
	[idNguoiXoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [qua_hsg_fk1_idx]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [qua_hsg_fk1_idx] ON [dbo].[qua_hsg]
(
	[namHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idNhanKhau]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [idNhanKhau] ON [dbo].[tam_tru]
(
	[idNhanKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idNhanKhau]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [idNhanKhau] ON [dbo].[tam_vang]
(
	[idNhanKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idHoKhau]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [idHoKhau] ON [dbo].[thanh_vien_cua_ho]
(
	[idHoKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idNhanKhau]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [idNhanKhau] ON [dbo].[tieu_su]
(
	[idNhanKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [s_idx]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [s_idx] ON [dbo].[trao_qua_hsg]
(
	[thanhTich] ASC,
	[namHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [qua_le_tet_fk2_idx]    Script Date: 2/13/2023 11:41:39 PM ******/
CREATE NONCLUSTERED INDEX [qua_le_tet_fk2_idx] ON [dbo].[trao_qua_le_tet]
(
	[idSuKien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [trao_qua_le_tet_fk3]    Script Date: 2/13/2023 11:41:39 PM ******/
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
ALTER TABLE [dbo].[hoc_sinh]  WITH CHECK ADD FOREIGN KEY([mpt_tre_em])
REFERENCES [dbo].[phan_thuong] ([maphanthuong])
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
ALTER TABLE [dbo].[tre_em]  WITH CHECK ADD FOREIGN KEY([mpt_thanh_tich])
REFERENCES [dbo].[phan_thuong] ([maphanthuong])
GO
ALTER TABLE [dbo].[tre_em]  WITH CHECK ADD FOREIGN KEY([mpt_tre_em])
REFERENCES [dbo].[phan_thuong] ([maphanthuong])
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
