USE [master]
GO
/****** Object:  Database [PadronElectoral]    Script Date: 27/11/2024 02:31:13 p. m. ******/
CREATE DATABASE [PadronElectoral]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PadronElectoral', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PadronElectoral.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PadronElectoral_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PadronElectoral_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PadronElectoral] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PadronElectoral].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PadronElectoral] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PadronElectoral] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PadronElectoral] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PadronElectoral] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PadronElectoral] SET ARITHABORT OFF 
GO
ALTER DATABASE [PadronElectoral] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PadronElectoral] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PadronElectoral] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PadronElectoral] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PadronElectoral] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PadronElectoral] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PadronElectoral] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PadronElectoral] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PadronElectoral] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PadronElectoral] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PadronElectoral] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PadronElectoral] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PadronElectoral] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PadronElectoral] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PadronElectoral] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PadronElectoral] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PadronElectoral] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PadronElectoral] SET RECOVERY FULL 
GO
ALTER DATABASE [PadronElectoral] SET  MULTI_USER 
GO
ALTER DATABASE [PadronElectoral] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PadronElectoral] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PadronElectoral] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PadronElectoral] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PadronElectoral] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PadronElectoral] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PadronElectoral', N'ON'
GO
ALTER DATABASE [PadronElectoral] SET QUERY_STORE = ON
GO
ALTER DATABASE [PadronElectoral] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PadronElectoral]
GO
/****** Object:  Table [dbo].[Padron]    Script Date: 27/11/2024 02:31:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Padron](
	[id_padron] [int] IDENTITY(1,1) NOT NULL,
	[cedula_hash] [nvarchar](255) NULL,
	[pin_hash] [nvarchar](255) NULL,
	[provincia] [int] NULL,
	[link] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id_padron] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincia]    Script Date: 27/11/2024 02:31:14 p. m. ******/
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
SET IDENTITY_INSERT [dbo].[Padron] ON 

INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (2, NULL, NULL, NULL, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (4, N'e8e3103f559b4157ff3a8ef44a88dd20bd797d0f6b1624299663a3d3ceb5dda2837d5f96b855e1969434a07c77b1d179c79f18f1c0d31141389c4306f29e8db6', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 1, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (5, N'183f437853df7f10d792ae5117f5e1bd08f5175e7c5d64e91581299db37c810cc0ae3872a58b6e7409b0e9ccfe01ae06902045d1336e7ae5ccfc2c46e3246f52 ', N'03e42545df72242613d0fcaa8babf4bc16d616bef56c19257e817d3772a4743bfb8c174f7a666ff963e2193fffdebb5553c0045baac01c7e1eec38ab6483d5ec', 1, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (6, N'0c56a45fa2f685fe2b8d6fcc2a937a5a32bb913a9544dc67949a7dfc114a83a2934bafa5108f62a8eaab3cfad40c6c6fe597b14d1f530de467ec01c587a7571c', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 1, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (7, N'3b06d1f1c4dfec74caa9d398caa4a9c6d730c7e69208a903af42741f9255b2b64c0956cc214762b35983c523e76050352a4a13a8757f0f60c16060570022c7f1', N'6f54462cd512b9cd97c7aff1161eca6ebcc43e65edef132374df6d6a441fcf242a2db4546aa6347b6e9572194312ea1d8021f217e6819de96d64c6c0199fae24', 1, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (8, N'a97e13ee20b39bb2de0d50f522c80308efa62848b0c6afa8ecca75e39644e749567f665d8d17d6ae0d8d7439a01efcb60ef5aa94ffaa74a8ea240de5589384c1', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 1, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (9, N'4cdd465da6b5791b4b1181cda27774f04ae4befab28c51e70e93d4b539444606ae4c928e3b0fde7223959c353cd9d406c8c9fc4ba431764d891e45622211d20b', N'88bad8742c8a609dd53763fb849aa5491b6e4412a34ce298dfbe402be902db7280cc788f56e1c03884eb412df81a9fa98752320c9201a27c2af019b1fbd01d1b', 1, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (10, N'b867ee18e8ffde367c20687b46416ce7127ccb0c7b6cd0215b117bd78ab4f8953682a42e3ab5011090c0ced09be3b1ca7e31d4fdc63ea8c4c2f85bde96b9d9dc', N'3c717ec57ea274b0dd2efefe83115942e39f561de96d7e8333572723d617d32b848c3b390de7b744db54e47ba308ee037ba490c587cc10f7e399ff153e30126e', 1, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (11, N'c0026dd956253e3947ce2ecd3948714bcb64a0599f9469aace628d0a1df9520bebfbf99ace2d260673a06e95f356d550923f9196ed4f125440fe73a369b06f9b', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 1, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (12, N'f99a04c8ecf42e61749226ec0a1c44a6f80ae0bf80853e1f3e5bd3fbe8a6c7fd2cbdcc7e6be53caed3b508b570b07dd9009eb8937aa8fc7441463cab158e9cc3', N'b0a580d0a771aeb22f9cbd769424ec5aa65e5da84cdba15f748d5a55c3abad7402b7659ee375e1ba5399a01fc00a3a9ee4290e6e14bd7a219e346955d0a3b5c9', 1, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (13, N'5059a548a4399f1740664f169c46bf87a34c9add4db4ab3f5a98edec258576281a7b802cc332e164d037c512647190af910c60ff27452dc82f742342c819dde3', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 1, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (14, N'f053305a6d64d821d4a7238c345f31995353b5685e1d39bfc3ebcaa636ef7b83953e2c7e5a789ca4019ce994095d7bfdb0900a02cf3b1cb5a60ea497e569a6ee', N'aca1229a264be1288e80c90d7ffd24ed706f0bc0857a17210b97599ba8b8e1d0ed1eeb40f3e4fd84930e7deb8c701d0f6d7fc8dccc27523153ec96f5f3f5b6a6', 2, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (15, N'2ec54311a791a95f7cf1d5453e82ffd42d3abe851ce7a4a7aacbc2f164eac42060cdd9901b3474a229f6455205766b2e9cbd98bd696663f8d8fd150332a5d05a', N'a458a58e357006feb54c3ba63eaff8be3cd43341d0a50c00ad953a76b87313845427001f508bb684db5e8005eebf04eef244fa529a4895079f61934ac1fb557a', 2, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (16, N'99749547e84fbe35e82e1934c5dddbafa4ae04199a2c06d49762d0817e1645851a1b4b9deae8002b8a36a3d8550ba883493b6b9b302b394b98dd1d55b64a49d5 ', N'0f242be6606e11bcc09e31f2bc6273c50135018906d03228b91b6b50ca9e83883d30e7a08d7bcf5205c0fc6ed11487f0958965e172dfe66b858f8ad6807d0ed0', 2, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (17, N'705fe9c5ad4a55d18d504b71814ea911e047c76b23e641219972159530a0671b23c4ba83adbb67b2bcfbe3aa92ae5afcceac11ec23935152e9cfe2d6ff3c9faa', N'fc5ba503db3420582602a10e949badb8a28b4642066775d23112ed71b647ad9f32f0afdf600e133fd94ac9aadbb9316b64fc76a7ac19e6b5d7f7d0e1f974156f', 2, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (18, N'232ce0cd08629d99a620bcfffda3c951f84e6901f063f59c004e782e192382c32826b927d7027f081633eaeffeaaff2b638bde151f87e4a1add5b9ecb19f39a4 ', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 2, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (19, N'48eb799152caece41a348eff631e3a876573f9debdbedaf6abab6c760138bc8740b4766aef4928a744f45fa670b9f96c8ad7c9610aa51ea6243cf209444613bc', N'5ada72b88b21ed7208ad6ddf286e78f13543cf972ddecf5b30126489ffce1c156ffebd001bfc6b058236012f8c77e77b2e39ae4943eff325bac2a0c6e137a155', 2, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (20, N'ec88f82cfddaddf3d5eb788e3d3c6303d513b81c1680728dcfb19595af77e6697d637b7b5b80e5433cc23184769aa3c2bfeeb0c6cf44ff986feac3f33275b2d4', N'b0a580d0a771aeb22f9cbd769424ec5aa65e5da84cdba15f748d5a55c3abad7402b7659ee375e1ba5399a01fc00a3a9ee4290e6e14bd7a219e346955d0a3b5c9', 2, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (21, N'c1aeec5bfd7f2f726082b320639f54f1469dd8cc9560c4bb5ef60539a674c7560a36776db4181fc6feaac8cab83043309061ff1ffd5a7f349a01e06880b34b1d', N'0502465643ddebe08c6b543691eaa3578440d2ca7d80bdbd9fdcb697617b963c8cd04dcf4fa571f437d40273ccacd75459f31302a18e9a894d278efbdc114f35', 2, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (22, N'36b4ff977101d2430f851b3184436ca1aacb20bb0bdf7fa548e2fbc8c4bc6d9f8ce84276828678ad9eb36a9a9376682da6234ef07295df7ee8c900eb2eedb6f3', N'1cf158e41e21e2d588de014841d8795ef816e2882f81776b737b3cd454fe3eb7f3f68ad14aedfbdc9ef20557331d8fbd176a8b7d38fdaf57718d388c5d5ff032', 2, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (23, N'aa5519467fe6bcc7c793b39d375e70e3caa86924f7273d709c64d3617be3020034b1b843c777965fb81219519a2131a0f2529206aad9c780e0f018e389e18809', N'24ed20332685053ed6eb1aa2b35a5c762919f312e9240de397ec7b7b2ffc291e07798cd9cae220028c184fe750df52a4abe68aa1ea5ec06010f2991a087ea701', 2, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (24, N'1f4cd244cf44057c4a5792443c1e41d3f0862574cc8ccda5f2019e64045632a147343a39a48b517070d1f446e0c508e432d4ee2f61260ab8625d341e0b747147', N'57a8891c78aaf0dad2816d1bf78a237571a2a807dd75ef85ff3f22558a1c4442b9f839299898d8e2e6129281b650ac114050a40023216804360d952f09f1a599', 2, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (25, N'3395a31fab673274da401aaddd4bbf06cae97a920ea5ab30b48ac55305f15d2bcf8ba7ab227f11b02d5a87852b57d866767771882444b573d752ecab901a01b9', N'2088848254f20c62d948e31c2d51f99364a35758d0cfd16c0d6454dd515b6e1aa1292a9f8d10cd2378e52af84ae9f62d2b7615e75cfda57210f927daeddd6a97', 2, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (26, N'51bcc7186851358045040876f31aeb1b0a4d35786c59cbb4c823191f03e067c4210c150b6f8ba20e60f9a20a068b1abd3718f519eaf8c7a0fd1749d7a3acc314', N'03e42545df72242613d0fcaa8babf4bc16d616bef56c19257e817d3772a4743bfb8c174f7a666ff963e2193fffdebb5553c0045baac01c7e1eec38ab6483d5ec', 2, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (27, N'e493355e274ccfdb7582a7398e4835879eb72367344e4071d9daefe2f47a203d606e405d3e336203d4c4246e9f900ef684dba876e40e009444159d0fa9b097f5', N'88bad8742c8a609dd53763fb849aa5491b6e4412a34ce298dfbe402be902db7280cc788f56e1c03884eb412df81a9fa98752320c9201a27c2af019b1fbd01d1b', 2, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (28, N'42208ac65cf8cd7d6d58a0cedc660504d953aed2ded6599d7facdc3c4897df59bae876b27b3aa24d9bcf9bfcf6743f1747cb1dad9f64493e6b875dc039b44abd', N'fc5ba503db3420582602a10e949badb8a28b4642066775d23112ed71b647ad9f32f0afdf600e133fd94ac9aadbb9316b64fc76a7ac19e6b5d7f7d0e1f974156f', 2, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (29, N'e2d14525e0c5ef3d4cf12cd7e694f0aa15d81b5abb0905ba6535a02d46945c01f4ed31927444cfde5bfa50c21e6154686ba5fb7a4933f1a31e5d4a39b3678f0c', N'60bebe906c27c2a4c74f616e2cef7446a3532f1dcb621e45b3c553fdef411faa7134322e2707a641e8a5e9e84337f7baf8caedbcc043aae832422fcbfaf9250d', 2, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (30, N'dfacba6033db4c78344cae8d7fa2665a6f3dd73e14e19eadd5210117ff27d5bc092f66d77df70e60ef4b786b4c0ae0e1055c1f58124a97507c7818d86270ab1a', N'eaa447714cafdd3ce9603c27a143b075c12ae8603caf71d4ca30c5cd7b692c554af54b133d8694541d383efd5036756666cfdc7bdbf285444ab9adc5df45c464', 3, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (31, N'c6fff776e35d1a3c7b75d9ab5a4e5d2294b8baaca052ff4ba625ee6a7c6296609884c2510659446d4b367725b8e5c5a9a7b666aeaaeede6069a2d2eda5546f7a', N'3c717ec57ea274b0dd2efefe83115942e39f561de96d7e8333572723d617d32b848c3b390de7b744db54e47ba308ee037ba490c587cc10f7e399ff153e30126e', 3, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (32, N'a52832058032f689511f9c29f9873149e0a71538ab380696ec281e8ecd8097988af340b25db594f23cdef5e7a55ffb663bfc0ed2c933a0f159e49c23867e543e', N'88bad8742c8a609dd53763fb849aa5491b6e4412a34ce298dfbe402be902db7280cc788f56e1c03884eb412df81a9fa98752320c9201a27c2af019b1fbd01d1b', 3, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (33, N'ca844766d153db62ed4bdd02799f01d6aefed782733a5fd796bcc7a5133bc9db7056e30060922bf8d4951a6476aba832664162798391acdc8f49d8318f15d54d', N'88bad8742c8a609dd53763fb849aa5491b6e4412a34ce298dfbe402be902db7280cc788f56e1c03884eb412df81a9fa98752320c9201a27c2af019b1fbd01d1b', 3, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (34, N'c22d8ea0ddf33205fdda3178b69bcb9f298cee38fbdf60eab56c1ea47022ef03130ed4bf6ccdd75bebbb4b7a647e7fbac32c4f166f750c262300e9670d2012c3', N'93a84f72bb7a90dee81c85ac2ab2b3bd7ec466e1e15aaf46623e2fc345bab325deb2878e79456b20acf746521467690b1aefbaf5131c20858de33d6ead834d6f', 3, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (35, N'fe4325e6b193710bc5d451be7d1eaf4d18f4b50fd09a450506705eec5388f95ca5ba10974cebc74810156e9b5b3c24dd9d2cd179e87f95c86e16df73fee88131', N'6f96fc5e3882b6d762ed66495d0cae64c521a9be47f3eb6e2a0f16f1e4587a732ecb36aa7d2fa71b232e9f8b13f71fcc4660c664f53e86d36dd0c1d532758b1c', 3, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (36, N'eb9a64a4909f27e924917a553810c65000a818919cdef9267f773534dfbef1d261e01fdceb47cd79059afb53fe0f5b781bcc6a4790f25ce9dd694838ccff4fba', N'2088848254f20c62d948e31c2d51f99364a35758d0cfd16c0d6454dd515b6e1aa1292a9f8d10cd2378e52af84ae9f62d2b7615e75cfda57210f927daeddd6a97', 3, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (37, N'a500dffee49c24dc908486eec866f052a9e53547a43678e33aafdda130a13e8f73403c9b55d522c6a5e548556dbb07f34835cfce7760e9e7a2e89dc30c41d5e4', N'94d64f6b175186299fec73427aa85f1a1ae379328e0953fab60927b2d2ecbe8b6e155f694495e37d0078169fdbb632d668f4f76bd6bc631b5e2d8b0b7930d47e', 3, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (38, N'a1def08415403c71fef24a26b24fb095ac91f500976a27053a3da9b0aabdd18e46f9ecc7dc088752fe6bcb00ba9452d76536a38861b2f06105b96280ee25a9af ', N'88bad8742c8a609dd53763fb849aa5491b6e4412a34ce298dfbe402be902db7280cc788f56e1c03884eb412df81a9fa98752320c9201a27c2af019b1fbd01d1b', 3, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (39, N'bc30f5dec9f462b749c1efc4bba2ee9a12da1c16d9d231f6500bd4388f62064db365c7b06ae5c2966793c62ba8d8242e4bb0878c5ac43813ab90b31d18c3e1b5', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 3, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (40, N'b587b45c36752c61e8205195ea1cd9df6b23ee386be7c355864496a8f1808b26901cc7efd9a01005226ff31a14a37dd5868d5ca320342edd0706988f66c03931', N'd41e812b916827f512bf39dafa71587dcc453ac3d4261b1d4647e22ce1e7faa02129299836c01d2e66cb520384652b78ff788fa714bee31d87d549437de2e966', 3, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (41, N'4c95ebd9d46a74f71aca87cbb4e73b925b0583e11138d00dbf128fbbbb0c7bfc7f33b8fe46600f92790eb588812a0086323644776498376f4378564f00accef2', N'5ada72b88b21ed7208ad6ddf286e78f13543cf972ddecf5b30126489ffce1c156ffebd001bfc6b058236012f8c77e77b2e39ae4943eff325bac2a0c6e137a155', 3, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (42, N'1f4a20ff97e926fe1c9ee25adb787671e1eb849ce2484a8d13a39eb5f25920d1577a561f87bc2c1826d7e87949ddb84aa18814f5f2193108062c14fefb6dd849', N'd41e812b916827f512bf39dafa71587dcc453ac3d4261b1d4647e22ce1e7faa02129299836c01d2e66cb520384652b78ff788fa714bee31d87d549437de2e966', 3, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (43, N'3043685423ca63730e2fb44813df856d99fb4ce8861723cd927b9addfc8c335341209886223bee3f900ff7de44d794ec694511c3ac8c836c5e4a2e4332d84572', N'57a8891c78aaf0dad2816d1bf78a237571a2a807dd75ef85ff3f22558a1c4442b9f839299898d8e2e6129281b650ac114050a40023216804360d952f09f1a599', 4, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (44, N'faacc54c67be5e5e9d243dd5c091008026e8b8bed45427dc6891a745229031d8e1349bbbedeb57d4f5f709f08c9a0353c75b095d66e4048b136148667780f24d', N'2088848254f20c62d948e31c2d51f99364a35758d0cfd16c0d6454dd515b6e1aa1292a9f8d10cd2378e52af84ae9f62d2b7615e75cfda57210f927daeddd6a97', 4, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (45, N'97ef78cd38d92a34f0badf2b06c37eed9f5473ec34b7c401447b6ef0fd23f498e18ad58a207775d72fb546332868d1a2c5b6214f7ec403e1d04c32428c477ad4', N'fc5ba503db3420582602a10e949badb8a28b4642066775d23112ed71b647ad9f32f0afdf600e133fd94ac9aadbb9316b64fc76a7ac19e6b5d7f7d0e1f974156f', 4, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (46, N'efe129c58bb9697c70b7f1962fa1631568931bf37f7e672b929fe768d8003587d5f5b984cc435ee35100b0ee6fd4a7705af3908122484eef41d909fbf776dd74 ', N'2088848254f20c62d948e31c2d51f99364a35758d0cfd16c0d6454dd515b6e1aa1292a9f8d10cd2378e52af84ae9f62d2b7615e75cfda57210f927daeddd6a97', 4, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (47, N'06094729d1a0d3962fbedbf0af3405e518d6073aade5f705479414da115d811753622c584ab622e2fedb00d1cd490b72337a72c0f7c55989323f8b710157ecdd', N'1030d1db42cc2f2520c393e9fd5e8db6a2f7513ff35326d78a1fb7627725dc6b71d9c40c89810cdb81f5476f13a9c6c71f856f1d13d55a3c7d3558d3e53e5090', 4, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (48, N'd94982ebb037a5586d9dc8442e6dacda0f67964b08fc109e4fb6121f8ef7f1cf0fea8a07b8e9de2811d374d6286396c598e801a224cd689a27b0f802a7b21cae', N'60bebe906c27c2a4c74f616e2cef7446a3532f1dcb621e45b3c553fdef411faa7134322e2707a641e8a5e9e84337f7baf8caedbcc043aae832422fcbfaf9250d', 4, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (49, N'30af4bc338182a52b063ddbc997962a196f3af0b3c809aef38e691b9254e7c86dd4fee39d60195e133e98b923d49d29a65f47a0a5a78b09c07036a5272c7b6c3', N'aca1229a264be1288e80c90d7ffd24ed706f0bc0857a17210b97599ba8b8e1d0ed1eeb40f3e4fd84930e7deb8c701d0f6d7fc8dccc27523153ec96f5f3f5b6a6', 4, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (50, N'467c641c1efd0ad3b63ffe753459e035b6f2b48ca28d9e1c8504cfe8c4caf798475246186e2d4fc3ed7d075b7f657afc57c2f3f7784122561b58403d5e277490', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 4, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (51, N'883a93b39f1e9aa915bf6ce723bf2dc515adbadb5f2cd2a84c6515be7106e5852ad6f0219eb2e4feec39423afa42ba9cd09c97100ebe3b9de2bdb65c6002fa67', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 4, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (52, N'73d2cf3ff24b1468d766abb1bd81241b67613616fcdb5c5ece4208a19f32d5d1022f09da2e391c699e287ee9ef5c2fddfe950e1ce99c2df6798037cdce3e2d0b', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 4, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (53, N'5896968c54ea0677246de9c7182819c48dade3eba59c922ae29fea43a90ceb0b11b043bee02cd1a2eff0e62d9647eb3849753968f031f45642a4e45a9c8a218e', N'b0a580d0a771aeb22f9cbd769424ec5aa65e5da84cdba15f748d5a55c3abad7402b7659ee375e1ba5399a01fc00a3a9ee4290e6e14bd7a219e346955d0a3b5c9', 4, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (54, N'2aeee4b047a7eaf400324d87f259a97805940dd3a529f325bd8805244b702bfbadeecf81eded59c76183c63d9fce5765c5320f43e7cf6b6348d8c030657d1d10', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 4, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (55, N'9ae0a3cdd1fa952b18fdcb91f46a87137cec256511e5a8e15f8177b2f8525b3c4ffec9ac5d75429993566a9f8ff4e70e53c5a229cd827df4660544c962bd12e6', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 5, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (56, N'f6a963891e227014565fd07d96db62917a99097909ba9a7ce0d289c1fac7db32b61a3666a3080e558202ed799da6ff2e54e47de417528c39b36e4d14092b266c', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 5, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (57, N'92ee5a489d2252a4b1b0ec13ebc63e39774782378027519838bd5ccb8f7b1a1ef0628ab64b9f2e8554812767bb3127472002e43e14e3f647389a1402fe96e337', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 5, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (58, N'bf566ec066b72a87b086904ed2e13d88a98037b0aff7089fce7d4a2882f0daff82b9a1e40c960633e4891eadf739512eeb8b5f872386947105b8daffa7856fcd', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 5, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (59, N'470f6635ad6c32e52fd02f2d7c30c8b908917f3b53c8ceebca128bdb1c9d9948c1937c69093583ca6e1e6da8ec4024f07bef0e2b9fcbbca63c84b3bc715156bc ', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 5, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (60, N'4864e6de3871d126bc463444f986ef1e37c1b519612e56b4d8667b8136e35b2c491ec2d42371a6608a72eee83011da8788be0bd0671e1d5be2245bb33d1a4478 ', N'a458a58e357006feb54c3ba63eaff8be3cd43341d0a50c00ad953a76b87313845427001f508bb684db5e8005eebf04eef244fa529a4895079f61934ac1fb557a', 5, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (61, N'457279a5a3a68ea23ceb357a45df0db85f2819cdac157abb7527d6749357d5559dfe8c14c0cbd1dac044392d1bc0b2dd2c5b330d37c37a14c98f6da7f77314f7', N'b0a580d0a771aeb22f9cbd769424ec5aa65e5da84cdba15f748d5a55c3abad7402b7659ee375e1ba5399a01fc00a3a9ee4290e6e14bd7a219e346955d0a3b5c9', 5, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (62, N'dd5c3eb91594c0153e07cc5da4798da8252b525456cee005f930b0b65f4a6e3dbc799ca46c18d0ffe8b9f095cd8555f66f7a65a1f62a6953171c30062e000ef1', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 5, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (63, N'65416d4d2a0c48b38991437f69f8868b95a8ca7ebc75058199435faa45f2d4481575adc1dbf2688a32cfff233023c013e4fd1a5ca90d1ed8b7e44a31966ed60c', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 5, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (64, N'ed448a4d7a62ea3da293c034fb27d53626916ecc4d2f7ef37da95d2aea1dacfc3cedca8b50fbb2d11ae3903f7299b364300e7e28248ae2bb40330722e7f6c311', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 5, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (65, N'01e0ce8341e300f685b876c4694b6699966d4603d94e9e0eb4710d42322a0a852697014dd5433c0676ba9bad1ffb876052850561b62ad5d4cc4ee1d01f3cc473', N'03e42545df72242613d0fcaa8babf4bc16d616bef56c19257e817d3772a4743bfb8c174f7a666ff963e2193fffdebb5553c0045baac01c7e1eec38ab6483d5ec', 5, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (66, N'a018c1ef8e0a975f1ee76dc41b18d3e055b5dadb6089ec21646333948628054ed1b1edd9e9dd00a7ed20cc328bc92f1ebcda792dc98c11af58084671bcc37432', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 6, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (67, N'50ed8b9062693a1e7d9c88b5657b8b1b62886342e251899ed56d5bc260f34af571e19208b51f8711a7c340c0a8e67828795d4fc986202109f927b48abff1d61c', N'b0a580d0a771aeb22f9cbd769424ec5aa65e5da84cdba15f748d5a55c3abad7402b7659ee375e1ba5399a01fc00a3a9ee4290e6e14bd7a219e346955d0a3b5c9', 6, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (68, N'8fc040e39c83bfb0c7817e4719687e3873e0c46dd2ccd3b2c351d825297278185890d4ab77cb94507b259d76e73e1892b0ba27b2ef318e789e6115d3536ced99', N'03e42545df72242613d0fcaa8babf4bc16d616bef56c19257e817d3772a4743bfb8c174f7a666ff963e2193fffdebb5553c0045baac01c7e1eec38ab6483d5ec', 6, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (69, N'c1db71dbf0fcd86b48ba4a4c241c75e50bd780245f9ca8b8144d2bce5faf5c3381393e93db2a80178f1539e862d04814f65e81dd7e64b473ccf8b07a93c6e58e', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 6, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (70, N'ca34b23a321a8f3382f98efeba5f04acd745224aa2f337ac1a14fec9877f8aa20954490132a51f2d595bac99af13525d74decf0ab2db1e024bf7751c1b91b512', N'a458a58e357006feb54c3ba63eaff8be3cd43341d0a50c00ad953a76b87313845427001f508bb684db5e8005eebf04eef244fa529a4895079f61934ac1fb557a', 6, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (71, N'fe0da069d39144c87879c57c7f7df92fa7b5f9aec472109c8e8c823d81f381a37e15342448137af367dfb30ba83abf6958ba3d2cd1634b6e7cd724658ac5076f ', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 6, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (72, N'030e94408489d74fe639d12de5539546d9c9f2945ef80b6f1856c2926de014ae94199292f0f31048b47f923e6c85162448c699f116e797f541291872d01e8d90', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 6, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (73, N'6cde522dba12528d2de2b46088341ef445d57bed7fb83bb20922c6918e5aadfb68920576bc8d27b771be70d58d0c024b711b3e6a55fc0d38d95d5cff9a91efb8', N'5ada72b88b21ed7208ad6ddf286e78f13543cf972ddecf5b30126489ffce1c156ffebd001bfc6b058236012f8c77e77b2e39ae4943eff325bac2a0c6e137a155', 6, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (74, N'eeabe5636b953ae94ec88d576165cb6ec45cf3a123fb85658445327d0dae108efcfa8daa90e0aacbdec0a3b4a710c22dac00d0db87d2e8fc706dbe199bb95a9a', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 6, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (75, N'f1b55048f19d88c99599a7e0ecc28c53cff4f6bad29dfee2d9cacced8769361190f624b6dbae015cf5c10418abf02953648e205e8b19b52164880d6c989de7b6', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 6, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (76, N'550d9309895df3209385ddb10fa9de82373d9b0b939afb2c5c2cd4f22469d13f9ba7b78f781e118979f73bb9d5902ed4f69652727808d47f5f2a5338b639bc56', N'03e42545df72242613d0fcaa8babf4bc16d616bef56c19257e817d3772a4743bfb8c174f7a666ff963e2193fffdebb5553c0045baac01c7e1eec38ab6483d5ec', 6, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (77, N'dde8fcffc0fc19ea7a2294dd6b747dba67d110283a6d5a91135ea4642120f619f65e636565e489fdb87aa3e086965437d4f235d2f49345eee4580c74fa3fcb6c', N'03e42545df72242613d0fcaa8babf4bc16d616bef56c19257e817d3772a4743bfb8c174f7a666ff963e2193fffdebb5553c0045baac01c7e1eec38ab6483d5ec', 6, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (78, N'84fbcfa94bbf493468418d614ceaebf0564f31326af6d49ec1316c082abc5e8344a7efd66177eec6e4a334f1509d0d41825f9180f0961bef592424c737ede78a', N'b0a580d0a771aeb22f9cbd769424ec5aa65e5da84cdba15f748d5a55c3abad7402b7659ee375e1ba5399a01fc00a3a9ee4290e6e14bd7a219e346955d0a3b5c9', 6, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (79, N'281c06cb47f9684b18cfa8c5bdc4e4287096f16b64d3667b753f92e306aecaf95594b93c122d3a5230ba2ffc7c5bef3f6e321940e5ac32f97f646c3becb8510a', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 6, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (80, N'f2b15c4496455035407e3415d805c1d453130c3f364c8c2cb2f5d01d4475eb1b2259e3357116bb864ce163c770a7951bc2fa1f3e7a7abf9ec335e9af063757d0', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 6, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (81, N'c1950e81be18e05e327c6fac477b92b97616062b70fc107b9b6987041215f36bf9a2f9267abb894c44d75b2c49b370efdc23127db5432836de54267dd14d8c55', N'5ada72b88b21ed7208ad6ddf286e78f13543cf972ddecf5b30126489ffce1c156ffebd001bfc6b058236012f8c77e77b2e39ae4943eff325bac2a0c6e137a155', 7, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (82, N'f4f770180a6e870ce1bcf8d2154a7b9ac93c445a5a300233ac4a6868054bf9be51c3f2a9536d42044f07a246df5fa5f81715a0dae5581b61b081bfb3da73c567', N'03e42545df72242613d0fcaa8babf4bc16d616bef56c19257e817d3772a4743bfb8c174f7a666ff963e2193fffdebb5553c0045baac01c7e1eec38ab6483d5ec', 7, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (83, N'a718b1cb0eaa73c662caf9563c203226566a55cec46d54071619213c21759c520120b82d5e1ba9a69ec583f412212987a36c7c4304e787084d0b917e2f757b36', N'b0a580d0a771aeb22f9cbd769424ec5aa65e5da84cdba15f748d5a55c3abad7402b7659ee375e1ba5399a01fc00a3a9ee4290e6e14bd7a219e346955d0a3b5c9', 7, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (84, N'18e5b6ffe3b071615ef120a27a199c70ee6fbc8058de15625cbe1b6a49d3e0a4b6b5189c69413f305bc9c68a41cf3115bfe188f7fad796961390ed4406be6b76', N'a458a58e357006feb54c3ba63eaff8be3cd43341d0a50c00ad953a76b87313845427001f508bb684db5e8005eebf04eef244fa529a4895079f61934ac1fb557a', 7, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (85, N'2ab0c49da1cbe9c47d1882984d3fb5247653dc538e73057a9b0c73f911aae28bab10ee165adf163f51c0a47d4b3fcbcedb70486359be06c6ac4c3ce3fb5cfb13 ', N'3c717ec57ea274b0dd2efefe83115942e39f561de96d7e8333572723d617d32b848c3b390de7b744db54e47ba308ee037ba490c587cc10f7e399ff153e30126e', 7, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (86, N'65eddda79fd6b680fdd30833b18eb1242fcd2d6d5ebb158b07affac56b5e7becf3134ee566690e9d38ddf7f374bfa811c031b815c1ca7e9619499d276300d525', N'6f54462cd512b9cd97c7aff1161eca6ebcc43e65edef132374df6d6a441fcf242a2db4546aa6347b6e9572194312ea1d8021f217e6819de96d64c6c0199fae24', 7, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (87, N'650248eb64613c7ffc27bbf3a6c755bb0b844d808b046830359128e703e1c2a2839355541753a17f2b095c9268230b107c2be02ff1a658408034b5687176a6d4', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 7, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (88, N'4d06251eb8af84f1d272845e39eb5900dc96b7aa3ed71d3fbfbdef1f83ba1a1620b51bce68e795fd88cacaf5acbf5779fb18586076c9b1328ccc225b71ecd7b9', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 7, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (89, N'dfd0a81e38eb70ee0ba83a114a8bd5e352e19e3442db6e4099a5ebfef1c93217594917712e355b67853a3a5e6dacf8e76a51c418662bffa9619448e106e5caea', N'3c717ec57ea274b0dd2efefe83115942e39f561de96d7e8333572723d617d32b848c3b390de7b744db54e47ba308ee037ba490c587cc10f7e399ff153e30126e', 7, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (90, N'60faff51f31da33efe132e0d509ce89bea77b347a167f0a3de384805dca26eec5f725fd69240932c1a8bb63550a058045a61e45fd44e51832ed51ab8cf924bc5', N'6f54462cd512b9cd97c7aff1161eca6ebcc43e65edef132374df6d6a441fcf242a2db4546aa6347b6e9572194312ea1d8021f217e6819de96d64c6c0199fae24', 7, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (91, N'ba3d4e8c810f4c2a6330d70c7fa38ca9880aea6b57ded6a8d35ba813b28a2adaa53777856b95b2cf5f8ae881772f6dc42bf2589edb262bf367e4e63af56ce9f8', N'03e42545df72242613d0fcaa8babf4bc16d616bef56c19257e817d3772a4743bfb8c174f7a666ff963e2193fffdebb5553c0045baac01c7e1eec38ab6483d5ec', 8, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (92, N'77a0805a42c31df17c243517ce0cf0f8674e0f6c0c7e876ad738df20ab890c5024e4386c153269a3397f5fc8d0f8509a6eca7ec3c8f4ed30c6c229ac73cd7958', N'a458a58e357006feb54c3ba63eaff8be3cd43341d0a50c00ad953a76b87313845427001f508bb684db5e8005eebf04eef244fa529a4895079f61934ac1fb557a', 8, N'E801322D3CFBAAFE50FFAEC73BC3BB904EEB7CFF9DF1A59AF263ED3BFCBD68BFF89FAF44E91BD4BC73F7D34BCD37C6816A20F1A69B8901EE42392C74AEEE15EA')
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (93, N'c88cde97c81eb05493c8d74254bde70e6a2b32f126268efdaa43ecf8550de79e55afc6e00fa8141549a0eb3782519a78a1d6b552498beaba9390135ac8b5e0f6', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 8, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (94, N'977f5fdec8cd3f8aedf29b873acb600eaa801deddfe8191c3647d84792364ea1c32e4217e0c9fd158224ca9517da3da45208050b8f217d54def49822ef1bb856', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 8, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (95, N'0924d97a3da63fa2737bb9addf8d1c83b9851ca5291bde1b991e5213ac8cd508a52008e57901bd801a5d20d94bddc6b40cd233064f2e8c407f46a23f8d320279', N'5ada72b88b21ed7208ad6ddf286e78f13543cf972ddecf5b30126489ffce1c156ffebd001bfc6b058236012f8c77e77b2e39ae4943eff325bac2a0c6e137a155', 8, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (96, N'68447f36a953b7313941cff157543cb08362a6a1fdee1f604f8e14dda3514a7a0eb7b5b09bfac7c8cb935514a264b1074a3d1005b46315299a60a1a61266ff82', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 8, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (97, N'fc47fb6eb6d810b60d5cf26e90a499eea660967d1a39e02a87a63ef3892a9bc5c4844d62a09029b93e23901007490b3689cfa4420a09d49e2b596330ddf22ca1', N'3c717ec57ea274b0dd2efefe83115942e39f561de96d7e8333572723d617d32b848c3b390de7b744db54e47ba308ee037ba490c587cc10f7e399ff153e30126e', 8, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (98, N'0c4f5d76640b977e39b76630a269ab517e21a6c29a100d431911f0f397a27b4a596990162aad7040bccdb47aa1f9e461702cc265c22a56ba3116b31a4219532a', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 8, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (99, N'64028eb0440680f8d97fd676bfbec6545dde9faf0f047dd109a19fd41f86a7d6d24ad51412179c578ef8492ac5d2a1a29a2fd34fd3e629c8ab144f5076c4e178 ', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 8, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (100, N'7f81179f8ccc98a1918818bd68d1853541382c07e41f86c1dc3377087ff2fde284e4cb41f1c559add33722353a6c67ff0d9a69b8d724169959683ca720b6b4d3', N'b0a580d0a771aeb22f9cbd769424ec5aa65e5da84cdba15f748d5a55c3abad7402b7659ee375e1ba5399a01fc00a3a9ee4290e6e14bd7a219e346955d0a3b5c9', 8, NULL)
GO
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (101, N'cb6b75b2286cd894ff2e3930c35ad2e75728cf9ef51911ad392be5e065b8f6b69731d10831f1decdf73ea75ba42744bc45771df40de3fd2de45a39401e2bb4f6', N'b1bac2ad7133918539025805709c471900490494981e5cfd766eeb9ec03d3730edb000eb1aa47286d12b4d59ca62a6fcb9f2d3b9f27f915e8b1502af98465628', 8, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (102, N'df2e39479d125a5111c73f0c44f9eb2b41987939860b50499ff6ba09b1ee873e4249e8c724666a323791237a3cdaf2d774e34b6f526c63fe34db43364ab15564', N'a458a58e357006feb54c3ba63eaff8be3cd43341d0a50c00ad953a76b87313845427001f508bb684db5e8005eebf04eef244fa529a4895079f61934ac1fb557a', 8, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (103, N'7bbd2151e1e2bcb7953108198a7449be7ba12354e45109161a84918fd623dd35b8d86cfbec3f79b74fe5bf11df737cf5de4545c3e3a30726e1e620dec672a906', N'5ada72b88b21ed7208ad6ddf286e78f13543cf972ddecf5b30126489ffce1c156ffebd001bfc6b058236012f8c77e77b2e39ae4943eff325bac2a0c6e137a155', 8, NULL)
INSERT [dbo].[Padron] ([id_padron], [cedula_hash], [pin_hash], [provincia], [link]) VALUES (104, NULL, NULL, NULL, N'E801322D3CFBAAFE50FFAEC73BC3BB904EEB7CFF9DF1A59AF263ED3BFCBD68BFF89FAF44E91BD4BC73F7D34BCD37C6816A20F1A69B8901EE42392C74AEEE15EA')
SET IDENTITY_INSERT [dbo].[Padron] OFF
GO
INSERT [dbo].[provincia] ([id_provincia], [nombre]) VALUES (1, N'Bocas del Toro')
INSERT [dbo].[provincia] ([id_provincia], [nombre]) VALUES (2, N'Coclé')
INSERT [dbo].[provincia] ([id_provincia], [nombre]) VALUES (3, N'Colón')
INSERT [dbo].[provincia] ([id_provincia], [nombre]) VALUES (4, N'Chiriquí')
INSERT [dbo].[provincia] ([id_provincia], [nombre]) VALUES (5, N'Darién')
INSERT [dbo].[provincia] ([id_provincia], [nombre]) VALUES (6, N'Herrera')
INSERT [dbo].[provincia] ([id_provincia], [nombre]) VALUES (7, N'Los Santos')
INSERT [dbo].[provincia] ([id_provincia], [nombre]) VALUES (8, N'Panamá')
INSERT [dbo].[provincia] ([id_provincia], [nombre]) VALUES (9, N'Veraguas')
GO
ALTER TABLE [dbo].[Padron]  WITH CHECK ADD FOREIGN KEY([provincia])
REFERENCES [dbo].[provincia] ([id_provincia])
GO
/****** Object:  StoredProcedure [dbo].[Autenticacion]    Script Date: 27/11/2024 02:31:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[Autenticacion] (@cedula NVARCHAR(255), @pin NVARCHAR(255))
AS 
BEGIN
    IF EXISTS (SELECT * FROM Padron WHERE cedula_hash = @cedula AND pin_hash = @pin AND link IS NULL )
        SELECT 1
    ELSE
        SELECT 0  
END
GO
/****** Object:  StoredProcedure [dbo].[InsertVarcharValue]    Script Date: 27/11/2024 02:31:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertVarcharValue]
    @cedula_hash NVARCHAR(255),          -- Primary key or identifier column
    @link NVARCHAR(255) -- Example column 1
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        UPDATE Padron
        SET 
            link = @link
        WHERE 
            cedula_hash = @cedula_hash;

        -- Commit transaction if successful
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Rollback transaction if an error occurs
        ROLLBACK TRANSACTION;

        -- Optionally, return the error message
        PRINT 'Error: ' + ERROR_MESSAGE();
    END CATCH

END;



GO
USE [master]
GO
ALTER DATABASE [PadronElectoral] SET  READ_WRITE 
GO
