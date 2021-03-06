CREATE DATABASE [military_base]
 CONTAINMENT = NONE
GO
ALTER DATABASE [military_base] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [military_base].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [military_base] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [military_base] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [military_base] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [military_base] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [military_base] SET ARITHABORT OFF 
GO
ALTER DATABASE [military_base] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [military_base] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [military_base] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [military_base] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [military_base] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [military_base] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [military_base] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [military_base] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [military_base] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [military_base] SET  DISABLE_BROKER 
GO
ALTER DATABASE [military_base] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [military_base] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [military_base] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [military_base] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [military_base] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [military_base] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [military_base] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [military_base] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [military_base] SET  MULTI_USER 
GO
ALTER DATABASE [military_base] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [military_base] SET DB_CHAINING OFF 
GO
ALTER DATABASE [military_base] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [military_base] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [military_base] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [military_base] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [military_base] SET QUERY_STORE = OFF
GO
USE [military_base]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 24.06.2021 16:33:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[id_product] [int] NOT NULL,
	[name_item] [nchar](30) NOT NULL,
	[amount_item] [int] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 24.06.2021 16:33:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[item_id] [int] NOT NULL,
	[name_shipper] [nchar](30) NOT NULL,
	[name_storehouse] [nchar](30) NOT NULL,
	[date_sending] [date] NOT NULL,
 CONSTRAINT [PK_Shipment] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 24.06.2021 16:33:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[name_company] [nchar](30) NOT NULL,
	[name_shipper] [nchar](30) NOT NULL,
	[phone_number] [nchar](30) NOT NULL,
	[date_shipping] [date] NOT NULL,
	[item_id] [int] NOT NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 24.06.2021 16:33:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Shippers.name_company, dbo.Shippers.item_id, dbo.Shippers.name_shipper, dbo.Shippers.date_shipping, dbo.Items.name_item, dbo.Items.amount_item
FROM            dbo.Items INNER JOIN
                         dbo.Shipment ON dbo.Items.id_product = dbo.Shipment.item_id INNER JOIN
                         dbo.Shippers ON dbo.Items.id_product = dbo.Shippers.item_id
GO
INSERT [dbo].[Items] ([id_product], [name_item], [amount_item]) VALUES (2, N'КР-Росрезерв                  ', 100)
INSERT [dbo].[Items] ([id_product], [name_item], [amount_item]) VALUES (5, N'Счетчик Гейгера ДП-12         ', 15)
INSERT [dbo].[Items] ([id_product], [name_item], [amount_item]) VALUES (8, N'Спасательный круг КС-01       ', 50)
INSERT [dbo].[Items] ([id_product], [name_item], [amount_item]) VALUES (9, N'Усиленный паек (ИРП-У)
      ', 200)
INSERT [dbo].[Items] ([id_product], [name_item], [amount_item]) VALUES (10, N'Коромовые флаги "ВМФ"         ', 120)
INSERT [dbo].[Items] ([id_product], [name_item], [amount_item]) VALUES (11, N'Веревка плетеная "ТЛ"         ', 300)
INSERT [dbo].[Items] ([id_product], [name_item], [amount_item]) VALUES (13, N'Компоненты РЛС                ', 3)
GO
INSERT [dbo].[Shipment] ([item_id], [name_shipper], [name_storehouse], [date_sending]) VALUES (2, N'Сергей Иванов Григорьевич     ', N'ВЧ-23478                      ', CAST(N'2021-06-30' AS Date))
INSERT [dbo].[Shipment] ([item_id], [name_shipper], [name_storehouse], [date_sending]) VALUES (5, N'Сергей Иванов Григорьевич     ', N'ВЧ-23478                      ', CAST(N'2021-06-30' AS Date))
INSERT [dbo].[Shipment] ([item_id], [name_shipper], [name_storehouse], [date_sending]) VALUES (8, N'Сергей Иванов Григорьевич     ', N'ВЧ-54312                      ', CAST(N'2021-07-02' AS Date))
INSERT [dbo].[Shipment] ([item_id], [name_shipper], [name_storehouse], [date_sending]) VALUES (10, N'Сергей Иванов Григорьевич     ', N'ВБ-34793                      ', CAST(N'2021-06-24' AS Date))
INSERT [dbo].[Shipment] ([item_id], [name_shipper], [name_storehouse], [date_sending]) VALUES (13, N'Сергей Иванов Григорьевич     ', N'ВБ-12444                      ', CAST(N'2021-06-29' AS Date))
GO
INSERT [dbo].[Shippers] ([name_company], [name_shipper], [phone_number], [date_shipping], [item_id]) VALUES (N'ООО "Ромашка"                 ', N'Виктор Слитов Гилов           ', N'+7(911)200 23 12              ', CAST(N'2021-06-14' AS Date), 2)
INSERT [dbo].[Shippers] ([name_company], [name_shipper], [phone_number], [date_shipping], [item_id]) VALUES (N'ООО "ВРВ"                     ', N'Наталья Сифинова Сергеевна    ', N'+7(934)213 11 99              ', CAST(N'2021-06-22' AS Date), 5)
INSERT [dbo].[Shippers] ([name_company], [name_shipper], [phone_number], [date_shipping], [item_id]) VALUES (N'ООО "Космос"                  ', N'Игорь Рашанов Александрович   ', N'+7(967)123 00 01              ', CAST(N'2021-06-12' AS Date), 8)
INSERT [dbo].[Shippers] ([name_company], [name_shipper], [phone_number], [date_shipping], [item_id]) VALUES (N'ООО "Звезда"                  ', N'Сергей Фирмен Григорьевич     ', N'+7(931)909 08 11              ', CAST(N'2021-06-15' AS Date), 9)
INSERT [dbo].[Shippers] ([name_company], [name_shipper], [phone_number], [date_shipping], [item_id]) VALUES (N'ООО "Пист"                    ', N'Илья Гонеров Александрович    ', N'+7(901)347 01 52              ', CAST(N'2021-06-20' AS Date), 10)
INSERT [dbo].[Shippers] ([name_company], [name_shipper], [phone_number], [date_shipping], [item_id]) VALUES (N'ООО "Росток"                  ', N'Николай Гонеров Александрович ', N'+7(901)347 01 53              ', CAST(N'2021-06-21' AS Date), 11)
INSERT [dbo].[Shippers] ([name_company], [name_shipper], [phone_number], [date_shipping], [item_id]) VALUES (N'ООО "МЗД"                     ', N'Светлана Циркова Ивановна     ', N'+7(909)731 67 22              ', CAST(N'2021-06-01' AS Date), 13)
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD FOREIGN KEY([item_id])
REFERENCES [dbo].[Items] ([id_product])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Shippers]  WITH CHECK ADD  CONSTRAINT [FK_Shippers_Items] FOREIGN KEY([item_id])
REFERENCES [dbo].[Items] ([id_product])
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [FK_Shippers_Items]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Items"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 172
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Shipment"
            Begin Extent = 
               Top = 169
               Left = 246
               Bottom = 332
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Shippers"
            Begin Extent = 
               Top = 0
               Left = 480
               Bottom = 173
               Right = 654
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [military_base] SET  READ_WRITE 
GO
