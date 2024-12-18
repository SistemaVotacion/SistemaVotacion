USE [master]
GO
/****** Object:  Database [RegistroDeVoto]    Script Date: 27/11/2024 02:31:52 p. m. ******/
CREATE DATABASE [RegistroDeVoto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RegistroDeVoto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RegistroDeVoto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RegistroDeVoto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RegistroDeVoto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RegistroDeVoto] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RegistroDeVoto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RegistroDeVoto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET ARITHABORT OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RegistroDeVoto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RegistroDeVoto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RegistroDeVoto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RegistroDeVoto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET RECOVERY FULL 
GO
ALTER DATABASE [RegistroDeVoto] SET  MULTI_USER 
GO
ALTER DATABASE [RegistroDeVoto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RegistroDeVoto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RegistroDeVoto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RegistroDeVoto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RegistroDeVoto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RegistroDeVoto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RegistroDeVoto', N'ON'
GO
ALTER DATABASE [RegistroDeVoto] SET QUERY_STORE = ON
GO
ALTER DATABASE [RegistroDeVoto] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RegistroDeVoto]
GO
/****** Object:  Table [dbo].[candidatos]    Script Date: 27/11/2024 02:31:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[candidatos](
	[candidato_id] [int] NOT NULL,
	[nombre] [varchar](25) NOT NULL,
	[partido] [varchar](35) NOT NULL,
	[provincia] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[candidato_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[votos]    Script Date: 27/11/2024 02:31:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[votos](
	[voto_id] [int] IDENTITY(1,1) NOT NULL,
	[Candidato_id] [int] NULL,
	[Provincia] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[voto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[candidatos] ([candidato_id], [nombre], [partido], [provincia]) VALUES (1, N'Yasiel Gomez', N'Patria', N'Panamá')
INSERT [dbo].[candidatos] ([candidato_id], [nombre], [partido], [provincia]) VALUES (2, N'Francisco Herrera', N'Democrático', N'Chiriquí')
INSERT [dbo].[candidatos] ([candidato_id], [nombre], [partido], [provincia]) VALUES (3, N'Ivan Wu', N'Comunista', N'Colón')
GO
SET IDENTITY_INSERT [dbo].[votos] ON 

INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (1, 1, N'Panamá')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (2, 2, N'Chiriquí')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (3, 3, N'Colón')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (4, 1, N'Panamá')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (5, 2, N'Chiriquí')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (6, 3, N'Colón')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (7, 1, N'Coclé')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (8, 2, N'Veraguas')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (9, 3, N'Bocas del Toro')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (10, 1, N'Panamá')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (11, 2, N'Chiriquí')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (12, 3, N'Colón')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (13, 1, N'Los Santos')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (14, 2, N'Herrera')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (15, 3, N'Darién')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (16, 1, N'Veraguas')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (17, 2, N'Coclé')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (18, 3, N'Bocas del Toro')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (19, 1, N'Panamá')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (20, 2, N'Chiriquí')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (21, 3, N'Colón')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (22, 1, N'Darién')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (23, 2, N'Veraguas')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (24, 3, N'Los Santos')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (25, 1, N'Panamá')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (26, 2, N'Chiriquí')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (27, 3, N'Colón')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (28, 1, N'Herrera')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (29, 2, N'Coclé')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (30, 3, N'Bocas del Toro')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (31, 1, N'Panamá')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (32, 1, N'Panamá')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (33, 2, N'Chiriquí')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (34, 3, N'Colón')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (35, 1, N'Bocas del Toro')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (36, 2, N'Los Santos')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (37, 3, N'Veraguas')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (38, 1, N'Chiriquí')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (39, 2, N'Coclé')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (40, 3, N'Herrera')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (41, 1, N'Panamá')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (42, 2, N'Darién')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (43, 3, N'Los Santos')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (44, 1, N'Colón')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (45, 2, N'Veraguas')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (46, 3, N'Bocas del Toro')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (47, 1, N'Coclé')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (48, 2, N'Panamá')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (49, 3, N'Chiriquí')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (50, 1, N'Veraguas')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (51, 2, N'Los Santos')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (52, 1, N'Panamá')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (54, 1, N'string')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (55, 1, N'string')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (56, 1, N'string')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (57, 1, N'Panamá')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (58, 1, N'Panamá')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (59, 1, N'Panamá')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (60, 1, N'Darién')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (61, 2, N'Coclé')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (62, 3, N'Los Santos')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (63, 3, N'Bocas del Toro')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (64, 2, N'Veraguas')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (65, 1, N'Darién')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (66, 1, N'Chiriquí')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (67, 1, N'Coclé')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (68, 1, N'Colón')
INSERT [dbo].[votos] ([voto_id], [Candidato_id], [Provincia]) VALUES (69, 1, N'Colón')
SET IDENTITY_INSERT [dbo].[votos] OFF
GO
ALTER TABLE [dbo].[votos] ADD  DEFAULT (NULL) FOR [Candidato_id]
GO
ALTER TABLE [dbo].[votos] ADD  DEFAULT (NULL) FOR [Provincia]
GO
ALTER TABLE [dbo].[votos]  WITH CHECK ADD  CONSTRAINT [votos_ibfk_2] FOREIGN KEY([Candidato_id])
REFERENCES [dbo].[candidatos] ([candidato_id])
GO
ALTER TABLE [dbo].[votos] CHECK CONSTRAINT [votos_ibfk_2]
GO
/****** Object:  StoredProcedure [dbo].[RegistrarVoto]    Script Date: 27/11/2024 02:31:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento para almacenar votos
CREATE PROCEDURE [dbo].[RegistrarVoto]
  @CandidatoId INT,
  @Provincia VARCHAR(30)
AS
BEGIN
  -- Insertar directamente el voto en la tabla votos
  INSERT INTO votos (Candidato_id, Provincia)
  VALUES (@CandidatoId, @Provincia);

  PRINT 'Voto registrado exitosamente.';
END;
GO
/****** Object:  StoredProcedure [dbo].[VerTotalVotos]    Script Date: 27/11/2024 02:31:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  --Procedimiento para Ver el Total de Votos
  CREATE PROCEDURE [dbo].[VerTotalVotos]
AS
BEGIN
  -- Consulta para obtener el total de votos
  SELECT 
      COUNT(voto_id) AS Total_Votos
  FROM 
      votos;
END;
GO
/****** Object:  StoredProcedure [dbo].[VerVotosPorCandidato]    Script Date: 27/11/2024 02:31:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimiento para ver votos por candidatos
CREATE PROCEDURE [dbo].[VerVotosPorCandidato]
AS
BEGIN
  -- Consulta para obtener el número total de votos por cada candidato
  SELECT 
      c.nombre AS Candidato, 
      COUNT(v.voto_id) AS Total_Votos
  FROM 
      votos v
  INNER JOIN 
      candidatos c ON v.Candidato_id = c.candidato_id
  GROUP BY 
      c.candidato_id, c.nombre
  ORDER BY 
      Total_Votos DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[VerVotosPorProvincia]    Script Date: 27/11/2024 02:31:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Procedimientos para ver votos por provincia 
CREATE PROCEDURE [dbo].[VerVotosPorProvincia]
AS
BEGIN
  -- Consulta para obtener el número total de votos por provincia
  SELECT 
      v.Provincia, 
      COUNT(v.voto_id) AS Total_Votos
  FROM 
      votos v
  GROUP BY 
      v.Provincia
  ORDER BY 
      Total_Votos DESC;
END;
GO
USE [master]
GO
ALTER DATABASE [RegistroDeVoto] SET  READ_WRITE 
GO
