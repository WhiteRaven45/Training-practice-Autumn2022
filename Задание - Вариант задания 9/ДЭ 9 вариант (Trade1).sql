USE [master]
GO
/****** Object:  Database [Trade1]    Script Date: 19.09.2022 10:56:13 ******/
CREATE DATABASE [Trade1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trade1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade1] SET  MULTI_USER 
GO
ALTER DATABASE [Trade1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade1] SET QUERY_STORE = OFF
GO
USE [Trade1]
GO
/****** Object:  View [dbo].[View_LaboratoryWork1]    Script Date: 19.09.2022 10:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_LaboratoryWork1]
AS
SELECT sys.sysfilegroups.groupid, sys.sysfilegroups.allocpolicy, sys.sysfilegroups.status, sys.sysfilegroups.groupname, sys.sysfiles.fileid, sys.sysfiles.groupid AS Expr1, sys.sysfiles.size, sys.sysfiles.maxsize, sys.sysfiles.growth, 
                  sys.sysfiles.status AS Expr2, sys.sysfiles.perf, sys.sysfiles.name, sys.sysfiles.filename
FROM     sys.sysfilegroups CROSS JOIN
                  sys.sysfiles
GO
/****** Object:  Table [dbo].[Order]    Script Date: 19.09.2022 10:56:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderClientFullName] [nvarchar](100) NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderStatusID] [int] NOT NULL,
	[OrderPickupPointID] [int] NOT NULL,
	[OrderGetCode] [int] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAFD3864B69] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPickupPoint]    Script Date: 19.09.2022 10:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPickupPoint](
	[ID] [int] NOT NULL,
	[PickupPoint] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OrderPickupPoint] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 19.09.2022 10:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK__OrderPro__817A26623EC157E8] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 19.09.2022 10:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[ID] [int] NOT NULL,
	[Status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.09.2022 10:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [image] NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductSupplier] [nvarchar](max) NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Product__2EA7DCD5EC593349] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 19.09.2022 10:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 19.09.2022 10:56:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
 CONSTRAINT [PK__User__1788CCAC55E9DE4D] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderClientFullName], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderPickupPointID], [OrderGetCode]) VALUES (1, N'Маслов Максим Иванович', CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 1, 27, 811)
INSERT [dbo].[Order] ([OrderID], [OrderClientFullName], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderPickupPointID], [OrderGetCode]) VALUES (2, N'', CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), 1, 5, 812)
INSERT [dbo].[Order] ([OrderID], [OrderClientFullName], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderPickupPointID], [OrderGetCode]) VALUES (3, N'', CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), 1, 29, 813)
INSERT [dbo].[Order] ([OrderID], [OrderClientFullName], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderPickupPointID], [OrderGetCode]) VALUES (4, N'', CAST(N'2022-05-13T00:00:00.000' AS DateTime), CAST(N'2022-05-19T00:00:00.000' AS DateTime), 1, 10, 814)
INSERT [dbo].[Order] ([OrderID], [OrderClientFullName], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderPickupPointID], [OrderGetCode]) VALUES (5, N'Симонов Михаил Тимурович', CAST(N'2022-05-14T00:00:00.000' AS DateTime), CAST(N'2022-05-20T00:00:00.000' AS DateTime), 1, 31, 815)
INSERT [dbo].[Order] ([OrderID], [OrderClientFullName], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderPickupPointID], [OrderGetCode]) VALUES (6, N'', CAST(N'2022-05-15T00:00:00.000' AS DateTime), CAST(N'2022-05-21T00:00:00.000' AS DateTime), 1, 32, 816)
INSERT [dbo].[Order] ([OrderID], [OrderClientFullName], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderPickupPointID], [OrderGetCode]) VALUES (7, N'', CAST(N'2022-05-16T00:00:00.000' AS DateTime), CAST(N'2022-05-22T00:00:00.000' AS DateTime), 1, 20, 817)
INSERT [dbo].[Order] ([OrderID], [OrderClientFullName], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderPickupPointID], [OrderGetCode]) VALUES (8, N'Павлова Ксения Михайловна', CAST(N'2022-05-17T00:00:00.000' AS DateTime), CAST(N'2022-05-23T00:00:00.000' AS DateTime), 2, 34, 818)
INSERT [dbo].[Order] ([OrderID], [OrderClientFullName], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderPickupPointID], [OrderGetCode]) VALUES (9, N'Трифонов Григорий Юрьевич', CAST(N'2022-05-18T00:00:00.000' AS DateTime), CAST(N'2022-05-24T00:00:00.000' AS DateTime), 1, 35, 819)
INSERT [dbo].[Order] ([OrderID], [OrderClientFullName], [OrderDate], [OrderDeliveryDate], [OrderStatusID], [OrderPickupPointID], [OrderGetCode]) VALUES (10, N'', CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2022-05-25T00:00:00.000' AS DateTime), 2, 36, 820)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (1, N'344288, г. Кропоткин, ул. Чехова, 1')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (2, N'614164, г.Кропоткин,  ул. Степная, 30')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (3, N'394242, г. Кропоткин, ул. Коммунистическая, 43')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (4, N'660540, г. Кропоткин, ул. Солнечная, 25')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (5, N'125837, г. Кропоткин, ул. Шоссейная, 40')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (6, N'125703, г. Кропоткин, ул. Партизанская, 49')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (7, N'625283, г. Кропоткин, ул. Победы, 46')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (8, N'614611, г. Кропоткин, ул. Молодежная, 50')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (9, N'454311, г.Кропоткин, ул. Новая, 19')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (10, N'660007, г.Кропоткин, ул. Октябрьская, 19')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (11, N'603036, г. Кропоткин, ул. Садовая, 4')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (12, N'450983, г.Кропоткин, ул. Комсомольская, 26')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (13, N'394782, г. Кропоткин, ул. Чехова, 3')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (14, N'603002, г. Кропоткин, ул. Дзержинского, 28')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (15, N'450558, г. Кропоткин, ул. Набережная, 30')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (16, N'394060, г.Кропоткин, ул. Фрунзе, 43')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (17, N'410661, г. Кропоткин, ул. Школьная, 50')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (18, N'625590, г. Кропоткин, ул. Коммунистическая, 20')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (19, N'625683, г. Кропоткин, ул. 8 Марта')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (20, N'400562, г. Кропоткин, ул. Зеленая, 32')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (21, N'614510, г. Кропоткин, ул. Маяковского, 47')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (22, N'410542, г. Кропоткин, ул. Светлая, 46')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (23, N'620839, г. Кропоткин, ул. Цветочная, 8')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (24, N'443890, г. Кропоткин, ул. Коммунистическая, 1')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (25, N'603379, г. Кропоткин, ул. Спортивная, 46')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (26, N'603721, г. Кропоткин, ул. Гоголя, 41')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (27, N'410172, г. Кропоткин, ул. Северная, 13')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (28, N'420151, г. Кропоткин, ул. Вишневая, 32')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (29, N'125061, г. Кропоткин, ул. Подгорная, 8')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (30, N'630370, г. Кропоткин, ул. Шоссейная, 24')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (31, N'614753, г. Кропоткин, ул. Полевая, 35')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (32, N'426030, г. Кропоткин, ул. Маяковского, 44')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (33, N'450375, г. Кропоткин ул. Клубная, 44')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (34, N'625560, г. Кропоткин, ул. Некрасова, 12')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (35, N'630201, г. Кропоткин, ул. Комсомольская, 17')
INSERT [dbo].[OrderPickupPoint] ([ID], [PickupPoint]) VALUES (36, N'190949, г. Кропоткин, ул. Мичурина, 26')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (1, N'B111C5', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (1, N'T238C7', 7)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (2, N'E112C6', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (2, N'T238C7', 9)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (3, N'L293S9', 8)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (3, N'M112C8', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (4, N'M294G9', 6)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (4, N'S384K2', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (5, N'Q836H4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (5, N'W874J3', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (6, N'O947D8', 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (6, N'R983K4', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (7, N'H497J3', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (7, N'N394K2', 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (8, N'P495H8', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (8, N'X846D3', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (9, N'K284U8', 3)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (9, N'V378J3', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (10, N'I483H3', 7)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (10, N'N387I8', 6)
INSERT [dbo].[OrderStatus] ([ID], [Status]) VALUES (1, N'Новый')
INSERT [dbo].[OrderStatus] ([ID], [Status]) VALUES (2, N'Завершен')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'B111C5', N'Поплин «Розовый жемчуг»', N'Поплин «Розовый жемчуг» шириной 220 см с изображением на ткани — крупные цветы, чайная роза; цветовая гамма: бледно-розовая.', N'Постельные ткани', NULL, N'БТК Текстиль', N'Раута', CAST(8500.0000 AS Decimal(19, 4)), 4, 6, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'C384D8', N'Сатин «Дымчатая роза» однотонный', N'Сатин «Дымчатая роза» однотонный шириной 250 см с изображением на ткани цветовая гамма: розовый зефир.', N'Постельные ткани', NULL, N'Империя ткани', N'Раута', CAST(1133.0000 AS Decimal(19, 4)), 3, 4, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'D938K3', N'Фланель однотонная светлая', N'Фланель однотонная светлая оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: голубая, желтая, розовая, сирень, фисташка.', N'Ткани для изделий', NULL, N'Май Фабрик', N'ГК Петров', CAST(1300.0000 AS Decimal(19, 4)), 4, 10, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'E112C6', N'Муслин «Bej»', N'Муслин «Bej» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: кофе с молоком.', N'Детские ткани', NULL, N'Империя ткани', N'ООО Афо-Тек', CAST(10500.0000 AS Decimal(19, 4)), 3, 13, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'F374S8', N'Фланель рубашечная', N'Фланель рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.', N'Ткани для изделий', NULL, N'БТК Текстиль', N'Раута', CAST(2100.0000 AS Decimal(19, 4)), 2, 5, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'H483D9', N'Фланель детская H483D9', N'Фланель детская 21212-2 шириной 90 см с изображением на ткани — россыпь звездочек; цветовая гамма: баклажан, оранжевый, розовая.', N'Детские ткани', NULL, N'Комильфо', N'ООО Афо-Тек', CAST(318.0000 AS Decimal(19, 4)), 2, 18, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'H497J3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — котята, сердечки; цветовая гамма: белоземельная, оранжевый.', N'Детские ткани', NULL, N'БТК Текстиль', N'ГК Петров', CAST(523.0000 AS Decimal(19, 4)), 2, 8, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'I483H3', N'Ткань поплин «Вивьен»', N'Ткань поплин «Вивьен» шириной 220 см с изображением на ткани — горошек; цветовая гамма: синяя, фисташка.', N'Постельные ткани', NULL, N'БТК Текстиль', N'ООО Афо-Тек', CAST(11300.0000 AS Decimal(19, 4)), 2, 5, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'K284U8', N'Бязь детская «Самолеты»', N'Бязь детская «Самолеты» шириной 150 см с изображением на ткани — игрушки, самолетики; цветовая гамма: белая, зеленая, синяя.', N'Детские ткани', NULL, N'Империя ткани', N'ГК Петров', CAST(5100.0000 AS Decimal(19, 4)), 3, 2, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'K839K3', N'Плюш белый в клетку', N'Плюш белый в клетку шириной 180 см с изображением на ткани — клетка, однотонный; цветовая гамма: белая, однотонная.', N'Детские ткани', NULL, N'Империя ткани', N'ГК Петров', CAST(765.0000 AS Decimal(19, 4)), 2, 3, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'L293S9', N'Плюш розовый гладкий', N'Плюш розовый гладкий шириной 180 см с изображением на ткани — однотонный; цветовая гамма: однотонная, розовая.', N'Детские ткани', NULL, N'Комильфо', N'Раута', CAST(30000.0000 AS Decimal(19, 4)), 3, 2, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'M112C8', N'Бязь детская «Совята»', N'Бязь детская «Совята» шириной 150 см с изображением на ткани — совы; цветовая гамма: бордо, желтая, салатовая.', N'Детские ткани', NULL, N'Империя ткани', N'Раута', CAST(26000.0000 AS Decimal(19, 4)), 2, 14, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'M294G9', N'Полотно вафельное «8 марта»', N'Полотно вафельное «8 марта» шириной 50 см с изображением на ткани — белые розы; цветовая гамма: розовая.', N'Ткани для изделий', NULL, N'Империя ткани', N'Раута', CAST(5130.0000 AS Decimal(19, 4)), 2, 1, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'M398S9', N'Поплин Мокко', N'Поплин Мокко 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: коричневая, кофе, шоколад.', N'Постельные ткани', NULL, N'Май Фабрик', N'ГК Петров', CAST(1800.0000 AS Decimal(19, 4)), 2, 6, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'N283K3', N'Сатин «Миндальный» однотонный', N'Сатин «Миндальный» однотонный шириной 250 см с изображением на ткани цветовая гамма: миндаль.', N'Постельные ткани', NULL, N'Комильфо', N'Раута', CAST(6500.0000 AS Decimal(19, 4)), 3, 7, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'N385L2', N'Сатин «Фисташковый» однотонный', N'Сатин «Фисташковый» однотонный шириной 250 см с изображением на ткани цветовая гамма: фисташка.', N'Постельные ткани', NULL, N'БТК Текстиль', N'ГК Петров', CAST(7000.0000 AS Decimal(19, 4)), 2, 2, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'N387I8', N'Полотно вафельное «Кухня»', N'Полотно вафельное «Кухня» шириной 50 см с изображением на ткани — кухня; цветовая гамма: желтая, малина.', N'Ткани для изделий', NULL, N'БТК Текстиль', N'ООО Афо-Тек', CAST(1000.0000 AS Decimal(19, 4)), 3, 5, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'N394K2', N'Ткань поплин «Лакшери»', N'Ткань поплин «Лакшери» шириной 220 см с изображением на ткани — надписи, сердечки; цветовая гамма: белая, красная, черная.', N'Постельные ткани', NULL, N'Империя ткани', N'ООО Афо-Тек', CAST(30660.0000 AS Decimal(19, 4)), 4, 15, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'O947D8', N'Ткань для скатертей под рогожку', N'Ткань для скатертей под рогожку «рис 18825» шириной 150 см с изображением на ткани — ромашки, россыпь цветов; цветовая гамма: красная, синяя.', N'Ткани для изделий', NULL, N'Май Фабрик', N'ООО Афо-Тек', CAST(3550.0000 AS Decimal(19, 4)), 3, 9, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'P495H8', N'Поплин «Густав»', N'Поплин «Густав» шириной 220 см с изображением на ткани — листья, папортник; цветовая гамма: зеленая, светло-серая.', N'Постельные ткани', NULL, N'Комильфо', N'Раута', CAST(1000.0000 AS Decimal(19, 4)), 2, 14, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'Q836H4', N'Фланель рубашечная', N'Фланель арт 535 рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.', N'Ткани для изделий', NULL, N'Май Фабрик', N'Раута', CAST(1350.0000 AS Decimal(19, 4)), 4, 7, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'R748K3', N'Поплин Морская волна', N'Поплин Морская волна 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: аквамарин, бирюзовая.', N'Постельные ткани', NULL, N'Май Фабрик', N'ГК Петров', CAST(2300.0000 AS Decimal(19, 4)), 2, 6, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'R983K4', N'Сатин «Серо-бежевый» однотонный', N'Сатин «Серо-бежевый» однотонный шириной 250 см с изображением на ткани цветовая гамма: серо-бежевая.', N'Постельные ткани', NULL, N'Империя ткани', N'ООО Афо-Тек', CAST(1645.0000 AS Decimal(19, 4)), 2, 13, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'S384K2', N'Фланель черная', N'Фланель черная оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: черная.', N'Ткани для изделий', NULL, N'БТК Текстиль', N'ГК Петров', CAST(69000.0000 AS Decimal(19, 4)), 4, 2, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'T238C7', N'Муслин «Gri»', N'Муслин «Gri» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: серая.', N'Детские ткани', NULL, N'БТК Текстиль', N'ООО Афо-Тек', CAST(6500.0000 AS Decimal(19, 4)), 2, 12, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'U947E9', N'Муслин белый горошек на однотонном фоне', N'Муслин белый горошек на однотонном фоне шириной 150 см с изображением на ткани — мелкий горошек; цветовая гамма: желтая.', N'Детские ткани', NULL, N'Империя ткани', N'ГК Петров', CAST(3411.0000 AS Decimal(19, 4)), 3, 4, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'V378J3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — котенок, облака, полумесяц, радуга; цветовая гамма: бледно-розовая, голубая, салатовая, серо-бежевая.', N'Детские ткани', NULL, N'Комильфо', N'ГК Петров', CAST(2400.0000 AS Decimal(19, 4)), 3, 14, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'W874J3', N'Ткань поплин «Натурель»', N'Ткань поплин «Натурель» шириной 220 см с изображением на ткани — мелкие цветы; цветовая гамма: пепельная, розовая.', N'Постельные ткани', NULL, N'БТК Текстиль', N'ГК Петров', CAST(1600.0000 AS Decimal(19, 4)), 3, 9, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'X846D3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — жираф, полумесяц, пчелки; цветовая гамма: темно-фиолетовая.', N'Детские ткани', NULL, N'Империя ткани', N'Раута', CAST(9300.0000 AS Decimal(19, 4)), 3, 5, N'В наличии')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductSupplier], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (N'Z937S2', N'Поплин Голубой', N'Поплин Голубой 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: голубая.', N'Постельные ткани', NULL, N'БТК Текстиль', N'Раута', CAST(9000.0000 AS Decimal(19, 4)), 2, 15, N'В наличии')
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Якушев', N'Евсей', N'Лукьевич', N'loginDEdcx2018', N'TYlFkM', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Фёдоров', N'Святослав', N'Григорьевич', N'loginDEnsa2018', N'LdqH+T', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Борисов', N'Герман', N'Дамирович', N'loginDErxm2018', N'8EavEy', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Ситников', N'Серапион', N'Фролович', N'loginDEaic2018', N'X2adoa', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Третьяков', N'Валерьян', N'Иринеевич', N'loginDEwul2018', N'uK&3Zr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Комиссарова', N'Мария', N'Владимировна', N'loginDEjgl2018', N'++04Tb', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Меркушева', N'Раиса', N'Владленовна', N'loginDEgtk2018', N'pNWXhi', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Калашникова', N'Венера', N'Якуновна', N'loginDEvrd2018', N'S7N9hz', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Комиссаров', N'Семён', N'Павлович', N'loginDExky2018', N'Kt9EAS', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Денисов', N'Митрофан', N'Егорович', N'loginDExnj2018', N'IJDdP0', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Матвиенко', N'Дамир', N'Богданович', N'loginDEnbu2018', N'86uDLd', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Кириллов', N'Константин', N'Алексеевич', N'loginDEiik2018', N'gKt2zV', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Медведьев', N'Фёдор', N'Мэлсович', N'loginDEwyi2018', N'9eskgK', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Карпов', N'Евгений', N'Лукьевич', N'loginDEpfr2018', N'mW1Q36', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Маркова', N'Евдокия', N'Артёмовна', N'loginDEjct2018', N'3WpoK9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Красильников', N'Тихон', N'Богданович', N'loginDEsmg2018', N'ApH1By', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Титов', N'Семён', N'Иринеевич', N'loginDEexu2018', N'Nt44pG', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Кудряшов', N'Борис', N'Иринеевич', N'loginDEztr2018', N'MYCgB7', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Гаврилова', N'Нинель', N'Денисовна', N'loginDEwrc2018', N'SktJa|', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Быков', N'Дмитрий', N'Валерьянович', N'loginDEzjs2018', N'|x{s+X', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Фомичёв', N'Денис', N'Федосеевич', N'loginDEeka2018', N'mLZvLv', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Белова', N'Марфа', N'Матвеевна', N'loginDEepr2018', N'BG6tpN', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Романова', N'Марина', N'Лаврентьевна', N'loginDEsnq2018', N'hrD}}g', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Беспалов', N'Демьян', N'Витальевич', N'loginDEvqn2018', N'LPa|e3', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Архипова', N'Венера', N'Демьяновна', N'loginDEery2018', N'*I0Rdi', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Носков', N'Парфений', N'Георгьевич', N'loginDElqv2018', N'Hqfw17', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Зыков', N'Иван', N'Варламович', N'loginDEtuz2018', N'Yln7JW', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Иван', N'Протасьевна', N'', N'loginDEllr2018', N'hXtdCD', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Рожков', N'Протасий', N'Альвианович', N'loginDEisy2018', N'5k5dHN', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Большакова', N'Нинель', N'Протасьевна', N'loginDEqiv2018', N'h+N2uW', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Наумова', N'Лидия', N'Донатовна', N'loginDEmfu2018', N'{ZpDBn', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Панова', N'Ольга', N'Олеговна', N'loginDEgbd2018', N'+86Nf*', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Комаров', N'Аркадий', N'Иванович', N'loginDEkdg2018', N'R0tt07', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Федосеева', N'Тамара', N'Михаиловна', N'loginDEjrs2018', N'MVg{yd', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Пестов', N'Роман', N'Михаилович', N'loginDEmvd2018', N'wyLDa{', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Блинов', N'Артём', N'Ильяович', N'loginDEctc2018', N'B&dlx+', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Владимирова', N'Полина', N'Иринеевна', N'loginDEavf2018', N'oDTttg', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Силин', N'Игнатий', N'Яковович', N'loginDEako2018', N'tD8J5+', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Кононов', N'Геннадий', N'Созонович', N'loginDEzrg2018', N'WXIgGi', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Дьячков', N'Фрол', N'Арсеньевич', N'loginDEdwq2018', N'WkTaBP', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Горбачёв', N'Арсений', N'Григорьевич', N'loginDEszg2018', N'NWkAVP', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Виноградов', N'Яков', N'Онисимович', N'loginDEmeh2018', N'HQ+m4W', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Лаврентьева', N'Валентина', N'Васильевна', N'loginDEpwm2018', N'be7AT0', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Брагин', N'Лукьян', N'Мартынович', N'loginDEnaq2018', N'I8c5EB', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Трофимов', N'Кондрат', N'Игоревич', N'loginDEtuk2018', N'6aDAzV', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Степанова', N'Глафира', N'Авксентьевна', N'loginDEhsb2018', N'n|I6A0', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Федосеев', N'Пётр', N'Григорьевич', N'loginDEaoi2018', N'Dl58m|', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Поляков', N'Николай', N'Антонович', N'loginDErmk2018', N'D3GuIv', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Медведев', N'Владимир', N'Онисимович', N'loginDEfnd2018', N'74D9|d', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'Иван', N'Мэлоровна', N'', N'loginDEtza2018', N'A7Qldh', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderPickupPoint] FOREIGN KEY([OrderPickupPointID])
REFERENCES [dbo].[OrderPickupPoint] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderPickupPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderStatus] FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[OrderStatus] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderStatus]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__403A8C7D] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__403A8C7D]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__412EB0B6] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__412EB0B6]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__UserRole__398D8EEE] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__UserRole__398D8EEE]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "sysfiles (sys)"
            Begin Extent = 
               Top = 1
               Left = 71
               Bottom = 272
               Right = 272
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sysfilegroups (sys)"
            Begin Extent = 
               Top = 7
               Left = 320
               Bottom = 170
               Right = 521
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_LaboratoryWork1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_LaboratoryWork1'
GO
USE [master]
GO
ALTER DATABASE [Trade1] SET  READ_WRITE 
GO
