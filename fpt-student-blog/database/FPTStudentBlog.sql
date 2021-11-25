USE [master]
GO
/****** Object:  Database [FPTStudentBlog]    Script Date: 11/10/2021 9:06:23 PM ******/
CREATE DATABASE [FPTStudentBlog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FPTStudentBlog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FPTStudentBlog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FPTStudentBlog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FPTStudentBlog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FPTStudentBlog] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FPTStudentBlog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FPTStudentBlog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET ARITHABORT OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FPTStudentBlog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FPTStudentBlog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FPTStudentBlog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FPTStudentBlog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FPTStudentBlog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FPTStudentBlog] SET  MULTI_USER 
GO
ALTER DATABASE [FPTStudentBlog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FPTStudentBlog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FPTStudentBlog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FPTStudentBlog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FPTStudentBlog] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FPTStudentBlog] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FPTStudentBlog] SET QUERY_STORE = OFF
GO
USE [FPTStudentBlog]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 11/10/2021 9:06:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblComment]    Script Date: 11/10/2021 9:06:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComment](
	[commentID] [int] IDENTITY(1,1) NOT NULL,
	[postID] [int] NOT NULL,
	[userID] [varchar](50) NULL,
	[date] [datetime] NULL,
	[commentContent] [nvarchar](max) NULL,
	[vote] [int] NULL,
 CONSTRAINT [PK_tblComment] PRIMARY KEY CLUSTERED 
(
	[commentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPosts]    Script Date: 11/10/2021 9:06:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPosts](
	[postID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[statusPID] [varchar](10) NOT NULL,
	[categoryID] [int] NULL,
	[title] [nvarchar](max) NULL,
	[postContent] [ntext] NULL,
	[date] [datetime] NULL,
	[vote] [int] NULL,
	[approveComment] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblPosts] PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRank]    Script Date: 11/10/2021 9:06:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRank](
	[rankID] [int] NOT NULL,
	[rankName] [nvarchar](100) NOT NULL,
	[vote] [int] NULL,
	[image] [nvarchar](200) NULL,
 CONSTRAINT [PK_tblRank] PRIMARY KEY CLUSTERED 
(
	[rankID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 11/10/2021 9:06:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [varchar](10) NOT NULL,
	[roleName] [varchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatusPosts]    Script Date: 11/10/2021 9:06:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatusPosts](
	[statusPID] [varchar](10) NOT NULL,
	[statusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblStatusPosts] PRIMARY KEY CLUSTERED 
(
	[statusPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatusUser]    Script Date: 11/10/2021 9:06:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatusUser](
	[statusUID] [varchar](10) NOT NULL,
	[statusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblStatusUser] PRIMARY KEY CLUSTERED 
(
	[statusUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTagBlog]    Script Date: 11/10/2021 9:06:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTagBlog](
	[postID] [int] NOT NULL,
	[tagID] [int] NOT NULL,
 CONSTRAINT [PK_tblTagBlog] PRIMARY KEY CLUSTERED 
(
	[postID] ASC,
	[tagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTags]    Script Date: 11/10/2021 9:06:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTags](
	[tagID] [int] IDENTITY(1,1) NOT NULL,
	[tagName] [varchar](50) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_tblTags] PRIMARY KEY CLUSTERED 
(
	[tagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 11/10/2021 9:06:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](50) NOT NULL,
	[roleID] [varchar](10) NOT NULL,
	[statusUID] [varchar](10) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[totalVote] [int] NULL,
	[rankID] [int] NULL,
	[date] [datetime] NULL,
	[image] [nvarchar](200) NULL,
	[banReason] [nvarchar](200) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblView]    Script Date: 11/10/2021 9:06:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblView](
	[Viewed] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVote]    Script Date: 11/10/2021 9:06:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVote](
	[postID] [int] NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_tblVote] PRIMARY KEY CLUSTERED 
(
	[postID] ASC,
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategories] ON 

INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (1, N'Business Administration')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (2, N'Software Engineering')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (3, N'International Bussiness')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (4, N'Information Assurance')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (5, N'Multimedia Communications')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (6, N'Graphic Design')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (7, N'Hotel Management')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (8, N'English Language')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (9, N'Japanese Language')
INSERT [dbo].[tblCategories] ([categoryID], [categoryName]) VALUES (10, N'NOTIFICATION')
SET IDENTITY_INSERT [dbo].[tblCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[tblComment] ON 

INSERT [dbo].[tblComment] ([commentID], [postID], [userID], [date], [commentContent], [vote]) VALUES (15, 23, N'mentor', CAST(N'2021-10-17T13:29:56.000' AS DateTime), N'Bài viết rất ổn.', NULL)
INSERT [dbo].[tblComment] ([commentID], [postID], [userID], [date], [commentContent], [vote]) VALUES (16, 27, N'108994352679725327738', CAST(N'2021-10-27T20:53:03.000' AS DateTime), N'hay', NULL)
SET IDENTITY_INSERT [dbo].[tblComment] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPosts] ON 

INSERT [dbo].[tblPosts] ([postID], [userID], [statusPID], [categoryID], [title], [postContent], [date], [vote], [approveComment], [image], [description]) VALUES (23, N'quangnt', N'1', 2, N'TRÍ TUỆ NHÂN TẠO & MACHINE LEARNING TRONG HOẠT ĐỘNG XÂY DỰNG', N'<p>
</p>
<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" class="ce-block ng-star-inserted">
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: inherit;" class="ng-star-inserted"><h2 style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; margin: 0px 0px 20px; font-size: 26px; font-weight: 700; font-family: &quot;Noto Sans&quot;; padding: 0.4rem 0px; display: block; line-height: 1.5;" class="ce-header ce-header--undefined">VẬY VỀ CƠ BẢN A.I VÀ M.L LÀ GÌ ?</h2></div></div>
</div>
<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" class="ce-block ng-star-inserted">
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: inherit;" class="ng-star-inserted"><h3 style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; margin: 0px 0px 20px; font-size: 22px; font-weight: 700; font-family: &quot;Noto Sans&quot;; padding: 0.4rem 0px; display: block; line-height: 1.5;" class="ce-header ce-header--undefined">Trí tuệ nhân tạo:</h3></div></div>
</div>
<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" class="ce-block ng-star-inserted">
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted"><strong style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-weight: 700;">Trí tuệ nhân tạo</strong> là trí tuệ thông minh do máy móc thể hiện. Thông thường, thuật ngữ &quot;trí tuệ nhân tạo&quot; thường được sử dụng để mô tả các máy móc (hoặc máy tính) có khả năng bắt chước các chức năng &quot;nhận thức&quot; mà con người thường phải liên kết với&nbsp;tâm trí, như &quot;học tập&quot; và &quot;giải quyết vấn đề&quot;.</div></div>
</div>
<p>
	<img style="width: 550px; height: 500px;" src="https://s3-ap-southeast-1.amazonaws.com/images.spiderum.com/sp-images/72a114d02b7511ec88d1ad32fd429786.png" /><br />
</p>
<p>
</p>
<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" class="ce-block ng-star-inserted">
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted">Việc sử dụng AI tốn kém rất nhiều khi xử lý một lượng lớn dữ liệu mà việc lập trình AI yêu cầu. Khả năng giải thích là trở ngại trong việc sử dụng AI trong các lĩnh vực hoạt động theo các yêu cầu khắt khe. Tuy vậy, nó lại có nhiều lợi ích nổi bật. Trí thông minh nhân tạo xử lý được lượng lớn dữ liệu nhanh hơn nhiều và đưa ra dự đoán chính xác hơn khả năng của con người. Bên cạnh đó, khối lượng dữ liệu khổng lồ được tạo ra hàng ngày sẽ gây khó khăn cho các nhà nghiên cứu. AI sử dụng Machine Learning để có thể lấy những dữ liệu đó và nhanh chóng biến nó thành thông tin có thể thực hiện được.</div></div>
</div>
<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" class="ce-block ng-star-inserted">
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: inherit;" class="ng-star-inserted"><h3 style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; margin: 0px 0px 20px; font-size: 22px; font-weight: 700; font-family: &quot;Noto Sans&quot;; padding: 0.4rem 0px; display: block; line-height: 1.5;" class="ce-header ce-header--undefined">Machine Learning:</h3></div></div>
</div>
<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" class="ce-block ng-star-inserted">
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted"><strong style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-weight: 700;">Machine Learning</strong> là một lĩnh vực của AI, nơi các kỹ thuật thống kê được sử dụng để cung cấp cho máy tính khả năng học hỏi từ dữ liệu mà không cần được lập trình rõ ràng để giải quyết những vấn đề cụ thể.</div></div>
</div>
<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" class="ce-block ng-star-inserted">
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted">Các thuật toán ML đang được sử dụng để phân tích dữ liệu lớn (big data) để giúp dự đoán xu hướng hoặc sự kiện thị trường, ví dụ như dự đoán kết quả cuộc bầu cử chính trị. Các thuật toán nhận dạng hình ảnh hiện có thể phân tích dữ liệu từ các hệ thống chụp ảnh vệ tinh để cung cấp thông tin về số lượng khách hàng tại các bãi đậu xe của cửa hàng bán lẻ, hoạt động vận chuyển và cơ sở sản xuất, và sản lượng nông nghiệp...</div></div>
</div>
<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" class="ce-block ng-star-inserted">
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted">Cả hai đều đang nhanh chóng trở thành phần không thể thiếu của công nghệ trong ngành xây dựng. </div></div>
</div>
<p>
	<br />
</p>', CAST(N'2021-10-17T13:26:49.000' AS DateTime), 0, N'Pass', N'https://s3-ap-southeast-1.amazonaws.com/images.spiderum.com/sp-images/72a114d02b7511ec88d1ad32fd429786.png', NULL)
INSERT [dbo].[tblPosts] ([postID], [userID], [statusPID], [categoryID], [title], [postContent], [date], [vote], [approveComment], [image], [description]) VALUES (24, N'quangnt', N'1', 2, N'TRÍ TUỆ NHÂN TẠO & MACHINE LEARNING TRONG HOẠT ĐỘNG XÂY DỰNG NHƯ THẾ NÀO?', N'<p>
	<span style="color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-size: 19px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Hãy tưởng tượng một thế giới mà bạn có thể sử dụng hệ thống máy tính để lập trình robot, máy móc hoặc tự động tính toán và thiết kế xây dựng nhà ở. Công nghệ này đã có sẵn và đang được sử dụng ngày nay, nó đang giúp chúng ta cải tiến công nghệ xây dựng và ngành công nghiệp này có thể hưởng lợi từ việc tăng hiệu quả về chi phí đến tốc độ thi công.</span> <br /> 
</p>
<p>
	<span style="color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-size: 19px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><img style="width: 600px; height: 500px;" src="https://s3-ap-southeast-1.amazonaws.com/images.spiderum.com/sp-images/86a1a0302b7511ec88d1ad32fd429786.png" /><br /></span>
</p>
<p>
	<span style="color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-size: 19px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"> 
</span>
</p>
<div style="float: none; box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; outline: none !important;" class="ce-block ng-star-inserted">
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted">Dưới đây là một số ví dụ về cách AI và ML đang mang lại lợi ích cho ngành xây dựng ngày nay:</div></div>
</div>
<p>
	<span style="color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-size: 19px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
</span>
</p>
<div style="float: none; box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; outline: none !important;" class="ce-block ng-star-inserted">
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: inherit;" class="ng-star-inserted"><h3 style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; margin: 0px 0px 20px; font-size: 22px; font-weight: 700; font-family: &quot;Noto Sans&quot;; padding: 0.4rem 0px; display: block; line-height: 1.5;" class="ce-header ce-header--undefined">Thiết kế dự đoán, xem xét nhiều yếu tố như thời tiết và tạo ra các “Building Twin” kỹ thuật số:</h3></div></div>
</div>
<p>
	<span style="color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-size: 19px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
</span>
</p>
<div style="float: none; box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; outline: none !important;" class="ce-block ng-star-inserted">
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted">Dự báo thời tiết là một trong những ngành luôn dựa vào dữ liệu để đưa ra dự đoán. Cập nhật dự báo thời tiết có ý nghĩa với các kĩ sư và nhân công trên công trường xây dựng. Việc phân tích, dự đoán trước thời tiết của Trí tuệ nhân tạo có thể giúp ích trong việc lên kế hoạch chuẩn bị qua đó giảm thiểu rủi ro xảy ra tai nạn và hạn chế thiệt hại do thời tiết gây ra.</div></div>
</div>
<p>
	<span style="color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-size: 19px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">
 <br /></span>
</p>', CAST(N'2021-10-17T13:28:17.000' AS DateTime), 0, N'Pass', N'https://s3-ap-southeast-1.amazonaws.com/images.spiderum.com/sp-images/86a1a0302b7511ec88d1ad32fd429786.png', NULL)
INSERT [dbo].[tblPosts] ([postID], [userID], [statusPID], [categoryID], [title], [postContent], [date], [vote], [approveComment], [image], [description]) VALUES (25, N'quangnt', N'1', 8, N'3 BƯỚC ĐỂ BẮT ĐẦU TỰ HỌC NGOẠI NGỮ TẠI NHÀ', N'<p style="text-align: center; ">
	<img style="width: 700px; height: 500px;" src="https://s3-ap-southeast-1.amazonaws.com/images.spiderum.com/sp-images/dc424aa0c2a011eb9b2d2f81230cd3c9.png" /><br />
</p>
<div style="text-align: left;">
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Dịch bệnh đang bùng phát khắp nơi và chưa có dấu hiệu dừng lại. Thay vì lo lắng và hoang mang tại sao bạn không tận dụng thời gian giãn cách xã hội để tự học thêm một ngoại ngữ. Việc tự học một ngoại ngữ không khó như nhiều người nghĩ. Dưới đây là một hướng dẫn bao gồm 3 bước mà ai cũng có thể áp dụng được.</div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><strong style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-weight: bolder;">Bước 1: Chuẩn bị các học cụ và kế hoạch học tại nhà</strong></div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Sử dụng các ứng dụng học ngoại ngữ. Các ứng dụng học ngoại ngữ hiện nay như là Duolingo, ứng dụng luyện phát âm Elsa, ứng dụng học tiếng Anh miễn phí như Hello English. Ngoài ra còn có ứng dụng chat và mạng xã hội Livemocha.. Các ứng dụng học ngoại ngữ giúp bạn học bất kể thời gian nào tại nhà, ngay mùa dịch này mà không tốn nhiều phí.&nbsp;</div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Nếu bạn là người tiếp thu theo kiểu trực quan, tức là bạn thích đọc sách rồi ghi chú và làm theo hướng dẫn trong sách thì nên mua sách hướng dẫn ngữ pháp cũng như quyển từ điển bằng ngoại ngữ bạn muốn nói. Bạn cũng sẽ cần một cuốn sách song ngữ để xem các bản dịch từ ngôn ngữ nguồn sang ngôn ngữ đích Chọn một vài cuốn sách chẳng hạn như tiểu thuyết hoặc sách phi hư cấu bằng ngôn ngữ bạn muốn học hoặc bất cứ thể loại sách nào mà bạn quan tâm như sách phát triển bản thân, tản văn…</div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Tìm bạn học cùng hoặc một giáo viên học online tại nhà. Nếu có điều kiện hãy đăng ký một lớp học online có giáo viên bản ngữ hoặc tìm một người bạn nói ngôn ngữ đích để bạn có thể học cách phát âm như người bản ngữ. Khi có một người đồng hành, bạn sẽ có thêm động lực để tiếp tục theo đuổi ngoại ngữ của mình.</div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><strong style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-weight: bolder;">Dành ra 1 cuốn sổ để ghi chép</strong></div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Viết là một cách tốt để ghi nhớ mọi thứ. Viết ra các quy tắc ngữ pháp và từ vựng trong một cuốn sách nhỏ là cực kỳ hữu ích trong việc học ngoại ngữ. Đầu tiên, chọn một cuốn sổ có khổ giấy vừa vặn, không quá to để bạn có thể dễ dàng mang theo khi đi ra ngoài. Sau đó, chia các trang trong quyển sổ thành 2 phần. Ghi chú ngữ pháp trên các trang bên phải và từ vựng ở bên trái. Bạn cũng có thể thực hành viết các câu trong đó. Có thể chia nó thành các phần cho ngữ pháp, từ vựng và thực hành.</div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><strong style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-weight: bolder;">Bước 2: Thực hành học ngoại ngữ thực sự</strong></div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Đầu tiên bạn cần nghiên cứu thật kỹ các quy tắc ngữ pháp. Có thể các quy tắc ngữ pháp của ngoại ngữ mà bạn muốn học sẽ hoàn toàn khác với ngôn ngữ mẹ đẻ của bạn.&nbsp;</div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Ví dụ như tiếng Hàn có cấu trúc S+O+V ( chủ ngữ+ tân ngữ+ động từ) trái với tiếng Việt là S+V+O ( chủ ngữ+ động từ+ tân ngữ). Dành thật nhiều thời gian để học cách cấu trúc câu, trật tự từ.</div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">&nbsp;Kinh nghiệm từ bản thân mình và đúc kết từ các chuyên gia ngôn ngữ cho thấy, việc học ngữ pháp nghiêm túc và hàn lâm ngay từ đầu sẽ giúp ích cho bạn về lâu dài, đặc biệt là nếu bạn có định hướng làm phiên dịch, biên dịch chuyên nghiệp trong tương lai.</div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><strong style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-weight: bolder;">Bước 3: Kiên trì và thực hiện đúng cam kết</strong></div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Steve Job từng nói rằng:” Sự khác biệt giữa người kinh doanh thành công và người chưa thành công là sự kiên trì thuần túy”. Trên con đường chinh phục ngoại ngữ hay bất kể con đường nào, nếu không rèn cho mình tính kiên trì thì chắc chắn rằng con đường thành công sẽ không dành cho bạn. Nhưng làm sao để kiên trì dành thời gian học và rèn luyện mỗi ngày, ngày nắng cũng như ngày mưa, ngày khỏe cũng như ngày ốm? Bí quyết là ở động lực!</div><br />
</div>
<p>
	<br />
</p>', CAST(N'2021-10-17T13:34:58.000' AS DateTime), 1, N'Pass', N'https://s3-ap-southeast-1.amazonaws.com/images.spiderum.com/sp-images/dc424aa0c2a011eb9b2d2f81230cd3c9.png', NULL)
INSERT [dbo].[tblPosts] ([postID], [userID], [statusPID], [categoryID], [title], [postContent], [date], [vote], [approveComment], [image], [description]) VALUES (26, N'quangnt', N'1', 5, N'Note.111✤9/2021: Nguồn gốc tên gọi “Thành Phố Hồ Chí Minh”', N'<p style="text-align: center;">
	<img src="https://cdn.noron.vn/2021/07/29/90679189766996833-1627528467_1024.png" /><br />
</p>
<div style="text-align: left;">
	<span style="color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-size: 19px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Có lẽ dù nhiều người sinh ra và lớn lên ở Thành Phố Hồ Chí Minh nhưng có lẽ không biết đến nguồn gốc tên gọi này, tại sao không gọi là Sài Gòn như xưa. Câu chuyện đổi tên của Thành Phố lại xuất phát từ ý tưởng của một Bác Sĩ.</span> <br />
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" class="ce-block ng-star-inserted">
		<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted">Một tờ báo khác thời điểm đó cũng có ý tưởng đổi tên là Báo Vì nước, số 188, ngày 4-9-1946, có bài tựa <i style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-style: italic;"><strong style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-weight: 700;">“Từ Thành phố Sài Gòn đến Thành phố Hồ Chí Minh”. </strong></i>Bài viết được ký tên chính tòa soạn Vì nước nêu ra nguyên nhân và ý nghĩa của việc “đổi tên này”, trích: <i style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-style: italic;"><strong style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-weight: 700;">“Nhân dịp kỷ niệm cuộc khởi nghĩa tháng Tám thành công ở miền Nam đất Việt, ngày 25 vừa qua, toàn thể đồng bào Nam bộ hiện có mặt ở Hà Nội gồm các đại biểu đủ các giới lao động chân tay và lao động trí thức đã quyết định xin Quốc hội và Chính phủ chuẩn y việc đổi tên thành phố Sài Gòn ra thành thành phố Hồ Chí Minh. Hành động tượng trưng này sẽ có một ảnh hưởng sâu rộng trong dân chúng Việt Nam cũng như các nước ngoài. Nó tăng tinh thần đoàn kết phấn đấu của dân tộc cũng như biểu dương cái ý chí thống nhất Quốc gia của toàn dân Việt Nam từ Bắc vào Nam…”.</strong></i></div></div>
	</div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; orphans: 2; text-align: start; text-indent: 0px; widows: 2; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; outline: none !important;" class="ce-block ng-star-inserted">
		<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto; outline: none !important;" class="ce-block__content">
			<div style="text-align: center; box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; margin-top: 1rem; outline: none !important;" class="ng-star-inserted">
				<span style="color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;;"><span style="white-space: pre-wrap;"><img src="https://cdn.noron.vn/2021/07/29/1257255791781435-1627528558_1024.png" /></span></span><br />
				<div style="text-align: left;">
					<span style="color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;;"><span style="white-space: pre-wrap;"> 
</span></span>
					<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; outline: none !important;" class="ce-block ng-star-inserted">
						<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted">Bài viết “Từ thành phố Sài Gòn đến thành phố Hồ Chí Minh” đăng trên báo Vì nước. (nguồn tuanbaovannghetphcm)</div></div>
					</div><span style="color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;;"><span style="white-space: pre-wrap;">
</span></span>
					<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; outline: none !important;" class="ce-block ng-star-inserted">
						<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted">Và rồi 30/4/1975, Chiến Dịch Hồ Chí Minh kết thúc, hình ảnh của chiếc xe tăng tiến vào Dinh Độc Lập. Hơn 100 năm về sau khi mà vào năm 1859 Trận thành Gia Định thất thủ, kéo dài thời kỳ Pháp thuộc.</div></div>
					</div><span style="color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;;"><span style="white-space: pre-wrap;">
</span></span>
					<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; outline: none !important;" class="ce-block ng-star-inserted">
						<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted">Lúc đó, chưa một quyết định nào được đưa ra về tên mới của Sài Gòn. Trong các quyết định hành chính đầu tiên của lực lượng tiếp quản thành phố, địa danh này vẫn được gọi là<strong style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-weight: 700;"> “Sài Gòn - Gia Định”.</strong></div></div>
					</div><span style="color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;;"><span style="white-space: pre-wrap;">
</span></span>
					<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; outline: none !important;" class="ce-block ng-star-inserted">
						<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted">Trước đó, <i style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-style: italic;">Nhân Dân</i> đã sử dụng cùng lúc hai tên “Sài Gòn” và “Thành phố Hồ Chí Minh” trong các bài tường thuật. Báo<i style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-style: italic;"> Hà Nội Mới</i> số ra ngày 1/5 cũng sử dụng cùng lúc cả hai tên trên trang nhất.</div></div>
					</div><span style="color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;;"><span style="white-space: pre-wrap;">
 <br /></span></span>
				</div>
			</div>
		</div>
	</div><br />
</div>', CAST(N'2021-10-17T13:38:36.000' AS DateTime), 0, N'Pass', N'https://cdn.noron.vn/2021/07/29/90679189766996833-1627528467_1024.png', NULL)
INSERT [dbo].[tblPosts] ([postID], [userID], [statusPID], [categoryID], [title], [postContent], [date], [vote], [approveComment], [image], [description]) VALUES (27, N'quangnt', N'1', 2, N'Software Architect – Check list những thứ cần có cần phải học', N'<p>
	<span style="color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-size: 19px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Đây là bài viết tiếp tục chặng đường trở thành SA của mình mà mình có đề cập đến trong bài viết “</span><a style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8); text-decoration: none; cursor: pointer; background-image: linear-gradient(rgba(0, 0, 0, 0.6) 50%, transparent 0px); background-repeat: repeat-x; background-size: 2px 0.1em; background-position: 0px 1.17em; font-weight: 700; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-size: 19px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;" rel="nofollow noopener noindex noreferrer" href="http://blog.ntechdevelopers.com/software-architect-con-duong-chang-he-de-dang/">Software Architect – Con đường chẳng hề dễ dàng</a><span style="color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; font-size: 19px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">“. Đúng là một con đường chẳng hề dễ dàng. Bài viết này mình đã tổng hợp được những kỹ năng cụ thể cần phải đạt được khi dấn thân vào con đường đầy chông gai này, có thể sau này mình có vững tâm rẽ theo con đường này hay không thì bài viết này mình cũng xin chia sẻ những kỹ năng này tại đây để các bạn cũng có thể nắm được như mình tại thời điểm hiện tại.</span>
</p>
<p style="text-align: center; ">
	<img style="width: 600px; height: 600px;" src="http://blog.ntechdevelopers.com/wp-content/uploads/2021/10/15-books-by-leading-software-architects-1024x538.jpg" /><br />
</p>
<div style="text-align: left;">
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" class="ce-block ng-star-inserted">
		<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted">Cùng đi tiếp nghiệp <strong style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-weight: 700;">Architect sẽ gồm 3 level cơ bản sau</strong>:</div></div>
	</div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" class="ce-block ng-star-inserted">
		<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted"><strong style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-weight: 700;">Application Level</strong>: Đây là level thấp nhất, nó tập trung vào một ứng dụng riêng lẻ, thiết kế kiến trúc chi tiết nhưng ở mức thấp, sẽ phải làm việc chủ yếu với team dev của bạn.</div></div>
	</div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" class="ce-block ng-star-inserted">
		<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted"><strong style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-weight: 700;">Solution Level</strong>: Đây là tầng ở giữa của Architecture, nó sẽ phải tập trung vào ứng dụng cùng với những nghiệp vụ xung quanh, cao hơn Application level nhưng chỉ xoay quanh các giải pháp để xử lý nghiệp vụ. Ở mức độ này bạn sẽ phải làm việc với BA và các team dev lớn khác nữa mà không chỉ riêng team dev của bạn.</div></div>
	</div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" class="ce-block ng-star-inserted">
		<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted"><strong style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; font-weight: 700;">Enterprise Level</strong>: Đây là mức độ cao nhất của Architecture. Nó tập trung vào các giải pháp tối ưu nhất, các thiết kế hệ thống ở mức cao và trừu tượng hóa mà không nhất thiết phải chi tiết đến từng bước làm triển khai. Ở đây bạn sẽ làm trực tiếp với khách hàng và tổ chức dự án ở cấp cao.</div></div>
	</div>
	<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none !important; color: rgba(0, 0, 0, 0.8); font-family: &quot;Noto Sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;" class="ce-block ng-star-inserted">
		<div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.15s ease 0s; outline: none !important; font-family: &quot;Noto Serif&quot;, Regular, &quot;Times New Roman&quot;; white-space: pre-wrap; word-break: break-word; position: relative; max-width: 100%; margin: 0px auto;" class="ce-block__content"><div style="box-sizing: border-box; border: 0px solid rgb(226, 232, 240); transition: background-color 0.1s ease-in 0s; outline: none; padding: 0.4em 0px; text-align: left; font-size: 19px; font-weight: 400; line-height: 32px; margin: 0px 0px 20px; z-index: 2; color: rgba(0, 0, 0, 0.8);" class="ce-paragraph cdx-block ce-paragraph--left ng-star-inserted">Khi trải qua từng level bạn sẽ phải là cầu nối của các bên như: Business – Development, Development – Development,&nbsp; Development – Management, Client – Team, 3rd Team – Internal Team.</div></div>
	</div><br />
</div>', CAST(N'2021-10-17T13:40:36.000' AS DateTime), 1, N'Pass', N'https://blog.ntechdevelopers.com/wp-content/uploads/2021/10/15-books-by-leading-software-architects-1024x538.jpg', NULL)
SET IDENTITY_INSERT [dbo].[tblPosts] OFF
GO
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote], [image]) VALUES (0, N'None', NULL, N'images/rank/new-rank.png')
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote], [image]) VALUES (1, N'Bronze', 150, N'images/rank/bronze-rank.png')
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote], [image]) VALUES (2, N'Silver', 250, N'images/rank/silver-rank.png')
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote], [image]) VALUES (3, N'Gold', 350, N'images/rank/gold-rank.png')
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote], [image]) VALUES (4, N'Platinum', 500, N'images/rank/platinum-rank.png')
INSERT [dbo].[tblRank] ([rankID], [rankName], [vote], [image]) VALUES (5, N'Diamond', 1000, N'images/rank/diamond-rank.png')
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'MT', N'Mentor')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'User')
GO
INSERT [dbo].[tblStatusPosts] ([statusPID], [statusName]) VALUES (N'0', N'Denied')
INSERT [dbo].[tblStatusPosts] ([statusPID], [statusName]) VALUES (N'1', N'Approved')
INSERT [dbo].[tblStatusPosts] ([statusPID], [statusName]) VALUES (N'2', N'Waiting')
INSERT [dbo].[tblStatusPosts] ([statusPID], [statusName]) VALUES (N'3', N'Notificate')
GO
INSERT [dbo].[tblStatusUser] ([statusUID], [statusName]) VALUES (N'0', N'Banned')
INSERT [dbo].[tblStatusUser] ([statusUID], [statusName]) VALUES (N'1', N'Active')
GO
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (23, 14)
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (23, 15)
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (24, 14)
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (24, 15)
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (25, 16)
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (25, 17)
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (25, 18)
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (26, 19)
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (26, 20)
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (27, 21)
INSERT [dbo].[tblTagBlog] ([postID], [tagID]) VALUES (27, 22)
GO
SET IDENTITY_INSERT [dbo].[tblTags] ON 

