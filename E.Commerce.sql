USE [master]
GO
/****** Object:  Database [ECommerceWebsite]    Script Date: 28-Jul-25 11:35:59 PM ******/
CREATE DATABASE [ECommerceWebsite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ECommerceWebsite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ECommerceWebsite.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ECommerceWebsite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ECommerceWebsite_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ECommerceWebsite] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECommerceWebsite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECommerceWebsite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECommerceWebsite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ECommerceWebsite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ECommerceWebsite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECommerceWebsite] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ECommerceWebsite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET RECOVERY FULL 
GO
ALTER DATABASE [ECommerceWebsite] SET  MULTI_USER 
GO
ALTER DATABASE [ECommerceWebsite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ECommerceWebsite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECommerceWebsite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ECommerceWebsite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ECommerceWebsite] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ECommerceWebsite] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ECommerceWebsite', N'ON'
GO
ALTER DATABASE [ECommerceWebsite] SET QUERY_STORE = ON
GO
ALTER DATABASE [ECommerceWebsite] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ECommerceWebsite]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdminId] [uniqueidentifier] NOT NULL,
	[AdminAccount] [varchar](250) NOT NULL,
	[AdminPassword] [varchar](250) NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[Avatar] [varchar](250) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[IdCardFront] [varchar](250) NOT NULL,
	[IdCardBack] [varchar](250) NOT NULL,
	[DateOfIssue] [datetime] NOT NULL,
	[PlaceOfIssue] [nvarchar](250) NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssembleIn]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssembleIn](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_AssembleIn] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillingAddress]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingAddress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillingAddressFirstName] [nvarchar](250) NULL,
	[BillingAddressLastName] [nvarchar](250) NULL,
	[BillingAddressEmail] [varchar](250) NOT NULL,
	[BillingAddressAddress] [nvarchar](250) NULL,
	[BillingAddressCity] [nvarchar](250) NULL,
	[BillingAddressCountry] [nvarchar](250) NULL,
	[BillingAddressZipCode] [varchar](250) NULL,
	[BillingAddressTelephone] [varchar](50) NULL,
	[ShiptoDifferenceAddress] [bit] NOT NULL,
	[ShippingAddressFirstName] [nvarchar](250) NULL,
	[ShippingAddressLastName] [nvarchar](250) NULL,
	[ShippingAddressEmail] [varchar](250) NULL,
	[ShippingAddressAddress] [nvarchar](250) NULL,
	[ShippingAddressCity] [nvarchar](250) NULL,
	[ShippingAddressCountry] [nvarchar](250) NULL,
	[ShippingAddressZipCode] [varchar](250) NULL,
	[ShippingAddressTelephone] [varchar](50) NULL,
	[OrderNote] [ntext] NOT NULL,
 CONSTRAINT [PK_BillingAddress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NOT NULL,
	[Logo] [varchar](250) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ColorCode] [varchar](250) NOT NULL,
	[ColorName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[CommentText] [ntext] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Rate] [int] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Config]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Mail1] [varchar](250) NOT NULL,
	[Mail2] [varchar](250) NULL,
	[Mail3] [varchar](250) NULL,
	[Mail4] [varchar](250) NULL,
	[Mail5] [varchar](250) NULL,
	[Contact] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Hotline] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Keyword] [nvarchar](250) NULL,
	[SocialLink1] [varchar](150) NOT NULL,
	[SocialLink2] [varchar](150) NOT NULL,
	[SocialLink3] [varchar](150) NOT NULL,
	[SocialLink4] [varchar](150) NOT NULL,
	[SocialLink5] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[PhoneNumber] [varchar](50) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Message] [ntext] NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[PaymentMethod] [nvarchar](250) NOT NULL,
	[TotalAmount] [real] NOT NULL,
	[ShippingFee] [real] NOT NULL,
	[IsTermsAccepted] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [real] NOT NULL,
	[TotalPrice] [real] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[MainImage] [nvarchar](max) NOT NULL,
	[Price] [real] NOT NULL,
	[SalePrice] [real] NOT NULL,
	[Description] [ntext] NOT NULL,
	[Status] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[AssembleInId] [int] NOT NULL,
	[CreateTime] [datetime2](7) NOT NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
	[QuantityTotal] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Images] [nvarchar](250) NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[TaxCode] [varchar](250) NOT NULL,
	[Website] [varchar](250) NOT NULL,
	[Logo] [varchar](250) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserAccount] [varchar](250) NOT NULL,
	[UserPassword] [varchar](250) NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[Avatar] [varchar](250) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[IdCardFront] [varchar](250) NOT NULL,
	[IdCardBack] [varchar](250) NOT NULL,
	[DateOfIssue] [datetime] NOT NULL,
	[PlaceOfIssue] [nvarchar](250) NOT NULL,
	[RoleId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishList]    Script Date: 28-Jul-25 11:36:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_WishList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250608143416_InitialCreate', N'8.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250619020908_AllowNullFields', N'8.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250625120924_AddWishListTable', N'8.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250704031140_AddIdentityToBillingAddress', N'8.0.5')
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [AdminId], [AdminAccount], [AdminPassword], [FullName], [Avatar], [PhoneNumber], [Email], [IdCardFront], [IdCardBack], [DateOfIssue], [PlaceOfIssue], [RoleId], [CreateTime]) VALUES (11, N'218cb08c-da11-42f0-b668-2de216280256', N'giangnguyen', N'ca7f486d0d2915101f2f1f4750f6e899e55fe42a34bfadf0aaec5a1264561ba9', N'Nguyễn Hoàng Giang', N'applo_logo.webp', N'0964598194', N'nghoanggiang230894@gmail.com', N'asus_logo.png', N'asus_logo.png', CAST(N'2025-06-02T00:00:00.000' AS DateTime), N'Cục quản lý hành chính về TTXH', 1, CAST(N'2025-06-20T09:56:44.237' AS DateTime))
INSERT [dbo].[Admin] ([Id], [AdminId], [AdminAccount], [AdminPassword], [FullName], [Avatar], [PhoneNumber], [Email], [IdCardFront], [IdCardBack], [DateOfIssue], [PlaceOfIssue], [RoleId], [CreateTime]) VALUES (12, N'599b35e6-5b2f-4f5b-ae5a-370263676a5b', N'hobaotruongmaugiao', N'7351a5b921d164f2837437e38eb5c17e5993b63ff1e999cc51ab9c25137e7f7e', N'Nguyễn Hoàng Giang', N'hp_logo.jpg', N'0964598194', N'babyhobao9x1234@gmail.com', N'asus_logo.png', N'applo_logo.webp', CAST(N'2025-06-09T00:00:00.000' AS DateTime), N'Cục quản lý hành chính về TTXH', 1, CAST(N'2025-06-24T08:54:00.910' AS DateTime))
INSERT [dbo].[Admin] ([Id], [AdminId], [AdminAccount], [AdminPassword], [FullName], [Avatar], [PhoneNumber], [Email], [IdCardFront], [IdCardBack], [DateOfIssue], [PlaceOfIssue], [RoleId], [CreateTime]) VALUES (13, N'8c314f01-caf6-42cd-8c2d-d868ea820b7a', N'huyquanhoa', N'c738c5c94e30f56cb146044a6a99882eb4f50f84cdf86b372775f5db1fb10916', N'lamchanhuy', N'hp_logo.jpg', N'0964598194', N'lamchanhuy@gmail.com', N'hp_logo.jpg', N'htc_logo.png', CAST(N'2025-06-12T00:00:00.000' AS DateTime), N'Cục quản lý hành chính về TTXH', 1, CAST(N'2025-06-26T23:29:11.467' AS DateTime))
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[AssembleIn] ON 

INSERT [dbo].[AssembleIn] ([Id], [Country]) VALUES (5, N'canada')
INSERT [dbo].[AssembleIn] ([Id], [Country]) VALUES (1, N'china')
INSERT [dbo].[AssembleIn] ([Id], [Country]) VALUES (3, N'usa')
SET IDENTITY_INSERT [dbo].[AssembleIn] OFF
GO
SET IDENTITY_INSERT [dbo].[BillingAddress] ON 

INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (1, N'', N'', N'', N'', N'', N'', N'', N'', 1, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'195 trần cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', N'')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (2, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 0, N'', N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (17, N'', N'', N'', N'', N'', N'', N'', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'No notes provided')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (18, N'', N'', N'', N'', N'', N'', N'', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'No notes provided')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (19, N'', N'', N'', N'', N'', N'', N'', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'No notes provided')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (20, N'Nguyễn', N'Giang', N'BabyHobao9x@gmail.com', N'195 trần cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, N'Nguyễn', N'Giang', N'BabyHobao9x@gmail.com', N'195 trần cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', N'ewefrgtfbg')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (21, N'Nguyễn', N'', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 0, N'Nguyễn', N'', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', N'')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (22, N'Nguyễn', N'', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 0, N'Nguyễn', N'', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', N'')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (23, N'Nguyễn', N'', N'nghoanggiang230894@gmail.com', N'195 trần cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, N'Nguyễn', NULL, N'nghoanggiang230894@gmail.com', N'195 trần cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', N'')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (24, N'Nguyễn', N'', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 0, N'Nguyễn', N'', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', N'')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (25, N'nguyen', N'', N'babyhobao9x@gmail.com', N'tran cung', N'ha noi', N'viet nam', N'+84', N'0964598194', 0, N'nguyen', N'', N'babyhobao9x@gmail.com', N'tran cung', N'ha noi', N'viet nam', N'+84', N'0964598194', N'')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (26, N'nguyen', N'giang', N'BabyHobao9x@gmail.com', N'hanoi', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 0, N'nguyen', N'giang', N'BabyHobao9x@gmail.com', N'hanoi', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', N'')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (27, N'', N'Giang', N'', N'', N'', N'', N'', N'', 1, NULL, N'Giang', NULL, NULL, NULL, NULL, NULL, NULL, N'No notes provided')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (28, N'Nguyễn', N'Giang', N'', N'', N'', N'', N'', N'', 1, N'Nguyễn', N'Giang', NULL, NULL, NULL, NULL, NULL, NULL, N'No notes provided')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (29, N'', N'', N'', N'', N'', N'', N'', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'No notes provided')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (30, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'195 trần cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'195 trần cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', N'No notes provided')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (31, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 0, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', N'')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (32, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 0, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', N'')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (33, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 0, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', N'')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (34, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'No notes provided')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (35, N'', N'', N'', N'', N'', N'', N'', N'', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'No notes provided')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (36, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, N'babyhobao9x', N'giang', N'nghoanggiang230894@gmail.com', N'195 trần cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', N'trytyutukyilu')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (38, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 0, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', N'')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (40, N'Nguyễn', N'Giang', N'BabyHobao9x@gmail.com', NULL, N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'qwertyjtkuyilu;oi''ơ
')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (42, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'wertykuyilu;ol')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (43, N'Nguyễn', N'Giang', N'BabyHobao9x@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'wdfegtrhkyuliu;oi'';pơ')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (44, N'Nguyễn', N'Giang', N'BabyHobao9x@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'wdfegtrhkyuliu;oi'';pơ')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (45, N'Nguyễn', N'Giang', N'BabyHobao9x@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'wdfegtrhkyuliu;oi'';pơ')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (46, N'Nguyễn', N'Giang', N'BabyHobao9x@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'wdfegtrhkyuliu;oi'';pơ')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (47, N'Nguyễn', N'Giang', N'BabyHobao9x@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'wdfegtrhkyuliu;oi'';pơ')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (48, N'Nguyễn', N'Giang', N'BabyHobao9x@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'wdfegtrhkyuliu;oi'';pơ')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (49, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', NULL, N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'giao hang cho toi vao chieu thu 7 tuan nay')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (50, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'tran cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'giao hang cho toi vao chieu chu nhat')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (51, N'Nguyễn', N'Giang', N'BabyHobao9x@gmail.com', NULL, N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'qsdwfedgfrgtjkhyi.l')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (52, N'Nguyễn', N'Giang', N'BabyHobao9x@gmail.com', NULL, N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'gf ')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (53, N'Nguyễn', N'Giang', N'BabyHobao9x@gmail.com', NULL, N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'ghjkl')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (54, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'hanoi', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, N'Nguyễn', N'Giang', N'nghoanggiang230894@gmail.com', N'195 trần cung', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', N'hadsfdsfdsf')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (55, N'giang', N'nguyen', N'BabyHobao9x@gmail.com', N'hanoi', N'Hà Nội', N'Vietnam', N'000084', N'0964598194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'giao ngoai gio hanh chinh')
INSERT [dbo].[BillingAddress] ([Id], [BillingAddressFirstName], [BillingAddressLastName], [BillingAddressEmail], [BillingAddressAddress], [BillingAddressCity], [BillingAddressCountry], [BillingAddressZipCode], [BillingAddressTelephone], [ShiptoDifferenceAddress], [ShippingAddressFirstName], [ShippingAddressLastName], [ShippingAddressEmail], [ShippingAddressAddress], [ShippingAddressCity], [ShippingAddressCountry], [ShippingAddressZipCode], [ShippingAddressTelephone], [OrderNote]) VALUES (56, N'Nguyễn', N'Giang', N'BabyHobao9x@gmail.com', N'hanoi', N'Hà Nội', N'Vietnam', N'+84', N'0964598194', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'giao gio hanh chinh')
SET IDENTITY_INSERT [dbo].[BillingAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [BrandName], [Logo], [Description], [CreatedDate]) VALUES (1, N'Apple', N'applo_logo.webp', N'qua tao can do', CAST(N'2025-06-13T22:09:19.5993942' AS DateTime2))
INSERT [dbo].[Brand] ([Id], [BrandName], [Logo], [Description], [CreatedDate]) VALUES (3, N'Samsung', N'samsung_logo.png', N'Samsung - Thương hiệu tới từ Hàn Quốc', CAST(N'2025-06-14T10:08:54.2557343' AS DateTime2))
INSERT [dbo].[Brand] ([Id], [BrandName], [Logo], [Description], [CreatedDate]) VALUES (4, N'Dell', N'Dell_Logo.png', N'Dell', CAST(N'2025-06-14T10:08:50.1345862' AS DateTime2))
INSERT [dbo].[Brand] ([Id], [BrandName], [Logo], [Description], [CreatedDate]) VALUES (5, N'HP', N'hp_logo.jpg', N'HP', CAST(N'2025-06-14T10:09:30.2877590' AS DateTime2))
INSERT [dbo].[Brand] ([Id], [BrandName], [Logo], [Description], [CreatedDate]) VALUES (6, N'Asus', N'asus_logo.png', N'Asus', CAST(N'2025-06-14T10:10:13.3227431' AS DateTime2))
INSERT [dbo].[Brand] ([Id], [BrandName], [Logo], [Description], [CreatedDate]) VALUES (7, N'Lenovo', N'lenovo_logo.png', N'Lenovo', CAST(N'2025-06-14T10:10:51.8355141' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [CreatedDate], [UpdatedDate]) VALUES (1, N'Điện thoại di động', CAST(N'2025-06-13T22:51:25.0446731' AS DateTime2), CAST(N'2025-06-13T22:51:25.0601395' AS DateTime2))
INSERT [dbo].[Category] ([Id], [Name], [CreatedDate], [UpdatedDate]) VALUES (2, N'Máy tính bảng', CAST(N'2025-06-13T22:51:39.2667422' AS DateTime2), CAST(N'2025-06-13T22:51:39.2673806' AS DateTime2))
INSERT [dbo].[Category] ([Id], [Name], [CreatedDate], [UpdatedDate]) VALUES (7, N'Laptop', CAST(N'2025-06-13T22:51:48.1902441' AS DateTime2), CAST(N'2025-06-13T22:51:48.1904538' AS DateTime2))
INSERT [dbo].[Category] ([Id], [Name], [CreatedDate], [UpdatedDate]) VALUES (8, N'Đồng hồ thông minh', CAST(N'2025-06-13T22:51:53.8803889' AS DateTime2), CAST(N'2025-06-13T22:51:53.8803893' AS DateTime2))
INSERT [dbo].[Category] ([Id], [Name], [CreatedDate], [UpdatedDate]) VALUES (9, N'Tai nghe', CAST(N'2025-06-13T22:52:01.0253946' AS DateTime2), CAST(N'2025-06-13T22:52:01.0253954' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([Id], [ColorCode], [ColorName]) VALUES (1, N'#0000', N'Trắng')
INSERT [dbo].[Color] ([Id], [ColorCode], [ColorName]) VALUES (2, N'#*0000', N'Xanh dương')
INSERT [dbo].[Color] ([Id], [ColorCode], [ColorName]) VALUES (3, N'#dsfghj', N'Đen')
INSERT [dbo].[Color] ([Id], [ColorCode], [ColorName]) VALUES (4, N'rtrthy787iyjhn', N'Hồng')
INSERT [dbo].[Color] ([Id], [ColorCode], [ColorName]) VALUES (5, N'ueu7898ger', N'Vàng')
INSERT [dbo].[Color] ([Id], [ColorCode], [ColorName]) VALUES (6, N'6y67tyghngn', N'Xanh lá')
INSERT [dbo].[Color] ([Id], [ColorCode], [ColorName]) VALUES (7, N'r3f34tt', N'Xám')
INSERT [dbo].[Color] ([Id], [ColorCode], [ColorName]) VALUES (8, N'34354t5y3dff', N'Cam')
INSERT [dbo].[Color] ([Id], [ColorCode], [ColorName]) VALUES (9, N'45y6hvfnhymo9', N'Bạc')
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (1, 14, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'ưefgrth', CAST(N'2025-06-24T11:49:27.173' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (2, 14, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'qsdwefgfrth', CAST(N'2025-06-24T11:50:26.237' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (3, 14, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'ư3gr4thgnyh', CAST(N'2025-06-24T12:21:29.417' AS DateTime), 5)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (4, 25, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'ew3re4r35t4h5ry', CAST(N'2025-06-24T13:53:43.543' AS DateTime), 5)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (5, 14, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'qưertghyjuj', CAST(N'2025-06-25T14:35:17.253' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (6, 14, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'qưegrfthghyjj', CAST(N'2025-06-25T14:36:16.047' AS DateTime), 5)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (7, 14, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'dsfdbgnhjm', CAST(N'2025-06-25T15:29:53.190' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (8, 14, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'qsdwefw3grt4h', CAST(N'2025-06-25T15:30:04.890' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (9, 14, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'23r2t54y6j7u', CAST(N'2025-06-25T15:30:39.510' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (10, 14, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'e3r5t4h6y', CAST(N'2025-06-25T15:30:43.747' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (11, 14, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'35467u8o9p0ơ]''-=ơ0
ư|=4186y6u57i68o7', CAST(N'2025-06-25T15:31:19.417' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (12, 6, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'e3t4rg5y', CAST(N'2025-06-25T17:12:55.593' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (13, 6, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'ưqdefgrthyjuk', CAST(N'2025-06-25T17:22:27.893' AS DateTime), 0)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (14, 6, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'dfegrthng ', CAST(N'2025-06-25T17:24:09.593' AS DateTime), 4)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (15, 6, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'qewertgrth', CAST(N'2025-06-25T17:30:26.687' AS DateTime), 5)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (16, 43, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'e3rt45y6u7i', CAST(N'2025-06-25T17:43:04.953' AS DateTime), 3)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (17, 23, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'wetrytykuilu;ol;p', CAST(N'2025-06-25T18:10:34.573' AS DateTime), 5)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (18, 14, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'qwefrthy', CAST(N'2025-06-25T18:22:58.563' AS DateTime), 1)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (19, 14, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'hay qua', CAST(N'2025-06-25T18:24:17.213' AS DateTime), 3)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (20, 8, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'qưerthyju', CAST(N'2025-06-25T19:04:08.503' AS DateTime), 5)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (21, 14, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'hahahaa', CAST(N'2025-06-25T19:05:41.223' AS DateTime), 5)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (23, 31, 4, N'Nguyễn Hoàng Giang', N'nghoanggiang230834494@gmail.com', N'ew3rfgrbtgn', CAST(N'2025-06-26T16:17:50.217' AS DateTime), 3)
INSERT [dbo].[Comment] ([Id], [ProductId], [UserId], [FullName], [Email], [CommentText], [CreateTime], [Rate]) VALUES (24, 41, 5, N'Nguyễn Hoàng Giang', N'nghoanggiang230894@gmail.com', N'werthyju', CAST(N'2025-06-27T23:02:23.393' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Config] ON 

INSERT [dbo].[Config] ([Id], [Mail1], [Mail2], [Mail3], [Mail4], [Mail5], [Contact], [Title], [Description], [Hotline], [Address], [Keyword], [SocialLink1], [SocialLink2], [SocialLink3], [SocialLink4], [SocialLink5]) VALUES (1, N'nghoanggiang230894@gmail.com', N'', N'', N'', N'', N'Mr.007', N'tieu de', N'mo ta', N'0964598194', N'hanoi', N'ha noi', N'https://facebook.com', N'https://instagram.com', N'https://www.threads.com', N'https://www.youtube.com', N'https://www.github.com')
SET IDENTITY_INSERT [dbo].[Config] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([Id], [FullName], [PhoneNumber], [Address], [Email], [Message]) VALUES (1, N'Nguyễn Hoàng Giang', N'0964598194', N'23', N'nghoanggiang230894@gmail.com', N'wfegrhtgjhyju,ki./l;.')
INSERT [dbo].[Contact] ([Id], [FullName], [PhoneNumber], [Address], [Email], [Message]) VALUES (2, N'Nguyễn Hoàng Giang', N'0964598194', N'23', N'nghoanggiang230894@gmail.com', N'ewrthkyu')
INSERT [dbo].[Contact] ([Id], [FullName], [PhoneNumber], [Address], [Email], [Message]) VALUES (3, N'Nguyễn Hoàng Giang', N'0964598194', N'23', N'nghoanggiang230894@gmail.com', N'3r4t5yt6u')
INSERT [dbo].[Contact] ([Id], [FullName], [PhoneNumber], [Address], [Email], [Message]) VALUES (4, N'23rgtbhgn bv', N'0964598194', N'23', N'nghoanggiang230894@gmail.com', N'3rt45y6u7i89ol')
INSERT [dbo].[Contact] ([Id], [FullName], [PhoneNumber], [Address], [Email], [Message]) VALUES (5, N'Nguyễn Hoàng Giang', N'0964598194', N'23', N'nghoanggiang230894@gmail.com', N'e23rt54ghyjet')
INSERT [dbo].[Contact] ([Id], [FullName], [PhoneNumber], [Address], [Email], [Message]) VALUES (6, N'Nguyễn Giang', N'0964598194', N'tran cung', N'BabyHobao9x@gmail.com', N'354678i9o0')
INSERT [dbo].[Contact] ([Id], [FullName], [PhoneNumber], [Address], [Email], [Message]) VALUES (7, N'Nguyễn Hoàng Giang', N'0964598194', N'23', N'nghoanggiang230894@gmail.com', N'3r4t5y6u7i68')
INSERT [dbo].[Contact] ([Id], [FullName], [PhoneNumber], [Address], [Email], [Message]) VALUES (8, N'3rt456uki', N'0964598194', N'tran cung', N'BabyHobao9x@gmail.com', N'3567i8o9')
INSERT [dbo].[Contact] ([Id], [FullName], [PhoneNumber], [Address], [Email], [Message]) VALUES (9, N'Nguyễn Hoàng Giang', N'0964598194', N'23', N'nghoanggiang230894@gmail.com', N'etrhyjtkuyi7;o''p9-09675t43rthkyu87o6ut5r')
INSERT [dbo].[Contact] ([Id], [FullName], [PhoneNumber], [Address], [Email], [Message]) VALUES (10, N'giangnhan', N'0256525655', N'ha noi', N'giangnhan@gmail.com', N'hahahaa')
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (4, N'Iphone 13 -128gb - Apple', N'iphone-13-trang-7.webp', 1.3E+07, 0.3, N'Với những cải tiến không ngừng nghỉ cho những sản phẩm điện thoại thông minh của mình, Apple là hãng smartphone luôn nhận được sự tin tưởng từ người tiêu dùng Việt Nam. Dòng sản phẩm iPhone 13 được ra mắt gần đây với màu sắc mới và nâng cấp đáng kể về phần cứng của điện thoại đang nhận được rất nhiều sự quan tâm từ người hâm mộ.   

', 1, 1, 1, 2, 1, 1, CAST(N'2025-06-15T14:34:48.6768911' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (6, N'Iphone 13 -128gb - Apple - Xanh dương', N'iphone-13-trang-7.webp', 1.3E+07, 0.3, N'Với những cải tiến không ngừng nghỉ cho những sản phẩm điện thoại thông minh của mình, Apple là hãng smartphone luôn nhận được sự tin tưởng từ người tiêu dùng Việt Nam. Dòng sản phẩm iPhone 13 được ra mắt gần đây với màu sắc mới và nâng cấp đáng kể về phần cứng của điện thoại đang nhận được rất nhiều sự quan tâm từ người hâm mộ.   

', 1, 1, 1, 2, 2, 1, CAST(N'2025-06-13T23:10:40.6923914' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (7, N'Iphone 13 -128gb - Apple - Đen', N'iphone-13-trang-7.webp', 1.3E+07, 0.3, N'Với những cải tiến không ngừng nghỉ cho những sản phẩm điện thoại thông minh của mình, Apple là hãng smartphone luôn nhận được sự tin tưởng từ người tiêu dùng Việt Nam. Dòng sản phẩm iPhone 13 được ra mắt gần đây với màu sắc mới và nâng cấp đáng kể về phần cứng của điện thoại đang nhận được rất nhiều sự quan tâm từ người hâm mộ.   

', 1, 1, 1, 2, 3, 1, CAST(N'2025-06-13T23:09:04.4630444' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (8, N'Iphone 13 -128gb - Apple - Hồng', N'iphone-13-trang-7.webp', 1.3E+07, 0.3, N'Với những cải tiến không ngừng nghỉ cho những sản phẩm điện thoại thông minh của mình, Apple là hãng smartphone luôn nhận được sự tin tưởng từ người tiêu dùng Việt Nam. Dòng sản phẩm iPhone 13 được ra mắt gần đây với màu sắc mới và nâng cấp đáng kể về phần cứng của điện thoại đang nhận được rất nhiều sự quan tâm từ người hâm mộ.   

', 1, 1, 1, 2, 1, 1, CAST(N'2025-06-13T23:11:12.7041250' AS DateTime2), CAST(N'2025-06-13T23:11:12.7051613' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (9, N'Iphone14 - plus 128bg - Apple', N'iphone-14-plus-den-1.webp', 1.5E+07, 0.3, N'Màn hình của iPhone 14 Plus làm bằng chất liệu Ceramic Shield siêu bền dành riêng cho iPhone và cứng hơn bất kỳ loại kính điện thoại thông minh nào khác - và được bảo vệ khỏi các sự cố tràn và tai nạn thông thường với khả năng chống nước và bụi.', 1, 1, 1, 2, 1, 1, CAST(N'2025-06-13T23:15:33.8995632' AS DateTime2), CAST(N'2025-06-13T23:15:33.9000553' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (10, N'Apple - Iphone 15 128gb - Đen', N'chinh2.webp', 1.6E+07, 0.3, N'Màn hình Apple-custom OLED của iPhone 14 Plus sử dụng công nghệ hiển thị Super Retina XDR có tần số quét 60Hz, giúp dữ liệu hình ảnh sẽ được truyền đến mắt của chúng ta trong cùng một thời điểm và hình ảnh trở nên mượt mà, sống động hơn.', 1, 1, 1, 2, 1, 1, CAST(N'2025-06-13T23:17:30.6094071' AS DateTime2), CAST(N'2025-06-13T23:17:30.6094495' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (11, N'Apple - Iphone 15 128gb - Hồng', N'chinh2.webp', 1.6E+07, 0.3, N'Màn hình Apple-custom OLED của iPhone 14 Plus sử dụng công nghệ hiển thị Super Retina XDR có tần số quét 60Hz, giúp dữ liệu hình ảnh sẽ được truyền đến mắt của chúng ta trong cùng một thời điểm và hình ảnh trở nên mượt mà, sống động hơn.', 1, 1, 1, 2, 4, 1, CAST(N'2025-06-13T23:19:23.0622627' AS DateTime2), CAST(N'2025-06-13T23:19:23.0628421' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (12, N'Apple - Iphone 15 128gb - Vàng', N'chinh2.webp', 1.6E+07, 0.3, N'Màn hình Apple-custom OLED của iPhone 14 Plus sử dụng công nghệ hiển thị Super Retina XDR có tần số quét 60Hz, giúp dữ liệu hình ảnh sẽ được truyền đến mắt của chúng ta trong cùng một thời điểm và hình ảnh trở nên mượt mà, sống động hơn.	
', 1, 1, 1, 2, 1, 5, CAST(N'2025-06-13T23:20:00.7254522' AS DateTime2), CAST(N'2025-06-13T23:20:00.7254546' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (13, N'Apple - Iphone 15 128gb - Xanh dương', N'chinh2.webp', 1.6E+07, 0.3, N'Màn hình Apple-custom OLED của iPhone 14 Plus sử dụng công nghệ hiển thị Super Retina XDR có tần số quét 60Hz, giúp dữ liệu hình ảnh sẽ được truyền đến mắt của chúng ta trong cùng một thời điểm và hình ảnh trở nên mượt mà, sống động hơn.	
', 0, 1, 1, 2, 1, 1, CAST(N'2025-06-13T23:20:28.2193835' AS DateTime2), CAST(N'2025-06-13T23:20:28.2193854' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (14, N'Apple - Iphone 15 128gb - Xanh lá', N'chinh2.webp', 1.6E+07, 0.3, N'Màn hình Apple-custom OLED của iPhone 14 Plus sử dụng công nghệ hiển thị Super Retina XDR có tần số quét 60Hz, giúp dữ liệu hình ảnh sẽ được truyền đến mắt của chúng ta trong cùng một thời điểm và hình ảnh trở nên mượt mà, sống động hơn.	
', 0, 1, 1, 2, 6, 5, CAST(N'2025-06-15T14:35:09.0745692' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (15, N'Apple - Iphone 16 Pro - 128gb', N'iphone-16-pro-trang-6.webp', 2.5E+07, 0.3, N'Màn hình Apple-custom OLED của iPhone 14 Plus sử dụng công nghệ hiển thị Super Retina XDR có tần số quét 60Hz, giúp dữ liệu hình ảnh sẽ được truyền đến mắt của chúng ta trong cùng một thời điểm và hình ảnh trở nên mượt mà, sống động hơn.', 1, 1, 1, 2, 1, 5, CAST(N'2025-06-13T23:22:25.6303173' AS DateTime2), CAST(N'2025-06-13T23:22:25.6303554' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (16, N'Apple - Iphone 16 Pro - 128gb - Đen', N'iphone-16-pro-trang-6.webp', 2.5E+07, 0.3, N'Màn hình Apple-custom OLED của iPhone 14 Plus sử dụng công nghệ hiển thị Super Retina XDR có tần số quét 60Hz, giúp dữ liệu hình ảnh sẽ được truyền đến mắt của chúng ta trong cùng một thời điểm và hình ảnh trở nên mượt mà, sống động hơn.', 1, 1, 1, 2, 3, 1, CAST(N'2025-06-13T23:23:10.9171824' AS DateTime2), CAST(N'2025-06-13T23:23:10.9172145' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (17, N'Apple - Iphone 16 Pro - 128gb - Vàng', N'iphone-16-pro-trang-6.webp', 2.5E+07, 0.3, N'Màn hình Apple-custom OLED của iPhone 14 Plus sử dụng công nghệ hiển thị Super Retina XDR có tần số quét 60Hz, giúp dữ liệu hình ảnh sẽ được truyền đến mắt của chúng ta trong cùng một thời điểm và hình ảnh trở nên mượt mà, sống động hơn.', 1, 1, 1, 2, 1, 5, CAST(N'2025-06-13T23:23:46.7292887' AS DateTime2), CAST(N'2025-06-13T23:23:46.7292901' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (18, N'Apple -Tai nghe lightning - Trắng', N'audifonos-earpods-apple-iphone-7-8-x-lightning-original-d_nq_np_615134-mpe27006605233_032018-f.webp', 500000, 0.1, N'tai nghe iphone lightning ', 1, 9, 1, 2, 1, 5, CAST(N'2025-06-13T23:37:42.5620602' AS DateTime2), CAST(N'2025-06-13T23:37:42.5626417' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (19, N'Apple - tai nghe iphone airpod 4 - Trắng', N'airpods-4.webp', 3000000, 0.2, N'Apple - tai nghe iphone airpod 4', 1, 9, 1, 2, 1, 1, CAST(N'2025-06-13T23:38:35.5387572' AS DateTime2), CAST(N'2025-06-13T23:38:35.5387587' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (20, N'Điện thoại Samsung Galaxy Z Flip5 8GB512GB - Đen', N'a56-den-marble.webp', 1.5E+07, 0.1, N'Điện thoại Samsung Galaxy Z Flip5 8GB512GB - Đen', 1, 1, 3, 12, 1, 1, CAST(N'2025-06-13T23:40:38.6334425' AS DateTime2), CAST(N'2025-06-13T23:40:38.6336612' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (21, N'Điện thoại Samsung Galaxy Z Flip5 8GB512GB - Xanh', N'a56-xanh-marble.webp', 1.6E+07, 0.1, N'Điện thoại Samsung Galaxy Z Flip5 8GB512GB - Đen', 1, 1, 3, 2, 1, 1, CAST(N'2025-06-13T23:41:17.1511919' AS DateTime2), CAST(N'2025-06-13T23:41:17.1511934' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (22, N'Điện thoại Samsung Galaxy Z Flip5 8GB512GB - Xám', N'a56-xanh-marble.webp', 1.6E+07, 0.3, N'Điện thoại Samsung Galaxy Z Flip5 8GB512GB - Xám', 0, 1, 3, 2, 1, 5, CAST(N'2025-06-13T23:41:50.3508843' AS DateTime2), CAST(N'2025-06-13T23:41:50.3508907' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (23, N'Tai nghe TWS Samsung Galaxy Buds3 Pro R630N - Xám', N'main.jpg', 4300000, 0.2, N'Tai nghe TWS Samsung Galaxy Buds3 Pro R630N - Xám', 0, 9, 3, 2, 7, 5, CAST(N'2025-06-14T10:57:28.2500100' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (24, N'Tai nghe Bluetooth True Wireless Samsung Galaxy Buds FE R400N - Trắng', N'main.jpg', 1500000, 0.2, N'Tai nghe Bluetooth True Wireless Samsung Galaxy Buds FE R400N - Trắng', 1, 9, 3, 2, 1, 5, CAST(N'2025-06-13T23:49:21.5309592' AS DateTime2), CAST(N'2025-06-13T23:49:21.5309908' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (25, N'Tai nghe Có Dây Samsung IA500 - Đen', N'main.jpg', 150000, 0.2, N'Tai nghe Có Dây Samsung IA500 - Đen', 1, 9, 1, 2, 3, 1, CAST(N'2025-06-13T23:50:04.7341193' AS DateTime2), CAST(N'2025-06-13T23:50:04.7341219' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (26, N'Đồng hồ thông minh Samsung Galaxy Watch Ultra LTE 47mm - Cam', N'main.jpg', 4500000, 0.3, N'Đồng hồ thông minh Samsung Galaxy Watch Ultra LTE 47mm - Cam', 1, 1, 3, 2, 8, 1, CAST(N'2025-06-13T23:58:11.6967004' AS DateTime2), CAST(N'2025-06-13T23:58:11.6967247' AS DateTime2), 150)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (27, N'Đồng hồ thông minh Samsung Galaxy Watch7 40mm - Trắng', N'main.jpg', 7500000, 0.2, N'Đồng hồ thông minh Samsung Galaxy Watch7 40mm - Trắng', 1, 8, 3, 2, 1, 1, CAST(N'2025-06-13T23:58:52.0107743' AS DateTime2), CAST(N'2025-06-13T23:58:52.0107756' AS DateTime2), 120)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (28, N'Vòng tay thông minh Samsung Galaxy Fit3 - Trắng', N'main.jpg', 1200000, 0.2, N'Vòng tay thông minh Samsung Galaxy Fit3 - Trắng', 1, 8, 1, 2, 1, 1, CAST(N'2025-06-13T23:59:50.6823531' AS DateTime2), CAST(N'2025-06-13T23:59:50.6823554' AS DateTime2), 150)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (29, N'Apple Watch Series 10 42mm viền nhôm dây thể thao - Trắng', N'main.jpg', 7500000, 0.2, N'Apple Watch Series 10 42mm viền nhôm dây thể thao - Trắng', 1, 8, 1, 2, 1, 1, CAST(N'2025-06-14T00:00:44.0093058' AS DateTime2), CAST(N'2025-06-14T00:00:44.0093073' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (30, N'Apple Watch Series 10 GPS + Cellular 42mm viền nhôm dây thể thao - Đen', N'apple-watch-s10-lte-42mm638651244991991232.jpg', 8500000, 0.1, N'Apple Watch Series 10 GPS + Cellular 42mm viền nhôm dây thể thao - Đen', 1, 1, 1, 2, 3, 5, CAST(N'2025-06-14T00:01:26.8348406' AS DateTime2), CAST(N'2025-06-14T00:01:26.8348419' AS DateTime2), 250)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (31, N'Apple Watch Series 10 GPS + Cellular 42mm viền Titanium dây Milan - Đen', N'apple-watch-s10-lte-42mm-vien-titanium-day-thep638652107418125684.jpg', 1E+07, 0.1, N'Apple Watch Series 10 GPS + Cellular 42mm viền Titanium dây Milan - Đen', 1, 8, 1, 2, 3, 1, CAST(N'2025-06-14T00:02:16.7169589' AS DateTime2), CAST(N'2025-06-14T00:02:16.7169602' AS DateTime2), 120)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (32, N'Máy tính bảng iPad A16 WiFi 128GB', N'ipad-a16-cellular-blue-pdp-image-position-1-vn-vi.webp', 1.5E+07, 0.2, N'Máy tính bảng iPad A16 WiFi 128GB', 1, 2, 1, 13, 1, 3, CAST(N'2025-06-14T10:17:38.7994477' AS DateTime2), CAST(N'2025-06-14T10:17:38.7996300' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (33, N'Máy tính bảng iPad A16 WiFi 128GB - Hồng', N'ipad-a16-cellular-blue-pdp-image-position-1-vn-vi.webp', 1.6E+07, 0.3, N'Máy tính bảng iPad A16 WiFi 128GB - Hồng', 1, 2, 1, 14, 4, 5, CAST(N'2025-06-14T10:18:19.7685205' AS DateTime2), CAST(N'2025-06-14T10:18:19.7685217' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (34, N'iPad Gen 9 10.2 inch 4G (64GB) - Chính hãng Apple Việt Nam - xanh', N'gen-9-4g-trang-1.webp', 1.7E+07, 0.3, N'iPad Gen 9 10.2 inch 4G (64GB) - Chính hãng Apple Việt Nam - xanh', 1, 2, 1, 2, 2, 5, CAST(N'2025-06-14T10:19:33.0271734' AS DateTime2), CAST(N'2025-06-14T10:19:33.0271750' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (35, N'iPad Gen 9 10.2 inch 4G (64GB) - Chính hãng Apple Việt Nam - trắng', N'gen-9-4g-trang-1.webp', 1.7E+07, 0.3, N'iPad Gen 9 10.2 inch 4G (64GB) - Chính hãng Apple Việt Nam - trắng', 1, 2, 1, 14, 1, 5, CAST(N'2025-06-14T10:19:57.7782949' AS DateTime2), CAST(N'2025-06-14T10:19:57.7782961' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (36, N'iPad Pro M4 13 inch WiFi (512GB) - Chính hãng Apple Việt Nam - Trắng', N'ipad-pro-m4-1.webp', 1.8E+07, 0.3, N'iPad Pro M4 13 inch WiFi (512GB) - Chính hãng Apple Việt Nam - Trắng', 1, 2, 1, 13, 1, 5, CAST(N'2025-06-14T10:20:39.8663337' AS DateTime2), CAST(N'2025-06-14T10:20:39.8663353' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (37, N'iPad Pro M4 13 inch WiFi (512GB) - Chính hãng Apple Việt Nam - Đen', N'ipad-pro-m4-1.webp', 1.6E+07, 0.1, N'iPad Pro M4 13 inch WiFi (512GB) - Chính hãng Apple Việt Nam - Đen', 1, 2, 1, 2, 1, 5, CAST(N'2025-06-14T10:21:06.5721010' AS DateTime2), CAST(N'2025-06-14T10:21:06.5721060' AS DateTime2), 150)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (38, N'Máy tính bảng Samsung Galaxy Tab A7 Lite (T225) - Chính hãng) - Trắng', N'bac.webp', 3500000, 0.2, N'Máy tính bảng Samsung Galaxy Tab A7 Lite (T225) - Chính hãng) - Trắng', 1, 2, 3, 13, 1, 1, CAST(N'2025-06-14T10:22:21.5917369' AS DateTime2), CAST(N'2025-06-14T10:22:21.5917383' AS DateTime2), 250)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (39, N'Máy tính bảng Samsung Galaxy Tab A7 Lite (T225) - Chính hãng) - Đen', N'xam.webp', 3500000, 0.2, N'Máy tính bảng Samsung Galaxy Tab A7 Lite (T225) - Chính hãng) - Đen', 0, 2, 3, 13, 2, 1, CAST(N'2025-06-14T10:22:58.9209344' AS DateTime2), CAST(N'2025-06-14T10:22:58.9209358' AS DateTime2), 350)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (40, N'Máy tính bảng Samsung Galaxy Tab A8 Plus 2019 - P205 - Chính hãng - Trắng', N'image-removebg-preview (1)_637394041410832509.webp', 4500000, 0.2, N'Máy tính bảng Samsung Galaxy Tab A8 Plus 2019 - P205 - Chính hãng - Trắng', 1, 2, 3, 2, 1, 5, CAST(N'2025-06-14T10:23:45.5551890' AS DateTime2), CAST(N'2025-06-14T10:23:45.5551899' AS DateTime2), 350)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (41, N'Máy tính bảng Samsung Galaxy Tab A8 Plus 2019 - P205 - Chính hãng - Đen', N'image-removebg-preview (1)_637394041410832509.webp', 4.5E+07, 0.2, N'Máy tính bảng Samsung Galaxy Tab A8 Plus 2019 - P205 - Chính hãng - Đen', 1, 1, 1, 14, 3, 5, CAST(N'2025-06-14T10:24:15.5206539' AS DateTime2), CAST(N'2025-06-14T10:24:15.5206556' AS DateTime2), 450)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (42, N'Máy tính bảng Samsung Tab A8 - T295 - Chính hãng - Đen', N'Máy tính bảng Samsung Tab A8 - T295.webp', 5E+07, 0.2, N'Máy tính bảng Samsung Tab A8 - T295 - Chính hãng - Đen', 1, 2, 3, 2, 3, 5, CAST(N'2025-06-14T10:24:58.7707719' AS DateTime2), CAST(N'2025-06-14T10:24:58.7707734' AS DateTime2), 500)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (43, N'Máy tính bảng Samsung Tab A8 - T295 - Chính hãng - Trắng', N'Máy tính bảng Samsung Tab A8 - T295 3.webp', 5.5E+07, 0.2, N'Máy tính bảng Samsung Tab A8 - T295 - Chính hãng - Trắng', 1, 2, 3, 2, 3, 5, CAST(N'2025-06-14T10:25:39.0741926' AS DateTime2), CAST(N'2025-06-14T10:25:39.0741942' AS DateTime2), 500)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (44, N'Samsung Galaxy Tab S6 Lite 2024 - Xám', N'image-removebg-preview (5)_637394050254302727.webp', 8.5E+07, 0.2, N'Samsung Galaxy Tab S6 Lite 2024 - Xám', 1, 2, 3, 14, 7, 5, CAST(N'2025-06-14T10:26:32.2858965' AS DateTime2), CAST(N'2025-06-14T10:26:32.2858984' AS DateTime2), 500)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (45, N'Samsung Galaxy Tab S6 Lite 2024 - Hồng', N'samsung-galaxy-tab-s6-lite-1.webp', 8.5E+07, 0.2, N'Samsung Galaxy Tab S6 Lite 2024 - Hồng', 1, 1, 1, 14, 4, 5, CAST(N'2025-06-14T10:27:01.5084202' AS DateTime2), CAST(N'2025-06-14T10:27:01.5084216' AS DateTime2), 500)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (46, N'Macbook Air M2 MC7X4SAA 13.6inch 16GB, 256GB Midnight (Apple VN) - Bạc', N'22434_macbook_air_m2_midnight__1.jpg', 2.5E+07, 0.1, N'Macbook Air M2 MC7X4SAA 13.6inch 16GB, 256GB Midnight (Apple VN) - Bạc', 1, 7, 1, 2, 9, 1, CAST(N'2025-06-14T10:39:00.4195200' AS DateTime2), CAST(N'2025-06-14T10:39:00.4195218' AS DateTime2), 500)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (47, N'Macbook Air M4 13.6inch MW123SAA Midnight (10 Core CPU  8 core GPU  16GB  256GB) - Bạc', N'21434_macbook_air_m4_13_6inch_x__m__1.jpg', 3E+07, 0.2, N'Macbook Air M4 13.6inch MW123SAA Midnight (10 Core CPU  8 core GPU  16GB  256GB) - Bạc', 1, 7, 1, 2, 9, 1, CAST(N'2025-06-14T10:39:39.4044782' AS DateTime2), CAST(N'2025-06-14T10:39:39.4044793' AS DateTime2), 500)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (48, N'250_20992_asus_vivobook_s_16 - Bạc', N'250_20992_asus_vivobook_s_16_oled_m5606ka__5.jpg', 2.2E+07, 0.1, N'250_20992_asus_vivobook_s_16 - Bạc', 1, 7, 6, 2, 9, 1, CAST(N'2025-06-14T10:40:25.8416723' AS DateTime2), CAST(N'2025-06-14T10:40:25.8416741' AS DateTime2), 500)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (49, N'Laptop ASUS Zenbook A14 UX3407QA-QD299WS (Snapdragon® X X1 26 100  16GB  512GB  Qualcomm® Adreno™ GPU  14inch WUXGA OLED  Win 11  Office  Bạc', N'20991_zenbook_a14_ux3407qa____nh_9___500.jpg', 2.5E+07, 0.2, N'Laptop ASUS Zenbook A14 UX3407QA-QD299WS (Snapdragon® X X1 26 100  16GB  512GB  Qualcomm® Adreno™ GPU  14inch WUXGA OLED  Win 11  Office  Bạc', 1, 7, 6, 12, 1, 1, CAST(N'2025-06-14T10:41:10.6110337' AS DateTime2), CAST(N'2025-06-14T10:41:10.6110386' AS DateTime2), 500)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (50, N'Laptop ASUS Zenbook S16 UM5606KA-RK127WS (Ryzen™ AI 7 350  24GB  1TB  AMD Radeon™ Graphics  16 inch 3K OLED  Win 11  Office  Trắng)', N'main.jpg', 2.6E+07, 0.2, N'Laptop ASUS Zenbook S16 UM5606KA-RK127WS (Ryzen™ AI 7 350  24GB  1TB  AMD Radeon™ Graphics  16 inch 3K OLED  Win 11  Office  Trắng)', 1, 7, 6, 2, 1, 5, CAST(N'2025-06-14T10:41:44.5809812' AS DateTime2), CAST(N'2025-06-14T10:41:44.5809840' AS DateTime2), 500)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (52, N'Laptop ASUS Zenbook S16 UM5606KA-RK127WS (Ryzen™ AI 7 350  24GB  1TB  AMD Radeon™ Graphics  16 inch 3K OLED  Win 11  Office  bạc)', N'main.jpg', 3E+07, 0.2, N'Laptop ASUS Zenbook S16 UM5606KA-RK127WS (Ryzen™ AI 7 350  24GB  1TB  AMD Radeon™ Graphics  16 inch 3K OLED  Win 11  Office  bạc)', 1, 7, 6, 12, 9, 5, CAST(N'2025-06-14T10:58:28.8784672' AS DateTime2), CAST(N'2025-06-14T10:58:28.8784690' AS DateTime2), 500)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (53, N'Laptop Dell Inspiron 14 5441 5MNK1 (Snapdragon X Plus X1P-64-100  16GB  512GB  Qualcomm® Adreno™ GPU  14 inch FHD+  Win 11  Office  Xám', N'21968_dell_inspiron_14_5441__2.jpg', 2.6E+07, 0.2, N'Laptop Dell Inspiron 14 5441 5MNK1 (Snapdragon X Plus X1P-64-100  16GB  512GB  Qualcomm® Adreno™ GPU  14 inch FHD+  Win 11  Office  Xám', 1, 7, 4, 12, 7, 1, CAST(N'2025-06-14T10:59:07.7885128' AS DateTime2), CAST(N'2025-06-14T10:59:07.7885146' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (54, N'Laptop Dell Inspiron 15 3530 N3530-i5U165W11SLU-BL-KYHD (Core i5-1334U  16GB  512GB  Intel Iris Xe Graphics  15.6 inch FHD  Win 11  Office 24  Bạc', N'main.jpg', 2.8E+07, 0.3, N'Laptop Dell Inspiron 15 3530 N3530-i5U165W11SLU-BL-KYHD (Core i5-1334U  16GB  512GB  Intel Iris Xe Graphics  15.6 inch FHD  Win 11  Office 24  Bạc', 1, 7, 4, 2, 9, 5, CAST(N'2025-06-14T10:59:42.3584862' AS DateTime2), CAST(N'2025-06-14T10:59:42.3584888' AS DateTime2), 300)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (55, N'Laptop Dell Inspiron T7430 N7430I58W1 (Core i5-1335U  8GB  512GB  Intel Iris Xe  14 inch FHD +  Cảm ứng  Bút cảm ứng  Win 11  Office  Bạc', N'14192_dell_inspiron_7430_2in1_1.jpg', 2.9E+07, 0.2, N'Laptop Dell Inspiron T7430 N7430I58W1 (Core i5-1335U  8GB  512GB  Intel Iris Xe  14 inch FHD +  Cảm ứng  Bút cảm ứng  Win 11  Office  Bạc', 1, 7, 1, 12, 9, 5, CAST(N'2025-06-14T11:00:13.9942318' AS DateTime2), CAST(N'2025-06-14T11:00:13.9942352' AS DateTime2), 500)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (56, N'Laptop Dell Vostro 3530 (Core i3-1305U, Ram 8GB, 512GB SSD, Intel Iris Xe, 15.6 inch FHD, Ubuntu, Đen)', N'20807_dell_vostro_3530___en__3.jpg', 3E+07, 0.2, N'Laptop Dell Vostro 3530 (Core i3-1305U, Ram 8GB, 512GB SSD, Intel Iris Xe, 15.6 inch FHD, Ubuntu, Đen)', 1, 7, 1, 12, 1, 5, CAST(N'2025-06-14T11:06:37.2995759' AS DateTime2), CAST(N'2025-06-14T11:06:37.2995782' AS DateTime2), 400)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (57, N'Laptop Dell Vostro 3530 (Core™ i7-1355U, Ram 8GB, 512GB SSD, Intel Iris Xe, 15.6 inch FHD 120Hz, FreeDos, Đen)', N'21362_dell_vostro_3530___en__3.jpg', 2.5E+07, 0.2, N'Laptop Dell Vostro 3530 (Core™ i7-1355U, Ram 8GB, 512GB SSD, Intel Iris Xe, 15.6 inch FHD 120Hz, FreeDos, Đen)', 1, 7, 4, 12, 3, 1, CAST(N'2025-06-14T11:07:11.7923587' AS DateTime2), CAST(N'2025-06-14T11:07:11.7923602' AS DateTime2), 500)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (58, N'Laptop HP Pavilion 15-eg3112TU 8U6L9PA (Core i7-1355U  16GB  512GB  Intel Iris Xe  15.6 inch FHD  Windows 11  Bạc)', N'14916_hp_pavilion_15_eg3099tu_4 (1).jpg', 2.7E+07, 0.2, N'Laptop HP Pavilion 15-eg3112TU 8U6L9PA (Core i7-1355U  16GB  512GB  Intel Iris Xe  15.6 inch FHD  Windows 11  Bạc)', 1, 7, 5, 12, 9, 1, CAST(N'2025-06-14T11:07:55.2197996' AS DateTime2), CAST(N'2025-06-14T11:07:55.2198022' AS DateTime2), 500)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (59, N'Laptop HP Pavilion 16-af0052TU AY8C1PA (Ultra 7 155U  16GB  1TB  Intel® Graphics  16 inch WUXGA  Win 11  Bạc)', N'22340_hp_pavilion_16__2.jpg', 2.9E+07, 0.2, N'Laptop HP Pavilion 16-af0052TU AY8C1PA (Ultra 7 155U  16GB  1TB  Intel® Graphics  16 inch WUXGA  Win 11  Bạc)', 1, 7, 5, 12, 9, 5, CAST(N'2025-06-14T11:08:31.4473240' AS DateTime2), CAST(N'2025-06-14T11:08:31.4473255' AS DateTime2), 500)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (60, N'Laptop HP Pavilion 16-af0054TU AY8C3PA (Ultra 5 125U  16GB  1TB  Intel® Graphics  16 inch WUXGA  Win 11  Bạc)', N'main.jpg', 2.8E+07, 0.2, N'Laptop HP Pavilion 16-af0054TU AY8C3PA (Ultra 5 125U  16GB  1TB  Intel® Graphics  16 inch WUXGA  Win 11  Bạc)', 1, 7, 5, 12, 9, 1, CAST(N'2025-06-14T11:09:07.0836724' AS DateTime2), CAST(N'2025-06-14T11:09:07.0836741' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (61, N'Laptop HP Pavilion X360 14-ek2024TU 9Z2V6PA (Core™ 5 120U  16GB  512GB  Intel® Graphics  14 inch FHD  Cảm ứng  Win 11  Vàng)', N'19343_hp_pavilion_x360_14_ek2024tu__7.jpg', 3.3E+07, 0.2, N'Laptop HP Pavilion X360 14-ek2024TU 9Z2V6PA (Core™ 5 120U  16GB  512GB  Intel® Graphics  14 inch FHD  Cảm ứng  Win 11  Vàng)', 1, 7, 5, 12, 5, 5, CAST(N'2025-06-14T11:09:46.5125165' AS DateTime2), CAST(N'2025-06-14T11:09:46.5125175' AS DateTime2), 500)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (62, N'Laptop Lenovo ThinkPad E16 Gen 3 21SR002RVN (Ultra 5 225H  32GB  1TB  Intel® Arc™ Graphics  16.0inch WUXGA  Win 11  Đen', N'main.jpg', 3E+07, 0.2, N'Laptop Lenovo ThinkPad E16 Gen 3 21SR002RVN (Ultra 5 225H  32GB  1TB  Intel® Arc™ Graphics  16.0inch WUXGA  Win 11  Đen', 1, 7, 7, 12, 3, 1, CAST(N'2025-06-14T11:10:21.1523071' AS DateTime2), CAST(N'2025-06-14T11:10:21.1523087' AS DateTime2), 200)
INSERT [dbo].[Product] ([Id], [Name], [MainImage], [Price], [SalePrice], [Description], [Status], [CategoryId], [BrandId], [SupplierId], [ColorId], [AssembleInId], [CreateTime], [UpdateTime], [QuantityTotal]) VALUES (63, N'Laptop Lenovo ThinkPad T14s Gen 4 21F600AAVA (Core™ i7-1355U  16GB  512GB  Intel Iris Xe Graphics  14 inch WUXGA  No OS  Đen', N'main.jpg', 3.5E+07, 0.2, N'Laptop Lenovo ThinkPad T14s Gen 4 21F600AAVA (Core™ i7-1355U  16GB  512GB  Intel Iris Xe Graphics  14 inch WUXGA  No OS  Đen', 1, 7, 7, 12, 3, 5, CAST(N'2025-06-14T11:10:50.6997656' AS DateTime2), CAST(N'2025-06-14T11:10:50.6997666' AS DateTime2), 800)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (9, N'iphone-13-trang-1.webp', 4)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (10, N'iphone-13-trang-2.webp', 4)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (11, N'iphone-13-trang-3.webp', 4)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (12, N'iphone-13-trang-4.webp', 4)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (13, N'iphone-13-trang-5.webp', 4)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (14, N'iphone-13-trang-10.webp', 4)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (15, N'iphone-13-xanh-duong-1.webp', 6)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (16, N'iphone-13-xanh-duong-2.webp', 6)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (17, N'iphone-13-xanh-duong-3.webp', 6)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (18, N'iphone-13-xanh-duong-4.webp', 6)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (19, N'iphone-13-xanh-duong-10.webp', 6)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (20, N'iphone-13-xanh-duong-1.webp', 7)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (21, N'iphone-13-xanh-duong-2.webp', 7)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (22, N'iphone-13-xanh-duong-3.webp', 7)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (23, N'iphone-13-xanh-duong-10.webp', 7)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (24, N'iphone-13-hong-1.webp', 8)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (25, N'iphone-13-hong-2.webp', 8)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (26, N'iphone-13-hong-3.webp', 8)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (27, N'iphone-13-hong-10.webp', 8)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (28, N'iphone-14-plus-den-1.webp', 9)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (29, N'iphone-14-plus-tim-1.webp', 9)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (30, N'iphone-14-plus-trang-1.webp', 9)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (31, N'iphone-14-plus-xanh-1.webp', 9)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (32, N'iphone-15-den-1.webp', 10)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (33, N'iphone-15-den-2.webp', 10)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (34, N'iphone-15-den-3.webp', 10)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (35, N'iphone-15-den-9.webp', 10)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (36, N'iphone-15-hong-1.webp', 11)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (37, N'iphone-15-hong-2.webp', 11)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (38, N'iphone-15-hong-3.webp', 11)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (39, N'iphone-15-hong-9.webp', 11)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (40, N'iphone-15-vang-1.webp', 12)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (41, N'iphone-15-vang-2.webp', 12)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (42, N'iphone-15-vang-3.webp', 12)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (43, N'iphone-15-vang-9.webp', 12)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (44, N'iphone-15-vang-1.webp', 13)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (45, N'iphone-15-vang-2.webp', 13)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (46, N'iphone-15-vang-3.webp', 13)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (47, N'iphone-15-vang-9.webp', 13)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (48, N'iphone-15-vang-1.webp', 14)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (49, N'iphone-15-vang-2.webp', 14)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (50, N'iphone-15-vang-3.webp', 14)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (51, N'iphone-15-vang-9.webp', 14)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (52, N'iphone-16-pro-trang-1.webp', 15)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (53, N'iphone-16-pro-trang-2.webp', 15)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (54, N'iphone-16-pro-trang-3.webp', 15)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (55, N'iphone-16-pro-trang-9.webp', 15)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (56, N'iphone-16-pro-den-1.webp', 16)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (57, N'iphone-16-pro-den-2.webp', 16)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (58, N'iphone-16-pro-den-3.webp', 16)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (59, N'iphone-16-pro-den-9.webp', 16)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (60, N'iphone-16-pro-sa-mac-1.webp', 17)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (61, N'iphone-16-pro-sa-mac-2.webp', 17)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (62, N'iphone-16-pro-sa-mac-3.webp', 17)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (63, N'iphone-16-pro-sa-mac-9.webp', 17)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (64, N'audifonos-earpods-apple-iphone-7-8-x-lightning-original-d_nq_np_615134-mpe27006605233_032018-f.webp', 18)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (65, N'main.webp', 18)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (66, N'airpods-4.webp', 19)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (67, N'airpods-4-1_638658806841141184.webp', 19)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (68, N'den-marble-1.webp', 20)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (69, N'den-marble-2.webp', 20)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (70, N'den-marble-3.webp', 20)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (71, N'den-marble-4.webp', 20)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (72, N'den-marble-5.webp', 20)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (73, N'den-marble-6.webp', 20)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (74, N'den-marble-7.webp', 20)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (75, N'xam-marble-1.webp', 21)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (76, N'xam-marble-2.webp', 21)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (77, N'xam-marble-3.webp', 21)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (78, N'xam-marble-4.webp', 21)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (79, N'xam-marble-5.webp', 21)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (80, N'xam-marble-1.webp', 22)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (81, N'xam-marble-2.webp', 22)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (82, N'xam-marble-3.webp', 22)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (83, N'xam-marble-4.webp', 22)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (84, N'xam-marble-5.webp', 22)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (85, N'samsung-galaxy-watch-ultra-cam-hc-1-750x500.jpg', 26)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (86, N'samsung-galaxy-watch-ultra-cam-hc-3-750x500.jpg', 26)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (87, N'samsung-galaxy-watch-ultra-cam-hc-4-750x500.jpg', 26)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (88, N'samsung-galaxy-watch-ultra-cam-hc-7-750x500.jpg', 26)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (89, N'samsung-galaxy-watch-ultra-cam-hc-8-750x500.jpg', 26)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (90, N'samsung-galaxy-watch7-40mm-kem-2-750x500.jpg', 28)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (91, N'samsung-galaxy-watch7-40mm-kem-3-750x500.jpg', 28)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (92, N'samsung-galaxy-watch7-40mm-kem-4-750x500.jpg', 28)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (93, N'samsung-galaxy-watch7-40mm-kem-5-750x500.jpg', 28)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (94, N'samsung-galaxy-fit3-hong-hc-2-750x500.jpg', 28)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (95, N'samsung-galaxy-fit3-hong-hc-3-750x500.jpg', 28)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (96, N'samsung-galaxy-fit3-hong-hc-4-750x500.jpg', 28)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (97, N'samsung-galaxy-fit3-hong-hc-5-750x500.jpg', 28)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (98, N'samsung-galaxy-fit3-hong-hc-7-750x500.jpg', 28)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (99, N'vi-vn-apple-watch-s10-vien-nhom-day-the-thao-sld-2.jpg', 29)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (100, N'vi-vn-apple-watch-s10-vien-nhom-day-the-thao-sld-3.jpg', 29)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (101, N'vi-vn-apple-watch-s10-vien-nhom-day-the-thao-sld-4.jpg', 29)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (102, N'vi-vn-apple-watch-s10-vien-nhom-day-the-thao-sld-5.jpg', 29)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (103, N'apple-watch-s10-lte-42mm638651244993651279.jpg', 30)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (104, N'apple-watch-s10-lte-42mm638651244995281283.jpg', 30)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (105, N'apple-watch-s10-lte-42mm638651244996891316.jpg', 30)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (106, N'main.jpg', 30)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (107, N'apple-watch-s10-lte-42mm-vien-titanium-day-thep638652107423940861.jpg', 31)
GO
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (108, N'apple-watch-s10-lte-42mm-vien-titanium-day-thep638652107429730967.jpg', 31)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (109, N'apple-watch-s10-lte-42mm-vien-titanium-day-thep638652107443361099.jpg', 31)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (110, N'main.jpg', 31)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (111, N'ipad-a16-cellular-blue-pdp-image-position-1-vn-vi.webp', 32)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (112, N'ipad-a16-cellular-blue-pdp-image-position-2-vn-vi.webp', 32)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (113, N'ipad-a16-cellular-blue-pdp-image-position-3-vn-vi.webp', 32)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (114, N'ipad-a16-cellular-blue-pdp-image-position-8-vn-vi.webp', 32)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (115, N'ipad-a16-cellular-blue-pdp-image-position-1-vn-vi.webp', 33)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (116, N'ipad-a16-cellular-blue-pdp-image-position-2-vn-vi.webp', 33)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (117, N'ipad-a16-cellular-blue-pdp-image-position-3-vn-vi.webp', 33)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (118, N'ipad-a16-cellular-blue-pdp-image-position-8-vn-vi.webp', 33)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (119, N'gen-9-4g-trang-1.webp', 34)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (120, N'gen-9-4g-trang-2.webp', 34)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (121, N'gen-9-4g-trang-3.webp', 34)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (122, N'gen-9-xam-3.webp', 34)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (123, N'gen-9-xam-4.webp', 34)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (124, N'gen-9-4g-trang-1.webp', 35)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (125, N'gen-9-4g-trang-2.webp', 35)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (126, N'gen-9-4g-trang-3.webp', 35)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (127, N'gen-9-xam-3.webp', 35)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (128, N'gen-9-xam-4.webp', 35)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (129, N'gen-9-4g-trang-1.webp', 35)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (130, N'gen-9-4g-trang-2.webp', 35)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (131, N'gen-9-4g-trang-3.webp', 35)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (132, N'gen-9-xam-3.webp', 35)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (133, N'gen-9-xam-3.webp', 4)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (134, N'250_20992_asus_vivobook_s_16_oled_m5606ka__5.jpg', 48)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (135, N'250_20992_asus_vivobook_s_16_oled_m5606ka__6.jpg', 48)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (136, N'20992_asus_vivobook_s_16_oled_m5606ka__1.jpg', 48)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (137, N'20992_asus_vivobook_s_16_oled_m5606ka__3.jpg', 48)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (138, N'main.jpg', 48)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (139, N'20991_zenbook_a14_ux3407qa____nh_9___500.jpg', 49)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (140, N'20991_zenbook_a14_ux3407qa____nh_10___500.jpg', 49)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (141, N'20991_zenbook_a14_ux3407qa____nh_11___500.jpg', 49)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (142, N'20991_zenbook_a14_ux3407qa____nh_12___500.jpg', 49)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (143, N'20991_zenbook_a14_ux3407qa____nh_14___500.jpg', 49)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (144, N'20991_zenbook_a14_ux3407qa____nh_15___500.jpg', 49)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (145, N'20991_zenbook_a14_ux3407qa____nh_16___500.jpg', 49)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (146, N'20991_zenbook_a14_ux3407qa____nh_18___500.jpg', 49)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (147, N'20991_zenbook_a14_ux3407qa____nh_19___500.jpg', 49)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (148, N'main.jpg', 49)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (149, N'21475_zenbook_s16_um5606_____6_smart_gesture_500.jpg', 50)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (150, N'21475_zenbook_s16_um5606ka_____1_ceraluminum_500.jpg', 50)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (151, N'21475_zenbook_s16_um5606ka_____2_design_500.jpg', 50)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (152, N'21475_zenbook_s16_um5606ka_____4_performance_500.jpg', 50)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (153, N'21475_zenbook_s16_um5606ka_____5_ai_500.jpg', 50)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (154, N'21475_zenbook_s16_um5606ka_____10_connectivity_500.jpg', 50)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (155, N'21475_zenbook_s16_um5606ka_____11_summary_500.jpg', 50)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (156, N'main.jpg', 50)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (157, N'21475_zenbook_s16_um5606_____6_smart_gesture_500.jpg', 52)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (158, N'21475_zenbook_s16_um5606ka_____1_ceraluminum_500.jpg', 52)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (159, N'21475_zenbook_s16_um5606ka_____2_design_500.jpg', 52)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (160, N'21475_zenbook_s16_um5606ka_____4_performance_500.jpg', 52)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (161, N'21475_zenbook_s16_um5606ka_____5_ai_500.jpg', 52)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (162, N'21475_zenbook_s16_um5606ka_____10_connectivity_500.jpg', 52)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (163, N'21475_zenbook_s16_um5606ka_____11_summary_500.jpg', 52)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (164, N'main.jpg', 52)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (165, N'21968_dell_inspiron_14_5441__2.jpg', 53)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (166, N'21968_dell_inspiron_14_5441__3.jpg', 53)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (167, N'21968_dell_inspiron_14_5441__5.jpg', 53)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (168, N'21968_dell_inspiron_14_5441__6.jpg', 53)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (169, N'21968_dell_inspiron_14_5441__7.jpg', 53)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (170, N'main.jpg', 53)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (171, N'22714_13172_dell_inspiron_3530_71011775_2.jpg', 54)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (172, N'22714_13172_dell_inspiron_3530_71011775_3.jpg', 54)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (173, N'22714_13172_dell_inspiron_3530_71011775_4.jpg', 54)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (174, N'22714_48155_laptop_dell_inspiron_3530_71035574__intel___2.jpg', 54)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (175, N'main.jpg', 54)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (176, N'14192_dell_inspiron_7430_2in1_1.jpg', 55)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (177, N'14192_dell_inspiron_7430_2in1_2.jpg', 55)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (178, N'14192_dell_inspiron_7430_2in1_3.jpg', 55)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (179, N'14192_dell_inspiron_7430_2in1_4.jpg', 55)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (180, N'14192_dell_inspiron_7430_2in1_5.jpg', 55)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (181, N'14192_dell_inspiron_7430_2in1_7.jpg', 55)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (182, N'20807_dell_vostro_3530___en__3.jpg', 56)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (183, N'20807_dell_vostro_3530___en__4.jpg', 56)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (184, N'20807_dell_vostro_3530___en__5.jpg', 56)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (185, N'main.jpg', 56)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (186, N'21362_dell_vostro_3530___en__3.jpg', 57)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (187, N'21362_dell_vostro_3530___en__5.jpg', 57)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (188, N'main.jpg', 57)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (189, N'250_14916_hp_pavilion_15_eg3099tu_3.jpg', 58)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (190, N'14916_hp_pavilion_15_eg3099tu_4 (1).jpg', 58)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (191, N'14916_hp_pavilion_15_eg3099tu_4.jpg', 58)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (192, N'14916_hp_pavilion_15_eg3099tu_5.jpg', 58)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (193, N'22340_hp_pavilion_16__2.jpg', 59)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (194, N'22340_hp_pavilion_16__3.jpg', 59)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (195, N'22340_hp_pavilion_16__5.jpg', 59)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (196, N'22340_hp_pavilion_16__logo.jpg', 59)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (197, N'main.jpg', 59)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (198, N'22339_hp_pavilion_16__2.jpg', 60)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (199, N'22339_hp_pavilion_16__3.jpg', 60)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (200, N'22339_hp_pavilion_16__5.jpg', 60)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (201, N'main.jpg', 60)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (202, N'19343_hp_pavilion_x360_14_ek2024tu__5.jpg', 61)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (203, N'19343_hp_pavilion_x360_14_ek2024tu__6.jpg', 61)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (204, N'19343_hp_pavilion_x360_14_ek2024tu__7.jpg', 61)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (205, N'19343_hp_pavilion_x360_14_ek2024tu__logo.jpg', 61)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (206, N'22079_lenovo_thinkpad_e16_gen_3__2.jpg', 62)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (207, N'22079_lenovo_thinkpad_e16_gen_3__3.jpg', 62)
GO
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (208, N'22079_lenovo_thinkpad_e16_gen_3__4.jpg', 62)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (209, N'22079_lenovo_thinkpad_e16_gen_3__5.jpg', 62)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (210, N'22079_lenovo_thinkpad_e16_gen_3__6.jpg', 62)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (211, N'main.jpg', 62)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (212, N'21356_lenovo_thinkpad_t14s_gen_4_2.jpg', 63)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (213, N'21356_lenovo_thinkpad_t14s_gen_4_3.jpg', 63)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (214, N'21356_lenovo_thinkpad_t14s_gen_4_4.jpg', 63)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (215, N'21356_lenovo_thinkpad_t14s_gen_4_6.jpg', 63)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (216, N'21356_lenovo_thinkpad_t14s_gen_4_7.jpg', 63)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (217, N'21356_lenovo_thinkpad_t14s_gen_4_8.jpg', 63)
INSERT [dbo].[ProductImage] ([Id], [Images], [ProductId]) VALUES (218, N'main.jpg', 63)
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([Id], [RoleName]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [Name], [Address], [Email], [Phone], [TaxCode], [Website], [Logo], [CreatedDate], [UpdatedDate]) VALUES (2, N'FPTSHOP', N'hà nội', N'nghoanggiang230894@gmail.com', N'0964598194', N'48df8492-d87b-4da5-a603-430b1d6e0fe9', N'95be9a4b-bd5c-4114-bf83-c22f7de06d8f', N'Screenshot 2025-05-26 174523.png', CAST(N'2025-06-13T12:27:32.3185612' AS DateTime2), CAST(N'2025-06-13T12:27:32.3194663' AS DateTime2))
INSERT [dbo].[Supplier] ([Id], [Name], [Address], [Email], [Phone], [TaxCode], [Website], [Logo], [CreatedDate], [UpdatedDate]) VALUES (12, N'ClickBuy', N'23', N'nghoanggiang230852265894@gmail.com', N'0973379755', N'cb5af7a6-29e6-43c5-a40e-eb1a3c64d222', N'f6fa3976-5c1d-425f-9662-a85d2c3d61df', N'Screenshot 2025-05-30 111717.png', CAST(N'2025-06-19T10:34:51.0574248' AS DateTime2), CAST(N'2025-06-19T10:34:51.0727265' AS DateTime2))
INSERT [dbo].[Supplier] ([Id], [Name], [Address], [Email], [Phone], [TaxCode], [Website], [Logo], [CreatedDate], [UpdatedDate]) VALUES (13, N'Thegioididong', N'23', N'nghoanggiang230894@gmail.com', N'0964598194', N'20e6eaa8-451a-427d-99df-f2801eac5e83', N'78a383bf-8c8a-4063-ba96-10c32653149f', N'asus_logo.png', CAST(N'2025-06-19T10:35:10.2796847' AS DateTime2), CAST(N'2025-06-19T10:35:10.2811638' AS DateTime2))
INSERT [dbo].[Supplier] ([Id], [Name], [Address], [Email], [Phone], [TaxCode], [Website], [Logo], [CreatedDate], [UpdatedDate]) VALUES (14, N'hoanghamobile', N'hoanghamobile', N'hoanghamobile@gmail.com', N'0964598194', N'bd92f1f3-a5db-4773-bb2c-c1313a402b54', N'82d69886-07b0-46b6-9810-0d2f5c33695b', N'htc_logo.png', CAST(N'2025-06-14T10:12:17.2497864' AS DateTime2), CAST(N'2025-06-14T10:12:17.2497878' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserId], [UserAccount], [UserPassword], [FullName], [Avatar], [PhoneNumber], [Email], [IdCardFront], [IdCardBack], [DateOfIssue], [PlaceOfIssue], [RoleId], [CreateTime]) VALUES (1, N'f796cbb1-451f-44ea-a1b6-4b210b471ede', N'giangnguyen1234', N'7351a5b921d164f2837437e38eb5c17e5993b63ff1e999cc51ab9c25137e7f7e', N'Nguyễn Hoàng Giang', N'Screenshot 2025-05-30 093100.png', N'0964598194', N'nghoanggiang230894@gmail.com', N'Screenshot 2025-05-28 094009.png', N'Screenshot 2025-05-30 111401.png', CAST(N'2025-06-10T00:00:00.000' AS DateTime), N'Cục quản lý hành chính về TTXH', 2, CAST(N'2025-06-24T09:42:43.257' AS DateTime))
INSERT [dbo].[User] ([Id], [UserId], [UserAccount], [UserPassword], [FullName], [Avatar], [PhoneNumber], [Email], [IdCardFront], [IdCardBack], [DateOfIssue], [PlaceOfIssue], [RoleId], [CreateTime]) VALUES (3, N'7517ae9a-84bd-4450-ba98-c96d21dcfb9b', N'BabyHobao9x', N'7351a5b921d164f2837437e38eb5c17e5993b63ff1e999cc51ab9c25137e7f7e', N'GiangNguyen', N'21356_lenovo_thinkpad_t14s_gen_4_7.jpg', N'0964598194', N'babyhobao@gmail.com', N'21356_lenovo_thinkpad_t14s_gen_4_4.jpg', N'main.jpg', CAST(N'2025-06-16T00:00:00.000' AS DateTime), N'Cục quản lý hành chính về TTXH', 2, CAST(N'2025-06-24T09:42:37.087' AS DateTime))
INSERT [dbo].[User] ([Id], [UserId], [UserAccount], [UserPassword], [FullName], [Avatar], [PhoneNumber], [Email], [IdCardFront], [IdCardBack], [DateOfIssue], [PlaceOfIssue], [RoleId], [CreateTime]) VALUES (4, N'f0f9e8a6-b55f-43bf-8cef-88565db6ef1e', N'abdAbc', N'7351a5b921d164f2837437e38eb5c17e5993b63ff1e999cc51ab9c25137e7f7e', N'Nguyễn Hoàng Giang', N'applo_logo.webp', N'0964598194', N'nghoanggiang230834494@gmail.com', N'asus_logo.png', N'asus_logo.png', CAST(N'2025-06-09T00:00:00.000' AS DateTime), N'Cục quản lý hành chính về TTXH', 2, CAST(N'2025-06-24T09:42:27.680' AS DateTime))
INSERT [dbo].[User] ([Id], [UserId], [UserAccount], [UserPassword], [FullName], [Avatar], [PhoneNumber], [Email], [IdCardFront], [IdCardBack], [DateOfIssue], [PlaceOfIssue], [RoleId], [CreateTime]) VALUES (5, N'9f97624c-9522-4ea2-8502-58f9bbf7e596', N'cityboi', N'7351a5b921d164f2837437e38eb5c17e5993b63ff1e999cc51ab9c25137e7f7e', N'Nguyễn Hoàng Giang', N'applo_logo.webp', N'0964598194', N'nghoanggiang230894@gmail.com', N'applo_logo.webp', N'applo_logo.webp', CAST(N'2025-06-02T00:00:00.000' AS DateTime), N'Cục quản lý hành chính về TTXH', 2, CAST(N'2025-06-24T09:43:39.953' AS DateTime))
INSERT [dbo].[User] ([Id], [UserId], [UserAccount], [UserPassword], [FullName], [Avatar], [PhoneNumber], [Email], [IdCardFront], [IdCardBack], [DateOfIssue], [PlaceOfIssue], [RoleId], [CreateTime]) VALUES (6, N'e509139d-58a0-462b-87c1-0c99be65a66d', N'bigcitiboi', N'7351a5b921d164f2837437e38eb5c17e5993b63ff1e999cc51ab9c25137e7f7e', N'Nguyễn Hoàng Giang', N'', N'0964598194', N'nghoanggiang230323894@gmail.com', N'', N'', CAST(N'2025-06-24T10:16:38.533' AS DateTime), N'', 2, CAST(N'2025-06-24T10:16:38.493' AS DateTime))
INSERT [dbo].[User] ([Id], [UserId], [UserAccount], [UserPassword], [FullName], [Avatar], [PhoneNumber], [Email], [IdCardFront], [IdCardBack], [DateOfIssue], [PlaceOfIssue], [RoleId], [CreateTime]) VALUES (7, N'2791cf58-57db-487b-9c59-7c133de8c967', N'lamchanhuy', N'31ca528a1dc9dbd266ce73bff8af0737e395a23c6a8f6b3633d7f598fffe9fc0', N'LamChanHuy', N'hp_logo.jpg', N'0964598194', N'lamchanhuy@gmail.com', N'htc_logo.png', N'hp_logo.jpg', CAST(N'2025-06-02T00:00:00.000' AS DateTime), N'Cục quản lý hành chính về TTXH', 2, CAST(N'2025-06-26T23:30:45.463' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[WishList] ON 

INSERT [dbo].[WishList] ([Id], [UserId], [ProductId], [CreateTime]) VALUES (13, 5, 14, CAST(N'2025-06-27T21:51:36.277' AS DateTime))
INSERT [dbo].[WishList] ([Id], [UserId], [ProductId], [CreateTime]) VALUES (15, 3, 31, CAST(N'2025-06-27T22:55:27.057' AS DateTime))
INSERT [dbo].[WishList] ([Id], [UserId], [ProductId], [CreateTime]) VALUES (16, 5, 44, CAST(N'2025-07-04T13:45:50.407' AS DateTime))
SET IDENTITY_INSERT [dbo].[WishList] OFF
GO
/****** Object:  Index [IX_Admin_RoleId]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Admin_RoleId] ON [dbo].[Admin]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AssembleIn_Country]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AssembleIn_Country] ON [dbo].[AssembleIn]
(
	[Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Brand_BrandName]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Brand_BrandName] ON [dbo].[Brand]
(
	[BrandName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Brand_Logo]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Brand_Logo] ON [dbo].[Brand]
(
	[Logo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Color_ColorCode]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Color_ColorCode] ON [dbo].[Color]
(
	[ColorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Color_ColorName]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Color_ColorName] ON [dbo].[Color]
(
	[ColorName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comment_ProductId]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comment_ProductId] ON [dbo].[Comment]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comment_UserId]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comment_UserId] ON [dbo].[Comment]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Order_UserId]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Order_UserId] ON [dbo].[Order]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_OrderId]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_OrderId] ON [dbo].[OrderDetail]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetail_ProductId]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_ProductId] ON [dbo].[OrderDetail]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_AssembleInId]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Product_AssembleInId] ON [dbo].[Product]
(
	[AssembleInId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_BrandId]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Product_BrandId] ON [dbo].[Product]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_CategoryId]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Product_CategoryId] ON [dbo].[Product]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_ColorId]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Product_ColorId] ON [dbo].[Product]
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Product_Name]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Product_Name] ON [dbo].[Product]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Product_SupplierId]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Product_SupplierId] ON [dbo].[Product]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductImage_ProductId]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductImage_ProductId] ON [dbo].[ProductImage]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Supplier_Logo]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Supplier_Logo] ON [dbo].[Supplier]
(
	[Logo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Supplier_Name]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Supplier_Name] ON [dbo].[Supplier]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Supplier_TaxCode]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Supplier_TaxCode] ON [dbo].[Supplier]
(
	[TaxCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Supplier_Website]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Supplier_Website] ON [dbo].[Supplier]
(
	[Website] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_RoleId]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_RoleId] ON [dbo].[User]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WishList_ProductId]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_WishList_ProductId] ON [dbo].[WishList]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WishList_UserId_ProductId]    Script Date: 28-Jul-25 11:36:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_WishList_UserId_ProductId] ON [dbo].[WishList]
(
	[UserId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[WishList] ADD  DEFAULT ('0001-01-01T00:00:00.000') FOR [CreateTime]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Role_RoleId]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Product_ProductId]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User_UserId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User_UserId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order_OrderId]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product_ProductId]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_AssembleIn_AssembleInId] FOREIGN KEY([AssembleInId])
REFERENCES [dbo].[AssembleIn] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_AssembleIn_AssembleInId]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand_BrandId]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category_CategoryId]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Color_ColorId] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Color] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Color_ColorId]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier_SupplierId] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier_SupplierId]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_Product_ProductId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role_RoleId]
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD  CONSTRAINT [FK_WishList_Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WishList] CHECK CONSTRAINT [FK_WishList_Product_ProductId]
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD  CONSTRAINT [FK_WishList_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WishList] CHECK CONSTRAINT [FK_WishList_User_UserId]
GO
USE [master]
GO
ALTER DATABASE [ECommerceWebsite] SET  READ_WRITE 
GO
