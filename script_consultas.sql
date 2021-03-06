USE [master]
GO
/****** Object:  Database [Consultas]    Script Date: 16/09/2021 8:57:53 p. m. ******/
CREATE DATABASE [Consultas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Consultas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS_1\MSSQL\DATA\Consultas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Consultas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS_1\MSSQL\DATA\Consultas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Consultas] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Consultas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Consultas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Consultas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Consultas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Consultas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Consultas] SET ARITHABORT OFF 
GO
ALTER DATABASE [Consultas] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Consultas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Consultas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Consultas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Consultas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Consultas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Consultas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Consultas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Consultas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Consultas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Consultas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Consultas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Consultas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Consultas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Consultas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Consultas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Consultas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Consultas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Consultas] SET  MULTI_USER 
GO
ALTER DATABASE [Consultas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Consultas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Consultas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Consultas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Consultas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Consultas] SET QUERY_STORE = OFF
GO
USE [Consultas]
GO
/****** Object:  Table [dbo].[consulta]    Script Date: 16/09/2021 8:57:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[consulta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[historiaclinica] [int] NULL,
	[idespecialista] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[especialistas]    Script Date: 16/09/2021 8:57:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[especialistas](
	[id] [int] NOT NULL,
	[idtipoconsulta] [int] NULL,
	[nombre] [varchar](50) NULL,
	[idestadoconsulta] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estadoconsulta]    Script Date: 16/09/2021 8:57:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estadoconsulta](
	[id] [int] NOT NULL,
	[estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paciente]    Script Date: 16/09/2021 8:57:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paciente](
	[historiaClinica] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[edad] [int] NULL,
	[prioridad] [decimal](5, 2) NULL,
	[riesgo] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[historiaClinica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[panciano]    Script Date: 16/09/2021 8:57:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[panciano](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[historiaClinica] [int] NULL,
	[dieta] [bit] NULL,
	[prioridad] [decimal](5, 2) NULL,
	[riesgo] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pjoven]    Script Date: 16/09/2021 8:57:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pjoven](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[historiaClinica] [int] NULL,
	[fumador] [bit] NULL,
	[prioridad] [decimal](5, 2) NULL,
	[riesgo] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pninno]    Script Date: 16/09/2021 8:57:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pninno](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[historiaClinica] [int] NULL,
	[edad] [int] NULL,
	[peso] [int] NULL,
	[estatura] [int] NULL,
	[prioridad] [decimal](5, 2) NULL,
	[riesgo] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipoconsulta]    Script Date: 16/09/2021 8:57:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipoconsulta](
	[id] [int] NOT NULL,
	[tipo] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[consulta]  WITH CHECK ADD  CONSTRAINT [FK_consulta_especialistas] FOREIGN KEY([idespecialista])
REFERENCES [dbo].[especialistas] ([id])
GO
ALTER TABLE [dbo].[consulta] CHECK CONSTRAINT [FK_consulta_especialistas]
GO
ALTER TABLE [dbo].[consulta]  WITH CHECK ADD  CONSTRAINT [FK_consulta_paciente] FOREIGN KEY([historiaclinica])
REFERENCES [dbo].[paciente] ([historiaClinica])
GO
ALTER TABLE [dbo].[consulta] CHECK CONSTRAINT [FK_consulta_paciente]
GO
ALTER TABLE [dbo].[especialistas]  WITH CHECK ADD  CONSTRAINT [FK_espcialista_estadoconsulta] FOREIGN KEY([idestadoconsulta])
REFERENCES [dbo].[estadoconsulta] ([id])
GO
ALTER TABLE [dbo].[especialistas] CHECK CONSTRAINT [FK_espcialista_estadoconsulta]
GO
ALTER TABLE [dbo].[especialistas]  WITH CHECK ADD  CONSTRAINT [FK_especialistas_tipoconsulta] FOREIGN KEY([idtipoconsulta])
REFERENCES [dbo].[tipoconsulta] ([id])
GO
ALTER TABLE [dbo].[especialistas] CHECK CONSTRAINT [FK_especialistas_tipoconsulta]
GO
ALTER TABLE [dbo].[panciano]  WITH CHECK ADD  CONSTRAINT [FK_panciano_paciente] FOREIGN KEY([historiaClinica])
REFERENCES [dbo].[paciente] ([historiaClinica])
GO
ALTER TABLE [dbo].[panciano] CHECK CONSTRAINT [FK_panciano_paciente]
GO
ALTER TABLE [dbo].[pjoven]  WITH CHECK ADD  CONSTRAINT [FK_pjoven_paciente] FOREIGN KEY([historiaClinica])
REFERENCES [dbo].[paciente] ([historiaClinica])
GO
ALTER TABLE [dbo].[pjoven] CHECK CONSTRAINT [FK_pjoven_paciente]
GO
ALTER TABLE [dbo].[pninno]  WITH CHECK ADD  CONSTRAINT [FK_pninno_paciente] FOREIGN KEY([historiaClinica])
REFERENCES [dbo].[paciente] ([historiaClinica])
GO
ALTER TABLE [dbo].[pninno] CHECK CONSTRAINT [FK_pninno_paciente]
GO
USE [master]
GO
ALTER DATABASE [Consultas] SET  READ_WRITE 
GO