INSERT [dbo].[tblTags] ([tagID], [tagName], [date]) VALUES (10, N'Test', NULL)
INSERT [dbo].[tblTags] ([tagID], [tagName], [date]) VALUES (14, N'#AI', CAST(N'2021-10-17T13:26:49.000' AS DateTime))
INSERT [dbo].[tblTags] ([tagID], [tagName], [date]) VALUES (15, N'#MachineLearning', CAST(N'2021-10-17T13:26:49.000' AS DateTime))
INSERT [dbo].[tblTags] ([tagID], [tagName], [date]) VALUES (16, N'#tienganh', CAST(N'2021-10-17T13:34:58.000' AS DateTime))
INSERT [dbo].[tblTags] ([tagID], [tagName], [date]) VALUES (17, N'#ngoaingu', CAST(N'2021-10-17T13:34:58.000' AS DateTime))
INSERT [dbo].[tblTags] ([tagID], [tagName], [date]) VALUES (18, N'#cachhoc', CAST(N'2021-10-17T13:34:58.000' AS DateTime))
INSERT [dbo].[tblTags] ([tagID], [tagName], [date]) VALUES (19, N'#lichsu', CAST(N'2021-10-17T13:38:36.000' AS DateTime))
INSERT [dbo].[tblTags] ([tagID], [tagName], [date]) VALUES (20, N'#HCMCity', CAST(N'2021-10-17T13:38:36.000' AS DateTime))
INSERT [dbo].[tblTags] ([tagID], [tagName], [date]) VALUES (21, N'#Software', CAST(N'2021-10-17T13:40:36.000' AS DateTime))
INSERT [dbo].[tblTags] ([tagID], [tagName], [date]) VALUES (22, N'#Congnghe', CAST(N'2021-10-17T13:40:36.000' AS DateTime))
INSERT [dbo].[tblTags] ([tagID], [tagName], [date]) VALUES (23, N'#quandiem', CAST(N'2021-10-19T11:24:17.000' AS DateTime))
INSERT [dbo].[tblTags] ([tagID], [tagName], [date]) VALUES (24, N'#tranhluan', CAST(N'2021-10-19T11:24:17.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblTags] OFF
GO
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date], [image], [banReason]) VALUES (N'107796538934134434547', N'US', N'1', N'Google User', N'', N'giangcam21031999@gmail.com', N'', 0, 0, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'https://lh3.googleusercontent.com/a/default-user=s96-c', NULL)
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date], [image], [banReason]) VALUES (N'108994352679725327738', N'US', N'1', N'Nguyen Duong', N'', N'nguyenduong971999@gmail.com', N'', 0, 0, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'https://lh3.googleusercontent.com/a-/AOh14GhtaVmAMb3v3qY-vVgnX5OWJtoH5X6ftQhojete4Q=s96-c', NULL)
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date], [image], [banReason]) VALUES (N'116318517284643149288', N'US', N'1', N'Google User', N'', N'duongnse150483@fpt.edu.vn', N'', 0, 0, CAST(N'2021-10-27T00:00:00.000' AS DateTime), N'https://lh3.googleusercontent.com/a-/AOh14Gi-h1GID9lOIoAU2ZqQQixihwJZy2Gy6j-mXUk=s96-c', NULL)
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date], [image], [banReason]) VALUES (N'admin', N'AD', N'1', N'Khoa Admin', N'12345678', N'admin@gmail.com', N'113', 0, 0, CAST(N'2021-09-22T00:00:00.000' AS DateTime), N'images\images.png', NULL)
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date], [image], [banReason]) VALUES (N'duongn', N'US', N'1', N'Nguyen Duong', N'12345678', N'duongn@gmail.com', N'114', 155, 0, CAST(N'2021-09-27T00:00:00.000' AS DateTime), N'images\images.png', NULL)
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date], [image], [banReason]) VALUES (N'khoala', N'US', N'1', N'Khoa Hacker', N'12345678', N'khoala@gmail.com', N'114', 300, 0, CAST(N'2021-09-22T00:00:00.000' AS DateTime), N'images\images.png', NULL)
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date], [image], [banReason]) VALUES (N'linhntt', N'US', N'1', N'Nguyen Thi Thuy Linh', N'12345678', N'linhntt@gmail.com', N'117', 600, 0, CAST(N'2021-09-27T00:00:00.000' AS DateTime), N'images\images.png', NULL)
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date], [image], [banReason]) VALUES (N'mentor', N'MT', N'1', N'Khoa Mentor', N'12345678', N'mentor@gmail.com', N'115', 0, 0, CAST(N'2021-09-22T00:00:00.000' AS DateTime), N'images\images.png', NULL)
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date], [image], [banReason]) VALUES (N'nhan', N'US', N'1', N'Nhan Nhan', N'12345678', N'nhannhan@gmail.com', N'118', 1, 0, CAST(N'2021-09-27T00:00:00.000' AS DateTime), N'images\images.png', NULL)
INSERT [dbo].[tblUsers] ([userID], [roleID], [statusUID], [userName], [password], [email], [phone], [totalVote], [rankID], [date], [image], [banReason]) VALUES (N'quangnt', N'US', N'1', N'Nguyen Thien Quang', N'12345678', N'quangnt1702@gmail.com', N'116', 1003, 5, CAST(N'2021-09-27T00:00:00.000' AS DateTime), N'images\images.png', NULL)
GO
INSERT [dbo].[tblView] ([Viewed]) VALUES (5)
GO
INSERT [dbo].[tblVote] ([postID], [userID], [date]) VALUES (25, N'quangnt', CAST(N'2021-11-10T21:05:35.000' AS DateTime))
INSERT [dbo].[tblVote] ([postID], [userID], [date]) VALUES (27, N'108994352679725327738', CAST(N'2021-10-27T20:52:45.000' AS DateTime))
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblPosts] FOREIGN KEY([postID])
REFERENCES [dbo].[tblPosts] ([postID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblPosts]
GO
ALTER TABLE [dbo].[tblComment]  WITH CHECK ADD  CONSTRAINT [FK_tblComment_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblComment] CHECK CONSTRAINT [FK_tblComment_tblUsers]
GO
ALTER TABLE [dbo].[tblPosts]  WITH CHECK ADD  CONSTRAINT [FK_tblPosts_tblCategories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategories] ([categoryID])
GO
ALTER TABLE [dbo].[tblPosts] CHECK CONSTRAINT [FK_tblPosts_tblCategories]
GO
ALTER TABLE [dbo].[tblPosts]  WITH CHECK ADD  CONSTRAINT [FK_tblPosts_tblStatusPosts] FOREIGN KEY([statusPID])
REFERENCES [dbo].[tblStatusPosts] ([statusPID])
GO
ALTER TABLE [dbo].[tblPosts] CHECK CONSTRAINT [FK_tblPosts_tblStatusPosts]
GO
ALTER TABLE [dbo].[tblPosts]  WITH CHECK ADD  CONSTRAINT [FK_tblPosts_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblPosts] CHECK CONSTRAINT [FK_tblPosts_tblUsers]
GO
ALTER TABLE [dbo].[tblTagBlog]  WITH CHECK ADD  CONSTRAINT [FK_tblTagBlog_tblPosts] FOREIGN KEY([postID])
REFERENCES [dbo].[tblPosts] ([postID])
GO
ALTER TABLE [dbo].[tblTagBlog] CHECK CONSTRAINT [FK_tblTagBlog_tblPosts]
GO
ALTER TABLE [dbo].[tblTagBlog]  WITH CHECK ADD  CONSTRAINT [FK_tblTagBlog_tblTags] FOREIGN KEY([tagID])
REFERENCES [dbo].[tblTags] ([tagID])
GO
ALTER TABLE [dbo].[tblTagBlog] CHECK CONSTRAINT [FK_tblTagBlog_tblTags]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRank] FOREIGN KEY([rankID])
REFERENCES [dbo].[tblRank] ([rankID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRank]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblStatusUser] FOREIGN KEY([statusUID])
REFERENCES [dbo].[tblStatusUser] ([statusUID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblStatusUser]
GO
ALTER TABLE [dbo].[tblVote]  WITH CHECK ADD  CONSTRAINT [FK_tblVote_tblPosts] FOREIGN KEY([postID])
REFERENCES [dbo].[tblPosts] ([postID])
GO
ALTER TABLE [dbo].[tblVote] CHECK CONSTRAINT [FK_tblVote_tblPosts]
GO
ALTER TABLE [dbo].[tblVote]  WITH CHECK ADD  CONSTRAINT [FK_tblVote_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblVote] CHECK CONSTRAINT [FK_tblVote_tblUsers]
GO
USE [master]
GO
ALTER DATABASE [FPTStudentBlog] SET  READ_WRITE 
GO
