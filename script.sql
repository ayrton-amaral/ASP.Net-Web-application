USE [master]
GO
/****** Object:  Database [ABCEmployeeJobAssignment]    Script Date: 2024-02-20 5:49:29 PM ******/
CREATE DATABASE [ABCEmployeeJobAssignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ABCEmployeeJobAssignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ABCEmployeeJobAssignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ABCEmployeeJobAssignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ABCEmployeeJobAssignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ABCEmployeeJobAssignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET RECOVERY FULL 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET  MULTI_USER 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ABCEmployeeJobAssignment', N'ON'
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET QUERY_STORE = ON
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ABCEmployeeJobAssignment]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 2024-02-20 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeNumber] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobAssignments]    Script Date: 2024-02-20 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobAssignments](
	[EmployeeNumber] [int] NOT NULL,
	[JobCode] [nvarchar](50) NOT NULL,
	[AssignedDate] [date] NOT NULL,
	[SubmittedDate] [date] NOT NULL,
 CONSTRAINT [PK_JobAssignments] PRIMARY KEY CLUSTERED 
(
	[EmployeeNumber] ASC,
	[JobCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 2024-02-20 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[JobCode] [nvarchar](50) NOT NULL,
	[JobTitle] [varchar](90) NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[JobCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2024-02-20 5:49:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserCode] [int] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Employees] ([EmployeeNumber], [FirstName], [LastName], [Email]) VALUES (12345, N'Mary', N'Brown', N'mary@yahoo.com')
INSERT [dbo].[Employees] ([EmployeeNumber], [FirstName], [LastName], [Email]) VALUES (12346, N'Richard', N'Green', N'richard@gmail.com')
INSERT [dbo].[Employees] ([EmployeeNumber], [FirstName], [LastName], [Email]) VALUES (12347, N'Michael', N'Freitag', N'michael@hotmail.com')
INSERT [dbo].[Employees] ([EmployeeNumber], [FirstName], [LastName], [Email]) VALUES (12348, N'Jennifer', N'Nguyen', N'jennifer@gmail.com')
INSERT [dbo].[Employees] ([EmployeeNumber], [FirstName], [LastName], [Email]) VALUES (12349, N'Julia', N'Wang', N'julia@hotmail.com')
INSERT [dbo].[Employees] ([EmployeeNumber], [FirstName], [LastName], [Email]) VALUES (44444, N'David', N'Cadieux', N'david@gmail.com')
GO
INSERT [dbo].[JobAssignments] ([EmployeeNumber], [JobCode], [AssignedDate], [SubmittedDate]) VALUES (12345, N'JOB101', CAST(N'2024-02-20' AS Date), CAST(N'2024-02-29' AS Date))
GO
INSERT [dbo].[Jobs] ([JobCode], [JobTitle]) VALUES (N'JOB101', N'Programmer Analyst')
INSERT [dbo].[Jobs] ([JobCode], [JobTitle]) VALUES (N'JOB102', N'Database Developer')
INSERT [dbo].[Jobs] ([JobCode], [JobTitle]) VALUES (N'JOB103', N'System Analyst')
INSERT [dbo].[Jobs] ([JobCode], [JobTitle]) VALUES (N'JOB104', N'Programmer')
INSERT [dbo].[Jobs] ([JobCode], [JobTitle]) VALUES (N'JOB105', N'Web Developer')
GO
INSERT [dbo].[Users] ([UserCode], [Password]) VALUES (12345, N'Mary12345')
INSERT [dbo].[Users] ([UserCode], [Password]) VALUES (12346, N'Richard12346')
INSERT [dbo].[Users] ([UserCode], [Password]) VALUES (12347, N'Michael12347')
INSERT [dbo].[Users] ([UserCode], [Password]) VALUES (12348, N'Jennifer12348')
INSERT [dbo].[Users] ([UserCode], [Password]) VALUES (12349, N'Julia12349')
INSERT [dbo].[Users] ([UserCode], [Password]) VALUES (44444, N'David44444')
GO
ALTER TABLE [dbo].[JobAssignments]  WITH CHECK ADD  CONSTRAINT [FK_JobAssignments_Employees] FOREIGN KEY([EmployeeNumber])
REFERENCES [dbo].[Employees] ([EmployeeNumber])
GO
ALTER TABLE [dbo].[JobAssignments] CHECK CONSTRAINT [FK_JobAssignments_Employees]
GO
ALTER TABLE [dbo].[JobAssignments]  WITH CHECK ADD  CONSTRAINT [FK_JobAssignments_Jobs] FOREIGN KEY([JobCode])
REFERENCES [dbo].[Jobs] ([JobCode])
GO
ALTER TABLE [dbo].[JobAssignments] CHECK CONSTRAINT [FK_JobAssignments_Jobs]
GO
USE [master]
GO
ALTER DATABASE [ABCEmployeeJobAssignment] SET  READ_WRITE 
GO
