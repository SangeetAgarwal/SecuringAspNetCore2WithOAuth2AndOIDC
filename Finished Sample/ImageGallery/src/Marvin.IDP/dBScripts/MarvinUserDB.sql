USE [MarvinUserDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 09/20/2018 12:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180715054011_InitialIdentityMarvinDbMigration', N'2.1.1-rtm-30846')
/****** Object:  Table [dbo].[Users]    Script Date: 09/20/2018 12:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[SubjectId] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Users] ([SubjectId], [Username], [Password], [IsActive]) VALUES (N'b7539694-97e7-4dfe-84da-b4256e1ff5c7', N'Claire', N'password', 1)
INSERT [dbo].[Users] ([SubjectId], [Username], [Password], [IsActive]) VALUES (N'd860efca-22d9-47fd-8249-791ba61b07c7', N'Frank', N'password', 1)
/****** Object:  Table [dbo].[UserLogins]    Script Date: 09/20/2018 12:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogins](
	[Id] [nvarchar](50) NOT NULL,
	[SubjectId] [nvarchar](50) NOT NULL,
	[LoginProvider] [nvarchar](250) NOT NULL,
	[ProviderKey] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_UserLogins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Claims]    Script Date: 09/20/2018 12:11:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claims](
	[Id] [nvarchar](50) NOT NULL,
	[SubjectId] [nvarchar](50) NOT NULL,
	[ClaimType] [nvarchar](250) NOT NULL,
	[ClaimValue] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Claims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Claims] ([Id], [SubjectId], [ClaimType], [ClaimValue]) VALUES (N'268217e2-fd01-4f26-8fe1-d7070eff1724', N'b7539694-97e7-4dfe-84da-b4256e1ff5c7', N'address', N'Main Road 1')
INSERT [dbo].[Claims] ([Id], [SubjectId], [ClaimType], [ClaimValue]) VALUES (N'61747d15-3bd5-421a-b842-5fdbcd97d9a3', N'd860efca-22d9-47fd-8249-791ba61b07c7', N'country', N'nl')
INSERT [dbo].[Claims] ([Id], [SubjectId], [ClaimType], [ClaimValue]) VALUES (N'6f1434ae-ff78-4c28-8071-718eb4be92db', N'd860efca-22d9-47fd-8249-791ba61b07c7', N'role', N'FreeUser')
INSERT [dbo].[Claims] ([Id], [SubjectId], [ClaimType], [ClaimValue]) VALUES (N'7283c70a-6ac3-4d72-a64d-431acd54a93a', N'b7539694-97e7-4dfe-84da-b4256e1ff5c7', N'given_name', N'Claire')
INSERT [dbo].[Claims] ([Id], [SubjectId], [ClaimType], [ClaimValue]) VALUES (N'737dbdc9-0faa-4464-89fc-d7e1a9468a67', N'd860efca-22d9-47fd-8249-791ba61b07c7', N'address', N'Main Street 1')
INSERT [dbo].[Claims] ([Id], [SubjectId], [ClaimType], [ClaimValue]) VALUES (N'814beb91-5888-4442-8127-ff9711d8688a', N'd860efca-22d9-47fd-8249-791ba61b07c7', N'subscriptionlevel', N'FreeUser')
INSERT [dbo].[Claims] ([Id], [SubjectId], [ClaimType], [ClaimValue]) VALUES (N'89c57b24-b090-4fb7-89cb-e4ebf3b2e5b7', N'b7539694-97e7-4dfe-84da-b4256e1ff5c7', N'country', N'be')
INSERT [dbo].[Claims] ([Id], [SubjectId], [ClaimType], [ClaimValue]) VALUES (N'8d507d1d-c20a-4f78-b287-b8dc0cdf3db9', N'd860efca-22d9-47fd-8249-791ba61b07c7', N'family_name', N'Underwood')
INSERT [dbo].[Claims] ([Id], [SubjectId], [ClaimType], [ClaimValue]) VALUES (N'9512c4b4-c1b7-480f-9258-3d3cec0ab31d', N'd860efca-22d9-47fd-8249-791ba61b07c7', N'given_name', N'Frank')
INSERT [dbo].[Claims] ([Id], [SubjectId], [ClaimType], [ClaimValue]) VALUES (N'aa691ac9-9b40-412b-b707-9c8efcf4ed0c', N'b7539694-97e7-4dfe-84da-b4256e1ff5c7', N'subscriptionlevel', N'PayingUser')
INSERT [dbo].[Claims] ([Id], [SubjectId], [ClaimType], [ClaimValue]) VALUES (N'eae5f19a-a69c-4fca-835d-628c9fe3f17e', N'b7539694-97e7-4dfe-84da-b4256e1ff5c7', N'role', N'PayingUser')
INSERT [dbo].[Claims] ([Id], [SubjectId], [ClaimType], [ClaimValue]) VALUES (N'fa8fa555-d89c-4404-bf1a-8d4173765e60', N'b7539694-97e7-4dfe-84da-b4256e1ff5c7', N'family_name', N'Underwood')
/****** Object:  ForeignKey [FK_Claims_Users_SubjectId]    Script Date: 09/20/2018 12:11:05 ******/
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_Claims_Users_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Users] ([SubjectId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [FK_Claims_Users_SubjectId]
GO
/****** Object:  ForeignKey [FK_UserLogins_Users_SubjectId]    Script Date: 09/20/2018 12:11:05 ******/
ALTER TABLE [dbo].[UserLogins]  WITH CHECK ADD  CONSTRAINT [FK_UserLogins_Users_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Users] ([SubjectId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLogins] CHECK CONSTRAINT [FK_UserLogins_Users_SubjectId]
GO
