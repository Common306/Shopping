USE [master]
GO
/****** Object:  Database [Shopping]    Script Date: 3/5/2022 9:48:06 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 3/5/2022 9:48:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](150) NOT NULL,
	[password] [nvarchar](150) NOT NULL,
	[isManager] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/5/2022 9:48:06 PM ******/
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
/****** Object:  Table [dbo].[Classifies]    Script Date: 3/5/2022 9:48:06 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 3/5/2022 9:48:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Time] [time](7) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/5/2022 9:48:06 PM ******/
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
INSERT [dbo].[Account] ([username], [password], [isManager]) VALUES (N'admin', N'123456', 1)
INSERT [dbo].[Account] ([username], [password], [isManager]) VALUES (N'user', N'123456', 0)
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
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (1, N'Hoodie – Core visual ver 2.0', N'https://static.dosi-in.com/images/detailed/363/dosiin-goldie-vietnam-mywana-hoodie-363433363433.jpeg                                                                                                                                                                                                                                                                                                                                                                                                                ', 400000, N'– Trọng lượng vải 360grm</br>
– Chất liệu: Nỉ bông</br>
– Có các đường trang trí dọc 2 tay áo & giữa lưng</br>
– Cổ tay áo và vạt áo đều là viền vải trang trí', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (2, N'Hoodie – Core visual ver 2.0', N'https://static.dosi-in.com/images/detailed/103/dosiin-ranverbae-industrioso-hoodie-103191103191.jpg                                                                                                                                                                                                                                                                                                                                                                                                                 ', 400000, N'– Trọng lượng vải 360grm</br>
– Chất liệu: Nỉ bông</br>
– Có các đường trang trí dọc 2 tay áo & giữa lưng</br>
– Cổ tay áo và vạt áo đều là viền vải trang trí', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (3, N'Hoodie Core visual
', N'https://static.dosi-in.com/images/detailed/220/dosiin-hanoi-riot-t-hoodie-core-visual-220343220343.jpg                                                                                                                                                                                                                                                                                                                                                                                                              ', 350000, N'– Chất liệu: Nỉ Cotton</br>
– Áo có đường trang trí ở dọc 2 phần tay áo & giữa lưng áo.
</br>– Các phần cổ tay, bo áo đều để viền vải trang trí.', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (4, N'Hoodie Core visual', N'https://cdn.mootssy.com/wp-content/uploads/2022/02/Screen-Shot-2022-02-12-at-07.22.59-800x1120.png                                                                                                                                                                                                                                                                                                                                                                                                                  ', 380000, N'– Áo dáng Oversized, với 02 túi ở bên thân áo.</br>
– Thiết kế áo hoodie da lộn', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (5, N'Sweater Core visual
', N'https://product.hstatic.net/200000216071/product/_dsc0587_a36bab32b9244cc998e2b79c54adc5c4_master.jpg                                                                                                                                                                                                                                                                                                                                                                                                               ', 300000, N'
– Chất liệu: Cotton nỉ </br>
– Áo có đường may dọc hai tay áo & chính giữa phía sau lưng</br> 
– Các đường cắt đều được trang trí', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (6, N'Sweater Core visual
', N'https://static.dosi-in.com/images/detailed/105/dosiin-myo-ao-sweater-den-105429105429.jpg                                                                                                                                                                                                                                                                                                                                                                                                                           ', 300000, N'
– Chất liệu: Cotton nỉ </br>
– Áo có đường may dọc hai tay áo & chính giữa phía sau lưng 
</br>– Các đường cắt đều được trang trí', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (7, N'Puffer Jacket', N'https://moncler-cdn.thron.com/delivery/public/image/moncler/G20911A0017368352999_F/dpx6uv/std/0x0/G20911A0017368352999_F.jpg                                                                                                                                                                                                                                                                                                                                                                                        ', 500000, N'– Chất liệu: 100% Polyester
</br>– Áo có thiết kế phù hợp với mùa đông lạnh giá', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (8, N'Bomber jacket', N'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2Ff2%2F6a%2Ff26a1549bbbdda07b467ea5648042bec755deace.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5B%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B2%5D&call=url[file:/product/main]                                                                                                                                                                                                                                                              ', 550000, N'– Chất liệu : polyeste
</br>
– Chi tiết áó:
</br>+ 2 túi ở thân áo</br>
+ 1 túi ở tay trái áo
</br>
+ 1 túi ở mặt trong của áo</br>', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (9, N'Gold Bomber Jacket', N'https://www.bolf.eu/eng_pl_Mens-Leather-Bomber-Jacket-Beige-Bolf-1147-79967_1.jpg                                                                                                                                                                                                                                                                                                                                                                                                                                   ', 550000, N'– Áo bomber dễ dàng giúp bạn phối với mọi loại trang phục, nam nữ đều dễ mặc cho mọi hoàn cảnh, mọi lứa tuổi
</br>
– Form dáng giãn, mặc thoải mái', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (10, N'Relax T-shirt', N'https://product.hstatic.net/1000042622/product/ak335-210-1_617d8a4a815d43169085386581353c38_master.jpg                                                                                                                                                                                                                                                                                                                                                                                                              ', 250000, N'– Chất liệu Cotton cao cấp', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (11, N'White T-shirt', N'https://static.dosi-in.com/images/detailed/88/dosiin-bellorum-blue-butterfly-tee-8845288452.jpeg                                                                                                                                                                                                                                                                                                                                                                                                                    ', 270000, N'– Thiết kế mới nhất với công nghệ in silicon.', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (12, N'Relax T-shirt ver 2.0', N'https://static.dosi-in.com/images/detailed/50/dosiin-ideci-ideci-singnature-tee-5064550645.jpg                                                                                                                                                                                                                                                                                                                                                                                                                      ', 250000, N'– Chất liệu Cotton cao cấp</br> – Ứng dụng kỹ thuật ép 3D để mang lại hiệu ứng nổi và tăng độ bền cho hình in logo', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (13, N'Straight Pants', N'https://hanoiriot.com/wp-content/uploads/2021/11/Screen-Shot-2021-12-01-at-18.00.03-324x518.png                                                                                                                                                                                                                                                                                                                                                                                                                     ', 400000, N'– Chất liệu: Cotton </br>– Có đường kẻ dọc ở phía sau', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (14, N'Tracking Pants', N'https://butikbos.com.my/image/butikbos/image/cache/data/all_product_images/product-1828/EX836%20(Khaki)%20A-800x800.jpg                                                                                                                                                                                                                                                                                                                                                                                             ', 400000, N'– Form relax, mặc thoải mái</br>– Quần có nhiều đường line cắt, 4 túi, trang trí tạo cảm giác khoẻ mạnh hơn', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (15, N'Leather Cardholder', N'https://cdn.shopify.com/s/files/1/0452/9497/7192/products/CARDHOLDE_ec2f7238-e6cb-4260-8804-b7b11666897e.png?v=1640502532                                                                                                                                                                                                                                                                                                                                                                                           ', 200000, N'– Mẫu Card Holder đầu tiên – độc đáo này sẽ là mảnh ghép không thể thiếu để hoàn thiện bộ outfit của mình.', 8)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (16, N'BMX Short Pants', N'https://www.kunstform.org/images/DUB-BMX-Tomorrow-Kurze-Hose-Black-2020062694214-1.jpg                                                                                                                                                                                                                                                                                                                                                                                                                              ', 250000, N'- Mẫu quần short thể thao khiến bạn cảm thấy thoải mái khi vận động', 6)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Image], [UnitCost], [Description], [CategoryID]) VALUES (17, N'Cotton Bucket Hat', N'https://lp2.hm.com/hmgoepprod?set=quality%5B79%5D%2Csource%5B%2F11%2F55%2F115579c109a25acafbc23b033433ac84fafdbfe1.jpg%5D%2Corigin%5Bdam%5D%2Ccategory%5Bmen_accessories_hatscaps%5D%2Ctype%5BDESCRIPTIVESTILLLIFE%5D%2Cres%5Bm%5D%2Chmver%5B1%5D&call=url[file:/product/main]                                                                                                                                                                                                                                      ', 150000, N'- Mũ được làm bằng 100% cotton ', 7)
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Classifies] FOREIGN KEY([ClassifyID])
REFERENCES [dbo].[Classifies] ([ClassifyID])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Classifies]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Cart_Products]
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
