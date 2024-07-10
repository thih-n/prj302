USE [master]
GO
/****** Object:  Database [Perfume_Website]    Script Date: 10/07/2024 8:22:19 SA ******/
CREATE DATABASE [Perfume_Website]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Perfume_Website', FILENAME = N'E:\sqlllll\MSSQL16.SQLEXPRESS\MSSQL\DATA\Perfume_Website.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Perfume_Website_log', FILENAME = N'E:\sqlllll\MSSQL16.SQLEXPRESS\MSSQL\DATA\Perfume_Website_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Perfume_Website] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Perfume_Website].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Perfume_Website] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Perfume_Website] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Perfume_Website] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Perfume_Website] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Perfume_Website] SET ARITHABORT OFF 
GO
ALTER DATABASE [Perfume_Website] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Perfume_Website] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Perfume_Website] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Perfume_Website] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Perfume_Website] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Perfume_Website] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Perfume_Website] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Perfume_Website] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Perfume_Website] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Perfume_Website] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Perfume_Website] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Perfume_Website] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Perfume_Website] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Perfume_Website] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Perfume_Website] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Perfume_Website] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Perfume_Website] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Perfume_Website] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Perfume_Website] SET  MULTI_USER 
GO
ALTER DATABASE [Perfume_Website] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Perfume_Website] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Perfume_Website] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Perfume_Website] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Perfume_Website] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Perfume_Website] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Perfume_Website] SET QUERY_STORE = ON
GO
ALTER DATABASE [Perfume_Website] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Perfume_Website]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/07/2024 8:22:20 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 10/07/2024 8:22:20 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
	[UnitPrice] [money] NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/07/2024 8:22:20 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[TotalMoney] [money] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/07/2024 8:22:20 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](100) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[QuantitySold] [int] NULL,
	[StarRating] [smallint] NULL,
	[Discontinued] [bit] NULL,
	[image] [nvarchar](max) NULL,
	[describe] [nvarchar](max) NULL,
	[releaseDate] [date] NULL,
	[Discount] [float] NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 10/07/2024 8:22:20 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Phone] [nvarchar](24) NULL,
	[HomePage] [ntext] NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/07/2024 8:22:20 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Image] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[BirthDay] [date] NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](11) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wallets]    Script Date: 10/07/2024 8:22:20 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallets](
	[WalletID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Balance] [decimal](10, 2) NULL,
 CONSTRAINT [PK_Wallets] PRIMARY KEY CLUSTERED 
(
	[WalletID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'Men', N'Đồng hồ nam không chỉ là một công cụ để xem giờ mà còn là biểu tượng của sự lịch lãm và phong cách. Chúng tôi cung cấp một bộ sưu tập đồng hồ đa dạng, từ cổ điển đến hiện đại, phù hợp với mọi phong cách của quý ông.')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'Women', N'Đồng hồ nữ không chỉ là phụ kiện thời trang mà còn là biểu tượng của sự tinh tế và sang trọng. Chúng tôi cung cấp những mẫu đồng hồ độc đáo và thời trang nhất, tôn vinh vẻ đẹp và cá tính của phụ nữ.')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'Kids', N'Đồng hồ cho trẻ không chỉ là phụ kiện thời trang mà còn giúp các bé quản lý thời gian của mình')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'Unisex', N'Đồng hồ unisex phù hợp cho cả nam và nữ, mang lại phong cách thời thượng và hiện đại. Chúng tôi giới thiệu bộ sưu tập đồng hồ unisex với thiết kế tinh tế và đẳng cấp, phù hợp với mọi giới tính và phong cách.')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description]) VALUES (5, N'Giftset', N'Giftset – hay còn gọi là bộ quà tặng, là tập hợp nhiều loại sản phẩm khác nhau. Chúng đều có tính ứng dụng cao để phục vụ cho công việc và cả trong cuộc sống hàng ngày. 
	Tất cả các sản phẩm trong bộ Giftset đều có liên quan đến nhau, tính thẩm mỹ cao để mang đến sự hài lòng cho người nhận.')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (1, 2, 3, 29.9900, 0.5)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (1, 3, 2, 39.9900, 0.3)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (1, 4, 2, 49.9900, 0.45)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (2, 5, 3, 59.9900, 0.7)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (2, 7, 3, 79.9900, 0.45)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (2, 62, 1, 9.9900, 0)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (3, 11, 3, 29.9900, 0.3)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (3, 64, 2, 14.9900, 0)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (4, 37, 4, 79.9900, 0.5)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (4, 39, 4, 99.9900, 0.45)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (4, 44, 4, 49.9900, 0.3)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (5, 52, 2, 19.9900, 0.7)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (5, 55, 4, 49.9900, 0.3)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (5, 58, 3, 29.9900, 0.5)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (6, 66, 3, 19.9900, 0)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (6, 68, 4, 17.9900, 0)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (47, 60, 11, 59.9900, 0.2)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (48, 60, 11, 59.9900, 0.2)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (49, 1, 1, 19999.9900, 0.7)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (50, 1, 12, 19999.9900, 0.7)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (51, 61, 1, 69.9900, 0.4)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (52, 60, 1, 59.9900, 0.2)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (53, 3, 1, 39999.9900, 0.3)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (54, 60, 1, 59.9900, 0.2)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (55, 61, 1, 69.9900, 0.4)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (56, 60, 1, 59.9900, 0.2)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (57, 60, 1, 59.9900, 0.2)
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [UnitPrice], [Discount]) VALUES (58, 60, 1, 59.9900, 0.2)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (1, CAST(N'2023-11-27' AS Date), N'user9', 155.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (2, CAST(N'2023-12-01' AS Date), N'user10', 155.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (3, CAST(N'2023-11-25' AS Date), N'user1', 155.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (4, CAST(N'2023-05-24' AS Date), N'user3', 195.9600, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (5, CAST(N'2023-12-15' AS Date), N'user2', 92.9500, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (6, CAST(N'2022-02-05' AS Date), N'user3', 519.8800, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (7, CAST(N'2021-07-12' AS Date), N'user6', 196.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (8, CAST(N'2023-07-03' AS Date), N'user5', 176.2000, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (9, CAST(N'2023-10-18' AS Date), N'user1', 131.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (10, CAST(N'2023-08-21' AS Date), N'user5', 196.0000, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (11, CAST(N'2023-07-26' AS Date), N'user6', 196.6500, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (12, CAST(N'2023-06-22' AS Date), N'user4', 129.1300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (13, CAST(N'2023-12-21' AS Date), N'user2', 92.9500, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (14, CAST(N'2023-02-28' AS Date), N'user4', 119.8800, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (15, CAST(N'2023-07-22' AS Date), N'user2', 96.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (16, CAST(N'2022-07-21' AS Date), N'user2', 56.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (17, CAST(N'2023-11-26' AS Date), N'user2', 13.5000, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (18, CAST(N'2023-12-15' AS Date), N'user1', 26.1300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (19, CAST(N'2023-12-31' AS Date), N'user5', 16.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (20, CAST(N'2023-12-22' AS Date), N'user6', 19.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (21, CAST(N'2022-12-11' AS Date), N'user10', 167.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (22, CAST(N'2023-12-26' AS Date), N'user9', 93.5000, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (23, CAST(N'2023-12-24' AS Date), N'user9', 16.1300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (24, CAST(N'2023-12-23' AS Date), N'user8', 96.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (25, CAST(N'2022-12-22' AS Date), N'user7', 50.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (26, CAST(N'2023-12-21' AS Date), N'user6', 225.5000, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (27, CAST(N'2023-12-27' AS Date), N'user1', 22.1300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (28, CAST(N'2023-12-28' AS Date), N'user5', 17.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (29, CAST(N'2023-12-29' AS Date), N'user6', 11.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (30, CAST(N'2022-12-11' AS Date), N'user10', 167.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (31, CAST(N'2023-12-28' AS Date), N'user9', 93.5000, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (32, CAST(N'2022-12-17' AS Date), N'user10', 167.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (33, CAST(N'2023-12-29' AS Date), N'user9', 93.5000, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (34, CAST(N'2023-12-30' AS Date), N'user9', 16.1300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (35, CAST(N'2023-12-26' AS Date), N'user8', 96.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (36, CAST(N'2022-12-25' AS Date), N'user7', 50.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (37, CAST(N'2023-12-24' AS Date), N'user6', 225.5000, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (38, CAST(N'2023-12-23' AS Date), N'user1', 22.1300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (39, CAST(N'2023-12-22' AS Date), N'user5', 17.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (40, CAST(N'2023-12-21' AS Date), N'user6', 11.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (41, CAST(N'2022-12-20' AS Date), N'user10', 167.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (42, CAST(N'2023-12-19' AS Date), N'user9', 93.5000, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (43, CAST(N'2023-12-25' AS Date), N'user2', 16.1300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (44, CAST(N'2023-12-22' AS Date), N'user8', 76.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (45, CAST(N'2023-12-22' AS Date), N'user6', 279.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (46, CAST(N'2023-12-25' AS Date), N'user2', 216.9300, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (47, CAST(N'2024-07-08' AS Date), N'thinh', 527.8900, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (48, CAST(N'2024-07-08' AS Date), N'thinh', 527.8900, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (49, CAST(N'2024-07-08' AS Date), N'thinh', 6000.0000, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (50, CAST(N'2024-07-08' AS Date), N'thinh', 72000.0000, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (51, CAST(N'2024-07-09' AS Date), N'thinh', 41.9900, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (52, CAST(N'2024-07-10' AS Date), N'thinh', 47.9900, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (53, CAST(N'2024-07-10' AS Date), N'thinh', 27999.9900, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (54, CAST(N'2024-07-10' AS Date), N'thinh', 47.9900, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (55, CAST(N'2024-07-10' AS Date), N'thinh', 41.9900, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (56, CAST(N'2024-07-10' AS Date), N'thinh', 47.9900, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (57, CAST(N'2024-07-10' AS Date), N'thinh', 47.9900, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [Date], [UserName], [TotalMoney], [status]) VALUES (58, CAST(N'2024-07-10' AS Date), N'thinh', 47.9900, 0)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (1, N'Rolex Submariner', 1, 1, N'yellow black', 19999.9900, 100, 20, 5, 0, N'images/products/Men/1-1.png, images/products/Men/1-2.png', N'good', CAST(N'2023-10-02' AS Date), 0.7, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (2, N'Omega Seamaster', 2, 1, N'yellow black', 29999.9900, 50, 10, 3, 0, N'images/products/Men/2-1.png, images/products/Men/2-2.png', N'good', CAST(N'2023-11-02' AS Date), 0.5, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (3, N'Tag Heuer Carrera', 3, 1, N'black brown red', 39999.9900, 75, 15, 3, 0, N'images/products/Men/3-1.png, images/products/Men/3-2.png', N'good', CAST(N'2016-10-02' AS Date), 0.3, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (4, N'Breitling Navitimer', 4, 1, N'black', 49999.9900, 120, 30, 4, 0, N'images/products/Men/4-1.png, images/products/Men/4-2.png', N'good', CAST(N'2023-10-02' AS Date), 0.45, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (5, N'IWC Portuguese', 5, 1, N'black', 59999.9900, 80, 25, 5, 0, N'images/products/Men/5-1.png, images/products/Men/5-2.png', N'good', CAST(N'2023-05-02' AS Date), 0.7, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (6, N'Panerai Luminor', 6, 1, N'black', 69999.9900, 60, 12, 5, 0, N'images/products/Men/6-1.png, images/products/Men/6-2.png', N'good', CAST(N'2009-07-02' AS Date), 0.3, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (7, N'Cartier Santos', 7, 1, N'black', 79999.9900, 90, 18, 4, 0, N'images/products/Men/7-1.png, images/products/Men/7-2.png', N'good', CAST(N'2023-02-02' AS Date), 0.45, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (8, N'Audemars Piguet Royal Oak', 8, 1, N'black', 89999.9900, 110, 22, 4, 0, N'images/products/Men/8-1.png, images/products/Men/8-2.png', N'good', CAST(N'2022-02-02' AS Date), 0.5, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (9, N'Patek Philippe Nautilus', 9, 1, N'black', 99999.9900, 150, 35, 3, 0, N'images/products/Men/9-1.png, images/products/Men/9-2.png', N'good', CAST(N'2023-09-01' AS Date), 0.7, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (10, N'Hublot Big Bang', 10, 1, N'gray', 109999.9900, 70, 14, 5, 0, N'images/products/Men/10-1.png, images/products/Men/10-2.png', N'good', CAST(N'2021-07-02' AS Date), 0.3, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (11, N'Zenith El Primero', 2, 1, N'black', 29999.9900, 100, 20, 4, 0, N'images/products/Men/11-1.png, images/products/Men/11-2.png', N'good', CAST(N'2023-11-12' AS Date), 0.3, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (12, N'Blancpain Fifty Fathoms', 1, 1, N'black', 29999.9900, 100, 10, 3, 0, N'images/products/Men/12-1.png, images/products/Men/12-2.png', N'good', CAST(N'2023-11-04' AS Date), 0.3, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (13, N'Longines Master', 4, 1, N'gray red', 39999.9900, 75, 15, 4, 0, N'images/products/Men/13-1.png, images/products/Men/13-2.png', N'good', CAST(N'2016-10-02' AS Date), 0.3, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (14, N'Jaeger-LeCoultre Reverso', 3, 1, N'gray red', 49999.9900, 120, 30, 2, 0, N'images/products/Men/14-1.png, images/products/Men/14-2.png', N'good', CAST(N'2023-10-02' AS Date), 0.45, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (15, N'Montblanc TimeWalker', 6, 1, N'black gray', 59999.9900, 80, 25, 4, 0, N'images/products/Men/15-1.png, images/products/Men/15-2.png', N'good', CAST(N'2023-05-02' AS Date), 0.7, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (16, N'Breguet Marine', 5, 1, N'black gray', 59999.9900, 60, 12, 3, 0, N'images/products/Men/16-1.png, images/products/Men/16-2.png', N'good', CAST(N'2009-06-02' AS Date), 0.7, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (17, N'Tudor Black Bay', 10, 1, N'red black', 29999.9900, 90, 18, 5, 0, N'images/products/Men/17-1.png, images/products/Men/17-2.png', N'good', CAST(N'2023-02-02' AS Date), 0.7, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (18, N'Breitling Superocean', 9, 1, N'black', 59999.9900, 110, 22, 3, 0, N'images/products/Men/18-1.png, images/products/Men/18-2.png', N'good', CAST(N'2022-02-03' AS Date), 0.5, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (19, N'Seiko Prospex', 8, 1, N'black gray', 79999.9900, 150, 35, 3, 0, N'images/products/Men/19-1.png, images/products/Men/19-2.png', N'good', CAST(N'2023-11-01' AS Date), 0.7, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (20, N'Grand Seiko', 7, 1, N'red gray', 49999.9900, 70, 14, 2, 0, N'images/products/Men/20-1.png, images/products/Men/20-2.png', N'good', CAST(N'2021-07-12' AS Date), 0.3, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (21, N'Cartier Ballon Bleu', 1, 2, N'pink', 19999.9900, 100, 20, 4, 0, N'images/products/Women/1-1.png, images/products/Women/1-2.png', N'good', CAST(N'2023-05-01' AS Date), 0.7, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (22, N'Chanel J12', 2, 2, N'pink', 29999.9900, 50, 10, 5, 0, N'images/products/Women/2-1.png, images/products/Women/2-2.png', N'good', CAST(N'2023-05-11' AS Date), 0.5, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (23, N'Bulgari Serpenti', 3, 2, N'red', 39999.9900, 75, 15, 4, 0, N'images/products/Women/3-1.png, images/products/Women/3-2.png', N'good', CAST(N'2019-09-08' AS Date), 0.45, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (24, N'Dior VIII', 4, 2, N'brown', 49999.9900, 120, 30, 4, 0, N'images/products/Women/4-1.png, images/products/Women/4-2.png', N'good', CAST(N'2023-08-09' AS Date), 0.7, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (25, N'Gucci G-Timeless', 5, 2, N'black', 59999.9900, 80, 25, 4, 0, N'images/products/Women/5-1.png, images/products/Women/5-2.png', N'good', CAST(N'2020-08-11' AS Date), 0.3, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (26, N'Hermes Heure H', 6, 2, N'black', 69999.9900, 60, 12, 5, 0, N'images/products/Women/6-1.png, images/products/Women/6-2.png', N'good', CAST(N'2023-01-11' AS Date), 0.45, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (27, N'Hublot Big Bang', 7, 2, N'grey', 79999.9900, 90, 18, 3, 0, N'images/products/Women/7-1.png, images/products/Women/7-2.png', N'good', CAST(N'2019-02-11' AS Date), 0.5, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (28, N'Longines PrimaLuna', 8, 2, N'yellow', 89999.9900, 110, 22, 4, 0, N'images/products/Women/8-1.png, images/products/Women/8-2.png', N'good', CAST(N'2023-02-12' AS Date), 0.7, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (29, N'Omega Constellation', 9, 2, N'brown', 99999.9900, 150, 35, 4, 0, N'images/products/Women/9-1.png, images/products/Women/9-2.png', N'good', CAST(N'2010-12-08' AS Date), 0.45, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (30, N'Patek Philippe Twenty-4', 10, 2, N'black', 109999.9900, 70, 14, 5, 0, N'images/products/Women/10-1.png, images/products/Women/10-2.png', N'good', CAST(N'2020-07-12' AS Date), 0.3, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (31, N'Rolex Lady-Datejust', 10, 2, N'pink red', 39999.9900, 100, 20, 4, 0, N'images/products/Women/11-1.png, images/products/Women/11-2.png', N'good', CAST(N'2023-07-01' AS Date), 0.7, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (32, N'Tag Heuer Formula 1', 9, 2, N'black', 29999.9900, 50, 10, 4, 0, N'images/products/Women/12-1.png, images/products/Women/12-2.png', N'good', CAST(N'2023-05-10' AS Date), 0.5, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (33, N'Tudor Clair de Rose', 8, 2, N'red black', 39999.9900, 75, 15, 5, 0, N'images/products/Women/13-1.png, images/products/Women/13-2.png', N'good', CAST(N'2019-09-08' AS Date), 0.3, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (34, N'Vacheron Constantin Overseas', 7, 2, N'pink grey black', 49999.9900, 120, 30, 4, 0, N'images/products/Women/14-1.png, images/products/Women/14-2.png', N'good', CAST(N'2023-08-09' AS Date), 0.3, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (35, N'Zenith Elite', 6, 2, N'neon', 39999.9900, 80, 25, 3, 0, N'images/products/Women/15-1.png, images/products/Women/15-2.png', N'good', CAST(N'2020-08-11' AS Date), 0.3, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (36, N'Audemars Piguet Royal Oak', 4, 2, N'gray black', 49999.9900, 60, 12, 2, 0, N'images/products/Women/16-1.png, images/products/Women/16-2.png', N'good', CAST(N'2023-01-11' AS Date), 0.45, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (37, N'Baume & Mercier Classima', 5, 2, N'black', 79999.9900, 90, 18, 3, 0, N'images/products/Women/17-1.png, images/products/Women/17-2.png', N'good', CAST(N'2019-02-11' AS Date), 0.5, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (38, N'Blancpain Villeret', 3, 2, N'yellow', 89999.9900, 110, 22, 4, 0, N'images/products/Women/18-1.png, images/products/Women/18-2.png', N'good', CAST(N'2023-02-12' AS Date), 0.7, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (39, N'Breguet Reine de Naples', 2, 2, N'yellow red, black', 99999.9900, 150, 35, 5, 0, N'images/products/Women/19-1.png, images/products/Women/19-2.png', N'good', CAST(N'2010-12-10' AS Date), 0.45, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (40, N'Chopard Happy Sport', 1, 2, N'black', 109999.9900, 70, 14, 4, 0, N'images/products/Women/20-1.png, images/products/Women/20-2.png', N'good', CAST(N'2005-07-12' AS Date), 0.3, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (41, N'Apple Watch Series 6', 1, 4, N'pink', 19999.9900, 100, 20, 4, 0, N'images/products/Unisex/1-1.png, images/products/Unisex/1-2.png', N'good', CAST(N'2023-02-11' AS Date), 0.7, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (42, N'Samsung Galaxy Watch 3', 2, 4, N'black', 29999.9900, 50, 10, 3, 0, N'images/products/Unisex/2-1.png, images/products/Unisex/2-2.png', N'good', CAST(N'2022-01-12' AS Date), 0.45, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (43, N'Garmin Fenix 6', 3, 4, N'red', 39999.9900, 75, 15, 5, 0, N'images/products/Unisex/3-1.png, images/products/Unisex/3-2.png', N'good', CAST(N'2023-01-14' AS Date), 0, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (44, N'Fitbit Versa 3', 4, 4, N'gray', 49999.9900, 120, 30, 5, 0, N'images/products/Unisex/4-1.png, images/products/Unisex/4-2.png', N'good', CAST(N'2020-11-12' AS Date), 0.3, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (45, N'Fossil Gen 5', 5, 4, N'red', 59999.9900, 80, 25, 5, 0, N'images/products/Unisex/5-1.png, images/products/Unisex/5-2.png', N'good', CAST(N'2023-12-09' AS Date), 0.7, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (46, N'TicWatch Pro 3', 5, 4, N'red', 59999.9900, 80, 25, 5, 0, N'images/products/Unisex/6-1.png, images/products/Unisex/6-2.png', N'good', CAST(N'2023-03-09' AS Date), 0.5, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (47, N'Withings Steel HR', 7, 4, N'black', 79999.9900, 90, 18, 4, 0, N'images/products/Unisex/7-1.png, images/products/Unisex/7-2.png', N'good', CAST(N'2023-02-02' AS Date), 0.45, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (48, N'Suunto 7', 8, 4, N'black', 20150.9900, 110, 22, 4, 0, N'images/products/Unisex/8-1.png, images/products/Unisex/8-2.png', N'good', CAST(N'2022-02-02' AS Date), 0.5, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (49, N'Polar Vantage V2', 9, 4, N'yellow', 99999.9900, 150, 35, 2, 0, N'images/products/Unisex/9-1.png, images/products/Unisex/9-2.png', N'good', CAST(N'2023-09-01' AS Date), 0.7, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (50, N'Amazfit GTR 2', 7, 4, N'blue', 79999.9900, 90, 18, 3, 0, N'images/products/Unisex/10-1.png, images/products/Unisex/10-2.png', N'good', CAST(N'2019-02-11' AS Date), 0.5, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (51, N'Amazfit GTR 3', 7, 4, N'blue', 79999.9900, 90, 18, 3, 0, N'images/products/Unisex/11-1.png, images/products/Unisex/11-2.png', N'good', CAST(N'2019-02-11' AS Date), 0.5, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (52, N'Casio Kids Watch', 1, 3, N'red', 49.9900, 100, 20, 5, 0, N'images/products/Kids/1-1.png, images/products/Kids/1-2.png', N'good', CAST(N'2023-01-01' AS Date), 0.1, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (53, N'Timex Kids Analog Watch', 2, 3, N'blue', 39.9900, 80, 15, 4, 0, N'images/products/Kids/2-1.png, images/products/Kids/2-2.png', N'good', CAST(N'2023-02-01' AS Date), 0.2, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (54, N'Disney Frozen Watch', 3, 3, N'pink', 29.9900, 70, 10, 3, 0, N'images/products/Kids/3-1.png, images/products/Kids/3-2.png', N'good', CAST(N'2023-03-01' AS Date), 0.3, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (55, N'Lego Star Wars Watch', 4, 3, N'black', 59.9900, 60, 25, 5, 0, N'images/products/Kids/4-1.png, images/products/Kids/4-2.png', N'good', CAST(N'2023-04-01' AS Date), 0.4, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (56, N'Peppa Pig Digital Watch', 5, 3, N'purple', 19.9900, 50, 30, 2, 0, N'images/products/Kids/5-1.png, images/products/Kids/5-2.png', N'good', CAST(N'2023-05-01' AS Date), 0.5, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (57, N'Marvel Avengers Watch', 6, 3, N'green', 39.9900, 40, 35, 4, 0, N'images/products/Kids/6-1.png, images/products/Kids/6-2.png', N'good', CAST(N'2023-06-01' AS Date), 0.6, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (58, N'Hello Kitty Watch', 7, 3, N'yellow', 29.9900, 30, 40, 3, 0, N'images/products/Kids/7-1.png, images/products/Kids/7-2.png', N'good', CAST(N'2023-07-01' AS Date), 0.6, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (59, N'Spider-Man Watch', 8, 3, N'red', 49.9900, 20, 45, 5, 0, N'images/products/Kids/8-1.png, images/products/Kids/8-2.png', N'good', CAST(N'2023-08-01' AS Date), 0.5, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (60, N'Barbie Watch', 1, 1, NULL, 59.9900, 14, 50, 4, 0, N'images/products/Kids/9-1.png, images/products/Kids/9-2.png', N'good', CAST(N'2023-09-01' AS Date), 0.2, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (61, N'Mickey Mouse Watch', 10, 3, N'black', 69.9900, 90, 55, 5, 0, N'images/products/Kids/10-1.png, images/products/Kids/10-2.png', N'good', CAST(N'2023-10-01' AS Date), 0.4, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (62, N'GIFTSET Casio Classic', 1, 5, N'black', 999.9900, 50, 20, 5, 0, N'images/products/Gift/1-1.png, images/products/Gift/1-2.png', N'good', CAST(N'2023-04-12' AS Date), 0, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (63, N'SET Timex Weekender', 2, 5, N'black', 1999.9900, 100, 20, 5, 0, N'images/products/Gift/2-1.png, images/products/Gift/2-2.png', N'good', CAST(N'2023-05-11' AS Date), 0, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (64, N'GIFTSET Swatch Originals', 3, 5, N'black', 1499.9900, 90, 15, 5, 0, N'images/products/Gift/3-1.png, images/products/Gift/3-2.png', N'good', CAST(N'2022-12-11' AS Date), 0, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (65, N'SET Citizen Eco-Drive', 4, 5, N'yellow black white', 999.9900, 50, 22, 5, 0, N'images/products/Gift/4-1.png, images/products/Gift/4-2.png', N'good', CAST(N'2023-06-12' AS Date), 0, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (66, N'SET Seiko Presage', 5, 5, N'white', 1999.9900, 80, 25, 5, 0, N'images/products/Gift/5-1.png, images/products/Gift/5-2.png', N'good', CAST(N'2023-09-12' AS Date), 0, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (67, N'SET Orient Bambino', 6, 5, N'black green', 1799.9900, 70, 30, 5, 0, N'images/products/Gift/6-1.png, images/products/Gift/6-2.png', N'good', CAST(N'2022-07-12' AS Date), 0, 1)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [SupplierID], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [QuantitySold], [StarRating], [Discontinued], [image], [describe], [releaseDate], [Discount], [status]) VALUES (68, N'SET 5 Tissot PRX', 1, 1, NULL, 1799.9900, 70, 30, 5, 0, N'images/products/Gift/7-1.png, images/products/Gift/7-2.png', N'good', CAST(N'2023-08-12' AS Date), 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (1, N'Casio', N'Supplier Contact Casio', N'J', N'+39 02 1234 5678', N'https://www.casio.com/vn/')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (2, N'Rolex', N'Supplier Contact Rolex', N'S', N'+49 30 9876 5432', N'https://www.rolex.com/vi')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (3, N'Cartier', N'Supplier Contact Cartier', N'F', N'+49 30 9876 5432', N'https://www.cartier.com/en-us/home')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (4, N'Omega', N'Supplier Contact Omega', N'S', N'+49 30 9876 5432', N'https://www.omegawatches.com/')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (5, N'Longines', N'Supplier Contact Longines', N'S', N'+49 30 9876 5432', N'https://www.longines.com/')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (6, N'Breitling', N'Supplier Contact Breitling', N'S', N'+49 30 9876 5432', N'https://www.breitling.com/vn-en/')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (7, N'Paiaget', N'Supplier Contact Paiaget', N'S', N'+49 30 9876 5432', N'https://www.piaget.com/')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (8, N'Montblanc', N'Supplier Contact Montblanc', N'G', N'+49 30 9876 5432', N'https://www.montblanc.com/en-vn')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (9, N'Breguet', N'Supplier Contact Breguet', N'S', N'+49 30 9876 5432', N'https://www.breguet.com/en')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (10, N'Audemars Piguet', N'Supplier Contact Audemars Piguet', N'S', N'+49 30 9876 5432', N'https://www.audemarspiguet.com/com/en/home.html')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (11, N'Casio1', N'Supplier Contact Casio', N'J', N'+39 02 1234 5678', N'https://www.casio.com/vn/')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (12, N'Rolex1', N'Supplier Contact Rolex', N'S', N'+49 30 9876 5432', N'https://www.rolex.com/vi')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (13, N'Cartier1', N'Supplier Contact Cartier', N'F', N'+49 30 9876 5432', N'https://www.cartier.com/en-us/home')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (14, N'Omega1', N'Supplier Contact Omega', N'S', N'+49 30 9876 5432', N'https://www.omegawatches.com/')
GO
INSERT [dbo].[Suppliers] ([SupplierID], [CompanyName], [ContactName], [Country], [Phone], [HomePage]) VALUES (15, N'Longines1', N'Supplier Contact Longines', N'S', N'+49 30 9876 5432', N'https://www.longines.com/')
GO
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (14, N'11ne', N'L', N'123qqq', 2, N'images/users/user.png', N'user4@gmail.com', CAST(N'2003-04-18' AS Date), N'Hà Nội', N'7890123456', 0)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (15, N'12dau', N'M', N'123qqq', 2, N'images/users/user.png', N'user5@gmail.com', CAST(N'1998-09-03' AS Date), N'Hà Nội', N'3456789012', 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (16, N'13kia', N'Z', N'123qqq', 2, N'images/users/user.png', N'user6@gmail.com', CAST(N'1993-12-25' AS Date), N'Hà Nội', N'9012345678', 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (17, N'14day', N'X', N'123qqq', 2, N'images/users/user.png', N'user7@gmail.com', CAST(N'1991-06-10' AS Date), N'Hà Nội', N'5678901234', 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (18, N'15do', N'V', N'123qqq', 2, N'images/users/user.png', N'user8@gmail.com', CAST(N'1994-03-27' AS Date), N'Hà Nội', N'2345678901', 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (19, N'16roi', N'B', N'123qqq', 2, N'images/users/user.png', N'user9@gmail.com', CAST(N'1997-08-14' AS Date), N'Hà Nội', N'8901234567', 0)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (1, N'john_doe', N'John Doe', N'password123', 1, N'images/users/user.png', N'aaaa@gmail.com', CAST(N'2003-08-09' AS Date), N'Hà Nội', N'12345678901', 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (3, N'john_doeee', N'John Doe', N'123qqq', 2, N'images/users/user.png', N'aaaa@gmail.com', CAST(N'2003-08-09' AS Date), N'Hà Nội', N'12345678901', 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (2, N'thinh', N'Nguyen Duc Thinh', N'123456', 1, N'images/users/thinh.png', N'bimat0906@gmail.com', CAST(N'2003-08-09' AS Date), N'Thai Binh', N'0707064154', 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (4, N'user1', N'A', N'123qqq', 2, N'images/users/user1.png', N'dongnguyen1968hldh@gmail.com', CAST(N'1995-02-15' AS Date), N'Hà Nội', N'9876543210', 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (13, N'user10', N'K', N'123qqq', 2, N'images/users/user10.png', N'user10@gmail.com', CAST(N'1996-01-05' AS Date), N'Hà Nội', N'4567890123', 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (5, N'user2', N'B', N'123qqq', 2, N'images/users/user2.png', N'user2@gmail.com', CAST(N'1990-07-22' AS Date), N'Hà Nội', N'1239874560', 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (6, N'user3', N'C', N'123qqq', 2, N'images/users/user3.png', N'user3@gmail.com', CAST(N'1988-11-30' AS Date), N'Hà Nội', N'6543217890', 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (7, N'user4', N'D', N'123qqq', 2, N'images/users/user4.png', N'user4@gmail.com', CAST(N'1992-04-18' AS Date), N'Hà Nội', N'7890123456', 0)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (8, N'user5', N'E', N'123qqq', 2, N'images/users/user5.png', N'user5@gmail.com', CAST(N'1998-09-03' AS Date), N'Hà Nội', N'3456789012', 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (9, N'user6', N'F', N'123qqq', 2, N'images/users/user6.png', N'user6@gmail.com', CAST(N'1993-12-25' AS Date), N'Hà Nội', N'9012345678', 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (10, N'user7', N'G', N'123qqq', 2, N'images/users/user7.png', N'user7@gmail.com', CAST(N'1991-06-10' AS Date), N'Hà Nội', N'5678901234', 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (11, N'user8', N'H', N'123qqq', 2, N'images/users/user8.png', N'user8@gmail.com', CAST(N'1994-03-27' AS Date), N'Hà Nội', N'2345678901', 1)
GO
INSERT [dbo].[Users] ([UserID], [UserName], [FullName], [Password], [RoleID], [Image], [Email], [BirthDay], [Address], [Phone], [status]) VALUES (12, N'user9', N'I', N'123qqq', 2, N'images/users/user9.png', N'user9@gmail.com', CAST(N'1997-08-14' AS Date), N'Hà Nội', N'8901234567', 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Wallets] ON 
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (1, N'john_doe', CAST(300.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (2, N'john_doeee', CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (3, N'thinh', CAST(143120.30 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (4, N'user1', CAST(200.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (5, N'user10', CAST(150.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (6, N'user2', CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (7, N'user3', CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (8, N'user4', CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (9, N'user5', CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (10, N'user6', CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (11, N'user7', CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (12, N'user8', CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (13, N'user9', CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (14, N'11ne', CAST(20.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (15, N'12dau', CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (16, N'13kia', CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (17, N'14day', CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (18, N'15do', CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (19, N'user8', CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Wallets] ([WalletID], [UserName], [Balance]) VALUES (20, N'16roi', CAST(20.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Wallets] OFF
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetail]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_ProductDetail]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Supplier]
GO
ALTER TABLE [dbo].[Wallets]  WITH CHECK ADD  CONSTRAINT [FK_Wallets_Users] FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[Wallets] CHECK CONSTRAINT [FK_Wallets_Users]
GO
USE [master]
GO
ALTER DATABASE [Perfume_Website] SET  READ_WRITE 
GO
