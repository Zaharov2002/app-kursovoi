USE [master]
GO
/****** Object:  Database [films]    Script Date: 26.02.2023 15:34:43 ******/
CREATE DATABASE [films]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'films', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\films.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'films_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\films_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [films] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [films].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [films] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [films] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [films] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [films] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [films] SET ARITHABORT OFF 
GO
ALTER DATABASE [films] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [films] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [films] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [films] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [films] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [films] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [films] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [films] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [films] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [films] SET  DISABLE_BROKER 
GO
ALTER DATABASE [films] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [films] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [films] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [films] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [films] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [films] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [films] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [films] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [films] SET  MULTI_USER 
GO
ALTER DATABASE [films] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [films] SET DB_CHAINING OFF 
GO
ALTER DATABASE [films] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [films] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [films] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [films] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [films] SET QUERY_STORE = OFF
GO
USE [films]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 26.02.2023 15:34:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[film]    Script Date: 26.02.2023 15:34:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[film](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[film] [nvarchar](100) NULL,
	[Year] [int] NULL,
	[CountryCode] [int] NULL,
	[GenreCode] [int] NULL,
 CONSTRAINT [PK_film] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 26.02.2023 15:34:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[Code] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hole]    Script Date: 26.02.2023 15:34:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hole](
	[Code] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Hole] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 26.02.2023 15:34:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[time] [time](7) NULL,
	[HoleCode] [int] NULL,
	[FilmCode] [int] NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Code], [Name]) VALUES (1, N'Russia')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (2, N'Korea')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (3, N'France')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (4, N'Norway')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (5, N'USA')
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[film] ON 

INSERT [dbo].[film] ([id], [film], [Year], [CountryCode], [GenreCode]) VALUES (5, N'Cheburaska', 2023, 1, 5)
INSERT [dbo].[film] ([id], [film], [Year], [CountryCode], [GenreCode]) VALUES (6, N'Goegimaensyon', 2021, 2, 4)
INSERT [dbo].[film] ([id], [film], [Year], [CountryCode], [GenreCode]) VALUES (7, N'Belle et Sébastien', 2022, 3, 5)
INSERT [dbo].[film] ([id], [film], [Year], [CountryCode], [GenreCode]) VALUES (8, N'The Old Way', 2022, 5, 1)
INSERT [dbo].[film] ([id], [film], [Year], [CountryCode], [GenreCode]) VALUES (9, N'Leave', 2022, 4, 4)
SET IDENTITY_INSERT [dbo].[film] OFF
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([Code], [Name]) VALUES (1, N'Action')
INSERT [dbo].[Genre] ([Code], [Name]) VALUES (2, N'Dramatic')
INSERT [dbo].[Genre] ([Code], [Name]) VALUES (3, N'Comedy')
INSERT [dbo].[Genre] ([Code], [Name]) VALUES (4, N'Horror')
INSERT [dbo].[Genre] ([Code], [Name]) VALUES (5, N'Family')
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[Hole] ON 

INSERT [dbo].[Hole] ([Code], [Name]) VALUES (1, N'IMAX')
INSERT [dbo].[Hole] ([Code], [Name]) VALUES (2, N'Dolby Atmos')
INSERT [dbo].[Hole] ([Code], [Name]) VALUES (3, N'3D')
INSERT [dbo].[Hole] ([Code], [Name]) VALUES (4, N'Comphort')
SET IDENTITY_INSERT [dbo].[Hole] OFF
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([id], [date], [time], [HoleCode], [FilmCode]) VALUES (1, CAST(N'2023-02-26' AS Date), CAST(N'12:00:00' AS Time), 1, 5)
INSERT [dbo].[Session] ([id], [date], [time], [HoleCode], [FilmCode]) VALUES (2, CAST(N'2023-02-28' AS Date), CAST(N'13:00:00' AS Time), 1, 6)
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
ALTER TABLE [dbo].[film]  WITH CHECK ADD  CONSTRAINT [FK_film_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[film] CHECK CONSTRAINT [FK_film_Country]
GO
ALTER TABLE [dbo].[film]  WITH CHECK ADD  CONSTRAINT [FK_film_Genre] FOREIGN KEY([GenreCode])
REFERENCES [dbo].[Genre] ([Code])
GO
ALTER TABLE [dbo].[film] CHECK CONSTRAINT [FK_film_Genre]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_film] FOREIGN KEY([FilmCode])
REFERENCES [dbo].[film] ([id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_film]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Hole] FOREIGN KEY([HoleCode])
REFERENCES [dbo].[Hole] ([Code])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Hole]
GO
USE [master]
GO
ALTER DATABASE [films] SET  READ_WRITE 
GO
