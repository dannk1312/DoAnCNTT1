USE [master]
GO
/****** Object:  Database [DB_Store]    Script Date: 12/15/2020 4:14:39 PM ******/
CREATE DATABASE [DB_Store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_Store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_Store_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB_Store] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Store] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Store] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_Store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Store] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_Store] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Store] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_Store', N'ON'
GO
ALTER DATABASE [DB_Store] SET QUERY_STORE = OFF
GO
USE [DB_Store]
GO
/****** Object:  Table [dbo].[Access]    Script Date: 12/15/2020 4:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Access](
	[AccessId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [ntext] NULL,
 CONSTRAINT [PK_Access] PRIMARY KEY CLUSTERED 
(
	[AccessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/15/2020 4:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [ntext] NULL,
	[CreateDate] [date] NULL,
	[Birthday] [date] NULL,
	[Address] [ntext] NULL,
	[Phone] [char](15) NOT NULL,
	[AccessId] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 12/15/2020 4:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [ntext] NULL,
	[Introduce] [ntext] NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/15/2020 4:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [ntext] NOT NULL,
	[Introduce] [ntext] NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 12/15/2020 4:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[BillId] [int] NOT NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC,
	[BillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discuss]    Script Date: 12/15/2020 4:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discuss](
	[DiscussId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [ntext] NULL,
	[StartDate] [datetime] NULL,
	[Introduce] [ntext] NULL,
	[Username] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Discuss] PRIMARY KEY CLUSTERED 
(
	[DiscussId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EarnBill]    Script Date: 12/15/2020 4:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EarnBill](
	[BillId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[StatusId] [int] NULL,
	[Username] [varchar](50) NOT NULL,
	[Price] [money] NULL,
	[Address] [ntext] NOT NULL,
 CONSTRAINT [PK_EarnBill] PRIMARY KEY CLUSTERED 
(
	[BillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 12/15/2020 4:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [ntext] NOT NULL,
	[PublishDate] [date] NULL,
	[AuthorId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Introduce] [ntext] NULL,
	[ImagePath] [text] NULL,
	[DiscussId] [int] NULL,
	[Sale] [int] NULL,
	[Rate] [float] NULL,
	[QuantitySold] [int] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemCategory]    Script Date: 12/15/2020 4:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemCategory](
	[CategoryId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
 CONSTRAINT [PK_BookType] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemRate]    Script Date: 12/15/2020 4:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemRate](
	[ItemId] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Rate] [float] NOT NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK_BookRate] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC,
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 12/15/2020 4:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[DiscussId] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[MessageId] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[DiscussId] ASC,
	[Username] ASC,
	[MessageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 12/15/2020 4:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Content] [ntext] NOT NULL,
	[isPublic] [bit] NOT NULL,
	[DiscussId] [int] NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaidBill]    Script Date: 12/15/2020 4:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaidBill](
	[BillId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[StatusId] [int] NOT NULL,
	[PublisherId] [int] NOT NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_PaidBill] PRIMARY KEY CLUSTERED 
(
	[BillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 12/15/2020 4:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[PublisherId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [ntext] NULL,
	[Introduce] [ntext] NULL,
	[Phone] [char](15) NULL,
	[Address] [ntext] NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 12/15/2020 4:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[BillId] [int] NOT NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC,
	[BillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 12/15/2020 4:14:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Access] ON 

INSERT [dbo].[Access] ([AccessId], [Name]) VALUES (1, N'ADMIN')
INSERT [dbo].[Access] ([AccessId], [Name]) VALUES (2, N'MEMBER')
SET IDENTITY_INSERT [dbo].[Access] OFF
GO
INSERT [dbo].[Account] ([Username], [Password], [Name], [CreateDate], [Birthday], [Address], [Phone], [AccessId], [Email]) VALUES (N'admin', N'1', N'Nguyễn Khoa Đảnh', CAST(N'2000-12-13' AS Date), CAST(N'2000-12-13' AS Date), N'Việt Nam', N'0923202850     ', 1, N'dannk1312@gmail.com')
INSERT [dbo].[Account] ([Username], [Password], [Name], [CreateDate], [Birthday], [Address], [Phone], [AccessId], [Email]) VALUES (N'test', N'1', N'TESTING', CAST(N'2020-12-15' AS Date), CAST(N'2000-01-01' AS Date), N'Việt Nam', N'19006068       ', 2, N'dannk1312@gmail.com')
INSERT [dbo].[Account] ([Username], [Password], [Name], [CreateDate], [Birthday], [Address], [Phone], [AccessId], [Email]) VALUES (N'trunghieu', N'123456', N'Bùi Trung Hiếu', CAST(N'2020-12-15' AS Date), CAST(N'2000-01-01' AS Date), N'Việt Nam', N'19006068       ', 2, N'dannk1312@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (3, N'Bộ GD', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (4, N'Nhiều Tác Giả', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (5, N'Cristiano Ronaldo', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (6, N'David Beckham', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (7, N'Nguyễn Khoa Đảnh', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (8, N'Bùi Trung Hiếu', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (9, N'Phùng Vĩnh Đức', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (10, N'Huỳnh Thanh Tâm', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (11, N'Davinci', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (12, N'Người Làm Báo', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (13, N'Kevin ', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (14, N'Uyên Phương', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (15, N'Đinh Quốc Phương', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (16, N'Phương Linh', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (17, N'Như Ngọc', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (18, N'Yến Thanh', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (19, N'Kim Yến', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (20, N'Đỗ Đức Anh', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (21, N'Hồ Duy Tân', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (22, N'Phùng Công Chiến', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (23, N'Hồ Đức Thiện', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (24, N'Hoàng Quốc Việt', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (25, N'Lê Kim Ngân', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (26, N'Bùi Đan Bích Ngọc', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (27, N'Vũ Thị Hồng Hậu', NULL)
INSERT [dbo].[Author] ([AuthorId], [Name], [Introduce]) VALUES (28, N'Phạm Nhật Bình ', NULL)
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name], [Introduce]) VALUES (33, N'Sách Giáo Khoa', NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [Introduce]) VALUES (34, N'Văn Học', NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [Introduce]) VALUES (35, N'Phiêu Lưu', NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [Introduce]) VALUES (36, N'Kỳ Ảo', NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [Introduce]) VALUES (37, N'Hành Động', NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [Introduce]) VALUES (38, N'Tiểu Thuyết', NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [Introduce]) VALUES (39, N'Lịch Sử', NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [Introduce]) VALUES (40, N'Khoa học công nghệ ', NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [Introduce]) VALUES (41, N'Tâm Lý', NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [Introduce]) VALUES (42, N'Giáo Dục', NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [Introduce]) VALUES (43, N'Thiếu Nhi', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Delivery] ([ItemId], [Quantity], [Price], [BillId]) VALUES (18, 1, 10000.0000, 1007)
INSERT [dbo].[Delivery] ([ItemId], [Quantity], [Price], [BillId]) VALUES (20, 1, 20000.0000, 1007)
INSERT [dbo].[Delivery] ([ItemId], [Quantity], [Price], [BillId]) VALUES (20, 1, 20000.0000, 1008)
INSERT [dbo].[Delivery] ([ItemId], [Quantity], [Price], [BillId]) VALUES (21, 3, 12000.0000, 1009)
GO
SET IDENTITY_INSERT [dbo].[Discuss] ON 

INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (8, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Tiếng Việt 1', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (9, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Đêm Chile', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (10, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Đêm Chile', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (11, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Tiếng Vọng Trong Lòng Đất', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (12, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Năm Đầu Tiên Khi Tôi Ba Mươi ', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (13, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Kim Cương Đoạt Mạng', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (14, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Michelangelo - Sáu Kiệt Tác Cuộc Đời', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (15, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Số "Nhọ" Không Đọ Được Lạc Quan', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (16, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Shout! The Beatles: Hơi Thở Thời Đại Của Thế Kỷ 20', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (17, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Tự Truyện Của Scott Kelly: Endurance ', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (18, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Mùa Thanh Xuân', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (19, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Dám Lựa Chọn', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (20, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Để Đời Nhàn Tênh', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (21, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Cách Để Yêu 1 Người', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (22, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Cách Để Về Hưu An Nhàn', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (23, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Cách Để Tự Bảo Vệ Mình', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (24, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Cách Để Về Hưu An Nhàn', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (25, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Thói Quen Nhỏ, Thay Đổi Lớn', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (26, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Thói Quen Nhỏ, Thay Đổi Lớn', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (27, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Thói Quen Hạnh Phúc', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (28, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Độc Thoại Nội Tâm Làm Chủ Cuộc Sống', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (29, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Học Làm Người Lớn', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (30, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Tư Duy Lười Biếng', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (31, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Mĩ Phẩm Trí Tuệ', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (32, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Chìa Khóa Hạnh Phúc', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (33, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Yêu Thương Ở Lại', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (34, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Bẫy Tình Yêu - Tập 2', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (35, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Hajime Là Số 1 - Tập 15', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (36, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Tuổi Dậy Thì Ti Tỉ Chuyện', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (37, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Phẩm Cách Quốc Gia', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (38, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Từ Điển Tiếng "Em"', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (39, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Tình Dục Không Chỉ Là "Chuyện Ấy"', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (40, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Sổ Tay Nhà Thôi Miên 2', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (41, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Công Thức Hạnh Phúc', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (42, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Osho: Đàn Ông', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (43, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Nguyễn Tri Phương', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (44, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Đây Là Van Gogh', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (45, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Đây Là Matisse', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (46, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Thiền Sư Và Em Bé 5 Tuổi', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (47, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Cúi Lạy Trước Hỏi Sau', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (48, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Dẫu Có Ra Đi Vẫn Sẽ Cười', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (49, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Đường Mây Trên Đất Hoa', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (50, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Lên Đồng - Hành Trình Của Thần Linh Và Thân Phận', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (51, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Tinh Vân Thiền Thoại', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (52, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Làm Cha Mẹ Tỉnh Thức - Chuyển Hóa Bản Thân, Trao Quyền Cho Con Cái', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (53, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Ba Từ Nhiệm Màu', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (54, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách 52 Thực Đơn Nấu Ăn Chay Trong Gia Đình', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (55, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Thực Hành Giáo Dục Nhân Cách Giúp Trẻ Trưởng Thành, Hạnh Phúc Và Vững Vàng', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (56, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Cá Voi Dài Bao Nhiêu?', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (57, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Bọ Rùa Nặng Chừng Nào?', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (58, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Xì Xà Xì Xụp', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (59, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Khi Bố Còn Thơ', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (60, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Dưỡng Trí Não Con Tinh', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (61, N'#TL', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về sách Phép Mầu Ở Những Vùng Đất Lạ Kỳ', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (62, N'#New', CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'Nói về tin tức', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (64, N'#Test', CAST(N'2020-12-15T00:53:18.597' AS DateTime), N'<p>Đăng thử 1 b&agrave;i</p>
', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (65, N'#Test', CAST(N'2020-12-15T00:54:24.697' AS DateTime), N'<p>Đăng thử lần 2</p>
', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (1070, N'#TL', CAST(N'2020-12-15T13:55:54.937' AS DateTime), N'Nói về sách Sách Tạo Thử', N'admin')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (1071, N'#Search', CAST(N'2020-12-15T14:29:03.020' AS DateTime), N'<p>T&igrave;m s&aacute;ch</p>
', N'test')
INSERT [dbo].[Discuss] ([DiscussId], [Name], [StartDate], [Introduce], [Username]) VALUES (1072, N'#New', CAST(N'2020-12-15T14:30:04.190' AS DateTime), N'Nói về tin tức', N'test')
SET IDENTITY_INSERT [dbo].[Discuss] OFF
GO
SET IDENTITY_INSERT [dbo].[EarnBill] ON 

INSERT [dbo].[EarnBill] ([BillId], [Date], [StatusId], [Username], [Price], [Address]) VALUES (1007, CAST(N'2020-12-15T14:25:57.360' AS DateTime), 4, N'test', 30000.0000, N'Việt Nam')
INSERT [dbo].[EarnBill] ([BillId], [Date], [StatusId], [Username], [Price], [Address]) VALUES (1008, CAST(N'2020-12-15T14:26:11.340' AS DateTime), 5, N'test', NULL, N'')
INSERT [dbo].[EarnBill] ([BillId], [Date], [StatusId], [Username], [Price], [Address]) VALUES (1009, CAST(N'2020-12-15T14:26:18.200' AS DateTime), 1, N'test', 36000.0000, N'Việt Nam')
SET IDENTITY_INSERT [dbo].[EarnBill] OFF
GO
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (18, N'Tiếng Việt 1', CAST(N'2000-01-01' AS Date), 3, 99, 10000.0000, N'<p>S&aacute;ch được bi&ecirc;n soạn theo chuẩn kiến thức v&agrave; kỹ năng chương tr&igrave;nh gi&aacute;o dục tiểu học của Bộ gi&aacute;o dục v&agrave; Đ&agrave;o tạo gi&uacute;p c&aacute;c em học sinh lớp 1 bắt đầu l&agrave;m quen với chữ viết một c&aacute;ch dễ hiểu nhất.</p>
', N'https://product.hstatic.net/200000122283/product/sanpham_shopping1_080be1f2f1dd486b8e070b658e573513_master.jpg', 8, NULL, 5, 1)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (20, N'Đêm Chile', CAST(N'2001-12-31' AS Date), 3, 49, 20000.0000, N'<p><strong>Đ&ecirc;m Chile</strong>&nbsp;kể về c&acirc;u chuyện của một vị linh mục đang hấp hối tr&ecirc;n giường bệnh v&agrave; biết m&igrave;nh sắp ra đi. Tại đ&acirc;y, &ocirc;ng đ&atilde; th&uacute; nhận về sự t&agrave;n bạo của chế độ độc t&agrave;i ở Chile những năm 70. &Ocirc;ng cũng kể về một trong những người bạn của m&igrave;nh, một người phụ nữ đ&atilde; th&agrave;nh lập một Đảng lớn ngay trong ch&iacute;nh ng&ocirc;i nh&agrave; của c&ocirc;. Trong ng&ocirc;i nh&agrave; ấy c&oacute; một căn hầm b&iacute; mật m&agrave; ở đ&oacute; rất nhiều người đ&atilde; bị tra tấn cho đến chết.</p>

<p><strong>Đ&ecirc;m Chile</strong>&nbsp;l&agrave; một truyện d&agrave;i phản &aacute;nh hai vấn đề gai g&oacute;c ở đất nước Nam Mỹ n&agrave;y. Thứ nhất l&agrave; nền d&acirc;n chủ chỉ mang t&iacute;nh h&igrave;nh thức, nơi những gi&aacute;o điều về tự do v&agrave; thực tế đời sống kh&aacute;c nhau một trời một vực. Chile chỉ l&agrave; một nơi d&acirc;n chủ tr&ecirc;n danh nghĩa, kh&ocirc;ng kh&aacute;c đất nước Cuba trước c&aacute;ch mạng 1959 l&agrave; mấy. Thứ hai l&agrave; hệ quả của nền d&acirc;n chủ đ&oacute; đối với văn học nghệ thuật. Ở Chile, nghệ thuật bị b&oacute;p chết, văn học đang hấp hối.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/213/213/detailed/184/dem-chile.jpg', 10, NULL, 0, 1)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (21, N'Tiếng Vọng Trong Lòng Đất', CAST(N'2000-02-01' AS Date), 3, 50, 12000.0000, N'<p>Với th&agrave;nh c&ocirc;ng từ cuốn s&aacute;ch &quot;&Aacute;m ảnh kinh ho&agrave;ng&quot;, t&aacute;c giả Mike Omer tiếp tục ra mắt bạn đọc Việt Nam cuốn s&aacute;ch thứ hai trong series trinh th&aacute;m tội phạm học: Zoe Bentley series.&nbsp;<strong>Tiếng Vọng Trong L&ograve;ng Đất</strong>&nbsp;l&agrave; sự ph&aacute;t triển từ c&aacute;i kết vẫn c&ograve;n bỏ ngỏ trong &quot;&Aacute;m ảnh kinh ho&agrave;ng&quot;. Zoe sẽ đối diện thế n&agrave;o khi nhận được bức ảnh nhuốm m&agrave;u u &aacute;m từ t&ecirc;n s&aacute;t thủ?</p>

<p>V&agrave; h&agrave;ng loạt những điều kinh ho&agrave;ng dồn dập đến...</p>

<p><strong>Tiếng Vọng Trong L&ograve;ng Đất</strong>&nbsp;kể về một t&ecirc;n s&aacute;t nh&acirc;n t&agrave;n nhẫn v&agrave; chứng hoang tưởng bệnh hoạn của hắn. C&ugrave;ng với người cộng sự l&agrave; Đặc vụ Tatum Gray, Tiến sĩ Zoe Bentley sử dụng khả năng khắc học của c&ocirc; để t&igrave;m ra một trong những t&ecirc;n tội phạm nguy hiểm nhất, kẻ c&oacute; biệt danh l&agrave; Schrodinger v&agrave; xem c&aacute;c nạn nh&acirc;n của hắn l&agrave; vật th&iacute; nghiệm.</p>

<p>Một video trực tuyến ghi lại h&igrave;nh ảnh một c&ocirc; g&aacute;i đang c&agrave;o cấu nắp quan t&agrave;i của m&igrave;nh bằng tay kh&ocirc;ng ch&iacute;nh l&agrave; điều tồi tệ nhất m&agrave; nh&agrave; t&acirc;m l&yacute; học ph&aacute;p chứng Zoe Bentley của FBI từng chứng kiến. Tệ hơn nữa ch&iacute;nh l&agrave; ẩn &yacute; nằm sau ti&ecirc;u đề của video: &ldquo;Th&iacute; Nghiệm Thứ Nhất.&rdquo;</p>

<p>Zoe v&agrave; cộng sự của c&ocirc; l&agrave; Đặc vụ Tatum Gray khẩn trương truy t&igrave;m t&ecirc;n qu&aacute;i vật đứng sau video kinh ho&agrave;ng n&agrave;y, nhưng video thứ hai nhanh ch&oacute;ng xuất hiện tr&ecirc;n mạng v&agrave; lại c&oacute; th&ecirc;m một c&ocirc; g&aacute;i bị s&aacute;t hại. Trong khi đ&oacute;, bản th&acirc;n Zoe cũng bị &aacute;m ảnh bởi một t&ecirc;n s&aacute;t nh&acirc;n kh&aacute;c. Rod Glover đ&atilde; gi&agrave;y v&ograve; tinh thần của c&ocirc; kể từ l&uacute;c nhỏ v&agrave; cuộc tấn c&ocirc;ng mới nhất của hắn ch&iacute;nh l&agrave; một tấm ảnh đ&aacute;ng sợ giữa Glover v&agrave; em g&aacute;i của Zoe. Khi Glover dần chuyển sự đe dọa từ tra tấn tinh thần sang h&agrave;nh động, Zoe giờ đ&acirc;y bị giằng x&eacute; giữa an nguy của người th&acirc;n v&agrave; t&iacute;nh mạng của một c&ocirc; g&aacute;i v&ocirc; tội đang cận kề c&aacute;i chết.</p>

<p>C&ocirc; phải suy nghĩ thật nhanh để ngăn chặn một vụ &aacute;n mạng kh&aacute;c. Khi t&iacute;nh mạng em g&aacute;i đang l&acirc;m v&agrave;o cảnh ng&agrave;n c&acirc;n treo sợi t&oacute;c, bản th&acirc;n Zoe cũng gặp nguy hiểm hơn bao giờ hết. Mặc d&ugrave; đ&atilde; biết r&otilde; c&ocirc;ng việc n&agrave;y c&oacute; thể khiến c&ocirc; thiệt mạng bất cứ l&uacute;c n&agrave;o, nhưng giờ đ&acirc;y c&ocirc; cho rằng c&aacute;i chết của m&igrave;nh sẽ đến sớm hơn dự t&iacute;nh.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/184/tieng-vong-trong-long-dat.jpg', 11, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (22, N'Năm Đầu Tiên Khi Tôi Ba Mươi ', CAST(N'2003-12-31' AS Date), 3, 0, 25000.0000, N'<p>Hai mươi tuổi. Ch&uacute;ng ta h&atilde;y c&ograve;n trẻ. Tuổi trẻ v&ocirc; gi&aacute;. Ba mươi tuổi, ch&uacute;ng ta c&oacute; g&igrave;, ch&uacute;ng ta t&igrave;m kiếm điều g&igrave;? Kh&ocirc;ng c&ograve;n trẻ, cũng chẳng phải đ&atilde; gi&agrave;, ch&iacute;nh c&aacute;i ẩm ương mới thật đ&aacute;ng sợ. V&agrave; c&oacute; lẽ sẽ đ&aacute;ng sợ hơn khi năm ba mươi ta c&ograve;n l&agrave; một b&agrave; c&ocirc; ế. Dứt kho&aacute;t chọn phấn đấu kiếm tiền, l&agrave;m một người phụ nữ độc lập, qua qu&yacute;t vội v&agrave;ng với y&ecirc;u đương nam nữ, hay đầu tư hẳn hoi x&acirc;y dựng một gia đ&igrave;nh v&agrave; ngập ngụa trong đống rắc rối m&agrave; h&ocirc;n nh&acirc;n mang lại.</p>

<p>Nh&acirc;n vật Trần T&ocirc; cho ta thấy một c&aacute;i t&ocirc;i m&acirc;u thuẫn v&agrave; hoang mang trước tuổi t&aacute;c điển h&igrave;nh đến kh&ocirc;ng thể điển h&igrave;nh hơn, d&ugrave; bạn đ&atilde; ngẩp ngh&eacute; ba mươi, qua ba mươi hay đang ở độ đ&ocirc;i mươi phơi phới.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/184/nam-dau-tien-khi-toi-ba-muoi.jpg', 12, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (23, N'Kim Cương Đoạt Mạng', CAST(N'2009-04-22' AS Date), 3, 0, 25000.0000, N'<p>Buổi s&aacute;ng cuối tuần tĩnh lặng ở khu phố 47, quận Kim cương bỗng chốc bị khuấy động bởi tin tức về vụ thảm s&aacute;t ba mạng người tại một tiệm trang sức. Nạn nh&acirc;n l&agrave; một nghệ nh&acirc;n cắt kim cương c&oacute; tiếng c&ugrave;ng một đ&ocirc;i uy&ecirc;n ương đang sắp sửa trao nhau chiếc nhẫn thề hẹn trăm năm. Số kim cương trị gi&aacute; cả nửa triệu đ&ocirc;-la trong cửa tiệm vẫn c&ograve;n nguy&ecirc;n vẹn trong khi c&aacute;c nạn nh&acirc;n bị tra tấn cho đến chết. Đ&acirc;y chắc chắn kh&ocirc;ng phải một vụ &aacute;n cướp của giết người th&ocirc;ng thường. Vậy mục đ&iacute;ch thực sự của t&ecirc;n s&aacute;t nh&acirc;n l&agrave; g&igrave;?</p>

<p>Chưa dừng lại ở đ&oacute;, c&aacute;c vụ tấn c&ocirc;ng li&ecirc;n tiếp xảy ra trong th&agrave;nh phố m&agrave; đối tượng hướng đến lu&ocirc;n l&agrave; c&aacute;c cặp đ&ocirc;i vừa mới đ&iacute;nh h&ocirc;n. T&ecirc;n s&aacute;t nh&acirc;n muốn lấy đi mạng sống của c&aacute;c nạn nh&acirc;n trong những khoảnh khắc qu&yacute; gi&aacute; nhất của họ - sau cuộc gặp của họ với b&ecirc;n tổ chức đ&aacute;m cưới, l&uacute;c họ lựa chọn nhẫn đ&iacute;nh h&ocirc;n hay sau khi c&ocirc; d&acirc;u vừa mặc thử chiếc v&aacute;y cưới ho&agrave;n hảo cho c&aacute;i ng&agrave;y m&agrave; c&oacute; thể sẽ kh&ocirc;ng bao giờ tới.</p>

<p>T&ecirc;n s&aacute;t nh&acirc;n vẫn &acirc;m thầm, lạnh l&ugrave;ng v&agrave; k&iacute;n kẽ đi tr&ecirc;n con đường của ri&ecirc;ng hắn, cẩn thận x&oacute;a bỏ mọi dấu vết v&agrave; giấu giếm chấp niệm trả th&ugrave; bệnh hoạn của m&igrave;nh trong khi đầu mối mơ hồ duy nhất m&agrave; thanh tra Rhyme c&ugrave;ng cộng sự của anh c&oacute; được l&agrave; cậu trai đang học việc tại tiệm trang sức. Tuy nhi&ecirc;n, đối tượng n&agrave;y lại lu&ocirc;n tho&aacute;t khỏi tầm tay của họ, kể cả l&uacute;c tưởng như đ&atilde; sa lưới mai phục tới nơi&hellip;</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/184/kim-cuong-doat-mang.jpg', 13, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (24, N'Michelangelo - Sáu Kiệt Tác Cuộc Đời', CAST(N'2010-02-12' AS Date), 3, 0, 92000.0000, N'<p>T&aacute;c phẩm n&agrave;y l&agrave; một bản tiểu sử đầy cuốn h&uacute;t về Michelangelo &ndash; Người đ&atilde; mang lại vị thế cao cho giới nghệ sĩ trong x&atilde; hội, với giọng kể trung dung dẫn dắt người đọc hiểu về bối cảnh x&atilde; hội v&agrave; cuộc đời người nghệ sĩ th&ocirc;ng qua việc ph&acirc;n t&iacute;ch 6 kiệt t&aacute;c của &ocirc;ng.</p>

<p>Dưới ng&ograve;i b&uacute;t của&nbsp; Miles J.Unger, Michelangelo được t&aacute;i hiện kh&ocirc;ng chỉ với t&agrave;i năng c&ugrave;ng tr&iacute; tưởng tượng đỉnh cao của một nghệ sĩ mang tinh thần c&aacute;ch mạng độc đ&aacute;o, m&agrave; c&ograve;n bởi những lời đồn đại về t&iacute;nh c&aacute;ch v&agrave; những lời t&aacute;n tụng của người đương thời, nhiều trong số đ&oacute; do &ocirc;ng khởi ph&aacute;t. Sự m&acirc;u thuẫn trong nội t&acirc;m l&agrave; điểm nổi bật của t&aacute;c phẩm n&agrave;y, n&oacute; kh&ocirc;ng chỉ chi phối t&igrave;nh cảm v&agrave; t&acirc;m tư của Michelangelo, m&agrave; c&ograve;n đi theo cuộc đời s&aacute;ng t&aacute;c nghệ thuật của &quot;Người si&ecirc;u ph&agrave;m&quot; xứ Florence.</p>

<p>Men theo c&aacute;c cột mốc l&agrave; 6 kiệt t&aacute;c nghệ thuật gắn liền với sự nghiệp của Michelangelo, t&aacute;c giả Unger đ&atilde; lột tả th&agrave;nh c&ocirc;ng ch&acirc;n dung một người nghệ sĩ đại t&agrave;i nổi tiếng kh&ocirc;ng chỉ trong thời kỳ Phục Hưng m&agrave; với cả những người h&acirc;m mộ nghệ thuật n&oacute;i chung v&agrave; đi&ecirc;u khắc c&ugrave;ng hội họa &Yacute; n&oacute;i ri&ecirc;ng.</p>

<p>B&igrave;a s&aacute;ch cũng mang tới sự t&ograve; m&ograve; đ</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/184/michelangelo-sau-kiet-tac-cuoc-doi.jpg', 14, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (25, N'Số "Nhọ" Không Đọ Được Lạc Quan', CAST(N'2008-12-02' AS Date), 3, 0, 120000.0000, N'<p>Trong b&agrave;i hit Đừng y&ecirc;u nữa, em mệt rồi của c&ocirc; ca sĩ Min c&oacute; c&acirc;u: &ldquo;Cứ đi rồi sẽ đến, cứ im lặng sẽ qua&rdquo; nhưng v&agrave;o c&aacute;i thuở thơ ấu của t&ocirc;i ấy m&agrave;, c&acirc;u h&aacute;t n&agrave;y c&oacute; lẽ n&ecirc;n đổi th&agrave;nh &ldquo;Cứ đi rồi sẽ ng&atilde;, cứ số &lsquo;nhọ&rsquo; m&atilde;i th&ocirc;i&rdquo;&hellip; mới l&agrave; chuẩn. Ai đời con g&aacute;i con đứa m&agrave; tay ch&acirc;n sứt sẹo hết cả, hết ng&atilde; chỗ n&agrave;y rồi lại va đập chỗ kia.&hellip;</p>

<p>D&ugrave; chẳng biết thực hư chuyện cuộc đời t&ocirc;i c&oacute; phải bị &ldquo;l&acirc;y đen&rdquo; từ một cơn b&atilde;o hay kh&ocirc;ng, bởi chẳng nh&agrave; khoa học n&agrave;o chứng minh được điều ấy nhưng quả thật, t&ocirc;i đ&atilde; trải qua 24 năm cuộc đời với kh&aacute; nhiều chuyện đen đủi một c&aacute;ch kh&ocirc;i h&agrave;i m&agrave; t&ocirc;i xin được kể lại ch&uacute;ng ở những phần kế tiếp đ&acirc;y.</p>

<p>Nếu lỡ sinh ra &ldquo;nhọ&rdquo; hơn người kh&aacute;c?</p>

<p>Th&igrave; t&ocirc;i sẽ d&otilde;ng dạc m&agrave; trả lời với cuộc đời n&agrave;y rằng: Số &ldquo;nhọ&rdquo; kh&ocirc;ng đọ được lạc quan!</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/184/so-nho-khong-do-duoc-lac-quan.jpg', 15, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (26, N'Shout! The Beatles: Hơi Thở Thời Đại Của Thế Kỷ 20', CAST(N'2013-02-22' AS Date), 4, 0, 190000.0000, N'<p><strong><em>&ldquo;Kh&oacute; m&agrave; tưởng tượng được c&oacute; một thế hệ n&agrave;o kh&aacute;c c&oacute; thể l&agrave; hiện th&acirc;n cho tuổi trẻ ho&agrave;n hảo hơn l&agrave; The Beatles.&rdquo;</em></strong></p>

<p><strong>Shout! The Beatles: Hơi Thở Thời Đại Của Thế Kỷ 20</strong>&nbsp;được ph&aacute;t h&agrave;nh lần đầu năm 1981. Phi&ecirc;n bản do Sống ph&aacute;t h&agrave;nh được xuất bản năm 2004 bởi Pan Books. Cuốn s&aacute;ch trở th&agrave;nh bestseller ngay khi mới ph&aacute;t h&agrave;nh năm 1981, đến nay được dịch ra nhiều thứ tiếng v&agrave; đ&atilde; b&aacute;n được hơn 1 triệu bản.</p>

<p>Đ&acirc;y l&agrave; t&aacute;c phẩm tiểu sử về ban nhạc c&oacute; ảnh hưởng nhất thế giới, một bản tường thuật tuyệt đẹp về cuộc sống, &acirc;m nhạc v&agrave; thời đại của họ. Cuốn s&aacute;ch cho thấy sự trỗi dậy của bốn ch&agrave;ng trai Liverpool cộc cằn từ những ng&agrave;y đầu hoang d&atilde;, h&agrave;i hước đến đỉnh cao đ&aacute;ng kinh ngạc của Beatlemania, từ sự hỗn loạn của Apple v&agrave; sự sụp đổ của chủ nghĩa l&yacute; tưởng hippy cho đến sự chia rẽ t&agrave;n khốc của ban nhạc.</p>

<p>N&oacute; cũng m&ocirc; tả cuộc đấu tranh của họ để tho&aacute;t khỏi di sản của Beatles, v&agrave; c&aacute;i chết bi thảm của John Lennon v&agrave; George Harrison. D&iacute; dỏm, s&acirc;u sắc v&agrave; cảm động, cuốn s&aacute;ch kh&ocirc;ng chỉ cho người h&acirc;m mộ Beatles m&agrave; cho bất cứ ai c&oacute; hứng th&uacute; với nhạc pop.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/184/shout-hoi-tho-thoi-dai-cua-the-ky-20.jpg', 16, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (27, N'Tự Truyện Của Scott Kelly: Endurance ', CAST(N'2011-12-12' AS Date), 4, 0, 125000.0000, N'<p>Cuốn s&aacute;ch l&agrave; hồi k&yacute; của Scott Kelly kể lại nhiệm vụ Year in Space của anh tr&ecirc;n Trạm Vũ trụ Quốc tế. Trải qua bốn lần bay v&agrave;o vũ trụ v&agrave; trở th&agrave;nh người Mỹ giữ kỷ lục 340 li&ecirc;n tiếp trong kh&ocirc;ng gian, Kelly đ&atilde; trải qua những ho&agrave;n cảnh khắc nghiệt.</p>

<p>Đưa ch&uacute;ng ta trở lại thời thơ ấu ở New Jersey của m&igrave;nh, Kelly kể về nguồn cảm hứng tuổi trẻ đ&atilde; dẫn lối cho anh tr&ecirc;n con đường sự nghiệp đ&aacute;ng kinh ngạc của m&igrave;nh. Cuốn s&aacute;ch cũng tr&igrave;nh b&agrave;y chi tiết những th&aacute;ch thức gay gắt của chuyến bay d&agrave;i hạn, cũng như những t&aacute;c động t&agrave;n ph&aacute; về thể chất v&agrave; t&acirc;m l&yacute; của thời gian k&eacute;o d&agrave;i trong kh&ocirc;ng gian.</p>

<p>Scott Kelly viết về nhiều điều th&uacute; vị tr&ecirc;n kh&ocirc;ng gian, chẳng hạn như việc bản th&acirc;n anh v&agrave; đồng đội đ&atilde; trở th&agrave;nh đối tượng của một nghi&ecirc;n cứu về những t&aacute;c động của du h&agrave;nh vũ trụ l&ecirc;n cơ thể người, hoặc đơn giản hơn, anh m&ocirc; tả một thứ m&ugrave;i kh&ocirc;ng gian giống như m&ugrave;i ph&aacute;o hoa bắn v&agrave;o ng&agrave;y Quốc kh&aacute;nh Mỹ. Trong cuốn s&aacute;ch c&oacute; nhiều chi tiết sẽ thu h&uacute;t được những người đam m&ecirc; kh&aacute;m ph&aacute; kh&ocirc;ng gian, từ c&aacute;c quy tr&igrave;nh v&agrave; kỹ thuật du h&agrave;nh vũ trụ đến c&aacute;c thử nghiệm khoa học nghi&ecirc;m ngặt, cũng như việc ghi lại nhật k&yacute; theo d&otilde;i đầy đủ t&acirc;m trạng cũng như t&igrave;nh trạng sức khoẻ của phi h&agrave;nh gia. Ngo&agrave;i ra, t&aacute;c giả cũng đề cập đến những ảnh hưởng của c&ocirc;ng việc tới cuộc sống gia đ&igrave;nh m&igrave;nh.</p>

<p>Cuối c&ugrave;ng, Kelly n&oacute;i r&otilde; rằng sao Hỏa l&agrave; bi&ecirc;n giới tiếp theo của nh&acirc;n loại về t&agrave;u bay vũ trụ.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/184/endurance-hanh-trinh-khong-gian.jpg', 17, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (28, N'Mùa Thanh Xuân', CAST(N'2005-02-03' AS Date), 3, 0, 212323.0000, N'<p>M&Ugrave;A THANH XU&Acirc;N l&agrave; c&acirc;u chuyện bắt đầu bằng một ng&agrave;y th&aacute;ng Bảy nắng gi&oacute; chan h&ograve;a, tiếng ve r&acirc;m ran khắp s&acirc;n trường b&aacute;o hiệu m&ugrave;a học mới.</p>

<p>Đ&oacute; l&agrave; ng&agrave;y đầu ti&ecirc;n của những năm th&aacute;ng cấp ba tươi đẹp, ch&uacute;ng t&ocirc;i t&igrave;nh cờ gặp nhau, t&igrave;nh cờ trở th&agrave;nh bạn rồi th&agrave;nh tri kỉ.</p>

<p>M&Ugrave;A THANH XU&Acirc;N l&agrave; cuốn băng Cassette chầm chậm ph&aacute;t đi ph&aacute;t lại để t&ocirc;i kh&ocirc;ng qu&ecirc;n rằng thật ra bản th&acirc;n đ&atilde; từng trải qua những chuyện vui buồn, đ&atilde; từng gặp những con người tốt như thế.</p>

<p>M&Ugrave;A THANH XU&Acirc;N l&agrave; nơi lưu giữ lại những kỷ niệm, những ng&agrave;y th&aacute;ng học tr&ograve; b&ecirc;n nhau hồn nhi&ecirc;n thế, ng&acirc;y ng&ocirc; thế m&agrave; cũng m&atilde;nh liệt, ngập tr&agrave;n cảm x&uacute;c đến thế.</p>

<p>Nơi đầu ti&ecirc;n t&ocirc;i gặp cậu, nơi đầu ti&ecirc;n t&ocirc;i gặp họ, nơi đầu ti&ecirc;n ta gặp nhau&hellip;</p>

<p>N&agrave;y Bạch Dương hồn nhi&ecirc;n bướng bỉnh, Thi&ecirc;n B&igrave;nh ấm &aacute;p đ&aacute;ng y&ecirc;u, Xử Nữ xinh đẹp cầu to&agrave;n, Song Ngư y&ecirc;u gh&eacute;t r&otilde; r&agrave;ng&hellip; ơi, ch&uacute;ng ta liệu c&ograve;n gặp lại nhau kh&ocirc;ng?</p>

<p>&ldquo;Chia tay chưa bao giờ l&agrave; kết th&uacute;c, chưa bao giờ l&agrave; hết y&ecirc;u, người c&oacute; duy&ecirc;n th&igrave; d&ugrave; đi đ&acirc;u cũng sẽ quay lại về b&ecirc;n nhau.&rdquo;</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/184/mua-thanh-xuan.jpg', 18, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (29, N'Dám Lựa Chọn', CAST(N'2019-02-03' AS Date), 12, 0, 222232.0000, NULL, N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/183/dam-lua-chon.jpg', 19, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (30, N'Để Đời Nhàn Tênh', CAST(N'2004-12-12' AS Date), 5, 0, 123412.0000, N'<p>Hẳn ch&uacute;ng ta đều nghĩ, tr&ecirc;n thế gian l&agrave;m g&igrave; c&oacute; ai kỳ quặc như vậy. Mỗi người ch&uacute;ng ta, tr&ecirc;n kh&iacute;a cạnh chủ quan, lu&ocirc;n tự nhủ: &ldquo;L&agrave;m g&igrave; c&oacute; chuyện muốn bị khổ đau, d&ugrave; &iacute;t hay nhiều.&rdquo;</p>

<p>Tuy nhi&ecirc;n, vượt ra ngo&agrave;i phạm vi c&oacute; thể tưởng tượng, thế giới n&agrave;y tồn tại b&oacute;ng d&aacute;ng khổ sở v&igrave; tức giận d&ugrave; việc ta phải đối mặt chẳng đ&aacute;ng để tức giận, khổ sở v&igrave; lo lắng d&ugrave; việc ta phải đối mặt chẳng đ&aacute;ng để lo lắng, khổ sở v&igrave; hối hận d&ugrave; việc ta đ&atilde; l&agrave;m chẳng đ&aacute;ng phải hối hận. Những b&oacute;ng d&aacute;ng ấy ch&iacute;nh l&agrave; sinh vật sống mang t&ecirc;n con người, ch&iacute;nh l&agrave; ch&uacute;ng ta. C&oacute; lẽ bạn thấy kh&oacute; tin, nhưng ở một tầng &yacute; nghĩa n&agrave;o đ&oacute;, t&acirc;m l&yacute; ẩn s&acirc;u b&ecirc;n trong con người c&oacute; xu hướng hoạt động theo chiều hướng &ldquo;muốn khổ sở&rdquo;.</p>

<p>Khi xuất hiện cảm gi&aacute;c &ldquo;khổ sở&rdquo;, bộ n&atilde;o sẽ tạo k&iacute;ch th&iacute;ch m&atilde;nh liệt. L&uacute;c đ&oacute;, con người sẽ cảm thấy &ldquo;kh&oacute; chịu, ch&aacute;n gh&eacute;t&rdquo;. Tuy nhi&ecirc;n, nếu đ&aacute;nh gi&aacute; từ kh&iacute;a cạnh cơ chế tr&aacute;i tim con người, th&igrave; tr&aacute;i tim sẽ ch&agrave;o đ&oacute;n những khổ sở đ&oacute; bởi tr&aacute;i tim &ldquo;th&iacute;ch tiếp nhận nhiều k&iacute;ch th&iacute;ch&rdquo;.</p>

<p>V&iacute; dụ, khi c&ocirc;ng việc trục trặc, ta bị sốc v&igrave; &aacute;nh mắt lạnh to&aacute;t từ chung quanh. Dĩ nhi&ecirc;n, khi ấy ai cũng thấy kh&oacute; chịu đ&uacute;ng kh&ocirc;ng? L&uacute;c n&agrave;y, d&ugrave; l&agrave; ai đi nữa th&igrave; cũng muốn &ldquo;kh&ocirc;ng bị cuốn theo cảm x&uacute;c kh&oacute; chịu, thay đổi t&acirc;m trạng bức bối l&uacute;c n&agrave;y&rdquo;. Tuy nhi&ecirc;n, tr&ecirc;n thực tế l&agrave; cả nửa ng&agrave;y tr&ocirc;i qua, ta vẫn bận t&acirc;m, bị cuốn theo sự việc khiến bản th&acirc;n kh&oacute; chịu, cảm thấy v&ocirc; c&ugrave;ng khổ sở. Thậm ch&iacute;, ta nghĩ: &ldquo;Trời! Thất bại tới mức như thế, thật kh&ocirc;ng t&agrave;i n&agrave;o tha thứ. Nếu đ&aacute;nh mất niềm tin của mọi người th&igrave; sao&hellip;&rdquo;</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/183/de-doi-nhan-tenh.jpg', 20, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (31, N'Cách Để Yêu 1 Người', CAST(N'2010-03-04' AS Date), 3, 0, 213222.0000, N'<p><strong>C&aacute;ch Để Y&ecirc;u 1 Người</strong>&nbsp;thuộc bộ s&aacute;ch độc quyền C&aacute;ch Để Trở Th&agrave;nh của Nh&acirc;n Văn n&oacute;i về những kh&iacute;a cạnh đa dạng của cuộc sống để c&oacute; thể gi&uacute;p ch&uacute;ng ta l&agrave;m đẹp t&acirc;m hồn, t&iacute;nh c&aacute;ch con người kh&ocirc;ng những cho ch&uacute;ng ta m&agrave; con những người xung quanh.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/183/cach-de-yeu-mot-nguoi.jpg', 21, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (33, N'Cách Để Tự Bảo Vệ Mình', NULL, 13, 0, 230000.0000, N'<p><strong>C&aacute;ch Để Tự Bảo Vệ M&igrave;nh</strong>&nbsp;thuộc bộ s&aacute;ch độc quyền C&aacute;ch Để Trở Th&agrave;nh của Nh&acirc;n Văn n&oacute;i về những kh&iacute;a cạnh đa dạng của cuộc sống để c&oacute; thể gi&uacute;p ch&uacute;ng ta l&agrave;m đẹp t&acirc;m hồn, t&iacute;nh c&aacute;ch con người kh&ocirc;ng những cho ch&uacute;ng ta m&agrave; con những người xung quanh.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/183/cach-de-tu-bao-ve-minh.jpg', 23, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (34, N'Cách Để Về Hưu An Nhàn', CAST(N'2020-04-12' AS Date), 9, 0, 40000.0000, N'<p><strong>C&aacute;ch Để Về Hưu An Nh&agrave;n</strong>&nbsp;thuộc bộ s&aacute;ch độc quyền C&aacute;ch Để Trở Th&agrave;nh của Nh&acirc;n Văn n&oacute;i về những kh&iacute;a cạnh đa dạng của cuộc sống để c&oacute; thể gi&uacute;p ch&uacute;ng ta l&agrave;m đẹp t&acirc;m hồn, t&iacute;nh c&aacute;ch con người kh&ocirc;ng những cho ch&uacute;ng ta m&agrave; con những người xung quanh.&nbsp;</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/183/cach-de-ve-huu-an-nhan.jpg', 24, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (36, N'Thói Quen Nhỏ, Thay Đổi Lớn', CAST(N'2022-03-02' AS Date), 12, 0, 210000.0000, N'<p>10 bước thay đổi cuộc sống th&ocirc;ng qua sức mạnh của những th&oacute;i quen nhỏ. Cuốn s&aacute;ch sẽ chỉ cho bạn phương ph&aacute;p tốt nhất để tạo ra những th&oacute;i quen t&iacute;ch cực v&agrave; hữu &iacute;ch. V&agrave; quan trọng, n&oacute; sẽ gi&uacute;p bạn biết c&aacute;ch để biến những th&oacute;i quen n&agrave;y th&agrave;nh bản năng.</p>

<p><strong>Ch&uacute;ng ta được định nghĩa bởi những th&oacute;i quen</strong></p>

<p>Ch&uacute;ng x&aacute;c định ch&uacute;ng ta l&agrave; ai, ch&uacute;ng ta l&agrave;m việc như thế n&agrave;o, v&agrave; ch&uacute;ng ta c&oacute; đạt được những mục ti&ecirc;u của m&igrave;nh. Ch&uacute;ng chỉ cho ch&uacute;ng ta c&aacute;ch tương t&aacute;c với người kh&aacute;c v&agrave; kết nối với thế giới xung quanh. Do vậy, việc tạo ra những th&oacute;i quen tốt rất quan trọng nếu ch&uacute;ng ta hi vọng hướng tới cuộc sống khỏe mạnh, hạnh ph&uacute;c v&agrave; bổ &iacute;ch.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/182/thoi-quen-nho-thay-doi-lon.jpg', 26, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (37, N'Thói Quen Hạnh Phúc', CAST(N'2010-01-31' AS Date), 8, 0, 123422.0000, N'<p><strong>Th&oacute;i Quen Hạnh Ph&uacute;c</strong>&nbsp;d&agrave;nh cho tất cả những ai mong muốn được hạnh ph&uacute;c hơn trong c&ocirc;ng việc cũng như trong cuộc sống, đặc biệt với những người đang trong giai đoạn chuyển đổi nghề nghiệp, c&ocirc;ng việc hay bất cứ ai đang ở giữa ng&atilde; ba đường, những người cần đến hạnh ph&uacute;c để l&agrave;m động lực. Qua những trang s&aacute;ch n&agrave;y, bạn sẽ học được điều m&agrave; t&ocirc;i gọi l&agrave; th&oacute;i quen hạnh ph&uacute;c - những b&agrave;i thực h&agrave;nh nhanh gọn h&agrave;ng ng&agrave;y gi&uacute;p tăng cường năng lượng, v&agrave; mang lại cho bạn trạng th&aacute;i tinh thần t&iacute;ch cực. Những kỹ thuật đơn giản được chứng minh l&agrave; sẽ l&agrave;m gia tăng mức độ hạnh ph&uacute;c, nếu thực h&agrave;nh h&agrave;ng ng&agrave;y trong t&aacute;m tuần.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/182/thoi-quen-hanh-phuc.jpg', 27, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (38, N'Độc Thoại Nội Tâm Làm Chủ Cuộc Sống', CAST(N'2020-11-20' AS Date), 11, 0, 134000.0000, N'<p>Học c&aacute;ch n&oacute;i chuyện v&agrave; lắng nghe bản th&acirc;n</p>

<p>Khi thực hiện c&aacute;c hoạt động thường ng&agrave;y, con người c&oacute; xu hướng n&oacute;i chuyện với bản th&acirc;n để diễn giải lại c&aacute;c t&igrave;nh huống xung quanh. T&acirc;m l&yacute; học gọi giọng n&oacute;i b&ecirc;n trong đ&oacute;&nbsp; l&agrave; độc thoại. Độc thoại thường n&oacute;i về bản th&acirc;n, về người kh&aacute;c v&agrave; c&aacute;c t&igrave;nh huống c&oacute; thể đang, đ&atilde;, hoặc sẽ xảy ra theo tưởng tượng của ch&uacute;ng ta. Độc thoại c&oacute; ảnh hưởng đ&aacute;ng kể đến c&aacute;ch bạn nh&igrave;n nhận về bản th&acirc;n cũng như c&aacute;ch ứng ph&oacute; với cuộc sống.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/182/doc-thoai-noi-tam-lam-chu-cuoc-song.jpg', 28, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (39, N'Học Làm Người Lớn', CAST(N'2003-02-23' AS Date), 8, 0, 30000.0000, N'<p>Bạn hiền ơi, Quỳnh in Seoul đ&atilde; trở lại rồi đ&acirc;y!</p>

<p>Cuốn s&aacute;ch thứ 3 của Quỳnh với Bloom Books ‒&nbsp;<strong>Học L&agrave;m Người Lớn</strong>&nbsp;sẽ kh&ocirc;ng chỉ l&agrave; một cuốn s&aacute;ch đơn thuần. N&oacute; giống như chiếc hộp nhỏ đựng những l&aacute; thư tay được Quỳnh tỉ mẩn chuẩn bị để gửi cho bạn. Trong đ&oacute; l&agrave; rất nhiều năm th&aacute;ng tuổi trẻ m&agrave; Quỳnh đ&atilde; đi, đ&atilde; học, đ&atilde; l&agrave;m, đ&atilde; sai, đ&atilde; đ&uacute;ng, đ&atilde; sống bằng mọi gi&aacute;c quan, trọn vẹn cả t&acirc;m tr&iacute; để b&acirc;y giờ viết lại thanh xu&acirc;n v&agrave;o trong từng ấy &ldquo;trang thư&rdquo;. Với th&ocirc;ng điệp xuy&ecirc;n suốt &ldquo;Người lớn chẳng phải ai xa lạ, người lớn vẫn ch&iacute;nh l&agrave; bạn đ&oacute; th&ocirc;i&rdquo;,&nbsp;<strong>Học L&agrave;m Người Lớn</strong>&nbsp;mong rằng c&aacute;c bạn h&atilde;y cứ mạnh mẽ v&agrave; dấn th&acirc;n tr&ecirc;n con đường trở th&agrave;nh người lớn ph&iacute;a trước, bạn đừng ngại phải thay đổi bản th&acirc;n để th&iacute;ch nghi bởi v&igrave; cuối c&ugrave;ng, bạn vẫn ch&iacute;nh l&agrave; bạn nhưng ở một phi&ecirc;n bản tốt đẹp hơn.</p>

<p>&nbsp;&ldquo;Qu&ecirc;n cả những sợ h&atilde;i v&agrave; ngơi nghỉ, khi nh&igrave;n lại &ndash; bạn sẽ kinh ngạc khi thấy m&igrave;nh đ&atilde; biến th&agrave;nh một &lsquo;ph&eacute;p m&agrave;u&rsquo; như thế n&agrave;o.&rdquo;</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/182/hoc-lam-nguoi-lon.jpg', 29, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (40, N'Tư Duy Lười Biếng', CAST(N'2020-03-23' AS Date), 10, 0, 20000.0000, N'<p>Trong thời điểm dịch Covid đang ng&agrave;y c&agrave;ng b&ugrave;ng ph&aacute;t mạnh mẽ, nhiều nơi đ&atilde; ra quy định mọi người đều ở trong nh&agrave; v&agrave; hạn chế ra ngo&agrave;i đường. Khi ở nh&agrave;, mọi người đều c&oacute; xu hướng tập trung l&agrave;m những c&ocirc;ng việc chăm lo cho gia đ&igrave;nh như nấu ăn, giặt giũ, dọn dẹp nh&agrave; cửa,&hellip; Thế nhưng, những c&ocirc;ng việc đ&oacute; cứ lặp đi lặp lại mỗi ng&agrave;y sẽ khiến cho ch&uacute;ng ta cảm gi&aacute;c nh&agrave;m ch&aacute;n, thậm ch&iacute; c&oacute; thể l&agrave;m cho ta phải &ldquo;ph&aacute;t đi&ecirc;n&rdquo; l&ecirc;n.</p>

<p>Nhận thấy được t&igrave;nh trạng đ&oacute;, t&aacute;c giả Kendra Adachi đ&atilde; cho xuất bản cuốn s&aacute;ch mang t&ecirc;n&nbsp;<strong>Tư Duy Lười Biếng</strong>&nbsp;trong thời điểm kh&aacute; đặc biệt n&agrave;y. Cuốn s&aacute;ch bao gồm 13 nguy&ecirc;n tắc v&ocirc; c&ugrave;ng hữu &iacute;ch, những chia sẻ v&agrave; lời khuy&ecirc;n thiết thực từ ch&iacute;nh t&aacute;c giả. Những nguy&ecirc;n tắc đ&oacute; c&oacute; thể kh&ocirc;ng gi&uacute;p bạn L&Agrave;M được nhiều việc hơn hoặc tốt hơn, nhưng n&oacute; sẽ gi&uacute;p bạn XEM được những g&igrave; cần phải l&agrave;m hoặc tốt hơn l&agrave; KH&Ocirc;NG n&ecirc;n l&agrave;m. Qua đ&oacute;, bạn sẽ c&oacute; thể thay đổi lại c&aacute;ch nh&igrave;n nhận về c&ocirc;ng việc, gia đ&igrave;nh, về cuộc sống, v&agrave; thậm ch&iacute; l&agrave; về cả c&aacute;ch bạn nh&igrave;n nhận bản th&acirc;n.&nbsp;</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/181/tu-duy-luoi-bieng.jpg', 30, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (41, N'Mĩ Phẩm Trí Tuệ', CAST(N'2018-04-20' AS Date), 9, 0, 123000.0000, N'<p>X&atilde; hội c&agrave;ng ph&aacute;t triển, con người c&agrave;ng c&oacute; nhu cầu học tập, ho&agrave;n thiện bản th&acirc;n, v&agrave; những tri thức, trải nghiệm về phương diện thẩm mĩ, tinh thần được v&iacute; như mĩ phẩm tr&iacute; tuệ. Tuyển tập b&agrave;i viết n&agrave;y l&agrave; một lượng &ldquo;mĩ phẩm&rdquo; chất lượng, c&ugrave;ng ta điểm trang cho t&acirc;m hồn.</p>

<p>NG&Ocirc; TỰ LẬP sinh tại H&agrave; Nội, hiện l&agrave; Viện trưởng Viện Quốc tế Ph&aacute;p ngữ, Đại học Quốc gia H&agrave; Nội.</p>

<p>Tốt nghiệp Đại học H&agrave;ng hải (Li&ecirc;n X&ocirc;, 1986), &ocirc;ng nhận bằng Thạc sĩ Văn chương tại Ph&aacute;p (1996) v&agrave; Tiến sĩ Văn học tại Mĩ (2006). &Ocirc;ng bắt đầu s&aacute;ng t&aacute;c văn học năm 1989, khi đang l&agrave; thuyền trưởng hải qu&acirc;n.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/181/mi-pham-tri-tue.jpg', 31, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (42, N'Chìa Khóa Hạnh Phúc', CAST(N'2007-02-03' AS Date), 12, 0, 200000.0000, N'<p>Cuốn s&aacute;ch&nbsp;<strong>CH&Igrave;A KH&Oacute;A HẠNH PH&Uacute;C</strong>&nbsp;l&agrave; cuốn cẩm nang chỉ ra cho bạn con đường đến với kho b&aacute;u v&ocirc; tận về Hạnh Ph&uacute;c của Bạn.</p>

<p>Nếu coi hạnh ph&uacute;c l&agrave; một ng&ocirc;i b&aacute;u th&igrave; bạn cần vượt qua một h&agrave;nh tr&igrave;nh gian nan t&igrave;m đến nơi ng&ocirc;i b&aacute;u được cất giữ. Đến nơi rồi, ng&ocirc;i b&aacute;u ấy nằm trong hang s&acirc;u n&uacute;i thẳm, ph&iacute;a trước chỉ c&oacute; một c&aacute;nh cửa đ&aacute; uy nghi v&agrave; một ổ kh&oacute;a vững chắc. Bạn chẳng c&oacute; thần ch&uacute; &ldquo;Vừng ơi, mở ra!&rdquo; như trong truyện cổ t&iacute;ch, bạn cũng chẳng c&oacute; sức mạnh lấp n&uacute;i dời non hay lay chuyển cửa đ&aacute; sừng sững kia. Khi ấy bạn cần một chiếc ch&igrave;a kh&oacute;a.</p>

<p>Hạnh ph&uacute;c cũng vậy, bạn cũng cần một h&agrave;nh tr&igrave;nh d&agrave;i v&agrave; những chiếc &ldquo;ch&igrave;a kh&oacute;a&rdquo; để khai mở ng&ocirc;i b&aacute;u hạnh ph&uacute;c của ri&ecirc;ng m&igrave;nh. V&agrave; trước khi nắm lấy những chiếc ch&igrave;a kh&oacute;a kia v&agrave; bắt đầu h&agrave;nh tr&igrave;nh hạnh ph&uacute;c, ch&uacute;ng ta cần hiểu được những kh&aacute;i niệm cơ bản nhất về hạnh ph&uacute;c.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/900/900/detailed/181/chia-khoa-hanh-phuc.jpg', 32, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (43, N'Yêu Thương Ở Lại', CAST(N'2012-02-22' AS Date), 10, 0, 25000.0000, N'<p>Một cuốn&nbsp;&nbsp;tiểu thuyết của t&aacute;c giả g&agrave; mờ mới v&agrave;o nghề Huỳnh Thanh T&acirc;m mong người đọc th&ocirc;ng cảm r&aacute;ng mua nha.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/183/yeu-thuong-o-lai.jpg', 33, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (44, N'Bẫy Tình Yêu - Tập 2', CAST(N'2004-02-03' AS Date), 7, 0, 20000.0000, N'<p><strong>Bẫy T&igrave;nh Y&ecirc;u</strong>&nbsp;xoay quanh một mối quan hệ k&igrave; lạ. Hong Seol l&agrave; một c&ocirc; g&aacute;i b&igrave;nh thường như bao con người b&igrave;nh thường kh&aacute;c. Vốn tưởng rằng đời sinh vi&ecirc;n chỉ xoay quanh việc học h&agrave;nh, Hong Seol bỗng vướng v&agrave;o tiền bối nổi tiếng Yoo Jung &ndash; ch&agrave;ng trai ho&agrave;n hảo &ldquo;vạn người m&ecirc;&rdquo;: đẹp trai, gi&agrave;u c&oacute;, t&agrave;i giỏi, lại c&ograve;n v&ocirc; c&ugrave;ng th&acirc;n thiện dễ mến.</p>

<p>Trong qu&aacute; khứ, tại một buổi gặp mặt sinh vi&ecirc;n, Seol đ&atilde; v&ocirc; t&igrave;nh ph&aacute;t hiện một mặt kh&aacute;c của Yoo Jung ẩn giấu ph&iacute;a sau nụ cười th&acirc;n thiện. Từ đ&oacute; c&ocirc; lu&ocirc;n t&igrave;m c&aacute;ch tr&aacute;nh mặt tiền bối, đồng thời cũng &acirc;m thầm để mắt tới anh.</p>

<p>Nhưng sau khi Seol quay trở lại trường đại học th&igrave; th&aacute;i độ của anh ta ho&agrave;n to&agrave;n thay đổi. Vị tiền bối đ&aacute;ng ngờ ấy đột nhi&ecirc;n th&acirc;n thiết với c&ocirc; một c&aacute;ch kh&aacute;c thường, nhưng cũng ch&iacute;nh sự th&acirc;n thiết ấy đ&atilde; khiến c&ocirc; gặp kh&ocirc;ng &iacute;t rắc rối, đ&ocirc;i khi l&agrave; &ldquo;đen đủi&rdquo;. Nhiều biến động li&ecirc;n tiếp xảy ra l&agrave;m cho Seol nhớ tới những khổ sở m&agrave; Nam Juyeon v&agrave; Oh Young Gon đ&atilde; g&acirc;y ra cho cuộc sống của c&ocirc; v&agrave;o thời gian trước.</p>

<p>Chuyện Seol nghỉ học c&oacute; li&ecirc;n quan g&igrave; tới hai người n&agrave;y? Hay nguy&ecirc;n do ch&iacute;nh l&agrave; vị tiền bối Yoo Jung kia? H&atilde;y c&ugrave;ng t&igrave;m c&acirc;u trả lời trong&nbsp;<strong>Bẫy T&igrave;nh Y&ecirc;u - Tập 2&nbsp;</strong>rối quen thuộc về t&igrave;nh y&ecirc;u, t&igrave;nh bạn v&agrave; những chuyện trường lớp tưởng chừng vụn vặt nhưng lại g&acirc;y ra những phiền to&aacute;i kh&ocirc;ng ngờ nh&eacute;!</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/182/bay-tinh-yeu-tap-2.jpg', 34, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (45, N'Hajime Là Số 1 - Tập 15', NULL, 6, 0, 200000.0000, N'<p>Từ khi 5 đứa em sinh năm ch&agrave;o đời, mỗi một ng&agrave;y của Hajime đều phải trải qua trong ngh&egrave;o kh&oacute;. Cuộc sống của cả nh&agrave; trở n&ecirc;n đảo lộn khi 5 cậu em trai t&igrave;nh cờ tham gia v&agrave;o một chương tr&igrave;nh quảng c&aacute;o tr&ecirc;n ti vi v&agrave; bước ch&acirc;n v&agrave;o con đường đ&agrave;o tạo ng&ocirc;i sao. Ban đầu Hajime đ&atilde; kịch liệt phản đối nhưng sau đ&oacute; th&igrave; c&ocirc; đ&atilde; thay đổi v&igrave; đ&atilde; gặp được thần tượng của m&igrave;nh l&agrave; Mizuki - th&agrave;nh vi&ecirc;n nh&oacute;m nhạc idol WE rất nổi tiếng.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/181/hajime-la-so-1-tap-15.jpg', 35, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (46, N'Tuổi Dậy Thì Ti Tỉ Chuyện', CAST(N'2009-02-23' AS Date), 14, 0, 120000.0000, N'<p>D&ugrave; l&agrave; con trai hay con g&aacute;i, khi bước v&agrave;o tuổi dậy th&igrave;, c&aacute;c bạn đều sẽ c&oacute; sự biến đổi cả về cơ thể v&agrave; t&acirc;m l&yacute;. Thậm ch&iacute;, một số biến đổi c&oacute; thể l&agrave;m x&aacute;o trộn cuộc sống của c&aacute;c bạn, v&agrave; kh&ocirc;ng &iacute;t c&aacute;c bạn teen phải trải qua một thời kỳ đầy hoang mang, bối rối.</p>

<p>Đừng lo, bạn đang trải qua &quot;Tuổi dậy th&igrave; ti tỉ chuyện&quot; - một giai đoạn biến động, nhưng cũng l&agrave; một thời kỳ trải nghiệm c&oacute; một kh&ocirc;ng hai trước khi l&agrave; người trưởng th&agrave;nh đấy!</p>

<p>Cuốn s&aacute;ch&nbsp;<strong>Tuổi Dậy Th&igrave; Ti Tỉ Chuyện</strong>&nbsp;với phần minh họa h&igrave;nh ảnh tinh tế v&agrave; ngộ nghĩnh, c&ugrave;ng lối kể chuyện d&iacute; dỏm qua lăng k&iacute;nh của ch&iacute;nh c&aacute;c bạn tuổi teen ch&iacute;nh l&agrave; một sổ tay bỏ t&uacute;i gi&uacute;p bạn &ldquo;đương đầu&rdquo; v&agrave; vượt qua độ</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/180/tuoi-day-thi-ti-ti-chuyen.jpg', 36, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (47, N'Phẩm Cách Quốc Gia', CAST(N'2019-08-22' AS Date), 3, 0, 200000.0000, N'<p>Fujiwara Masahiko l&agrave; nh&agrave; to&aacute;n học, gi&aacute;o sư danh dự Đại học Ochanomizu, đồng thời cũng l&agrave; nh&agrave; ph&ecirc; b&igrave;nh, người viết tiểu luận c&oacute; tiếng tại Nhật Bản.&Ocirc;ng từng dạy ba năm ở đại học của Mĩ, &ldquo;nơi mọi sự được quyết định duy nhất bởi t&aacute;c dụng của sự logic&rdquo;, v&agrave; ngay lập tức say m&ecirc; lối tư duy kiểu Mỹ.</p>

<p>Sau một năm sống tại Anh, nơi &ldquo;tập qu&aacute;n, truyền thống, sự th&agrave;nh thật v&agrave; h&agrave;i hước của c&aacute; nh&acirc;n được coi trọng hơn logic, người Anh &ldquo;rất coi trọng truyền thống đến độ họ c&oacute; thể t&igrave;m ra niềm hạnh ph&uacute;c khi họ ở trong căn ph&ograve;ng giống như thời của Newton&rdquo;, Fujiwara Masahiko dần quan t&acirc;m đến vị tr&iacute; của cảm x&uacute;c, h&igrave;nh thức v&agrave; hạ thấp địa vị của l&ocirc;i tư duy logic. Cảm x&uacute;c &ldquo;l&agrave; sự nhớ thương, cảm động &ndash; những thứ được tạo ra v&agrave; nu&ocirc;i dưỡng bởi gi&aacute;o dục&rdquo;. H&igrave;nh thức ở đ&acirc;y chủ yếu l&agrave; ti&ecirc;u chuẩn h&agrave;nh động đến từ tinh thần v&otilde; sĩ đạo&rdquo;.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/182/pham-cach-quoc-gia.jpg', 37, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (48, N'Từ Điển Tiếng "Em"', CAST(N'2004-04-24' AS Date), 10, 0, 30000.0000, N'<p>Bạn sẽ bất ngờ, khi cầm cuốn &ldquo;từ điển&rdquo; xinh xinh n&agrave;y tr&ecirc;n tay.</p>

<p>V&agrave; sẽ c&ograve;n ngạc nhi&ecirc;n hơn nữa, khi bắt đầu đọc từng trang s&aacute;ch&hellip;</p>

<p>Dĩ nhi&ecirc;n l&agrave; v&igrave;&nbsp;<strong>Từ Điển Tiếng &quot;Em&quot;</strong>&nbsp;kh&ocirc;ng phải l&agrave; một cuốn từ điển th&ocirc;ng thường rồi!</p>

<p>N&oacute;i đến &ldquo;từ điển&rdquo;, xưa nay ch&uacute;ng ta đều nghĩ về một bộ s&aacute;ch đồ sộ, giải th&iacute;ch &yacute; nghĩa, c&aacute;ch d&ugrave;ng, dịch, c&aacute;ch ph&aacute;t &acirc;m, v&agrave; thường k&egrave;m theo c&aacute;c v&iacute; dụ về c&aacute;ch sử dụng từ đ&oacute;.</p>

<p>Tuy nhi&ecirc;n, với cuốn s&aacute;ch&nbsp;<strong>Từ Điển Tiếng &quot;Em&quot;</strong>, c&aacute;c bạn sẽ hết sức bất ngờ với những định nghĩa mới, bắt trend, s&aacute;ng tạo, th&ocirc;ng minh v&agrave; v&ocirc; c&ugrave;ng h&agrave;i hước.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/181/tu-dien-tieng-am.jpg', 38, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (49, N'Tình Dục Không Chỉ Là "Chuyện Ấy"', CAST(N'2012-02-20' AS Date), 9, 0, 30000.0000, N'<p><strong>T&igrave;nh Dục Kh&ocirc;ng Chỉ L&agrave; &quot;Chuyện Ấy&quot;</strong>&nbsp;gồm 3 phần:</p>

<p>-&nbsp; Phần đầu l&agrave; những kiến thức nền tảng khoa học, gần gũi, dễ hiểu.</p>

<p>-&nbsp; Phần hai l&agrave; trả lời những c&acirc;u hỏi về t&igrave;nh dục ai cũng muốn hỏi m&agrave; chẳng biết hỏi ai.</p>

<p>-&nbsp; Phần ba của cuốn s&aacute;ch l&agrave; 8 ca tư vấn kh&oacute; qu&ecirc;n của gi&aacute;o sư, tiến sĩ, b&aacute;c sĩ Barte Nhi cho bạn đọc Việt Nam.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/181/tinh-duc-khong-chi-la-chuyen-ay.jpg', 39, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (50, N'Sổ Tay Nhà Thôi Miên 2', NULL, 8, 0, 200000.0000, N'<p>TH&Ocirc;I MI&Ecirc;N KH&Ocirc;NG RU BẠN V&Agrave;O CƠN SAY NGỦ, N&Oacute; Đ&Aacute;NH THỨC BẠN KHỎI CƠN NGỦ SAY</p>

<p>Trước khi đọc&nbsp;<strong>Sổ Tay Nh&agrave; Th&ocirc;i Mi&ecirc;n 2</strong>&nbsp;c&oacute; một số vấn đề bạn cần biết!</p>

<p>-&nbsp;&nbsp;<strong>Sổ Tay Nh&agrave; Th&ocirc;i Mi&ecirc;n</strong>&nbsp;l&agrave; một bộ truyện viết ở ng&ocirc;i thứ nhất, nh&acirc;n vật &ldquo;t&ocirc;i&rdquo; &ndash; nh&agrave; th&ocirc;i mi&ecirc;n giữ vai tr&ograve; tự kể lại c&acirc;u chuyện xoay quanh nghề nghiệp của m&igrave;nh, mỗi phần thu thập khoảng 10 c&acirc;u chuyện, viết th&agrave;nh 15 chương.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/180/so-tay-nha-thoi-mien-2.jpg', 40, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (51, N'Công Thức Hạnh Phúc', CAST(N'2010-01-20' AS Date), 27, 0, 21000.0000, N'<p>Hạnh ph&uacute;c thực ra l&agrave; g&igrave;? C&ocirc;ng thức n&agrave;o tạo ra hạnh ph&uacute;c?</p>

<p>Trong cuốn s&aacute;ch n&agrave;y, Kets de Vries nỗ lực giải cấu tr&uacute;c kh&aacute;i niệm trừu tượng ấy. &Ocirc;ng đi từ quan điểm sinh học, thống k&ecirc; học, t&acirc;m l&yacute; học, triết học tự cổ ch&iacute; kim đến cả c&aacute;c tr&iacute;ch dẫn từ nh&agrave; văn, nh&agrave; thơ, nghệ sĩ, v&agrave; tr&ecirc;n hết, những trải nghiệm c&aacute; nh&acirc;n, nhằm t&igrave;m ra một &quot;đơn thuốc&quot; gi&uacute;p tăng cường khả năng đạt được hạnh ph&uacute;c. Đơn thuốc ấy c&oacute; hiệu quả hay kh&ocirc;ng t&ugrave;y thuộc ở mỗi người, nhưng c&oacute; một điều chắc chắn: hạnh ph&uacute;c lu&ocirc;n ở đ&acirc;u đ&oacute;, trong hiện tại v&agrave; trong tương lai, v&agrave; ta kh&ocirc;ng bao giờ được mất hy vọng.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/130/cong-thuc-hanh-phuc.jpg', 41, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (52, N'Osho: Đàn Ông', CAST(N'2001-02-02' AS Date), 26, 0, 30000.0000, N'<p>Trong cuốn&nbsp;<strong>Osho: Đ&agrave;n &Ocirc;ng</strong>, t&aacute;c giả sẽ ph&acirc;n t&iacute;ch c&aacute;c vai tr&ograve; kh&aacute;c nhau của người đ&agrave;n &ocirc;ng, cũng như việc họ đ&atilde; định h&igrave;nh v&agrave; ảnh hưởng l&ecirc;n x&atilde; hội như thế n&agrave;o. Đồng thời, &ocirc;ng chỉ ra l&agrave;m thế n&agrave;o đ&agrave;n &ocirc;ng c&oacute; thể chuyển hướng nguồn năng lượng vốn đang dẫn đến bạo lực, hung hăng sang s&aacute;ng tạo v&agrave; tiến ho&aacute;.</p>

<p>------</p>

<p>Bạn thật may mắn khi được sống trong thời đại n&agrave;y bởi c&oacute; một điều v&ocirc; c&ugrave;ng vĩ đại sắp xảy ra &ndash; đ&oacute; l&agrave; sự gặp gỡ giữa khoa học v&agrave; t&ocirc;n gi&aacute;o, sự gặp gỡ giữa Đ&ocirc;ng v&agrave; T&acirc;y, sự gặp gỡ giữa hướng ngoại v&agrave; hướng nội. Điều n&agrave;y sẽ tạo ra một con người mới, một con người c&oacute; thể dễ d&agrave;ng đi ra b&ecirc;n ngo&agrave;i hoặc đi v&agrave;o b&ecirc;n trong, đi v&agrave;o thế giới hướng ngoại của khoa học hoặc đi v&agrave;o thế giới hướng nội của t&ocirc;n gi&aacute;o &ndash; dễ d&agrave;ng như khi bạn đi từ trong nh&agrave; ra vườn rồi lại quay trở v&agrave;o nh&agrave;. Chẳng c&oacute; g&igrave; kh&oacute; khăn v&agrave; bạn kh&ocirc;ng cần sự thỏa hiệp n&agrave;o cả. Mỗi lần ra khỏi nh&agrave; v&agrave; bước l&ecirc;n b&atilde;i cỏ, bạn đ&acirc;u c&oacute; cần nhọc sức &ndash; bạn cứ thế bước ra m&agrave; th&ocirc;i. Trong nh&agrave; lạnh qu&aacute; c&ograve;n ở ngo&agrave;i kia, mặt trời rạng rỡ v&agrave; ấm &aacute;p, bạn bước ra b&atilde;i cỏ, bạn ngồi xuống b&atilde;i cỏ. Rồi khi b&ecirc;n ngo&agrave;i trở n&ecirc;n qu&aacute; n&oacute;ng, bạn lại đi v&agrave;o nh&agrave; v&igrave; b&ecirc;n trong rất m&aacute;t mẻ, chỉ đơn giản vậy th&ocirc;i.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/130/osho-dan-ong.jpg', 42, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (53, N'Nguyễn Tri Phương', CAST(N'2018-03-22' AS Date), 25, 0, 332344.0000, N'<p>Chiến đấu cho Tổ quốc d&acirc;n tộc, kh&ocirc;ng phải chỉ tr&ecirc;n v&agrave;i ba trận mạc hay trong ch&iacute;n mười xu&acirc;n thu, nhưng ch&iacute;nh l&agrave; một cuộc tranh đấu tinh thần r&ograve;ng r&atilde; trong khoảng thời gian v&ocirc; tận. V&igrave; thế, n&ecirc;n d&ugrave; thua trận với những kh&iacute; giới vật chất nhất thời, nhưng c&oacute; tinh thần lưu truyền cho hậu thế với những cử chỉ th&aacute;i độ của m&igrave;nh, tiền bối gục ng&atilde; th&igrave; hậu sinh kế tiếp, ng&agrave;y trước kh&ocirc;ng th&agrave;nh, năm sau lại thắng, chứng minh c&acirc;u n&oacute;i của một ch&iacute;nh kh&aacute;ch Trung Hoa: &ldquo;Thất bại l&agrave; mẹ th&agrave;nh c&ocirc;ng&rdquo;, kh&ocirc;ng theo nghĩa kinh nghiệm c&aacute; nh&acirc;n, nhưng theo l&yacute; truyền thống d&acirc;n tộc. Đ&oacute; l&agrave; th&agrave;nh c&ocirc;ng vinh hiển của c&aacute;c bậc vĩ nh&acirc;n.</p>

<p>Trong lịch sử oai h&ugrave;ng của d&acirc;n tộc Việt Nam, năm 1973 kỷ niệm đệ nhất B&aacute;ch chu ni&ecirc;n một vị trong số c&aacute;c vĩ nh&acirc;n n&agrave;y. Ch&iacute;nh l&agrave; 100 năm truy niệm vong linh Cụ NGUYỄN TRI PHƯƠNG. Sinh trưởng ở Thuận H&oacute;a, l&agrave;m quan ki&ecirc;m th&ocirc;ng văn vũ với ba triều vua, cụ l&agrave; một chiến sĩ khắp c&aacute;c mặt trận tinh thần v&agrave; vật chất. Tuy Cụ thua trận với vũ kh&iacute;, bị qu&acirc;n Ph&aacute;p bắt tại H&agrave; Nội h&ocirc;m Rằm th&aacute;ng 10 năm Qu&yacute; Dậu (1873), nhưng với tinh thần bất khuất, Cụ đ&atilde; ra đi, để lại những lời nhắn nhủ k&ecirc;u gọi bao nhi&ecirc;u kẻ hậu sinh nối g&oacute;t, kh&ocirc;ng n&oacute;i đến thực d&acirc;n n&agrave;o hay chủ nghĩa n&agrave;o, chỉ biết một trăm năm sau, mặc d&ugrave; ai gọi l&agrave; chậm tiến vật chất v&agrave; ngh&egrave;o n&agrave;n hữu h&igrave;nh, nhưng cả thế giới đều cảm phục d&acirc;n tộc Việt Nam tr&ecirc;n con đường tranh đấu tinh thần.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/182/nguyen-tri-phuong.jpg', 43, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (54, N'Đây Là Van Gogh', CAST(N'2010-02-21' AS Date), 22, 0, 400000.0000, N'<p>Vincent van Gogh (1853 - 1890) - vị danh họa người H&agrave; Lan chạm ng&otilde; hội họa khi đ&atilde; gần ngưỡng ba mươi tuổi, gần mười năm khổ luyện, h&agrave;ng ng&agrave;n bức tranh (bức th&igrave; qu&aacute; u tối, bức lại qu&aacute; rực rỡ) nhưng chỉ b&aacute;n được duy nhất một t&aacute;c phẩm, bị nghi ngờ mắc bệnh t&acirc;m thần v&agrave; tự s&aacute;t ở tuổi ba mươi bảy. Danh tiếng, th&agrave;nh c&ocirc;ng&hellip; m&agrave; &ocirc;ng hằng khao kh&aacute;t, đến như một định mệnh chỉ khi &ocirc;ng đ&atilde; vĩnh viễn ra đi.</p>

<p><strong>Đ&acirc;y l&agrave; Van Gogh</strong>&nbsp;sẽ ph&aacute;c họa cho bạn c&acirc;u chuyện cuộc đời của vị họa sĩ t&agrave;i ba m&agrave; bất hạnh n&agrave;y, bằng cả con chữ v&agrave; những h&igrave;nh ảnh đa m&agrave;u sắc. Với cuốn s&aacute;ch n&agrave;y, bạn sẽ được d&otilde;i theo h&agrave;nh tr&igrave;nh của Van Gogh, từ một cậu b&eacute; dường như sinh ra đ&atilde; mang nỗi buồn, đến một người m&ocirc;i giới nghệ thuật trẻ sống xa qu&ecirc; hương v&agrave; gia đ&igrave;nh, rồi rẽ ngang sang con đường t&ocirc;n gi&aacute;o với một đức tin mạnh mẽ, sau c&ugrave;ng l&agrave; một họa sĩ c&ocirc; đơn, khao kh&aacute;t hội họa v&agrave; đi&ecirc;n cuồng với đam m&ecirc; hội họa.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/176/day-la-van-gogh.jpg', 44, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (55, N'Đây Là Matisse', CAST(N'2020-01-22' AS Date), 20, 0, 30000.0000, N'<p><strong>Đ&acirc;y l&agrave; Matisse</strong>&nbsp;kể về cuộc đời v&agrave; sự nghiệp của một trong những nh&acirc;n vật đi đầu trong nghệ thuật hiện đại - Henri Matisse (1869 - 1954).</p>

<p>Sự nghiệp họa sỹ của Matisse gần như bắt rễ từ văn h&oacute;a nghề thủ c&ocirc;ng ở Bohain - qu&ecirc; nh&agrave; của &ocirc;ng. L&agrave; nh&acirc;n vật ti&ecirc;n phong của trường ph&aacute;i D&atilde; th&uacute;, v&agrave;o thập ni&ecirc;n 1920, Matisse được coi l&agrave; một trong những người n&acirc;ng tầm truyền thống cổ điển trong hội họa Ph&aacute;p. Trải qua nửa đầu đầy gi&ocirc;ng b&atilde;o của thế kỷ 20 v&agrave; c&aacute;i m&agrave; Matisse gọi l&agrave; &ldquo;căn bệnh tập thể của con tim&rdquo;, to&agrave;n bộ sự nghiệp &ocirc;ng l&agrave; một nỗ lực miệt m&agrave;i nhằm t&igrave;m kiếm v&agrave; khẳng định c&aacute;i phong ph&uacute; v&agrave; vẻ đẹp của sự sống giữa những hỗn độn v&agrave; khốn c&ugrave;ng.</p>

<p>Matisse sống rất s&ocirc;i nổi. &Ocirc;ng ch&uacute; &yacute; đến những thứ dễ d&agrave;ng bị bỏ qua, d&ugrave; cho đ&oacute; l&agrave; tia nắng m&agrave;u va ni lộng lẫy ở Tahiti hay l&agrave; c&aacute;i cong m&igrave;nh của con s&ecirc;n vườn trườn ra khỏi vỏ. Tranh &ocirc;ng thật sự l&agrave; &ldquo;h&igrave;nh ảnh của cuộc sống s&ocirc;i nổi&rdquo;. C&aacute;c gi&aacute;c quan được thỏa m&atilde;n c&ugrave;ng cực, những m&agrave;u sắc sống động tươi mới, một nguồn năng lượng mạnh mẽ, mang t&iacute;nh nghi thức được giải ph&oacute;ng. Những con người khỏa th&acirc;n nhảy m&uacute;a hay nhảy xuống nước m&agrave; bơi. Chim liệng tr&ecirc;n tầng kh&ocirc;ng. C&aacute;c th&agrave;nh phần, từng c&aacute;i từng c&aacute;i một, đều được trộn lẫn v&agrave;o nhau một c&aacute;ch h&ograve;a điệu.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/176/day-la-matisse.jpg', 45, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (56, N'Thiền Sư Và Em Bé 5 Tuổi', CAST(N'2010-08-24' AS Date), 8, 0, 200000.0000, N'<p>Trong l&ograve;ng ch&uacute;ng ta ai cũng c&oacute; một em b&eacute; đang đau khổ. Ai cũng c&oacute; một thời gian kh&oacute; khăn khi c&ograve;n thơ ấu v&agrave; nhiều người đ&atilde; trải qua những chấn động t&acirc;m l&yacute;, những tổn thương lớn m&agrave; vết thương c&ograve;n lưu lại đến b&acirc;y giờ. Để tự bảo vệ v&agrave; ph&ograve;ng hộ trước những khổ đau trong tương lai, ch&uacute;ng ta thường cố qu&ecirc;n đi thời gian đau l&ograve;ng đ&oacute;. Mỗi khi tiếp x&uacute;c với những kinh nghiệm khổ đau ấy, ch&uacute;ng ta nghĩ rằng ch&uacute;ng ta sẽ kh&ocirc;ng chịu đựng nổi, sẽ kh&ocirc;ng c&oacute; khả năng xử l&yacute; n&ecirc;n ch&uacute;ng ta n&eacute;n chặt những cảm x&uacute;c v&agrave; k&yacute; ức của m&igrave;nh v&agrave;o đ&aacute;y s&acirc;u v&ocirc; thức. Đ&oacute; c&oacute; thể l&agrave; do đ&atilde; từ l&acirc;u ch&uacute;ng ta kh&ocirc;ng đủ can đảm để đối diện với em b&eacute; đ&oacute;.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/181/thien-su-va-em-be-5-tuoi.jpg', 46, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (57, N'Cúi Lạy Trước Hỏi Sau', CAST(N'2017-02-12' AS Date), 3, 0, 200000.0000, N'<p>Chuyện g&igrave; sẽ xảy ra khi một c&ocirc; g&aacute;i người Mỹ hiện đại với t&iacute;nh c&aacute;ch ph&oacute;ng kho&aacute;ng v&agrave; t&acirc;m hồn tự do đi v&agrave;o con đường t&acirc;m linh, t&igrave;m kiếm, học hỏi v&agrave; tu tập Thiền t&ocirc;ng Nhật Bản?</p>

<p>Cuốn s&aacute;ch n&agrave;y n&oacute;i về qu&aacute; tr&igrave;nh trưởng th&agrave;nh của một con người, về t&ocirc;n gi&aacute;o, c&ocirc;ng việc, đạo đức, c&aacute; nh&acirc;n v&agrave; đặc biệt l&agrave; về con đường truy tầm hạnh ph&uacute;c. Đặt c&acirc;u hỏi l&agrave; chủ đề xuy&ecirc;n suốt cuốn s&aacute;ch: L&agrave;m thế n&agrave;o t&ocirc;i c&oacute; thể hạnh ph&uacute;c? Điều g&igrave; l&agrave; đ&uacute;ng? T&iacute;nh đ&iacute;ch thực l&agrave; g&igrave;? Độc giả sẽ được tham gia v&agrave;o một h&agrave;nh tr&igrave;nh kh&oacute; khăn, buồn b&atilde; xen lẫn h&agrave;i hước, truyền cảm hứng, trung thực v&agrave; v&ocirc; c&ugrave;ng ch&acirc;n th&agrave;nh.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/178/cui-lay-truoc-hoi-sau.jpg', 47, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (58, N'Dẫu Có Ra Đi Vẫn Sẽ Cười', CAST(N'2005-02-01' AS Date), 24, 0, 30000.0000, N'<p>Người ta thường n&oacute;i, nh&acirc;n duy&ecirc;n như một chiếc thuyền, vậy th&igrave; cho hỏi, l&agrave;m người bao kiếp mới đi chung một chuyến với nhau? Cho d&ugrave; c&oacute; đi chung chăng nữa, đến nơi người vẫn phải xuống bến. Rời khỏi thuyền đồng nghĩa m&igrave;nh đ&atilde; hết duy&ecirc;n.</p>

<p>Vậy l&agrave; m&igrave;nh chỉ c&oacute; duy&ecirc;n với nhau như vậy, một chiếc thuyền xưa, một kh&uacute;c s&ocirc;ng cũ. Nặng nghĩa nặng t&igrave;nh th&igrave; c&uacute;i ch&agrave;o, vẫy tay. C&ograve;n kh&ocirc;ng th&igrave; c&uacute;i mặt quay đầu. Đường ai nấy bước, m&atilde;i m&atilde;i nợ nhau một c&aacute;i ch&agrave;o.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/177/dau-co-ra-di-van-se-cuoi.jpg', 48, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (59, N'Đường Mây Trên Đất Hoa', CAST(N'2000-03-21' AS Date), 3, 0, 25000.0000, N'<p>H&ograve;a thượng Hư V&acirc;n ra đời v&agrave;o l&uacute;c c&aacute;c nước đế quốc đang x&acirc;u x&eacute; Trung Hoa (1840) v&agrave; ng&agrave;i qua đời v&agrave;o năm 1959, sau khi nước Cộng h&ograve;a Nh&acirc;n d&acirc;n Trung Hoa ra đời (1949).</p>

<p>Bất chấp mọi kh&oacute; khăn trở ngại, t&igrave;nh h&igrave;nh ch&iacute;nh trị x&aacute;o trộn, ng&agrave;i vẫn ung dung hoằng ph&aacute;p, x&acirc;y dựng lại những tự viện, ch&ugrave;a chiền đổ n&aacute;t v&igrave; chiến cuộc, chấn hưng Phật gi&aacute;o, đ&agrave;o tạo tăng t&agrave;i, x&acirc;y dựng lại căn nh&agrave; ph&aacute;p cho bền vững. Ng&agrave;i đ&atilde; x&acirc;y cất h&agrave;ng chục cảnh ch&ugrave;a, tr&ugrave;ng tu h&agrave;ng trăm th&aacute;p Tổ, dạy dỗ h&agrave;ng ng&agrave;n tăng ch&uacute;ng v&agrave; truyền giới cho h&agrave;ng trăm ng&agrave;n người. Ng&agrave;i kh&ocirc;ng những đ&atilde; đi khắp Trung Hoa hoằng dương Phật đạo m&agrave; c&ograve;n qua cả Xi&ecirc;m La (Th&aacute;i Lan), T&acirc;y Tạng, Ấn Độ, Nam Dương, M&atilde; Lai, Miến Điện để l&agrave;m Phật sự.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/131/sach-duong-may-tren-dat-hoa.jpg', 49, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (60, N'Lên Đồng - Hành Trình Của Thần Linh Và Thân Phận', CAST(N'2012-05-21' AS Date), 19, 0, 200000.0000, N'<p>&ldquo;&hellip; l&ecirc;n đồng kh&ocirc;ng phải l&agrave; trạng th&aacute;i bệnh l&yacute;, m&agrave; chỉ l&agrave; trạng th&aacute;i t&acirc;m sinh l&yacute;, l&agrave; trạng th&aacute;i biến đổi &yacute; thức đặc biệt, ở đ&oacute; c&aacute;c &ocirc;ng đồng, b&agrave; đồng chủ động tự đưa m&igrave;nh v&agrave;o trạng th&aacute;i ấy. Ch&iacute;nh trong m&ocirc;i trường tự biến đổi &yacute; thức đ&oacute;, c&aacute;i v&ocirc; thức trỗi dậy, gi&uacute;p b&agrave; đồng, &ocirc;ng đồng giải tỏa nhiều ức chế t&acirc;m thần cũng ch&iacute;nh l&agrave; nguồn gốc của nhiều hiện tượng t&acirc;m sinh l&yacute;, như đi&ecirc;n loạn, bệnh tật, kết t&oacute;c, cơ đ&agrave;y... V&agrave; cũng kh&ocirc;ng c&oacute; g&igrave; ngạc nhi&ecirc;n khi ra đồng v&agrave; thường xuy&ecirc;n l&ecirc;n đồng th&igrave; trong m&ocirc;i trường tự biến đổi &yacute; thức do tự &aacute;m thị m&agrave; c&aacute;c ức chế v&ocirc; thức được giải tỏa, dần khỏi bệnh, dần khắc phục được c&aacute;c h&agrave;nh vi lệch chuẩn v&agrave; t&aacute;i h&ograve;a nhập cộng đồng như những người b&igrave;nh thường kh&aacute;c.&rdquo;</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/131/len-dong.jpg', 50, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (61, N'Tinh Vân Thiền Thoại', CAST(N'2012-12-11' AS Date), 16, 0, 20000.0000, NULL, N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/133/tinh-van-thien-thoai.jpg', 51, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (62, N'Làm Cha Mẹ Tỉnh Thức - Chuyển Hóa Bản Thân, Trao Quyền Cho Con Cái', NULL, 4, 0, 200000.0000, N'<p>Khi nu&ocirc;i dạy con c&aacute;i, ta thường xuy&ecirc;n bắt gặp m&igrave;nh đứng trước cuộc chiến giữa l&yacute; tr&iacute; v&agrave; con tim, như lu&ocirc;n phải đi thăng bằng tr&ecirc;n d&acirc;y. Một phản ứng kh&ocirc;ng ph&ugrave; hợp c&oacute; thể l&agrave;m kh&ocirc; h&eacute;o t&acirc;m hồn con, ngược lại, một lời khen ngợi đ&uacute;ng l&uacute;c c&oacute; thể tạo cảm hứng để con thăng hoa. Trong mỗi khoảnh khắc, ta đều phải lựa chọn x&acirc;y hay ph&aacute;, sưởi ấm hay l&agrave;m nguội lạnh t&acirc;m hồn con trẻ.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/183/lam-cha-me-tinh-thuc.jpg', 52, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (63, N'Ba Từ Nhiệm Màu', CAST(N'2020-02-22' AS Date), 15, 0, 21000.0000, N'<p>Gia đ&igrave;nh l&agrave; c&aacute;i n&ocirc;i văn h&oacute;a đầu ti&ecirc;n h&igrave;nh th&agrave;nh n&ecirc;n nh&acirc;n c&aacute;ch của trẻ. Sự kh&eacute;o l&eacute;o trong giao tiếp v&agrave; ki&ecirc;n định với phương ch&acirc;m gi&aacute;o dục trẻ l&agrave; điều v&ocirc; c&ugrave;ng quan trọng. T&aacute;c giả Saito Takashi đ&atilde; ngầm khẳng định kh&ocirc;ng thể chủ quan khi cho rằng &quot;cha mẹ sinh con trời sinh t&iacute;nh&quot; m&agrave; c&acirc;u n&oacute;i &quot;ở bầu th&igrave; tr&ograve;n ở ống th&igrave; d&agrave;i&quot; sẽ ch&iacute;nh x&aacute;c hơn. Cuốn s&aacute;ch xoay quanh vấn đề về việc r&egrave;n luyện tư duy cho trẻ th&ocirc;ng qua học tập. V&agrave; th&oacute;i quen học tập hay bất cứ một loại động lực n&agrave;o trong cuộc sống hằng ng&agrave;y của trẻ c&oacute; được khi, cha mẹ biết c&aacute;ch th&uacute;c đẩy v&agrave; duy tr&igrave; bằng ba cụm từ &quot;c&oacute; ph&eacute;p m&agrave;u&quot;:</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/181/ba-tu-nhiem-mau.jpg', 53, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (64, N'52 Thực Đơn Nấu Ăn Chay Trong Gia Đình', CAST(N'2012-02-02' AS Date), 14, 0, 30000.0000, N'<p>S&aacute;ch dạy nấu ăn</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/180/52-thuc-don-nau-an-chay-trong-gia-dinh.jpg', 54, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (65, N'Thực Hành Giáo Dục Nhân Cách Giúp Trẻ Trưởng Thành, Hạnh Phúc Và Vững Vàng', NULL, 17, 0, 30000.0000, N'<p>THỰC H&Agrave;NH GI&Aacute;O DỤC NH&Acirc;N C&Aacute;CH được soạn thảo dựa tr&ecirc;n &yacute; tưởng của Tổ chức HEARY v&agrave; c&aacute;c th&agrave;nh vi&ecirc;n chủ chốt của Nh&oacute;m T&acirc;m l&yacute; học t&iacute;ch cực tại Việt Nam, cuốn s&aacute;ch lần đầu ra mắt độc giả Việt Nam v&agrave;o th&aacute;ng 7 năm 2020 do Thanglongbooks - Đơn vị s&aacute;ch ti&ecirc;n phong trong gi&aacute;o dục trường học v&agrave; gi&aacute;o dục x&atilde; hội ph&aacute;t h&agrave;nh.</p>

<p>THỰC H&Agrave;NH GI&Aacute;O DỤC NH&Acirc;N C&Aacute;CH l&agrave; một cuốn cẩm nang đơn giản nhưng hữu &iacute;ch, d&agrave;nh cho c&aacute;c bậc phụ huynh, gi&aacute;o vi&ecirc;n mầm non. C&aacute;c t&aacute;c giả đưa ra luận đề về c&aacute;ch nu&ocirc;i dạy một đứa trẻ hạnh ph&uacute;c v&agrave; đưa ra hướng đi hợp l&iacute; cho cha mẹ v&agrave; gi&aacute;o vi&ecirc;n, bằng c&aacute;ch m&ocirc; h&igrave;nh h&oacute;a v&agrave; đơn giản h&oacute;a c&aacute;c kiến thức khoa học v&agrave; h&agrave;n l&acirc;m, c&aacute;c t&aacute;c giả đ&atilde; truyền tải th&agrave;nh c&ocirc;ng th&ocirc;ng điệp về nu&ocirc;i dưỡng một đứa trẻ hạnh ph&uacute;c.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/130/thuc-hanh-giao-duc-nhan-cach.jpg', 55, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (66, N'Cá Voi Dài Bao Nhiêu?', NULL, 20, 0, 20000.0000, N'<p>Đ&atilde; bao giờ bạn thắc mắc, c&aacute; voi d&agrave;i chừng n&agrave;o? C&ograve;n c&aacute; heo v&agrave; sư tử biển th&igrave; sao nhỉ? H&atilde;y c&ugrave;ng kh&aacute;m ph&aacute; những điều đ&oacute; trong cuốn s&aacute;ch si&ecirc;u th&uacute; vị v&agrave; đầy ắp những th&ocirc;ng tin bổ &iacute;ch n&agrave;y nh&eacute;!</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/184/ca-voi-dai-bao-nhieu.jpg', 56, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (67, N'Bọ Rùa Nặng Chừng Nào?', CAST(N'2014-05-22' AS Date), 3, 0, 20000.0000, N'<p>Bạn c&oacute; biết một ch&uacute; bọ r&ugrave;a nặng bằng bao nhi&ecirc;u con kiến kh&ocirc;ng? Hay một con c&aacute;o nặng bằng bao nhi&ecirc;u con thỏ? H&atilde;y c&ugrave;ng t&igrave;m hiểu những th&ocirc;ng tin cực k&igrave; th&uacute; vị về c&acirc;n nặng của c&aacute;c lo&agrave;i động vật trong cuốn s&aacute;ch n&agrave;y nh&eacute;!</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/184/bo-rua-nang-chung-nao.jpg', 57, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (68, N'Xì Xà Xì Xụp', NULL, 3, 0, 25000.0000, N'<p>&nbsp;</p>

<p>L&agrave; người Việt, ai lại kh&ocirc;ng m&ecirc; những m&oacute;n sợi vắn sợi d&agrave;i nuột n&agrave;, nấu với thịt, c&aacute;, t&ocirc;m thơm ngon, với nước d&ugrave;ng ngọt lịm, chan ngập, n&oacute;ng sốt, khi ăn ph&aacute;t ra tiếng x&igrave; x&agrave; x&igrave; xụp vui tai? Phở, b&uacute;n, miến, m&igrave;, b&aacute;nh đa, b&aacute;nh canh, cao lầu, hủ tiếu&hellip;với cơ man biến tấu về nguy&ecirc;n liệu, về gia vị qua c&aacute;c v&ugrave;ng miền đ&atilde; trở th&agrave;nh một n&eacute;t ẩm thực độc đ&aacute;o trong đời sống hằng ng&agrave;y của người Việt.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/131/xi-xa-xi-xup.jpg', 58, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (69, N'Khi Bố Còn Thơ', CAST(N'2009-01-21' AS Date), 3, 0, 200000.0000, N'<p>C&oacute; khi kh&ocirc;ng nghĩ ra được chuyện n&agrave;o, t&ocirc;i lại kể chuyện của những &ocirc;ng bố kh&aacute;c m&agrave; t&ocirc;i biết. X&eacute;t cho c&ugrave;ng th&igrave; &ocirc;ng bố n&agrave;o cũng từng l&agrave; một cậu b&eacute;. Do đ&oacute; c&aacute;c ch&aacute;u sẽ thấy, kh&ocirc;ng c&oacute; chuyện n&agrave;o trong n&agrave;y bịa đặt cả, bởi cậu b&eacute; con n&agrave;o cũng đ&atilde; từng gặp phải.</p>

<p>C&oacute; lẽ tất cả trẻ con đều muốn biết điều g&igrave; đ&atilde; xảy ra với một &ocirc;ng bố khi c&ograve;n nhỏ.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/131/khi-bo-con-tho.jpg', 59, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (70, N'Dưỡng Trí Não Con Tinh', CAST(N'2009-01-02' AS Date), 7, 0, 25000.0000, N'<p>Kh&aacute; nhiều phụ huynh Việt Nam hiện nay đang bối rối trong việc lựa chọn phương ph&aacute;p nu&ocirc;i dạy con, từ quan t&acirc;m về thai gi&aacute;o trước khi trẻ ra đời, gi&aacute;o dục sớm cho trẻ, cho đến chọn trường học, học kỹ năng, ph&aacute;t triển tư duy, học ngoại ngữ, sống hạnh ph&uacute;c,... Nếu t&igrave;m kiếm qua s&aacute;ch vở th&igrave; c&oacute; lẽ nhiều người sẽ cho&aacute;ng ngợp bởi rất nhiều s&aacute;ch gi&aacute;o dục từ Mỹ, Nhật, Do Th&aacute;i,... Biết theo ai, theo phong c&aacute;ch dạy con n&agrave;o b&acirc;y giờ?</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/132/duong-tri-nao-con-tinh.jpg', 60, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (71, N'Phép Mầu Ở Những Vùng Đất Lạ Kỳ', NULL, 9, 0, 30000.0000, N'<p>Ph&eacute;p mầu sẽ xuất hiện khi ta c&oacute; tr&aacute;i tim thi&ecirc;n thần.</p>

<p>Ai đ&atilde; từng &ocirc;m ấp một chuyến đi d&agrave;i trong t&acirc;m tưởng, qua những xứ sở thần ti&ecirc;n, thấy những điều lạ lẫm, gặp những chuyện th&uacute; vị, th&igrave; h&atilde;y đọc&nbsp;<strong>Ph&eacute;p Mầu Ở Những V&ugrave;ng Đất Lạ Kỳ</strong>, nh&agrave; văn nh&iacute; Xu&acirc;n Mai sẽ đưa bạn phi&ecirc;u lưu một chuyến thật bay bổng, l&atilde;ng mạn m&agrave; chỉ c&oacute; trong những giấc mơ tuổi thơ.</p>

<p>Xu&acirc;n Mai đ&atilde; chắp cho nh&acirc;n vật Rona &ldquo;đ&ocirc;i c&aacute;nh thi&ecirc;n thần&rdquo;, bay v&agrave;o những kh&ocirc;ng gian của hai miền hư thực. Hư l&agrave; những n&uacute;i non s&ocirc;ng suối ti&ecirc;n cảnh, những sắc m&agrave;u lung linh ảo ảnh, thực l&agrave; b&aacute;nh kem, l&agrave; kẹo s&ocirc; c&ocirc; la, l&agrave; những thứ m&agrave; trẻ nhỏ th&iacute;ch th&uacute;.</p>
', N'https://nhasachphuongnam.com/images/thumbnails/465/465/detailed/184/phep-mau-o-nhung-vung-dat-la-ky.jpg', 61, NULL, 0, 0)
INSERT [dbo].[Item] ([ItemId], [Name], [PublishDate], [AuthorId], [Quantity], [Price], [Introduce], [ImagePath], [DiscussId], [Sale], [Rate], [QuantitySold]) VALUES (73, N'Sách Tạo Thử', CAST(N'2009-12-13' AS Date), 7, 0, 50000.0000, N'<p>S&aacute;ch n&agrave;y admin tạo thử</p>
', N'https://www.google.com/search?q=h%C3%ACnh+%E1%BA%A3nh&client=firefox-b-d&tbm=isch&source=iu&ictx=1&fir=pQcZmfCR-na3eM%252CbyJ-56hnj8o3aM%252C_&vet=1&usg=AI4_-kQ4HrnOtNXG4WQ0a0udfjecDTl3OQ&sa=X&ved=2ahUKEwjU7bbts8_tAhXx8XMBHVdNA80Q9QF6BAgMEAE#imgrc=pQcZmfCR-na3eM', 1070, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Item] OFF
GO
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (33, 18)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (33, 29)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (33, 40)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (33, 61)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 20)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 21)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 22)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 23)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 24)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 25)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 26)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 27)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 28)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 34)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 38)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 41)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 45)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 46)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 48)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 53)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 54)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 55)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 57)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 58)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (34, 68)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 20)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 24)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 25)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 29)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 33)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 36)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 38)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 39)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 41)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 44)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 45)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 52)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 53)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 57)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 60)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 63)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 65)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 71)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (35, 73)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 20)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 23)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 24)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 25)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 30)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 31)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 36)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 38)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 40)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 41)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 42)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 43)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 44)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 50)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 52)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 54)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 60)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 63)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 65)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 69)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 70)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (36, 73)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (37, 33)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (37, 39)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (37, 43)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (37, 44)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (37, 51)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (37, 52)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (37, 60)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (37, 62)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (37, 64)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (37, 65)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (37, 66)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (37, 67)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (37, 71)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (37, 73)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (38, 21)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (38, 22)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (38, 23)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (38, 24)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (38, 28)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (38, 30)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (38, 31)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (38, 33)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (38, 39)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (38, 40)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (38, 43)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (38, 55)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (38, 64)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (38, 67)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (38, 69)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (38, 71)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (39, 28)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (39, 29)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (39, 47)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (39, 51)
GO
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (39, 55)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (39, 64)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (39, 67)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (39, 70)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (40, 42)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (40, 45)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (40, 66)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (40, 70)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 22)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 30)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 31)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 36)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 37)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 42)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 46)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 47)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 48)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 49)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 50)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 54)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 56)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 58)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 59)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 61)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (41, 66)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (42, 34)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (42, 37)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (42, 46)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (42, 47)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (42, 48)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (42, 49)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (42, 50)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (42, 56)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (42, 58)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (42, 61)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (42, 63)
INSERT [dbo].[ItemCategory] ([CategoryId], [ItemId]) VALUES (42, 68)
GO
INSERT [dbo].[ItemRate] ([ItemId], [Username], [Rate], [Comment]) VALUES (18, N'test', 5, N'Cũng hay đó')
GO
SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([DiscussId], [Username], [MessageId], [Content], [Time]) VALUES (8, N'test', 55, N'Quyền sách này hay không nhỉ ?', CAST(N'2020-12-15T14:23:46.060' AS DateTime))
INSERT [dbo].[Message] ([DiscussId], [Username], [MessageId], [Content], [Time]) VALUES (62, N'admin', 57, N'hello bạn', CAST(N'2020-12-15T14:28:14.787' AS DateTime))
INSERT [dbo].[Message] ([DiscussId], [Username], [MessageId], [Content], [Time]) VALUES (62, N'test', 56, N'Hêlo mọi người', CAST(N'2020-12-15T14:28:04.553' AS DateTime))
INSERT [dbo].[Message] ([DiscussId], [Username], [MessageId], [Content], [Time]) VALUES (1071, N'test', 58, N'tìm sách ....', CAST(N'2020-12-15T14:29:13.693' AS DateTime))
SET IDENTITY_INSERT [dbo].[Message] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([NewsId], [Username], [Content], [isPublic], [DiscussId], [Date]) VALUES (7, N'admin', N'<p style="text-align:center"><span style="color:#c0392b"><span style="font-size:20px"><strong>LỜI GIỚI THIỆU</strong></span></span></p>

<p>daithuvien.com&nbsp;l&agrave; trang thương mại điện tử của&nbsp;<strong>Nh&agrave; S&aacute;ch Hiếu Đảnh</strong>, hệ thống nh&agrave; s&aacute;ch th&acirc;n thuộc của nhiều gia đ&igrave;nh Việt kể từ nh&agrave; s&aacute;ch đầu ti&ecirc;n ra đời năm 2020&nbsp;đến nay.&nbsp;&nbsp;</p>

<p>&nbsp;</p>

<p>Đến với kh&ocirc;ng gian mua sắm trực tuyến daithuvien.com, kh&aacute;ch h&agrave;ng c&oacute; thể dễ d&agrave;ng t&igrave;m thấy những cuốn s&aacute;ch hay, đa thể loại của nhiều nh&agrave; xuất bản, c&ocirc;ng ty s&aacute;ch trong v&agrave; ngo&agrave;i nước c&ugrave;ng nhiều dụng cụ học tập, văn ph&ograve;ng phẩm, qu&agrave; lưu niệm, đồ chơi gi&aacute;o dục ch&iacute;nh h&atilde;ng của những thương hiệu uy t&iacute;n.&nbsp;C&ugrave;ng ti&ecirc;u ch&iacute; kh&ocirc;ng ngừng ho&agrave;n thiện, n&acirc;ng cao chất lượng sản phẩm, dịch vụ, Nh&agrave; S&aacute;ch Phương Nam cam kết mang đến cho kh&aacute;ch h&agrave;ng trải nghiệm mua sắm trực tuyến an to&agrave;n, tiện lợi: c&aacute;ch đặt h&agrave;ng đơn giản, phương thức thanh to&aacute;n đa dạng, dịch vụ chăm s&oacute;c kh&aacute;ch h&agrave;ng tận t&igrave;nh, chu đ&aacute;o.&nbsp;</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>

<table border="1" cellpadding="1" cellspacing="1" style="width:100%">
	<tbody>
		<tr>
			<td>
			<p style="text-align:center">S&aacute;ng lập: Nguyễn Khoa Đảnh (Backend)</p>

			<p style="text-align:center"><img alt="" src="https://scontent.fsgn5-2.fna.fbcdn.net/v/t1.0-9/76922066_433874144167980_1601990623513018368_o.jpg?_nc_cat=105&amp;ccb=2&amp;_nc_sid=454319&amp;_nc_ohc=UrxBoIzL920AX_NSqSy&amp;_nc_ht=scontent.fsgn5-2.fna&amp;oh=15dbdd5d025905406ee918e59d918466&amp;oe=5FFB30C3" style="height:400px; width:300px" /></p>
			</td>
			<td>
			<p style="text-align:center">Đồng s&aacute;ng lập: B&ugrave;i Trung Hiếu (Frontend)</p>

			<p style="text-align:center"><img alt="" src="https://scontent.fsgn5-7.fna.fbcdn.net/v/t1.0-9/107498183_2698048370513230_8417862590277377964_n.jpg?_nc_cat=109&amp;ccb=2&amp;_nc_sid=09cbfe&amp;_nc_ohc=CQZ7XHTi-70AX8_8Xip&amp;_nc_ht=scontent.fsgn5-7.fna&amp;oh=9c289ac2918e67079328ff757847d522&amp;oe=5FFC16C3" style="height:400px; width:400px" /></p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p>&nbsp;</p>
', 1, 62, CAST(N'2020-12-14T14:50:38.000' AS DateTime))
INSERT [dbo].[News] ([NewsId], [Username], [Content], [isPublic], [DiscussId], [Date]) VALUES (9, N'test', N'<p><strong>T&igrave;m </strong>s&aacute;ch to&agrave;n cầu ....&nbsp;</p>
', 1, 1072, CAST(N'2020-12-15T14:30:04.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[PaidBill] ON 

INSERT [dbo].[PaidBill] ([BillId], [Date], [StatusId], [PublisherId], [Price]) VALUES (1021, CAST(N'2020-12-15T14:25:27.523' AS DateTime), 4, 1, 750000.0000)
INSERT [dbo].[PaidBill] ([BillId], [Date], [StatusId], [PublisherId], [Price]) VALUES (1022, CAST(N'2020-12-15T14:32:30.280' AS DateTime), 4, 1, 500000.0000)
SET IDENTITY_INSERT [dbo].[PaidBill] OFF
GO
SET IDENTITY_INSERT [dbo].[Publisher] ON 

INSERT [dbo].[Publisher] ([PublisherId], [Name], [Introduce], [Phone], [Address]) VALUES (1, N'Kim Đồng', N'<p>Rất nổi tiếng</p>
', NULL, N'VietNam, TpHCM')
INSERT [dbo].[Publisher] ([PublisherId], [Name], [Introduce], [Phone], [Address]) VALUES (2, N'GDVN', N'<p>S&aacute;ch nh&agrave; nước đ&oacute; fen</p>
', NULL, N'Việt Nam')
SET IDENTITY_INSERT [dbo].[Publisher] OFF
GO
INSERT [dbo].[Receipt] ([ItemId], [Quantity], [Price], [BillId]) VALUES (18, 100, 5000.0000, 1021)
INSERT [dbo].[Receipt] ([ItemId], [Quantity], [Price], [BillId]) VALUES (20, 50, 5000.0000, 1021)
INSERT [dbo].[Receipt] ([ItemId], [Quantity], [Price], [BillId]) VALUES (21, 50, 10000.0000, 1022)
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusId], [Name]) VALUES (1, N'Đang Chờ')
INSERT [dbo].[Status] ([StatusId], [Name]) VALUES (2, N'Đang Xử Lí')
INSERT [dbo].[Status] ([StatusId], [Name]) VALUES (3, N'Đang Vận Chuyển')
INSERT [dbo].[Status] ([StatusId], [Name]) VALUES (4, N'Đã Hoàn Thành')
INSERT [dbo].[Status] ([StatusId], [Name]) VALUES (5, N'Đã Huỷ')
INSERT [dbo].[Status] ([StatusId], [Name]) VALUES (6, N'Đặt Hàng')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Access] FOREIGN KEY([AccessId])
REFERENCES [dbo].[Access] ([AccessId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Access]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_EarnBill] FOREIGN KEY([BillId])
REFERENCES [dbo].[EarnBill] ([BillId])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_EarnBill]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Item]
GO
ALTER TABLE [dbo].[Discuss]  WITH CHECK ADD  CONSTRAINT [FK_Discuss_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Discuss] CHECK CONSTRAINT [FK_Discuss_Account]
GO
ALTER TABLE [dbo].[EarnBill]  WITH CHECK ADD  CONSTRAINT [FK_EarnBill_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[EarnBill] CHECK CONSTRAINT [FK_EarnBill_Account]
GO
ALTER TABLE [dbo].[EarnBill]  WITH CHECK ADD  CONSTRAINT [FK_EarnBill_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[EarnBill] CHECK CONSTRAINT [FK_EarnBill_Status]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([AuthorId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Book_Author]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Discuss] FOREIGN KEY([DiscussId])
REFERENCES [dbo].[Discuss] ([DiscussId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Discuss]
GO
ALTER TABLE [dbo].[ItemCategory]  WITH CHECK ADD  CONSTRAINT [FK_BookType_Book] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[ItemCategory] CHECK CONSTRAINT [FK_BookType_Book]
GO
ALTER TABLE [dbo].[ItemCategory]  WITH CHECK ADD  CONSTRAINT [FK_BookType_Type] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[ItemCategory] CHECK CONSTRAINT [FK_BookType_Type]
GO
ALTER TABLE [dbo].[ItemRate]  WITH CHECK ADD  CONSTRAINT [FK_BookRate_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ItemRate] CHECK CONSTRAINT [FK_BookRate_Account]
GO
ALTER TABLE [dbo].[ItemRate]  WITH CHECK ADD  CONSTRAINT [FK_BookRate_Book] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[ItemRate] CHECK CONSTRAINT [FK_BookRate_Book]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Account]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Discuss] FOREIGN KEY([DiscussId])
REFERENCES [dbo].[Discuss] ([DiscussId])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Discuss]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Account]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_Discuss] FOREIGN KEY([DiscussId])
REFERENCES [dbo].[Discuss] ([DiscussId])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_Discuss]
GO
ALTER TABLE [dbo].[PaidBill]  WITH CHECK ADD  CONSTRAINT [FK_PaidBill_Publisher] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publisher] ([PublisherId])
GO
ALTER TABLE [dbo].[PaidBill] CHECK CONSTRAINT [FK_PaidBill_Publisher]
GO
ALTER TABLE [dbo].[PaidBill]  WITH CHECK ADD  CONSTRAINT [FK_PaidBill_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[PaidBill] CHECK CONSTRAINT [FK_PaidBill_Status]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_Item]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FK_Receipt_PaidBill] FOREIGN KEY([BillId])
REFERENCES [dbo].[PaidBill] ([BillId])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FK_Receipt_PaidBill]
GO
USE [master]
GO
ALTER DATABASE [DB_Store] SET  READ_WRITE 
GO
