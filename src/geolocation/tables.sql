USE [DBTeste]
GO



GO
/****** Object:  Table [dbo].[TBSBT_Emissoras_Localizacao]    Script Date: 04/02/2019 11:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBSBT_Emissoras_Localizacao](
	[inCD_Codigo] [int] IDENTITY(1,1) NOT NULL,
	[vcND_Regional] [varchar](100) NOT NULL,
	[vcND_UF] [char](2) NOT NULL,
	[vcND_Cidade] [varchar](250) NOT NULL,
	[inNR_Latitude] [decimal](18, 8) NOT NULL,
	[inNR_Longitude] [decimal](18, 8) NOT NULL,
 CONSTRAINT [PK_TBSBT_Emissoras_Localizacao] PRIMARY KEY CLUSTERED 
(
	[inCD_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IX_TBSBT_Emissoras_Localizacao_inNR_Latitude]    Script Date: 04/02/2019 11:47:23 ******/
CREATE NONCLUSTERED INDEX [IX_TBSBT_Emissoras_Localizacao_inNR_Latitude] ON [dbo].[TBSBT_Emissoras_Localizacao]
(
	[inNR_Latitude] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TBSBT_Emissoras_Localizacao_inNR_Longitude]    Script Date: 04/02/2019 11:47:23 ******/
CREATE NONCLUSTERED INDEX [IX_TBSBT_Emissoras_Localizacao_inNR_Longitude] ON [dbo].[TBSBT_Emissoras_Localizacao]
(
	[inNR_Longitude] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TBSBT_Emissoras_Localizacao] ADD  CONSTRAINT [DF__TBSBT_Emi__vcND___53D770D6]  DEFAULT ('') FOR [vcND_Regional]
GO
