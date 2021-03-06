USE [IdentityServerDataDB]
GO
/****** Object:  User [AccredOnlineUser]    Script Date: 09/20/2018 12:09:22 ******/
CREATE USER [AccredOnlineUser] FOR LOGIN [AccredOnlineUser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AbsoluteRefreshTokenLifetime] [int] NOT NULL,
	[AccessTokenLifetime] [int] NOT NULL,
	[AccessTokenType] [int] NOT NULL,
	[AllowAccessTokensViaBrowser] [bit] NOT NULL,
	[AllowOfflineAccess] [bit] NOT NULL,
	[AllowPlainTextPkce] [bit] NOT NULL,
	[AllowRememberConsent] [bit] NOT NULL,
	[AlwaysIncludeUserClaimsInIdToken] [bit] NOT NULL,
	[AlwaysSendClientClaims] [bit] NOT NULL,
	[AuthorizationCodeLifetime] [int] NOT NULL,
	[BackChannelLogoutSessionRequired] [bit] NOT NULL,
	[BackChannelLogoutUri] [nvarchar](2000) NULL,
	[ClientClaimsPrefix] [nvarchar](200) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[ClientName] [nvarchar](200) NULL,
	[ClientUri] [nvarchar](2000) NULL,
	[ConsentLifetime] [int] NULL,
	[Description] [nvarchar](1000) NULL,
	[EnableLocalLogin] [bit] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[FrontChannelLogoutSessionRequired] [bit] NOT NULL,
	[FrontChannelLogoutUri] [nvarchar](2000) NULL,
	[IdentityTokenLifetime] [int] NOT NULL,
	[IncludeJwtId] [bit] NOT NULL,
	[LogoUri] [nvarchar](2000) NULL,
	[PairWiseSubjectSalt] [nvarchar](200) NULL,
	[ProtocolType] [nvarchar](200) NOT NULL,
	[RefreshTokenExpiration] [int] NOT NULL,
	[RefreshTokenUsage] [int] NOT NULL,
	[RequireClientSecret] [bit] NOT NULL,
	[RequireConsent] [bit] NOT NULL,
	[RequirePkce] [bit] NOT NULL,
	[SlidingRefreshTokenLifetime] [int] NOT NULL,
	[UpdateAccessTokenClaimsOnRefresh] [bit] NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON
