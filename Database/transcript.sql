USE [master]
GO
/****** Object:  Database [Shopping]    Script Date: 1/26/2022 10:34:43 AM ******/
CREATE DATABASE [Shopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookingTour', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BookingTour.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BookingTour_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\BookingTour_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Shopping] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shopping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shopping] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Shopping] SET  MULTI_USER 
GO
ALTER DATABASE [Shopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shopping] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Shopping] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Shopping]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 1/26/2022 10:34:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](150) NOT NULL,
	[password] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 1/26/2022 10:34:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[Username] [nvarchar](150) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/26/2022 10:34:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](150) NOT NULL,
	[ClassifyID] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Classifies]    Script Date: 1/26/2022 10:34:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classifies](
	[ClassifyID] [int] NOT NULL,
	[ClassifyName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Classifies] PRIMARY KEY CLUSTERED 
(
	[ClassifyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/26/2022 10:34:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](150) NOT NULL,
	[Image] [nchar](500) NOT NULL,
	[UnitCost] [int] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([username], [password]) VALUES (N'admin', N'123456')
INSERT [dbo].[Account] ([username], [password]) VALUES (N'user1', N'pass1')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ClassifyID]) VALUES (1, N'Áo Hoodie', 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ClassifyID]) VALUES (2, N'Áo Sweater', 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ClassifyID]) VALUES (3, N'Áo Jacket', 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ClassifyID]) VALUES (4, N'Áo Phông', 1)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ClassifyID]) VALUES (5, N'Quần Dài', 2)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ClassifyID]) VALUES (6, N'Quần Short', 2)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ClassifyID]) VALUES (7, N'Mũ', 3)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [ClassifyID]) VALUES (8, N'Túi', 3)
INSERT [dbo].[Classifies] ([ClassifyID], [ClassifyName]) VALUES (1, N'TOP')
INSERT [dbo].[Classifies] ([ClassifyID], [ClassifyName]) VALUES (2, N'BOTTOM')
INSERT [dbo].[Classifies] ([ClassifyID], [ClassifyName]) VALUES (3, N'ACCESSORIES')
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (1, N'H0008 – Hoodie – Core visual ver 2.0', N'https://hanoiriot.com/wp-content/uploads/2021/12/DSCF0979-324x518.jpeg                                                                                                                                                                                                                                                                                                                                                                                                                                              ', 400000, N'– Trọng lượng vải 360grm
– Chất liệu: Nỉ bông
– Có các đường trang trí dọc 2 tay áo & giữa lưng
– Cổ tay áo và vạt áo đều là viền vải trang trí', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (2, N'H0008 – Hoodie – Core visual ver 2.0', N'https://hanoiriot.com/wp-content/uploads/2021/12/DSCF0976-324x518.jpeg                                                                                                                                                                                                                                                                                                                                                                                                                                              ', 400000, N'– Trọng lượng vải 360grm
– Chất liệu: Nỉ bông
– Có các đường trang trí dọc 2 tay áo & giữa lưng
– Cổ tay áo và vạt áo đều là viền vải trang trí', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (3, N'T0144 – Hoodie Core visual
', N'https://hanoiriot.com/wp-content/uploads/2021/10/DSCF3310-Edit-13-324x518.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                       ', 350000, N'– Chất liệu: Nỉ Cotton
– Áo có đường trang trí ở dọc 2 phần tay áo & giữa lưng áo.
– Các phần cổ tay, bo áo đều để viền vải trang trí.', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (4, N'T0144 – Hoodie Core visual', N'https://hanoiriot.com/wp-content/uploads/2021/10/DSCF3312-Edit-15-324x518.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                       ', 380000, N'– Áo dáng Oversized, với 02 túi ở bên thân áo.
– Thiết kế áo hoodie da lộn phiên bản thứ 04 của RIOT', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (5, N'T0143 – Sweater Core visual
', N'https://hanoiriot.com/wp-content/uploads/2021/10/DSCF3304-Edit-9-324x518.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                        ', 300000, N'
– Chất liệu: Cotton nỉ 
– Áo có đường may dọc hai tay áo & chính giữa phía sau lưng 
– Các đường cắt đều được trang trí', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (6, N'T0143 – Sweater Core visual
', N'https://hanoiriot.com/wp-content/uploads/2021/10/DSCF3307-Edit-11-324x518.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                       ', 300000, N'
– Chất liệu: Cotton nỉ 
– Áo có đường may dọc hai tay áo & chính giữa phía sau lưng 
– Các đường cắt đều được trang trí', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (7, N'J0027 – Symmetrical line bomber', N'https://hanoiriot.com/wp-content/uploads/2021/10/DSCF3301-Edit-7-324x518.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                        ', 500000, N'– Chất liệu: 100% Polyester
– Áo có 04 túi ở ngoài & 01 túi ở thân áo.
– Có dây phía trong để mặc được 02 kiểu.', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (8, N'J0032 – Muilti-pocket leather jacket', N'https://hanoiriot.com/wp-content/uploads/2022/01/DSCF1118-Edit-324x518.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                          ', 550000, N'– Chất liệu : da pu + lót gió
– Chi tiết áó:
+ 2 túi ở thân áo
+ 1 túi ở ngực áo
+ 1 túi ở tay trái áo
+ 1 túi ở mặt trong của áo
+ Cổ tay áo có khuy bấm & khoá kéo giúp dễ dàng điều chỉnh khi mặc', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (9, N'J0030 – Nylon With Fur Patches Jacket', N'https://hanoiriot.com/wp-content/uploads/2021/12/Screen-Shot-2021-12-13-at-16.09.40-324x518.png                                                                                                                                                                                                                                                                                                                                                                                                                     ', 550000, N'+ Áo khoác lông dễ dàng giúp bạn phối với mọi loại trang phục, nam nữ đều dễ mặc cho mọi hoàn cảnh, mọi lứa tuổi
+ Form dáng giãn, mặc thoải mái', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (10, N'T0120 – Mirrored Print Relax T-shirt ver 2.0', N'https://hanoiriot.com/wp-content/uploads/2021/04/Screen-Shot-2021-11-17-at-10.17.44-324x518.png                                                                                                                                                                                                                                                                                                                                                                                                                     ', 250000, N'– Chất liệu Cotton cao cấp – Ứng dụng kỹ thuật ép 3D để mang lại hiệu ứng nổi và tăng độ bền cho hình in logo', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (11, N'T0145 – Crystal Cluster T-shirt
', N'https://hanoiriot.com/wp-content/uploads/2021/10/Screen-Shot-2021-10-22-at-14.49.15-324x518.png                                                                                                                                                                                                                                                                                                                                                                                                                     ', 270000, N'Thiết kế mới nhất của RIOT với công nghệ in silicon cho hình in abstract, cùng Tag kim loại RIOT không gỉ trên ngực áo', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (12, N'T0120 – Mirrored Print Relax T-shirt ver 2.0', N'https://hanoiriot.com/wp-content/uploads/2021/04/Screen-Shot-2021-11-17-at-10.17.47-324x518.png                                                                                                                                                                                                                                                                                                                                                                                                                     ', 250000, N'– Chất liệu Cotton cao cấp – Ứng dụng kỹ thuật ép 3D để mang lại hiệu ứng nổi và tăng độ bền cho hình in logo', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (13, N'P0059 – Straight Pants With Back Details', N'https://hanoiriot.com/wp-content/uploads/2021/11/Screen-Shot-2021-12-01-at-17.59.52-324x518.png                                                                                                                                                                                                                                                                                                                                                                                                                     ', 400000, N'– Chất liệu: Cotton – Có đường kẻ dọc ở phía sau', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (14, N'P0058 – Tracking Pants', N'https://hanoiriot.com/wp-content/uploads/2021/11/Screen-Shot-2021-11-17-at-16.26.24-324x518.png                                                                                                                                                                                                                                                                                                                                                                                                                     ', 400000, N'– Form relax, mặc thoải mái – Quần có nhiều đường line cắt, 4 túi, trang trí tạo cảm giác khoẻ mạnh hơn', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (15, N'B0021 –  Leather Cardholder w buckle detail', N'https://hanoiriot.com/wp-content/uploads/2021/04/1-324x518.png                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', 200000, N'Mẫu Card Holder đầu tiên – độc đáo này sẽ là mảnh ghép không thể thiếu để các Rioters hoàn thiện bộ outfit của mình.', 8)
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Products]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Classifies] FOREIGN KEY([ClassifyID])
REFERENCES [dbo].[Classifies] ([ClassifyID])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Classifies]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [Shopping] SET  READ_WRITE 
GO
