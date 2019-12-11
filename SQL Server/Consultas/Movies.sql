USE [XXXXXXX]
GO
/****** Object:  Schema [Movies]    Script Date: 11/12/2019 10:30:04 ******/
CREATE SCHEMA [Movies]
GO
/****** Object:  Table [Movies].[Director]    Script Date: 11/12/2019 10:30:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movies].[Director](
	[DirectorID] [varchar](10) NOT NULL,
	[DirectorName] [varchar](30) NOT NULL,
	[DirectoryNationality] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DirectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Movies].[Genre]    Script Date: 11/12/2019 10:30:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movies].[Genre](
	[GenreID] [varchar](10) NOT NULL,
	[GenreType] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Movies].[Movie]    Script Date: 11/12/2019 10:30:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Movies].[Movie](
	[MovieID] [varchar](10) NOT NULL,
	[MovieTitle] [varchar](30) NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[GenereID] [varchar](10) NULL,
	[DirectorID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Movies].[Director] ([DirectorID], [DirectorName], [DirectoryNationality]) VALUES (N'D01', N'Zack Snyder', N'American')
INSERT [Movies].[Director] ([DirectorID], [DirectorName], [DirectoryNationality]) VALUES (N'D02', N'Tim Miller', N'American')
INSERT [Movies].[Director] ([DirectorID], [DirectorName], [DirectoryNationality]) VALUES (N'D03', N'James Wan', N'Australian')
INSERT [Movies].[Director] ([DirectorID], [DirectorName], [DirectoryNationality]) VALUES (N'D04', N'Rajkumar Hirani', N'Indian')
INSERT [Movies].[Director] ([DirectorID], [DirectorName], [DirectoryNationality]) VALUES (N'D05', N'Ridley Scott', N'British')
INSERT [Movies].[Director] ([DirectorID], [DirectorName], [DirectoryNationality]) VALUES (N'D06', N'Todd Phillips', N'American')
INSERT [Movies].[Director] ([DirectorID], [DirectorName], [DirectoryNationality]) VALUES (N'D07', N'Sam Mendes', N'British')
INSERT [Movies].[Director] ([DirectorID], [DirectorName], [DirectoryNationality]) VALUES (N'D08', N'Christopher Nolan', N'British')
INSERT [Movies].[Director] ([DirectorID], [DirectorName], [DirectoryNationality]) VALUES (N'D09', N'Russel Crowe', N'Australian')
INSERT [Movies].[Genre] ([GenreID], [GenreType]) VALUES (N'G01', N'Action')
INSERT [Movies].[Genre] ([GenreID], [GenreType]) VALUES (N'G02', N'Comedy')
INSERT [Movies].[Genre] ([GenreID], [GenreType]) VALUES (N'G03', N'Thriller')
INSERT [Movies].[Genre] ([GenreID], [GenreType]) VALUES (N'G04', N'Drama')
INSERT [Movies].[Genre] ([GenreID], [GenreType]) VALUES (N'G05', N'Crime')
INSERT [Movies].[Genre] ([GenreID], [GenreType]) VALUES (N'G06', N'Cartoon')
INSERT [Movies].[Movie] ([MovieID], [MovieTitle], [ReleaseDate], [GenereID], [DirectorID]) VALUES (N'M01', N'Superman vs Batman', CAST(N'2016-03-25' AS Date), N'G01', N'D01')
INSERT [Movies].[Movie] ([MovieID], [MovieTitle], [ReleaseDate], [GenereID], [DirectorID]) VALUES (N'M02', N'Deadpool', CAST(N'2016-02-12' AS Date), N'G02', N'D02')
INSERT [Movies].[Movie] ([MovieID], [MovieTitle], [ReleaseDate], [GenereID], [DirectorID]) VALUES (N'M03', N'Furious 7', CAST(N'2015-04-03' AS Date), N'G03', N'D03')
INSERT [Movies].[Movie] ([MovieID], [MovieTitle], [ReleaseDate], [GenereID], [DirectorID]) VALUES (N'M04', N'PK', CAST(N'2014-12-19' AS Date), N'G04', N'D04')
INSERT [Movies].[Movie] ([MovieID], [MovieTitle], [ReleaseDate], [GenereID], [DirectorID]) VALUES (N'M05', N'Gladiator', CAST(N'2000-05-05' AS Date), N'G01', N'D05')
INSERT [Movies].[Movie] ([MovieID], [MovieTitle], [ReleaseDate], [GenereID], [DirectorID]) VALUES (N'M06', N'The Hangover', CAST(N'2009-06-05' AS Date), N'G02', N'D06')
INSERT [Movies].[Movie] ([MovieID], [MovieTitle], [ReleaseDate], [GenereID], [DirectorID]) VALUES (N'M07', N'3 Idiots', CAST(N'2009-12-25' AS Date), N'G04', N'D04')
INSERT [Movies].[Movie] ([MovieID], [MovieTitle], [ReleaseDate], [GenereID], [DirectorID]) VALUES (N'M08', N'Spectre', CAST(N'2015-11-06' AS Date), N'G03', N'D07')
INSERT [Movies].[Movie] ([MovieID], [MovieTitle], [ReleaseDate], [GenereID], [DirectorID]) VALUES (N'M09', N'Batman Begins', CAST(N'2005-06-15' AS Date), N'G01', N'D08')
INSERT [Movies].[Movie] ([MovieID], [MovieTitle], [ReleaseDate], [GenereID], [DirectorID]) VALUES (N'M10', N'The Dark Knight', CAST(N'2008-07-18' AS Date), N'G05', N'D08')
ALTER TABLE [Movies].[Movie]  WITH CHECK ADD FOREIGN KEY([DirectorID])
REFERENCES [Movies].[Director] ([DirectorID])
GO
ALTER TABLE [Movies].[Movie]  WITH CHECK ADD FOREIGN KEY([GenereID])
REFERENCES [Movies].[Genre] ([GenreID])
GO