INSERT [dbo].[Clients] ([Id], [AbsoluteRefreshTokenLifetime], [AccessTokenLifetime], [AccessTokenType], [AllowAccessTokensViaBrowser], [AllowOfflineAccess], [AllowPlainTextPkce], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [AlwaysSendClientClaims], [AuthorizationCodeLifetime], [BackChannelLogoutSessionRequired], [BackChannelLogoutUri], [ClientClaimsPrefix], [ClientId], [ClientName], [ClientUri], [ConsentLifetime], [Description], [EnableLocalLogin], [Enabled], [FrontChannelLogoutSessionRequired], [FrontChannelLogoutUri], [IdentityTokenLifetime], [IncludeJwtId], [LogoUri], [PairWiseSubjectSalt], [ProtocolType], [RefreshTokenExpiration], [RefreshTokenUsage], [RequireClientSecret], [RequireConsent], [RequirePkce], [SlidingRefreshTokenLifetime], [UpdateAccessTokenClaimsOnRefresh]) VALUES (1, 2592000, 3600, 0, 0, 1, 0, 1, 0, 0, 300, 1, NULL, N'client_', N'imagegalleryclient', N'Image Gallery', NULL, NULL, NULL, 1, 1, 1, NULL, 300, 0, NULL, NULL, N'oidc', 1, 1, 1, 0, 0, 1296000, 1)
INSERT [dbo].[Clients] ([Id], [AbsoluteRefreshTokenLifetime], [AccessTokenLifetime], [AccessTokenType], [AllowAccessTokensViaBrowser], [AllowOfflineAccess], [AllowPlainTextPkce], [AllowRememberConsent], [AlwaysIncludeUserClaimsInIdToken], [AlwaysSendClientClaims], [AuthorizationCodeLifetime], [BackChannelLogoutSessionRequired], [BackChannelLogoutUri], [ClientClaimsPrefix], [ClientId], [ClientName], [ClientUri], [ConsentLifetime], [Description], [EnableLocalLogin], [Enabled], [FrontChannelLogoutSessionRequired], [FrontChannelLogoutUri], [IdentityTokenLifetime], [IncludeJwtId], [LogoUri], [PairWiseSubjectSalt], [ProtocolType], [RefreshTokenExpiration], [RefreshTokenUsage], [RequireClientSecret], [RequireConsent], [RequirePkce], [SlidingRefreshTokenLifetime], [UpdateAccessTokenClaimsOnRefresh]) VALUES (5, 2592000, 3600, 0, 1, 0, 0, 1, 0, 0, 300, 1, NULL, N'client_', N'js', N'Javascript Client', NULL, NULL, NULL, 1, 1, 1, NULL, 300, 0, NULL, NULL, N'oidc', 1, 1, 0, 1, 0, 1296000, 0)
SET IDENTITY_INSERT [dbo].[Clients] OFF
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 09/20/2018 12:09:22 ******/
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180714195613_InitialIdentityServerConfigurationDbMigration', N'2.0.3-rtm-10026')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180715020433_InitialIdentityServerOperationalDbMigration', N'2.0.3-rtm-10026')
/****** Object:  Table [dbo].[ApiResources]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ApiResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ApiResources] ON
INSERT [dbo].[ApiResources] ([Id], [Description], [DisplayName], [Enabled], [Name]) VALUES (1, NULL, N'Image Gallery API', 1, N'imagegalleryapi')
INSERT [dbo].[ApiResources] ([Id], [Description], [DisplayName], [Enabled], [Name]) VALUES (2, NULL, N'My API', 1, N'api1')
SET IDENTITY_INSERT [dbo].[ApiResources] OFF
/****** Object:  Table [dbo].[PersistedGrants]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersistedGrants](
	[Key] [nvarchar](200) NOT NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[SubjectId] [nvarchar](200) NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PersistedGrants] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[PersistedGrants] ([Key], [ClientId], [CreationTime], [Data], [Expiration], [SubjectId], [Type]) VALUES (N'1FS6APdU4RLcKTsv4qqiBpDAeY8qE2RLT1UqPi1DW/M=', N'imagegalleryclient', CAST(0x0780CBFB83849E3E0B AS DateTime2), N'{"CreationTime":"2018-08-21T15:48:35Z","Lifetime":2592000,"AccessToken":{"Audiences":["https://localhost:44346/resources","imagegalleryapi"],"Issuer":"https://localhost:44346","CreationTime":"2018-08-21T15:48:35Z","Lifetime":120,"Type":"access_token","ClientId":"imagegalleryclient","AccessTokenType":0,"Claims":[{"Type":"client_id","Value":"imagegalleryclient","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"openid","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"profile","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"address","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"roles","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"subscriptionlevel","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"country","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"imagegalleryapi","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"offline_access","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sub","Value":"d860efca-22d9-47fd-8249-791ba61b07c7","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1534866512","ValueType":"http://www.w3.org/2001/XMLSchema#integer"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"country","Value":"nl","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"address","Value":"Main Street 1","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"subscriptionlevel","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"family_name","Value":"Underwood","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"given_name","Value":"Frank","ValueType":"http://www.w3.org/2001/XMLSchema#string"}],"Version":4},"Version":4}', CAST(0x0780CBFB8384BC3E0B AS DateTime2), N'd860efca-22d9-47fd-8249-791ba61b07c7', N'refresh_token')
INSERT [dbo].[PersistedGrants] ([Key], [ClientId], [CreationTime], [Data], [Expiration], [SubjectId], [Type]) VALUES (N'aFtkeufrjrDO+U1Ds0rKlEV/TQsTHIlEByi/hpAyTgQ=', N'imagegalleryclient', CAST(0x0780405F9DA17D3E0B AS DateTime2), N'{"CreationTime":"2018-07-19T19:16:53Z","Lifetime":2592000,"AccessToken":{"Audiences":["https://localhost:44346/resources","imagegalleryapi"],"Issuer":"https://localhost:44346","CreationTime":"2018-07-19T19:16:53Z","Lifetime":120,"Type":"access_token","ClientId":"imagegalleryclient","AccessTokenType":0,"Claims":[{"Type":"client_id","Value":"imagegalleryclient","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"openid","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"profile","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"address","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"roles","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"subscriptionlevel","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"country","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"imagegalleryapi","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"offline_access","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sub","Value":"d860efca-22d9-47fd-8249-791ba61b07c7","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1532027811","ValueType":"http://www.w3.org/2001/XMLSchema#integer"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"country","Value":"nl","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"address","Value":"Main Street 1","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"subscriptionlevel","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"family_name","Value":"Underwood","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"given_name","Value":"Frank","ValueType":"http://www.w3.org/2001/XMLSchema#string"}],"Version":4},"Version":4}', CAST(0x0780405F9DA19B3E0B AS DateTime2), N'd860efca-22d9-47fd-8249-791ba61b07c7', N'refresh_token')
INSERT [dbo].[PersistedGrants] ([Key], [ClientId], [CreationTime], [Data], [Expiration], [SubjectId], [Type]) VALUES (N'dy2h96MtdiRUl0keuiDZbtbX/h7gPWpA5wBslAhL9tA=', N'imagegalleryclient', CAST(0x07001F38DDC59E3E0B AS DateTime2), N'{"CreationTime":"2018-08-21T23:36:22Z","Lifetime":2592000,"AccessToken":{"Audiences":["https://localhost:44346/resources","imagegalleryapi"],"Issuer":"https://localhost:44346","CreationTime":"2018-08-21T23:36:22Z","Lifetime":120,"Type":"access_token","ClientId":"imagegalleryclient","AccessTokenType":0,"Claims":[{"Type":"client_id","Value":"imagegalleryclient","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"openid","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"profile","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"address","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"roles","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"subscriptionlevel","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"country","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"imagegalleryapi","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"offline_access","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sub","Value":"d860efca-22d9-47fd-8249-791ba61b07c7","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1534894581","ValueType":"http://www.w3.org/2001/XMLSchema#integer"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"country","Value":"nl","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"address","Value":"Main Street 1","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"subscriptionlevel","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"family_name","Value":"Underwood","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"given_name","Value":"Frank","ValueType":"http://www.w3.org/2001/XMLSchema#string"}],"Version":4},"Version":4}', CAST(0x07001F38DDC5BC3E0B AS DateTime2), N'd860efca-22d9-47fd-8249-791ba61b07c7', N'refresh_token')
INSERT [dbo].[PersistedGrants] ([Key], [ClientId], [CreationTime], [Data], [Expiration], [SubjectId], [Type]) VALUES (N'E7spG1oETsjlLp6jklJU4pbZvLcZ403SOIFfubmpAhM=', N'imagegalleryclient', CAST(0x0700E2A87CC59E3E0B AS DateTime2), N'{"CreationTime":"2018-08-21T23:33:40Z","Lifetime":2592000,"AccessToken":{"Audiences":["https://localhost:44346/resources","imagegalleryapi"],"Issuer":"https://localhost:44346","CreationTime":"2018-08-21T23:33:40Z","Lifetime":120,"Type":"access_token","ClientId":"imagegalleryclient","AccessTokenType":0,"Claims":[{"Type":"client_id","Value":"imagegalleryclient","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"openid","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"profile","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"address","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"roles","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"subscriptionlevel","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"country","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"imagegalleryapi","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"offline_access","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sub","Value":"d860efca-22d9-47fd-8249-791ba61b07c7","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1534894418","ValueType":"http://www.w3.org/2001/XMLSchema#integer"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"country","Value":"nl","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"address","Value":"Main Street 1","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"subscriptionlevel","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"family_name","Value":"Underwood","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"given_name","Value":"Frank","ValueType":"http://www.w3.org/2001/XMLSchema#string"}],"Version":4},"Version":4}', CAST(0x0700E2A87CC5BC3E0B AS DateTime2), N'd860efca-22d9-47fd-8249-791ba61b07c7', N'refresh_token')
INSERT [dbo].[PersistedGrants] ([Key], [ClientId], [CreationTime], [Data], [Expiration], [SubjectId], [Type]) VALUES (N'FTkOr+QaP3eJVEkK0a42DV/b0gOPQU1UyS+lo5pPIXw=', N'imagegalleryclient', CAST(0x0700374EA0899E3E0B AS DateTime2), N'{"CreationTime":"2018-08-21T16:25:10Z","Lifetime":2592000,"AccessToken":{"Audiences":["https://localhost:44346/resources","imagegalleryapi"],"Issuer":"https://localhost:44346","CreationTime":"2018-08-21T16:25:10Z","Lifetime":120,"Type":"access_token","ClientId":"imagegalleryclient","AccessTokenType":0,"Claims":[{"Type":"client_id","Value":"imagegalleryclient","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"openid","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"profile","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"address","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"roles","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"subscriptionlevel","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"country","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"imagegalleryapi","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"offline_access","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sub","Value":"d860efca-22d9-47fd-8249-791ba61b07c7","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1534868708","ValueType":"http://www.w3.org/2001/XMLSchema#integer"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"country","Value":"nl","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"address","Value":"Main Street 1","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"subscriptionlevel","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"family_name","Value":"Underwood","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"given_name","Value":"Frank","ValueType":"http://www.w3.org/2001/XMLSchema#string"}],"Version":4},"Version":4}', CAST(0x0700374EA089BC3E0B AS DateTime2), N'd860efca-22d9-47fd-8249-791ba61b07c7', N'refresh_token')
INSERT [dbo].[PersistedGrants] ([Key], [ClientId], [CreationTime], [Data], [Expiration], [SubjectId], [Type]) VALUES (N'hkKJUIppM+xpN52MEQoEpysURX1XyxwazLZn2F7cg/s=', N'imagegalleryclient', CAST(0x0700D0DEE4939E3E0B AS DateTime2), N'{"CreationTime":"2018-08-21T17:38:40Z","Lifetime":2592000,"AccessToken":{"Audiences":["https://localhost:44346/resources","imagegalleryapi"],"Issuer":"https://localhost:44346","CreationTime":"2018-08-21T17:38:40Z","Lifetime":120,"Type":"access_token","ClientId":"imagegalleryclient","AccessTokenType":0,"Claims":[{"Type":"client_id","Value":"imagegalleryclient","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"openid","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"profile","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"address","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"roles","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"subscriptionlevel","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"country","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"imagegalleryapi","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"offline_access","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sub","Value":"d860efca-22d9-47fd-8249-791ba61b07c7","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1534873114","ValueType":"http://www.w3.org/2001/XMLSchema#integer"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"country","Value":"nl","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"address","Value":"Main Street 1","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"subscriptionlevel","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"family_name","Value":"Underwood","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"given_name","Value":"Frank","ValueType":"http://www.w3.org/2001/XMLSchema#string"}],"Version":4},"Version":4}', CAST(0x0700D0DEE493BC3E0B AS DateTime2), N'd860efca-22d9-47fd-8249-791ba61b07c7', N'refresh_token')
INSERT [dbo].[PersistedGrants] ([Key], [ClientId], [CreationTime], [Data], [Expiration], [SubjectId], [Type]) VALUES (N'nSP1IjYuZxvvQ9j1FDvjJOgqO2HuhOQePTPupl5hAI4=', N'imagegalleryclient', CAST(0x07805C78CB709D3E0B AS DateTime2), N'{"CreationTime":"2018-08-20T13:27:25Z","Lifetime":2592000,"AccessToken":{"Audiences":["https://localhost:44346/resources","imagegalleryapi"],"Issuer":"https://localhost:44346","CreationTime":"2018-08-20T13:27:25Z","Lifetime":120,"Type":"access_token","ClientId":"imagegalleryclient","AccessTokenType":0,"Claims":[{"Type":"client_id","Value":"imagegalleryclient","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"openid","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"profile","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"address","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"roles","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"subscriptionlevel","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"country","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"imagegalleryapi","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"offline_access","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sub","Value":"d860efca-22d9-47fd-8249-791ba61b07c7","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1534771642","ValueType":"http://www.w3.org/2001/XMLSchema#integer"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"country","Value":"nl","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"address","Value":"Main Street 1","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"subscriptionlevel","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"family_name","Value":"Underwood","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"given_name","Value":"Frank","ValueType":"http://www.w3.org/2001/XMLSchema#string"}],"Version":4},"Version":4}', CAST(0x07805C78CB70BB3E0B AS DateTime2), N'd860efca-22d9-47fd-8249-791ba61b07c7', N'refresh_token')
INSERT [dbo].[PersistedGrants] ([Key], [ClientId], [CreationTime], [Data], [Expiration], [SubjectId], [Type]) VALUES (N'ta6BBRde0xbMMKMcxzBXdTl2ybvJHIpRcP9txU7y9TQ=', N'imagegalleryclient', CAST(0x0780892470C59E3E0B AS DateTime2), N'{"CreationTime":"2018-08-21T23:33:19Z","Lifetime":2592000,"AccessToken":{"Audiences":["https://localhost:44346/resources","imagegalleryapi"],"Issuer":"https://localhost:44346","CreationTime":"2018-08-21T23:33:19Z","Lifetime":120,"Type":"access_token","ClientId":"imagegalleryclient","AccessTokenType":0,"Claims":[{"Type":"client_id","Value":"imagegalleryclient","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"openid","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"profile","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"address","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"roles","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"subscriptionlevel","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"country","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"imagegalleryapi","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"offline_access","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sub","Value":"d860efca-22d9-47fd-8249-791ba61b07c7","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1534893856","ValueType":"http://www.w3.org/2001/XMLSchema#integer"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"country","Value":"nl","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"address","Value":"Main Street 1","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"subscriptionlevel","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"family_name","Value":"Underwood","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"given_name","Value":"Frank","ValueType":"http://www.w3.org/2001/XMLSchema#string"}],"Version":4},"Version":4}', CAST(0x0780892470C5BC3E0B AS DateTime2), N'd860efca-22d9-47fd-8249-791ba61b07c7', N'refresh_token')
INSERT [dbo].[PersistedGrants] ([Key], [ClientId], [CreationTime], [Data], [Expiration], [SubjectId], [Type]) VALUES (N'V4nLj6adIhwYXERwWgwTXI2WwEGnR5BzqJLLoSmYajs=', N'imagegalleryclient', CAST(0x0700463618257A3E0B AS DateTime2), N'{"CreationTime":"2018-07-16T04:25:32Z","Lifetime":2592000,"AccessToken":{"Audiences":["https://localhost:44346/resources","imagegalleryapi"],"Issuer":"https://localhost:44346","CreationTime":"2018-07-16T04:25:32Z","Lifetime":120,"Type":"access_token","ClientId":"imagegalleryclient","AccessTokenType":0,"Claims":[{"Type":"client_id","Value":"imagegalleryclient","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"openid","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"profile","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"address","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"roles","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"subscriptionlevel","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"country","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"imagegalleryapi","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"offline_access","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sub","Value":"d860efca-22d9-47fd-8249-791ba61b07c7","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1531715130","ValueType":"http://www.w3.org/2001/XMLSchema#integer"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"country","Value":"nl","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"address","Value":"Main Street 1","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"subscriptionlevel","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"family_name","Value":"Underwood","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"given_name","Value":"Frank","ValueType":"http://www.w3.org/2001/XMLSchema#string"}],"Version":4},"Version":4}', CAST(0x070046361825983E0B AS DateTime2), N'd860efca-22d9-47fd-8249-791ba61b07c7', N'refresh_token')
INSERT [dbo].[PersistedGrants] ([Key], [ClientId], [CreationTime], [Data], [Expiration], [SubjectId], [Type]) VALUES (N'y7cDbj1la4YJZarIcDuoHc+uexirru6uiYu1VaiVjj4=', N'imagegalleryclient', CAST(0x07807A78D5C59E3E0B AS DateTime2), N'{"CreationTime":"2018-08-21T23:36:09Z","Lifetime":2592000,"AccessToken":{"Audiences":["https://localhost:44346/resources","imagegalleryapi"],"Issuer":"https://localhost:44346","CreationTime":"2018-08-21T23:36:09Z","Lifetime":120,"Type":"access_token","ClientId":"imagegalleryclient","AccessTokenType":0,"Claims":[{"Type":"client_id","Value":"imagegalleryclient","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"openid","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"profile","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"address","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"roles","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"subscriptionlevel","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"country","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"imagegalleryapi","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"scope","Value":"offline_access","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"sub","Value":"d860efca-22d9-47fd-8249-791ba61b07c7","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"auth_time","Value":"1534894567","ValueType":"http://www.w3.org/2001/XMLSchema#integer"},{"Type":"idp","Value":"local","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"amr","Value":"pwd","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"country","Value":"nl","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"role","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"address","Value":"Main Street 1","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"subscriptionlevel","Value":"FreeUser","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"family_name","Value":"Underwood","ValueType":"http://www.w3.org/2001/XMLSchema#string"},{"Type":"given_name","Value":"Frank","ValueType":"http://www.w3.org/2001/XMLSchema#string"}],"Version":4},"Version":4}', CAST(0x07807A78D5C5BC3E0B AS DateTime2), N'd860efca-22d9-47fd-8249-791ba61b07c7', N'refresh_token')
INSERT [dbo].[PersistedGrants] ([Key], [ClientId], [CreationTime], [Data], [Expiration], [SubjectId], [Type]) VALUES (N'yH8GeyLcHjorcRdgm+Xu1UWHZUCVBv/GmD+BXusDUtE=', N'js', CAST(0x070024EC5A0DA03E0B AS DateTime2), N'{"SubjectId":"d860efca-22d9-47fd-8249-791ba61b07c7","ClientId":"js","Scopes":["openid","profile","api1"],"CreationTime":"2018-08-23T01:35:36Z","Expiration":null}', NULL, N'd860efca-22d9-47fd-8249-791ba61b07c7', N'user_consent')
/****** Object:  Table [dbo].[IdentityResources]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityResources](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Emphasize] [bit] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Required] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
 CONSTRAINT [PK_IdentityResources] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[IdentityResources] ON
INSERT [dbo].[IdentityResources] ([Id], [Description], [DisplayName], [Emphasize], [Enabled], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (1, NULL, N'Your user identifier', 0, 1, N'openid', 1, 1)
INSERT [dbo].[IdentityResources] ([Id], [Description], [DisplayName], [Emphasize], [Enabled], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (2, N'Your user profile information (first name, last name, etc.)', N'User profile', 1, 1, N'profile', 0, 1)
INSERT [dbo].[IdentityResources] ([Id], [Description], [DisplayName], [Emphasize], [Enabled], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (3, NULL, N'Your postal address', 1, 1, N'address', 0, 1)
INSERT [dbo].[IdentityResources] ([Id], [Description], [DisplayName], [Emphasize], [Enabled], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (4, NULL, N'Your roles', 0, 1, N'roles', 0, 1)
INSERT [dbo].[IdentityResources] ([Id], [Description], [DisplayName], [Emphasize], [Enabled], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (5, NULL, N'Your subscription level', 0, 1, N'subscriptionlevel', 0, 1)
INSERT [dbo].[IdentityResources] ([Id], [Description], [DisplayName], [Emphasize], [Enabled], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (6, NULL, N'Your country', 0, 1, N'country', 0, 1)
SET IDENTITY_INSERT [dbo].[IdentityResources] OFF
/****** Object:  Table [dbo].[IdentityClaims]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdentityResourceId] [int] NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_IdentityClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[IdentityClaims] ON
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (1, 1, N'sub')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (2, 4, N'role')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (3, 3, N'address')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (4, 2, N'updated_at')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (5, 2, N'locale')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (6, 2, N'zoneinfo')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (7, 2, N'birthdate')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (8, 2, N'gender')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (9, 5, N'subscriptionlevel')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (10, 2, N'website')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (11, 2, N'profile')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (12, 2, N'preferred_username')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (13, 2, N'nickname')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (14, 2, N'middle_name')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (15, 2, N'given_name')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (16, 2, N'family_name')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (17, 2, N'name')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (18, 2, N'picture')
INSERT [dbo].[IdentityClaims] ([Id], [IdentityResourceId], [Type]) VALUES (19, 6, N'country')
SET IDENTITY_INSERT [dbo].[IdentityClaims] OFF
/****** Object:  Table [dbo].[ClientSecrets]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NULL,
	[Value] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_ClientSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ClientSecrets] ON
INSERT [dbo].[ClientSecrets] ([Id], [ClientId], [Description], [Expiration], [Type], [Value]) VALUES (2, 1, NULL, NULL, N'SharedSecret', N'K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=')
SET IDENTITY_INSERT [dbo].[ClientSecrets] OFF
/****** Object:  Table [dbo].[ClientScopes]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Scope] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ClientScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ClientScopes] ON
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope]) VALUES (1, 1, N'openid')
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope]) VALUES (2, 1, N'profile')
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope]) VALUES (3, 1, N'address')
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope]) VALUES (4, 1, N'roles')
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope]) VALUES (5, 1, N'imagegalleryapi')
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope]) VALUES (6, 1, N'subscriptionlevel')
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope]) VALUES (7, 1, N'country')
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope]) VALUES (9, 5, N'openid')
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope]) VALUES (10, 5, N'profile')
INSERT [dbo].[ClientScopes] ([Id], [ClientId], [Scope]) VALUES (17, 5, N'api1')
SET IDENTITY_INSERT [dbo].[ClientScopes] OFF
/****** Object:  Table [dbo].[ApiClaims]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ApiClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ApiClaims] ON
INSERT [dbo].[ApiClaims] ([Id], [ApiResourceId], [Type]) VALUES (1, 1, N'role')
SET IDENTITY_INSERT [dbo].[ApiClaims] OFF
/****** Object:  Table [dbo].[ClientRedirectUris]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[RedirectUri] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_ClientRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ClientRedirectUris] ON
INSERT [dbo].[ClientRedirectUris] ([Id], [ClientId], [RedirectUri]) VALUES (1, 1, N'https://localhost:44342/signin-oidc')
INSERT [dbo].[ClientRedirectUris] ([Id], [ClientId], [RedirectUri]) VALUES (3, 5, N'http://localhost:3000/callback')
INSERT [dbo].[ClientRedirectUris] ([Id], [ClientId], [RedirectUri]) VALUES (4, 5, N'http://localhost:3000/silent_renew')
SET IDENTITY_INSERT [dbo].[ClientRedirectUris] OFF
/****** Object:  Table [dbo].[ClientProperties]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientProperties](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Key] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_ClientProperties] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientPostLogoutRedirectUris]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientPostLogoutRedirectUris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[PostLogoutRedirectUri] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_ClientPostLogoutRedirectUris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ClientPostLogoutRedirectUris] ON
INSERT [dbo].[ClientPostLogoutRedirectUris] ([Id], [ClientId], [PostLogoutRedirectUri]) VALUES (1, 1, N'https://localhost:44342/signout-callback-oidc')
INSERT [dbo].[ClientPostLogoutRedirectUris] ([Id], [ClientId], [PostLogoutRedirectUri]) VALUES (2, 5, N'http://localhost:3000/')
SET IDENTITY_INSERT [dbo].[ClientPostLogoutRedirectUris] OFF
/****** Object:  Table [dbo].[ClientIdPRestrictions]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientIdPRestrictions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Provider] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ClientIdPRestrictions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientGrantTypes]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientGrantTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[GrantType] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_ClientGrantTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] ON
INSERT [dbo].[ClientGrantTypes] ([Id], [ClientId], [GrantType]) VALUES (1, 1, N'hybrid')
INSERT [dbo].[ClientGrantTypes] ([Id], [ClientId], [GrantType]) VALUES (2, 5, N'implicit')
SET IDENTITY_INSERT [dbo].[ClientGrantTypes] OFF
/****** Object:  Table [dbo].[ClientCorsOrigins]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientCorsOrigins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Origin] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ClientCorsOrigins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ClientCorsOrigins] ON
INSERT [dbo].[ClientCorsOrigins] ([Id], [ClientId], [Origin]) VALUES (1, 5, N'http://localhost:3000')
SET IDENTITY_INSERT [dbo].[ClientCorsOrigins] OFF
/****** Object:  Table [dbo].[ClientClaims]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[Type] [nvarchar](250) NOT NULL,
	[Value] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_ClientClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiSecrets]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiSecrets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[Expiration] [datetime2](7) NULL,
	[Type] [nvarchar](250) NULL,
	[Value] [nvarchar](2000) NULL,
 CONSTRAINT [PK_ApiSecrets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApiScopes]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApiResourceId] [int] NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[DisplayName] [nvarchar](200) NULL,
	[Emphasize] [bit] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Required] [bit] NOT NULL,
	[ShowInDiscoveryDocument] [bit] NOT NULL,
 CONSTRAINT [PK_ApiScopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ApiScopes] ON
INSERT [dbo].[ApiScopes] ([Id], [ApiResourceId], [Description], [DisplayName], [Emphasize], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (1, 1, NULL, N'Image Gallery API', 0, N'imagegalleryapi', 0, 1)
INSERT [dbo].[ApiScopes] ([Id], [ApiResourceId], [Description], [DisplayName], [Emphasize], [Name], [Required], [ShowInDiscoveryDocument]) VALUES (2, 2, NULL, N'My API', 0, N'api1', 0, 1)
SET IDENTITY_INSERT [dbo].[ApiScopes] OFF
/****** Object:  Table [dbo].[ApiScopeClaims]    Script Date: 09/20/2018 12:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApiScopeClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApiScopeId] [int] NOT NULL,
	[Type] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ApiScopeClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_ApiClaims_ApiResources_ApiResourceId]    Script Date: 09/20/2018 12:09:22 ******/
