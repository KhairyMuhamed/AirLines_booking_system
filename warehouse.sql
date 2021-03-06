USE [master]
GO
/****** Object:  Database [AirLineWarehouse]    Script Date: 5/31/2022 2:42:52 PM ******/
CREATE DATABASE [AirLineWarehouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AirLineWarehouse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AirLineWarehouse.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AirLineWarehouse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AirLineWarehouse_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AirLineWarehouse] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AirLineWarehouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AirLineWarehouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AirLineWarehouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AirLineWarehouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AirLineWarehouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AirLineWarehouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET RECOVERY FULL 
GO
ALTER DATABASE [AirLineWarehouse] SET  MULTI_USER 
GO
ALTER DATABASE [AirLineWarehouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AirLineWarehouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AirLineWarehouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AirLineWarehouse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AirLineWarehouse] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AirLineWarehouse] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AirLineWarehouse', N'ON'
GO
ALTER DATABASE [AirLineWarehouse] SET QUERY_STORE = OFF
GO
USE [AirLineWarehouse]
GO
/****** Object:  Table [dbo].[dim_customers]    Script Date: 5/31/2022 2:42:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_customers](
	[cust_ID] [int] NOT NULL,
	[fname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[gender] [varchar](50) NULL,
	[age] [int] NULL,
	[contact_add] [varchar](50) NULL,
	[cust_email] [nvarchar](255) NULL,
	[cust_pass] [varchar](50) NOT NULL,
	[res_ID] [int] NULL,
 CONSTRAINT [PK__dim_cust__A1B6234869F6EFED] PRIMARY KEY CLUSTERED 
(
	[cust_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_reservation]    Script Date: 5/31/2022 2:42:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_reservation](
	[res_ID] [int] NOT NULL,
	[cust_id] [int] NULL,
	[ticket_id] [nvarchar](50) NULL,
	[day_reserve] [datetime] NULL,
	[time_reserve] [datetime] NULL,
	[payment] [nvarchar](50) NULL,
	[trans_ID] [int] NULL,
 CONSTRAINT [PK__dim_rese__2091B135256B3408] PRIMARY KEY CLUSTERED 
(
	[res_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_tickets]    Script Date: 5/31/2022 2:42:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_tickets](
	[ticket_ID] [nvarchar](50) NOT NULL,
	[ticket_num] [int] NULL,
	[date_flight] [datetime] NULL,
	[time_flight] [datetime] NULL,
	[time_land] [datetime] NULL,
	[destination] [varchar](50) NULL,
	[trip_type] [nvarchar](50) NULL,
	[price] [money] NULL,
	[date_land] [datetime] NULL,
 CONSTRAINT [PK__dim_tick__D597FD6380539FDC] PRIMARY KEY CLUSTERED 
(
	[ticket_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_transactions]    Script Date: 5/31/2022 2:42:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_transactions](
	[trans_ID] [int] NOT NULL,
	[trans_name] [varchar](1) NULL,
	[res_ID] [int] NULL,
	[schedule_ID] [int] NULL,
	[ticket_ID] [int] NULL,
	[trans_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[trans_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fact]    Script Date: 5/31/2022 2:42:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fact](
	[fact_ID] [int] NOT NULL,
	[trans_ID] [int] NULL,
	[#_tickets] [int] NULL,
	[cust_ID] [int] NULL,
	[ticket_ID] [nvarchar](50) NULL,
	[price] [money] NULL,
	[destination] [varchar](50) NULL,
	[gender] [varchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[age] [int] NULL,
 CONSTRAINT [PK__fact__4BC2E70B9AB180D1] PRIMARY KEY CLUSTERED 
(
	[fact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sheet1$]    Script Date: 5/31/2022 2:42:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sheet1$](
	[cus_id] [int] NULL,
	[fname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[gender] [varchar](50) NULL,
	[age] [int] NULL,
	[cust_email] [nvarchar](255) NULL,
	[cust_pas] [varchar](50) NULL,
	[res_id] [int] NULL,
	[ticket_id] [nvarchar](50) NULL,
	[day_reserve] [datetime] NULL,
	[time_reserve] [datetime] NULL,
	[payment] [nvarchar](50) NULL,
	[date_flight] [datetime] NULL,
	[time_flight] [datetime] NULL,
	[time_land] [datetime] NULL,
	[destination] [varchar](50) NULL,
	[type] [nvarchar](50) NULL,
	[price] [money] NULL,
	[date_land] [datetime] NULL,
	[ticket_num] [int] NULL,
	[trans_id] [int] NULL,
	[trans_date] [nvarchar](255) NULL,
	[duration] [datetime] NULL,
	[departure] [varchar](50) NULL,
	[fact_id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dim_reservation]  WITH NOCHECK ADD  CONSTRAINT [FK_dim_reservation_dim_customers] FOREIGN KEY([cust_id])
REFERENCES [dbo].[dim_customers] ([cust_ID])
GO
ALTER TABLE [dbo].[dim_reservation] CHECK CONSTRAINT [FK_dim_reservation_dim_customers]
GO
ALTER TABLE [dbo].[dim_transactions]  WITH CHECK ADD  CONSTRAINT [FK_dim_transactions_dim_reservation1] FOREIGN KEY([trans_ID])
REFERENCES [dbo].[dim_reservation] ([res_ID])
GO
ALTER TABLE [dbo].[dim_transactions] CHECK CONSTRAINT [FK_dim_transactions_dim_reservation1]
GO
ALTER TABLE [dbo].[fact]  WITH NOCHECK ADD  CONSTRAINT [dim_custFK] FOREIGN KEY([cust_ID])
REFERENCES [dbo].[dim_customers] ([cust_ID])
GO
ALTER TABLE [dbo].[fact] CHECK CONSTRAINT [dim_custFK]
GO
ALTER TABLE [dbo].[fact]  WITH NOCHECK ADD  CONSTRAINT [dim_tickertFK] FOREIGN KEY([ticket_ID])
REFERENCES [dbo].[dim_tickets] ([ticket_ID])
GO
ALTER TABLE [dbo].[fact] CHECK CONSTRAINT [dim_tickertFK]
GO
ALTER TABLE [dbo].[fact]  WITH NOCHECK ADD  CONSTRAINT [dim_transFK] FOREIGN KEY([trans_ID])
REFERENCES [dbo].[dim_transactions] ([trans_ID])
GO
ALTER TABLE [dbo].[fact] CHECK CONSTRAINT [dim_transFK]
GO
USE [master]
GO
ALTER DATABASE [AirLineWarehouse] SET  READ_WRITE 
GO
