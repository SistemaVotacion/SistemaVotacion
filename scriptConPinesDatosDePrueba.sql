USE [master]
GO
/****** Object:  Database [pruebaHash]    Script Date: 26/11/2024 11:18:17 p. m. ******/
CREATE DATABASE [pruebaHash]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prueba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\pruebaHash.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'prueba_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\pruebaHash_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [pruebaHash] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pruebaHash].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pruebaHash] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pruebaHash] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pruebaHash] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pruebaHash] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pruebaHash] SET ARITHABORT OFF 
GO
ALTER DATABASE [pruebaHash] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [pruebaHash] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pruebaHash] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pruebaHash] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pruebaHash] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pruebaHash] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pruebaHash] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pruebaHash] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pruebaHash] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pruebaHash] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pruebaHash] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pruebaHash] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pruebaHash] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pruebaHash] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pruebaHash] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pruebaHash] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pruebaHash] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pruebaHash] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [pruebaHash] SET  MULTI_USER 
GO
ALTER DATABASE [pruebaHash] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pruebaHash] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pruebaHash] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pruebaHash] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pruebaHash] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pruebaHash] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'pruebaHash', N'ON'
GO
ALTER DATABASE [pruebaHash] SET QUERY_STORE = OFF
GO
USE [pruebaHash]
GO
/****** Object:  Table [dbo].[cedula#]    Script Date: 26/11/2024 11:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cedula#](
	[nombre] [varchar](30) NOT NULL,
	[cedula] [varchar](20) NOT NULL,
	[provincia] [int] NOT NULL,
	[pin] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CedulaHash]    Script Date: 26/11/2024 11:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CedulaHash](
	[cedulaHash] [varbinary](max) NULL,
	[provincia] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Padron]    Script Date: 26/11/2024 11:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Padron](
	[id_padron] [int] IDENTITY(1,1) NOT NULL,
	[cedula_hash] [varbinary](max) NOT NULL,
	[pin_hash] [varbinary](max) NOT NULL,
	[link] [varchar](255) NULL,
	[provincia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_padron] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincia]    Script Date: 26/11/2024 11:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincia](
	[id_provincia] [int] NOT NULL,
	[nombre] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincias]    Script Date: 26/11/2024 11:18:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincias](
	[id_provincia] [int] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Carlos Jiménez', N'1-12-3456', 1, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Javier Torres', N'1-15-2345 ', 1, N'ni0460')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'María González', N'1-27-7890', 1, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Lucía Villarreal', N'1-28-6789', 1, N'ni0253')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Ana Martínez', N'1-34-5678', 1, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Omar Mendoza', N'1-36-9876', 1, N'ni0560')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Patricia Gómez', N'1-49-5432', 1, N'ni0760')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Pedro Rodríguez', N'1-50-1234', 1, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Sofía Herrera', N'1-68-8901', 1, N'ni0266')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Luis Pérez', N'1-89-4321', 1, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Jorge Villarreal', N'2-10-1234', 2, N'ni0263')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Ana Morales', N'2-14-3567', 2, N'ni0264')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'María Valdés', N'2-15-5678 ', 2, N'ni0261')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Carlos Herrera', N'2-22-3456', 2, N'ni0262')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Roberto Castillo', N'2-25-7894 ', 2, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Sofía Díaz', N'2-30-7890', 2, N'ni0265')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Silvia Rodríguez', N'2-33-1238', 2, N'ni0266')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Ricardo Montenegro', N'2-35-2345', 2, N'ni0267')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Marcos Pérez', N'2-41-5672', 2, N'ni0268')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Elena Salinas', N'2-42-6789', 2, N'ni0269')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Luis Gómez', N'2-51-9876', 2, N'ni0250')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Laura Sánchez', N'2-58-8903', 2, N'ni0270')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Carmen Ortega', N'2-60-4321', 2, N'ni0460')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Felipe Gómez', N'2-62-2349', 2, N'ni0560')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Daniel Rivera', N'2-68-8765', 2, N'ni0262')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Natalia Sánchez', N'2-74-5432', 2, N'ni0240')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Alberto Moreno', N'3-10-3456', 3, N'ni0860')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Daniela Martínez', N'3-15-7890', 3, N'ni0760')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Jorge Ríos', N'3-22-1234', 3, N'ni0560')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Carolina Jiménez', N'3-30-4567', 3, N'ni0560')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Francisco Castillo', N'3-35-6789', 3, N'ni0210')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Gabriela López', N'3-40-2345', 3, N'ni0200')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Mario Espinosa', N'3-48-8765', 3, N'ni0270')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Lucía Gómez', N'3-55-5432', 3, N'ni0280')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Pedro Sánchez', N'3-60-9876 ', 3, N'ni0560')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Verónica Herrera', N'3-68-4321', 3, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Julio Pérez', N'3-72-5678', 3, N'ni0360')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Rosa Delgado', N'3-81-3459', 3, N'ni0265')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Esteban Vega', N'3-90-8760', 3, N'ni0360')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Juan Camarena', N'4-12-2345', 4, N'ni0250')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'José Castillo', N'4-18-2451', 4, N'ni0270')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Mariana Ortega', N'4-18-8765', 4, N'ni0262')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Elena Ríos', N'4-25-3678 ', 4, N'ni0270')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Carlos Núñez', N'4-25-6789', 4, N'ni0230')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Gabriela Delgado', N'4-32-1357', 4, N'ni0240')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Ricardo Sánchez', N'4-32-1987', 4, N'ni0263')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Mario Espinosa', N'4-41-4567', 4, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Karina López', N'4-45-7892', 4, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Isabel Quintero', N'4-55-9876', 4, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Andrés Vega', N'4-56-3421', 4, N'ni0266')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Diana Morales', N'4-67-8765', 4, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Alejandro Torres', N'5-12-3456', 5, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Lorena Martínez', N'5-18-7890', 5, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Diego González', N'5-25-1234', 5, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Carmen Gutiérrez', N'5-30-4567', 5, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Manuel Herrera', N'5-36-6789 ', 5, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Paola López', N'5-40-2345 ', 5, N'ni0264')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Sebastián Rivera', N'5-49-8765', 5, N'ni0266')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Natalia Jiménez', N'5-53-5432', 5, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Andrés Vega', N'5-62-9876', 5, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Clara Morales', N'5-68-4321', 5, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Rafael Núñez', N'5-75-5678', 5, N'ni0460')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'José Pérez', N'6-01-1234', 6, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Mariana Rodríguez', N'6-03-5678', 6, N'ni0266')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Luis Castillo', N'6-07-3456', 6, N'ni0460')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Ana Morales', N'6-10-7890', 6, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Pedro Herrera', N'6-15-2345', 6, N'ni0264')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Sofía Gómez', N'6-18-6789 ', 6, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Ricardo Vega', N'6-21-9876', 6, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Lorena Díaz', N'6-25-4321', 6, N'ni0265')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Andrés Salinas', N'6-30-8765', 6, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Gabriela Montenegro', N'6-34-5432', 6, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Mario Jiménez', N'6-41-6543', 6, N'ni0460')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Clara Valdés', N'6-45-7896', 6, N'ni0460')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Julio López', N'6-50-3654', 6, N'ni0266')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Karina Ríos', N'6-55-2487', 6, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Javier Torres', N'6-60-9132', 6, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Miguel Sánchez', N'7-05-1234', 7, N'ni0265')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Rosa López', N'7-10-4567', 7, N'ni0460')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Andrés Villarreal', N'7-15-7890', 7, N'ni0266')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Laura Valdés', N'7-20-2345', 7, N'ni0264')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Javier González', N'7-25-6789 ', 7, N'ni0760')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Sofía Herrera', N'7-30-9876', 7, N'ni0253')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Pedro Rodríguez', N'7-35-5432', 7, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Carla Salinas', N'7-40-8765', 7, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Daniel Espinosa', N'7-50-4321', 7, N'ni0760')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Elena Gutiérrez', N'7-55-6543', 7, N'ni0253')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Javier Pérez', N'8-100-1234', 8, N'ni0460')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Francisco Herrera', N'8-1005-1990', 8, N'ni0264')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Ana Herrera', N'8-1005-3456', 8, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Nathan Carrasco', N'8-1010-606', 8, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Andrés López', N'8-1111-7654', 8, N'ni0265')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Natalia Sánchez', N'8-1205-6542', 8, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Sofía González', N'8-2310-4321', 8, N'ni0760')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Mariana Castillo', N'8-275-5678', 8, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Elena Rivera', N'8-3005-1234 ', 8, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Carmen Ríos', N'8-325-2345', 8, N'ni0266')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Diego Espinosa', N'8-4321-5678', 8, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Luis Montenegro', N'8-4523-4987', 8, N'ni0264')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Ricardo Morales', N'8-456-7890', 8, N'ni0265')
GO
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Daniel Herrera', N'8-564-7894', 8, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Rosa Salinas', N'8-678-3459', 8, N'ni0266')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Pedro Valdés', N'8-789-9876 ', 8, N'ni0760')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Patricia Delgado', N'8-876-7891', 8, N'ni0253')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Laura Vega', N'8-905-6543', 8, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Ivan Wu', N'8-960-606', 8, N'ni0253')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'José Martínez', N'8-9876-5432', 8, N'ni0264')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Mariana Gutiérrez', N'9-1005-5678', 9, N'ni0266')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Andrés Vega', N'9-1205-6543', 9, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Ana Sánchez', N'9-2301-3456', 9, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Javier Castillo', N'9-245-1234', 9, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Diego Espinosa', N'9-3005-5678', 9, N'ni0264')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Sofía Martínez', N'9-4321-4321', 9, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Ricardo López', N'9-456-7890', 9, N'ni0266')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Rosa Herrera', N'9-567-7654', 9, N'ni0760')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Pedro Valdés', N'9-789-9876', 9, N'ni0260')
INSERT [dbo].[cedula#] ([nombre], [cedula], [provincia], [pin]) VALUES (N'Carmen Ríos', N'9-999-2345', 9, N'ni0760')
GO
INSERT [dbo].[provincias] ([id_provincia], [nombre]) VALUES (1, N'Bocas del Toro')
INSERT [dbo].[provincias] ([id_provincia], [nombre]) VALUES (2, N'Coclé')
INSERT [dbo].[provincias] ([id_provincia], [nombre]) VALUES (3, N'Colón')
INSERT [dbo].[provincias] ([id_provincia], [nombre]) VALUES (4, N'Chiriquí')
INSERT [dbo].[provincias] ([id_provincia], [nombre]) VALUES (5, N'Darién')
INSERT [dbo].[provincias] ([id_provincia], [nombre]) VALUES (6, N'Herrera')
INSERT [dbo].[provincias] ([id_provincia], [nombre]) VALUES (7, N'Los Santos')
INSERT [dbo].[provincias] ([id_provincia], [nombre]) VALUES (8, N'Panamá')
INSERT [dbo].[provincias] ([id_provincia], [nombre]) VALUES (9, N'Veraguas')
GO
ALTER TABLE [dbo].[cedula#]  WITH CHECK ADD FOREIGN KEY([provincia])
REFERENCES [dbo].[provincias] ([id_provincia])
GO
ALTER TABLE [dbo].[Padron]  WITH CHECK ADD FOREIGN KEY([provincia])
REFERENCES [dbo].[provincia] ([id_provincia])
GO
USE [master]
GO
ALTER DATABASE [pruebaHash] SET  READ_WRITE 
GO
