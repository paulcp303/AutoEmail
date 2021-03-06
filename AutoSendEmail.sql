USE [master]
GO
/****** Object:  Database [AutoSendEmail]    Script Date: 2018/12/3/周一 22:09:18 ******/
CREATE DATABASE [AutoSendEmail]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AutoSendEmail', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AutoSendEmail.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AutoSendEmail_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\AutoSendEmail_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AutoSendEmail] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AutoSendEmail].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AutoSendEmail] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AutoSendEmail] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AutoSendEmail] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AutoSendEmail] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AutoSendEmail] SET ARITHABORT OFF 
GO
ALTER DATABASE [AutoSendEmail] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AutoSendEmail] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [AutoSendEmail] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AutoSendEmail] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AutoSendEmail] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AutoSendEmail] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AutoSendEmail] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AutoSendEmail] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AutoSendEmail] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AutoSendEmail] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AutoSendEmail] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AutoSendEmail] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AutoSendEmail] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AutoSendEmail] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AutoSendEmail] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AutoSendEmail] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AutoSendEmail] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AutoSendEmail] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AutoSendEmail] SET RECOVERY FULL 
GO
ALTER DATABASE [AutoSendEmail] SET  MULTI_USER 
GO
ALTER DATABASE [AutoSendEmail] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AutoSendEmail] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AutoSendEmail] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AutoSendEmail] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AutoSendEmail', N'ON'
GO
USE [AutoSendEmail]
GO
/****** Object:  Table [dbo].[Organization_Dates]    Script Date: 2018/12/3/周一 22:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organization_Dates](
	[Date_Id] [varchar](36) NOT NULL,
	[Date_Name] [varchar](100) NULL,
	[Organization_Id] [varchar](36) NULL,
	[Date] [varchar](30) NULL,
	[Is_Solar] [int] NULL,
	[Date_Description] [varchar](2000) NULL,
	[Is_Send] [int] NULL,
 CONSTRAINT [PK_Organization_Date] PRIMARY KEY CLUSTERED 
(
	[Date_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Organization_Manager]    Script Date: 2018/12/3/周一 22:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organization_Manager](
	[Organization_Id] [varchar](36) NULL,
	[Manger_Id] [varchar](36) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Organizations]    Script Date: 2018/12/3/周一 22:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organizations](
	[Organization_Id] [varchar](36) NOT NULL,
	[Organization_Code] [varchar](30) NULL,
	[Organization_Name] [nvarchar](200) NULL,
	[Organization_Description] [nvarchar](2000) NULL,
	[Organization_Email] [varchar](100) NULL,
	[Email_Password] [varchar](100) NULL,
	[Email_Type] [varchar](50) NULL,
	[Join_Time] [varchar](30) NULL,
	[Create_Time] [varchar](30) NULL,
	[Is_Delete] [int] NULL,
 CONSTRAINT [PK_Organizations] PRIMARY KEY CLUSTERED 
(
	[Organization_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Organizations_Users]    Script Date: 2018/12/3/周一 22:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organizations_Users](
	[Organization_Id] [varchar](36) NULL,
	[User_Id] [varchar](36) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Public_Date_Time]    Script Date: 2018/12/3/周一 22:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Public_Date_Time](
	[Organization_Id] [varchar](36) NULL,
	[Public_Date_Id] [varchar](36) NULL,
	[Send_Time] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Public_Dates]    Script Date: 2018/12/3/周一 22:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Public_Dates](
	[Date_Id] [varchar](36) NOT NULL,
	[Date_Name] [varchar](100) NOT NULL,
	[Date] [varchar](30) NULL,
	[Is_Solar] [int] NULL,
	[Date_Description] [nvarchar](2000) NULL,
	[Is_Active] [int] NULL,
 CONSTRAINT [PK_Public_Dates] PRIMARY KEY CLUSTERED 
(
	[Date_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sends]    Script Date: 2018/12/3/周一 22:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sends](
	[Send_Id] [varchar](36) NOT NULL,
	[User_Id] [varchar](36) NULL,
	[Date_Id] [varchar](36) NULL,
	[Is_Send] [int] NULL,
	[Send_Content] [nvarchar](max) NULL,
	[Remark] [varchar](max) NULL,
	[Send_Time] [varchar](30) NULL,
	[Success_Time] [varchar](30) NULL,
 CONSTRAINT [PK_Sends] PRIMARY KEY CLUSTERED 
(
	[Send_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Dates]    Script Date: 2018/12/3/周一 22:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Dates](
	[Date_Id] [varchar](36) NOT NULL,
	[Date_Name] [varchar](100) NOT NULL,
	[User_Id] [varchar](36) NULL,
	[Date] [varchar](30) NULL,
	[Is_Solar] [int] NULL,
	[Date_Description] [varchar](2000) NULL,
	[Is_Send] [int] NULL,
 CONSTRAINT [PK_User_Date] PRIMARY KEY CLUSTERED 
(
	[Date_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2018/12/3/周一 22:09:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[User_Id] [varchar](36) NOT NULL,
	[User_Code] [varchar](30) NULL,
	[Pwd] [varchar](50) NULL,
	[User_Name] [varchar](100) NULL,
	[Role] [varchar](30) NULL,
	[Gender] [int] NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[User_Description] [nvarchar](2000) NULL,
	[BirthDay] [varchar](30) NULL,
	[Location] [varchar](100) NULL,
	[Province] [varchar](30) NULL,
	[City] [varchar](30) NULL,
	[Is_Active] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Organization_Dates] ADD  CONSTRAINT [DF_Organization_Date_Is_Send]  DEFAULT ((1)) FOR [Is_Send]
GO
ALTER TABLE [dbo].[Organizations] ADD  CONSTRAINT [DF_Organizations_Is_Delete]  DEFAULT ((0)) FOR [Is_Delete]
GO
ALTER TABLE [dbo].[Public_Dates] ADD  CONSTRAINT [DF_Table_1_Is_Send]  DEFAULT ((1)) FOR [Is_Active]
GO
ALTER TABLE [dbo].[Sends] ADD  CONSTRAINT [DF_Sends_Is_Send]  DEFAULT ((1)) FOR [Is_Send]
GO
ALTER TABLE [dbo].[User_Dates] ADD  CONSTRAINT [DF_User_Date_Is_Send]  DEFAULT ((1)) FOR [Is_Send]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Gender]  DEFAULT ((0)) FOR [Gender]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Is_Active]  DEFAULT ((1)) FOR [Is_Active]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization_Dates', @level2type=N'COLUMN',@level2name=N'Date_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节日名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization_Dates', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization_Dates', @level2type=N'COLUMN',@level2name=N'Organization_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织庆祝日期（如09-12）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization_Dates', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否是公历（1代表公历，2电表阴历农历）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization_Dates', @level2type=N'COLUMN',@level2name=N'Is_Solar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否发送（1代表启用，0代表禁用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization_Dates', @level2type=N'COLUMN',@level2name=N'Is_Send'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization_Manager', @level2type=N'COLUMN',@level2name=N'Organization_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'管理员用户id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organization_Manager', @level2type=N'COLUMN',@level2name=N'Manger_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键，组织id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organizations', @level2type=N'COLUMN',@level2name=N'Organization_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organizations', @level2type=N'COLUMN',@level2name=N'Organization_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organizations', @level2type=N'COLUMN',@level2name=N'Organization_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organizations', @level2type=N'COLUMN',@level2name=N'Organization_Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织邮箱（用于发邮件）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organizations', @level2type=N'COLUMN',@level2name=N'Organization_Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱密码（授权码）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organizations', @level2type=N'COLUMN',@level2name=N'Email_Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱类别（@后缀，如qq、163）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organizations', @level2type=N'COLUMN',@level2name=N'Email_Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加入平台时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organizations', @level2type=N'COLUMN',@level2name=N'Join_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organizations', @level2type=N'COLUMN',@level2name=N'Create_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否删除，1代表已删除，0代表未删除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organizations', @level2type=N'COLUMN',@level2name=N'Is_Delete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organizations_Users', @level2type=N'COLUMN',@level2name=N'Organization_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Organizations_Users', @level2type=N'COLUMN',@level2name=N'User_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Public_Date_Time', @level2type=N'COLUMN',@level2name=N'Organization_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公用日期id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Public_Date_Time', @level2type=N'COLUMN',@level2name=N'Public_Date_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送具体时间（2018-10-20 12:00）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Public_Date_Time', @level2type=N'COLUMN',@level2name=N'Send_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Public_Dates', @level2type=N'COLUMN',@level2name=N'Date_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节日名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Public_Dates', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织庆祝日期（如09-12）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Public_Dates', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否是公历（1代表公历，2电表阴历农历）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Public_Dates', @level2type=N'COLUMN',@level2name=N'Is_Solar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用（1代表启用，0代表禁用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Public_Dates', @level2type=N'COLUMN',@level2name=N'Is_Active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sends', @level2type=N'COLUMN',@level2name=N'Send_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sends', @level2type=N'COLUMN',@level2name=N'User_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sends', @level2type=N'COLUMN',@level2name=N'Date_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否发送（1代表发送，0代表停止发送）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sends', @level2type=N'COLUMN',@level2name=N'Is_Send'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sends', @level2type=N'COLUMN',@level2name=N'Send_Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发送时间（2018-10-20 12:00）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sends', @level2type=N'COLUMN',@level2name=N'Send_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际发送时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sends', @level2type=N'COLUMN',@level2name=N'Success_Time'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'日期id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Dates', @level2type=N'COLUMN',@level2name=N'Date_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'节日名字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Dates', @level2type=N'COLUMN',@level2name=N'Date_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Dates', @level2type=N'COLUMN',@level2name=N'User_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组织庆祝日期（如09-12）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Dates', @level2type=N'COLUMN',@level2name=N'Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否是公历（1代表公历，2电表阴历农历）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Dates', @level2type=N'COLUMN',@level2name=N'Is_Solar'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否发送（1代表启用，0代表禁用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User_Dates', @level2type=N'COLUMN',@level2name=N'Is_Send'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户id，主键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'User_Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'User_Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Pwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'User_Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色（1代表管理员，2代表普通用户）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别（1代表男，2代表女，其他代表未知）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户邮箱，用于收邮件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户介绍' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'User_Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生日（如1990-01-01）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'BirthDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在地区（城市）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Location'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在省' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所在市' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1代表正常，0代表禁用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'Is_Active'
GO
USE [master]
GO
ALTER DATABASE [AutoSendEmail] SET  READ_WRITE 
GO
