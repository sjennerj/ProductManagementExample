USE [master]
GO
/****** Object:  Database [ProductManagement]    Script Date: 8/26/2019 9:37:22 PM ******/
CREATE DATABASE [ProductManagement]
GO
ALTER DATABASE [ProductManagement] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProductManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProductManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ProductManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductManagement] SET QUERY_STORE = OFF
GO
USE [ProductManagement]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 8/26/2019 9:37:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](19, 4) NOT NULL,
	[Archived] [bit] NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [ProductManagement] SET  READ_WRITE 
GO
