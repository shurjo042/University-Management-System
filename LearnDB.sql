USE [master]
GO
/****** Object:  Database [LearnHunter]    Script Date: 12/21/2018 11:41:43 AM ******/
CREATE DATABASE [LearnHunter]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LearnHunter', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LearnHunter.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LearnHunter_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\LearnHunter_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LearnHunter] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LearnHunter].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LearnHunter] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LearnHunter] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LearnHunter] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LearnHunter] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LearnHunter] SET ARITHABORT OFF 
GO
ALTER DATABASE [LearnHunter] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LearnHunter] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [LearnHunter] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LearnHunter] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LearnHunter] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LearnHunter] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LearnHunter] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LearnHunter] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LearnHunter] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LearnHunter] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LearnHunter] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LearnHunter] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LearnHunter] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LearnHunter] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LearnHunter] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LearnHunter] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LearnHunter] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LearnHunter] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LearnHunter] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LearnHunter] SET  MULTI_USER 
GO
ALTER DATABASE [LearnHunter] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LearnHunter] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LearnHunter] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LearnHunter] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [LearnHunter]
GO
/****** Object:  Table [dbo].[AllocateClassrooms]    Script Date: 12/21/2018 11:41:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllocateClassrooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[FromTime] [datetime] NOT NULL,
	[ToTime] [datetime] NOT NULL,
	[Action] [int] NOT NULL,
 CONSTRAINT [PK_AllocateClassrooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AutoId]    Script Date: 12/21/2018 11:41:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AutoId](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[Date] [datetime2](7) NULL,
 CONSTRAINT [PK_test] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 12/21/2018 11:41:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Credit] [float] NOT NULL,
	[Descrition] [varchar](250) NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
	[Action] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssign]    Script Date: 12/21/2018 11:41:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseAssign](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NULL,
	[CourseCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CourseAssign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Day]    Script Date: 12/21/2018 11:41:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Day](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Day] [varchar](50) NULL,
 CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 12/21/2018 11:41:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](100) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_SaveDepartment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 12/21/2018 11:41:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Designation] [varchar](50) NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EnrollCourse]    Script Date: 12/21/2018 11:41:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnrollCourse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationNo] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_EnrollCourse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GradeLetter]    Script Date: 12/21/2018 11:41:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GradeLetter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GradeLetter] [varchar](50) NULL,
 CONSTRAINT [PK_GradeLetter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 12/21/2018 11:41:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 12/21/2018 11:41:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[Id] [int] NOT NULL,
	[Semester] [varchar](100) NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 12/21/2018 11:41:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Date] [date] NULL,
	[Address] [varchar](150) NULL,
	[DepartmentId] [int] NULL,
	[RegistrationNo] [varchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 12/21/2018 11:41:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RegistrationNo] [varchar](50) NOT NULL,
	[CourseId] [int] NOT NULL,
	[GradeLetterId] [int] NOT NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 12/21/2018 11:41:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CreditToken] [float] NOT NULL,
	[ReminingCredit] [float] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[AllocateClassroomsView]    Script Date: 12/21/2018 11:41:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View  [dbo].[AllocateClassroomsView]
As
SELECT AllocateClassrooms.DepartmentId,Code,Course.Name,Room.RoomCode,Day.Day,CASE WHEN AllocateClassrooms.FromTime IS NULL THEN '00:00:00.0000000'
                           ELSE CONVERT(varchar,AllocateClassrooms.FromTime) END AS FromTime,
                           CASE WHEN AllocateClassrooms.ToTime IS NULL THEN '00:00:00.0000000'
                           ELSE CONVERT(varchar, AllocateClassrooms.ToTime) END AS ToTime FROM 
                           AllocateClassrooms INNER JOIN Course ON AllocateClassrooms.CourseId=
                           Course.Id INNER JOIN Room ON AllocateClassrooms.RoomId=Room.Id INNER 
                           JOIN Day ON AllocateClassrooms.DayId=Day.Id
GO
SET IDENTITY_INSERT [dbo].[AllocateClassrooms] ON 

INSERT [dbo].[AllocateClassrooms] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Action]) VALUES (1, 2, 4, 14, 5, CAST(0x0000A9BD008C1360 AS DateTime), CAST(0x0000A9BD009C8E20 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AllocateClassrooms] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId], [Action]) VALUES (1, N'CSE-101', N'Introduction to Computer System', 3, N'Computer System', 2, 1, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId], [Action]) VALUES (3, N'CSE-102', N'Structure Programming', 2, N'Structure Programming description', 2, 2, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId], [Action]) VALUES (4, N'CSE-318', N'Artificial Intelligence', 3, N'Artificial Intelligence description', 2, 6, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId], [Action]) VALUES (5, N'CSE12', N'Electronics2', 3, N'jgfcjgfcj', 2, 2, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId], [Action]) VALUES (6, N'CSE66', N'English Literature & Language', 3, N'btfggn', 2, 2, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId], [Action]) VALUES (7, N'CSE317', N'Computer Networking', 3, N'abcd', 2, 6, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId], [Action]) VALUES (8, N'CSE123', N'Electronic Engineering', 3, N'abcd', 2, 2, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId], [Action]) VALUES (9, N'EEE222', N'Communication Engineering', 3, N'abcd', 3, 5, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Descrition], [DepartmentId], [SemesterId], [Action]) VALUES (10, N'EEE101', N'Microprocessor', 3, N'abcd', 3, 4, 1)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseAssign] ON 

INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (1, 2, 1, N'1')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (2, 2, 1, N'3')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (3, 2, 4, N'4')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (4, 2, 4, N'5')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (5, 2, 4, N'6')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (6, 2, 4, N'7')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (7, 2, 4, N'8')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (8, 3, 5, N'9')
INSERT [dbo].[CourseAssign] ([Id], [DepartmentId], [TeacherId], [CourseCode]) VALUES (9, 3, 5, N'10')
SET IDENTITY_INSERT [dbo].[CourseAssign] OFF
SET IDENTITY_INSERT [dbo].[Day] ON 

INSERT [dbo].[Day] ([Id], [Day]) VALUES (7, N'Friday')
INSERT [dbo].[Day] ([Id], [Day]) VALUES (3, N'Monday')
INSERT [dbo].[Day] ([Id], [Day]) VALUES (1, N'Saturday')
INSERT [dbo].[Day] ([Id], [Day]) VALUES (2, N'Sunday')
INSERT [dbo].[Day] ([Id], [Day]) VALUES (6, N'Thursday')
INSERT [dbo].[Day] ([Id], [Day]) VALUES (4, N'Tuesday')
INSERT [dbo].[Day] ([Id], [Day]) VALUES (5, N'Wednesday')
SET IDENTITY_INSERT [dbo].[Day] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2, N'CSE', N'Computer Science and Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (3, N'EEE', N'Electrical and Electronic Engineering')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (1, N'Lecturer')
INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (2, N'Ass Professor')
INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (3, N'Professor')
INSERT [dbo].[Designation] ([Id], [Designation]) VALUES (4, N'Chairman')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[EnrollCourse] ON 

INSERT [dbo].[EnrollCourse] ([Id], [RegistrationNo], [CourseId], [Date]) VALUES (1, 4, 1, CAST(0x173F0B00 AS Date))
INSERT [dbo].[EnrollCourse] ([Id], [RegistrationNo], [CourseId], [Date]) VALUES (2, 5, 3, CAST(0x173F0B00 AS Date))
SET IDENTITY_INSERT [dbo].[EnrollCourse] OFF
SET IDENTITY_INSERT [dbo].[GradeLetter] ON 

INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (1, N'A+')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (2, N'A')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (3, N'A-')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (4, N'B+')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (5, N'B')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (6, N'B-')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (7, N'C+')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (8, N'C')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (9, N'C-')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (10, N'D+')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (11, N'D')
INSERT [dbo].[GradeLetter] ([Id], [GradeLetter]) VALUES (12, N'D-')
SET IDENTITY_INSERT [dbo].[GradeLetter] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (1, N'201')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (2, N'202')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (3, N'203')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (4, N'204')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (5, N'205')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (6, N'206')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (7, N'207')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (8, N'208')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (9, N'209')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (10, N'301')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (11, N'305')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (12, N'401')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (13, N'501')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (14, N'502')
INSERT [dbo].[Room] ([Id], [RoomCode]) VALUES (15, N'503')
SET IDENTITY_INSERT [dbo].[Room] OFF
INSERT [dbo].[Semester] ([Id], [Semester]) VALUES (1, N'1st')
INSERT [dbo].[Semester] ([Id], [Semester]) VALUES (2, N'2nd')
INSERT [dbo].[Semester] ([Id], [Semester]) VALUES (3, N'3rd')
INSERT [dbo].[Semester] ([Id], [Semester]) VALUES (4, N'4th')
INSERT [dbo].[Semester] ([Id], [Semester]) VALUES (5, N'5th')
INSERT [dbo].[Semester] ([Id], [Semester]) VALUES (6, N'6th')
INSERT [dbo].[Semester] ([Id], [Semester]) VALUES (7, N'7th')
INSERT [dbo].[Semester] ([Id], [Semester]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [Email], [Contact], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (4, N'Md Raihan Uddin', N'raihan@yahoo.com', N'01834564757', CAST(0x113F0B00 AS Date), N'abcd', 2, N'CSE-2018-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contact], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (5, N'Md Asif', N'asif@gmail.com', N'018345647675', CAST(0x123F0B00 AS Date), N'bcdf', 2, N'CSE-2018-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contact], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (6, N'Sharmin Sultana', N's@gmail.com', N'018345647675', CAST(0x133F0B00 AS Date), N'erty', 2, N'CSE-2018-003')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contact], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (7, N'fahmida Sultana', N'fahmida@gmail.com', N'01834564111', CAST(0x163F0B00 AS Date), N'aaaaa', 2, N'CSE-2018-004')
INSERT [dbo].[Student] ([Id], [Name], [Email], [Contact], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (8, N'Md Arif', N'arif@gmail.com', N'01834564888', CAST(0x173F0B00 AS Date), N'qqqq', 2, N'CSE-2018-005')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentResult] ON 

INSERT [dbo].[StudentResult] ([Id], [RegistrationNo], [CourseId], [GradeLetterId]) VALUES (1, N'4', 1, 1)
INSERT [dbo].[StudentResult] ([Id], [RegistrationNo], [CourseId], [GradeLetterId]) VALUES (2, N'5', 3, 2)
SET IDENTITY_INSERT [dbo].[StudentResult] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToken], [ReminingCredit]) VALUES (1, N'Ashiq Kamal', N'Kotoali', N'asshiq@yahoo.com', N'01823456756', 1, 2, 20, 15)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToken], [ReminingCredit]) VALUES (2, N'KMS Hamim', N'cdef', N'hamim@gmail.com', N'01834564757', 1, 2, 5, 5)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToken], [ReminingCredit]) VALUES (3, N'Ariful Islam', N'erfd', N'arif@yahoo.com', N'01834564757', 1, 2, 5, 5)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToken], [ReminingCredit]) VALUES (4, N'Md Asif Iqbal', N'abcde', N'asifiqbal@hotmail.com', N'01834564999', 3, 2, 1, -14)
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToken], [ReminingCredit]) VALUES (5, N'Rumpa Das', N'abcd', N'rumpa@gmail.com', N'01834564759', 1, 3, 1, -5)
SET IDENTITY_INSERT [dbo].[Teacher] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Course]    Script Date: 12/21/2018 11:41:43 AM ******/
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [IX_Course] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Course_1]    Script Date: 12/21/2018 11:41:43 AM ******/
ALTER TABLE [dbo].[Course] ADD  CONSTRAINT [IX_Course_1] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Day]    Script Date: 12/21/2018 11:41:43 AM ******/
ALTER TABLE [dbo].[Day] ADD  CONSTRAINT [IX_Day] UNIQUE NONCLUSTERED 
(
	[Day] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SaveDepartment]    Script Date: 12/21/2018 11:41:43 AM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [IX_SaveDepartment] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_SaveDepartment_1]    Script Date: 12/21/2018 11:41:43 AM ******/
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [IX_SaveDepartment_1] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Table_1]    Script Date: 12/21/2018 11:41:43 AM ******/
ALTER TABLE [dbo].[Room] ADD  CONSTRAINT [IX_Table_1] UNIQUE NONCLUSTERED 
(
	[RoomCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Student]    Script Date: 12/21/2018 11:41:43 AM ******/
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [IX_Student] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Teacher]    Script Date: 12/21/2018 11:41:43 AM ******/
ALTER TABLE [dbo].[Teacher] ADD  CONSTRAINT [IX_Teacher] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Course] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Course]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Semester] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semester] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Semester]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_CourseAssign_Department]
GO
ALTER TABLE [dbo].[CourseAssign]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssign_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[CourseAssign] CHECK CONSTRAINT [FK_CourseAssign_Teacher]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourse_Course]
GO
ALTER TABLE [dbo].[EnrollCourse]  WITH CHECK ADD  CONSTRAINT [FK_EnrollCourse_Student] FOREIGN KEY([RegistrationNo])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[EnrollCourse] CHECK CONSTRAINT [FK_EnrollCourse_Student]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Course]
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_GradeLetter] FOREIGN KEY([GradeLetterId])
REFERENCES [dbo].[GradeLetter] ([Id])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_GradeLetter]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Department]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Designation]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Teacher] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Teacher]
GO
USE [master]
GO
ALTER DATABASE [LearnHunter] SET  READ_WRITE 
GO