ALTER TABLE [dbo].[ApiClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiClaims_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiClaims] CHECK CONSTRAINT [FK_ApiClaims_ApiResources_ApiResourceId]
GO
/****** Object:  ForeignKey [FK_ApiScopeClaims_ApiScopes_ApiScopeId]    Script Date: 09/20/2018 12:09:22 ******/
ALTER TABLE [dbo].[ApiScopeClaims]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ApiScopeId] FOREIGN KEY([ApiScopeId])
REFERENCES [dbo].[ApiScopes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopeClaims] CHECK CONSTRAINT [FK_ApiScopeClaims_ApiScopes_ApiScopeId]
GO
/****** Object:  ForeignKey [FK_ApiScopes_ApiResources_ApiResourceId]    Script Date: 09/20/2018 12:09:22 ******/
ALTER TABLE [dbo].[ApiScopes]  WITH CHECK ADD  CONSTRAINT [FK_ApiScopes_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiScopes] CHECK CONSTRAINT [FK_ApiScopes_ApiResources_ApiResourceId]
GO
/****** Object:  ForeignKey [FK_ApiSecrets_ApiResources_ApiResourceId]    Script Date: 09/20/2018 12:09:22 ******/
ALTER TABLE [dbo].[ApiSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ApiSecrets_ApiResources_ApiResourceId] FOREIGN KEY([ApiResourceId])
REFERENCES [dbo].[ApiResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApiSecrets] CHECK CONSTRAINT [FK_ApiSecrets_ApiResources_ApiResourceId]
GO
/****** Object:  ForeignKey [FK_ClientClaims_Clients_ClientId]    Script Date: 09/20/2018 12:09:22 ******/
ALTER TABLE [dbo].[ClientClaims]  WITH CHECK ADD  CONSTRAINT [FK_ClientClaims_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientClaims] CHECK CONSTRAINT [FK_ClientClaims_Clients_ClientId]
GO
/****** Object:  ForeignKey [FK_ClientCorsOrigins_Clients_ClientId]    Script Date: 09/20/2018 12:09:22 ******/
ALTER TABLE [dbo].[ClientCorsOrigins]  WITH CHECK ADD  CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientCorsOrigins] CHECK CONSTRAINT [FK_ClientCorsOrigins_Clients_ClientId]
GO
/****** Object:  ForeignKey [FK_ClientGrantTypes_Clients_ClientId]    Script Date: 09/20/2018 12:09:22 ******/
ALTER TABLE [dbo].[ClientGrantTypes]  WITH CHECK ADD  CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientGrantTypes] CHECK CONSTRAINT [FK_ClientGrantTypes_Clients_ClientId]
GO
/****** Object:  ForeignKey [FK_ClientIdPRestrictions_Clients_ClientId]    Script Date: 09/20/2018 12:09:22 ******/
ALTER TABLE [dbo].[ClientIdPRestrictions]  WITH CHECK ADD  CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientIdPRestrictions] CHECK CONSTRAINT [FK_ClientIdPRestrictions_Clients_ClientId]
GO
/****** Object:  ForeignKey [FK_ClientPostLogoutRedirectUris_Clients_ClientId]    Script Date: 09/20/2018 12:09:22 ******/
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientPostLogoutRedirectUris] CHECK CONSTRAINT [FK_ClientPostLogoutRedirectUris_Clients_ClientId]
GO
/****** Object:  ForeignKey [FK_ClientProperties_Clients_ClientId]    Script Date: 09/20/2018 12:09:22 ******/
ALTER TABLE [dbo].[ClientProperties]  WITH CHECK ADD  CONSTRAINT [FK_ClientProperties_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientProperties] CHECK CONSTRAINT [FK_ClientProperties_Clients_ClientId]
GO
/****** Object:  ForeignKey [FK_ClientRedirectUris_Clients_ClientId]    Script Date: 09/20/2018 12:09:22 ******/
ALTER TABLE [dbo].[ClientRedirectUris]  WITH CHECK ADD  CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientRedirectUris] CHECK CONSTRAINT [FK_ClientRedirectUris_Clients_ClientId]
GO
/****** Object:  ForeignKey [FK_ClientScopes_Clients_ClientId]    Script Date: 09/20/2018 12:09:22 ******/
ALTER TABLE [dbo].[ClientScopes]  WITH CHECK ADD  CONSTRAINT [FK_ClientScopes_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientScopes] CHECK CONSTRAINT [FK_ClientScopes_Clients_ClientId]
GO
/****** Object:  ForeignKey [FK_ClientSecrets_Clients_ClientId]    Script Date: 09/20/2018 12:09:22 ******/
ALTER TABLE [dbo].[ClientSecrets]  WITH CHECK ADD  CONSTRAINT [FK_ClientSecrets_Clients_ClientId] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientSecrets] CHECK CONSTRAINT [FK_ClientSecrets_Clients_ClientId]
GO
/****** Object:  ForeignKey [FK_IdentityClaims_IdentityResources_IdentityResourceId]    Script Date: 09/20/2018 12:09:22 ******/
ALTER TABLE [dbo].[IdentityClaims]  WITH CHECK ADD  CONSTRAINT [FK_IdentityClaims_IdentityResources_IdentityResourceId] FOREIGN KEY([IdentityResourceId])
REFERENCES [dbo].[IdentityResources] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IdentityClaims] CHECK CONSTRAINT [FK_IdentityClaims_IdentityResources_IdentityResourceId]
GO
