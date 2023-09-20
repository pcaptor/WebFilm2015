-- SQL Manager Lite for SQL Server 4.2.1.47272
-- ---------------------------------------
-- Host      : DESKTOP-G4GURU6\SQLEXPRESS
-- Database  : FilmDB1
-- Version   : Microsoft SQL Server 2016 (SP2) (KB4052908) 13.0.5026.0


CREATE DATABASE FilmDB1
COLLATE Cyrillic_General_CI_AS
GO

USE FilmDB1
GO

--
-- Definition for table __MigrationHistory : 
--

CREATE TABLE dbo.__MigrationHistory (
  MigrationId nvarchar(150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  ContextKey nvarchar(300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  Model varbinary(max) NOT NULL,
  ProductVersion nvarchar(32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED (MigrationId, ContextKey)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table AspNetRoles : 
--

CREATE TABLE dbo.AspNetRoles (
  Id nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  Name nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED (Id)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table AspNetUsers : 
--

CREATE TABLE dbo.AspNetUsers (
  Id nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  Email nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  EmailConfirmed bit NOT NULL,
  PasswordHash nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  SecurityStamp nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  PhoneNumber nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  PhoneNumberConfirmed bit NOT NULL,
  TwoFactorEnabled bit NOT NULL,
  LockoutEndDateUtc datetime NULL,
  LockoutEnabled bit NOT NULL,
  AccessFailedCount int NOT NULL,
  UserName nvarchar(256) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  FirstName nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  MiddleName nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  LastName nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED (Id)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table AspNetUserClaims : 
--

CREATE TABLE dbo.AspNetUserClaims (
  Id int IDENTITY(1, 1) NOT NULL,
  UserId nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  ClaimType nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  ClaimValue nvarchar(max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED (Id)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table AspNetUserLogins : 
--

CREATE TABLE dbo.AspNetUserLogins (
  LoginProvider nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  ProviderKey nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  UserId nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED (LoginProvider, ProviderKey, UserId)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table AspNetUserRoles : 
--

CREATE TABLE dbo.AspNetUserRoles (
  UserId nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  RoleId nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED (UserId, RoleId)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table Country : 
--

CREATE TABLE dbo.Country (
  country_id int NOT NULL,
  cname nvarchar(50) COLLATE Cyrillic_General_CI_AS NOT NULL,
  cname_full nvarchar(100) COLLATE Cyrillic_General_CI_AS NOT NULL,
  code nvarchar(2) COLLATE Cyrillic_General_CI_AS DEFAULT 'ru' NOT NULL,
  PRIMARY KEY CLUSTERED (country_id)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table Episode : 
--

CREATE TABLE dbo.Episode (
  episode_id int NOT NULL,
  ename varchar(50) COLLATE Cyrillic_General_CI_AS NOT NULL,
  CONSTRAINT PK_Episode PRIMARY KEY CLUSTERED (episode_id)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table Season : 
--

CREATE TABLE dbo.Season (
  season_id int NOT NULL,
  sname varchar(50) COLLATE Cyrillic_General_CI_AS NOT NULL,
  CONSTRAINT PK_Season PRIMARY KEY CLUSTERED (season_id)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table Type : 
--

CREATE TABLE dbo.Type (
  type_id int NOT NULL,
  tname varchar(50) COLLATE Cyrillic_General_CI_AS NOT NULL,
  CONSTRAINT PK_Type PRIMARY KEY CLUSTERED (type_id)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table History : 
--

CREATE TABLE dbo.History (
  history_id int NOT NULL,
  film_id int NOT NULL,
  season_id int NOT NULL,
  episode_id int NOT NULL,
  hdate datetime NOT NULL,
  CONSTRAINT PK_History PRIMARY KEY CLUSTERED (history_id)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table Film : 
--

CREATE TABLE dbo.Film (
  film_id int NOT NULL,
  fname nvarchar(100) COLLATE Cyrillic_General_CI_AS NOT NULL,
  fname_eng nvarchar(100) COLLATE Cyrillic_General_CI_AS NOT NULL,
  type_id int NOT NULL,
  country_id int NOT NULL,
  year smallint NOT NULL,
  season_id int NOT NULL,
  episode_id int NOT NULL,
  description nvarchar(500) COLLATE Cyrillic_General_CI_AS NULL,
  AspUserId nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  CONSTRAINT PK_Film PRIMARY KEY CLUSTERED (film_id)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table FUser : 
--

CREATE TABLE dbo.FUser (
  user_id int IDENTITY(1, 1) NOT NULL,
  login varchar(50) COLLATE Cyrillic_General_CI_AS NOT NULL,
  password varchar(50) COLLATE Cyrillic_General_CI_AS NOT NULL,
  lastname varchar(50) COLLATE Cyrillic_General_CI_AS NOT NULL,
  firstname varchar(50) COLLATE Cyrillic_General_CI_AS NOT NULL,
  middlename varchar(50) COLLATE Cyrillic_General_CI_AS NOT NULL,
  email nvarchar(100) COLLATE Cyrillic_General_CI_AS NULL,
  birthday datetime NULL,
  gender int NULL,
  CONSTRAINT FUser_pk PRIMARY KEY CLUSTERED (user_id)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for table UserProfile : 
--

CREATE TABLE dbo.UserProfile (
  UserId int IDENTITY(1, 1) NOT NULL,
  UserName nvarchar(56) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  PRIMARY KEY CLUSTERED (UserId)
    WITH (
      PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF,
      ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
ON [PRIMARY]
GO

--
-- Definition for view View_History : 
--
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_History]
AS
SELECT        dbo.History.history_id, dbo.Film.fname, dbo.Type.tname, dbo.Season.sname, dbo.Episode.ename, dbo.History.hdate, dbo.Film.AspUserId
FROM            dbo.History INNER JOIN
                         dbo.Film ON dbo.History.film_id = dbo.Film.film_id INNER JOIN
                         dbo.Type ON dbo.Film.type_id = dbo.Type.type_id INNER JOIN
                         dbo.Season ON dbo.History.season_id = dbo.Season.season_id INNER JOIN
                         dbo.Episode ON dbo.History.episode_id = dbo.Episode.episode_id
GO

--
-- Definition for stored procedure AddCountry : 
--
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.AddCountry
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @MaxId INTEGER;

    -- Insert statements for procedure here
	SELECT @MaxId = Max(country_id) + 1 FROM Country;

	INSERT INTO Country (country_id, cname, cname_full) VALUES (@MaxId, '', '');
END
GO

--
-- Definition for stored procedure AddEpisode : 
--
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddEpisode]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @MaxId INTEGER;

    -- Insert statements for procedure here
	SELECT @MaxId = Max(episode_id) + 1 FROM Episode;

	INSERT INTO Episode (ename) VALUES (CONVERT(varchar(2), @MaxId) + ' серия');
END
GO

--
-- Definition for stored procedure GetCountries : 
--
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCountries]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT country_id
      ,cname
      ,cname_full
      ,code
  FROM Country
END
GO

--
-- Definition for stored procedure GetFilms : 
--
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetFilms]
	-- Add the parameters for the stored procedure here
	@Fname nvarchar(100),
	@StartDate datetime,
	@EndDate datetime,
	@TypeID int,
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT DISTINCT F.film_id
      ,F.fname
      ,F.fname_eng
      ,F.type_id
	  ,T.tname
	  ,F.country_id
	  ,C.cname
	  ,F.year
      ,F.season_id
      ,F.episode_id
      ,F.user_id
      ,F.description
	  ,C.code
  FROM [FCatalog].[dbo].[Film] F, [FCatalog].[dbo].[History] H, [FCatalog].[dbo].[Type] T, [FCatalog].[dbo].[Country] C
  WHERE F.film_id = H.film_id AND
		substring(F.fname, 1, len(@Fname)) = @Fname AND
	   (DateDiff(day, @StartDate, H.hdate) >= 0) AND
	   (DateDiff(day, H.hdate, @EndDate) >= 0) AND
	   ((F.type_id = @TypeID) OR (@TypeID = -1)) AND
	   F.user_id = @UserID AND
	   T.type_id = F.type_id AND
	   F.country_id = C.country_id
  -- ORDER BY H.history_id DESC
END
GO

--
-- Definition for stored procedure GetHistory : 
--
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.GetHistory
	@FilmID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Select history_id, History.film_id, fname, type_id, History.season_id, History.episode_id, hdate
	  from History, Film
	 where History.film_id = Film.film_id and History.film_id = @FilmID
END
GO

--
-- Definition for stored procedure HistoryReport : 
--
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[HistoryReport]
	-- Add the parameters for the stored procedure here
	@start_date datetime,
	@end_date datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT history_id, Film.fname, Type.tname, Season.sname, Episode.ename, hdate
	  FROM History, Film, Type, Season, Episode
	 WHERE DATEDIFF(day, @start_date, hdate) >= 0 and DATEDIFF(day, hdate, @end_date) >= 0 and
		   History.film_id = Film.film_id and
		   Film.type_id = Type.type_id and
		   History.season_id = Season.season_id and
		   History.episode_id = Episode.episode_id;
END
GO

--
-- Definition for stored procedure UpdateCountry : 
--
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.UpdateCountry
	-- Add the parameters for the stored procedure here
	@CountryId INT,
	@Cname NVARCHAR(50),
	@Cname_full NVARCHAR(100),
	@Code NVARCHAR(2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	UPDATE Country SET cname = @Cname, cname_full = @Cname_full, code = @Code
	 WHERE country_id = @CountryId
END
GO

--
-- Definition for stored procedure UpdateEpisodeId : 
--
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.UpdateEpisodeId
	@EpisodeID int
AS
BEGIN
	DECLARE @NewEpisodeID int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select @NewEpisodeID = Max(episode_id) + 1 from Episode where episode_id < @EpisodeID;

	SET IDENTITY_INSERT Episode ON;
	insert into Episode(episode_id, ename)
	select @NewEpisodeID, ename from Episode where episode_id = @EpisodeID;

	SET IDENTITY_INSERT Episode OFF;
	DBCC CHECKIDENT ('Episode', RESEED, @NewEpisodeID);

	delete from Episode where episode_id = @EpisodeID;
END
GO

--
-- Definition for stored procedure UpdateHistoryId : 
--
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateHistoryId]
	-- Add the parameters for the stored procedure here
	@HistoryID int
AS
BEGIN
	DECLARE @NewHistoryID int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select @NewHistoryID = Max(history_id) + 1 from History where history_id < @HistoryID;

	SET IDENTITY_INSERT History ON;
	insert into History(history_id, film_id, season_id, episode_id, hdate)
	select @NewHistoryID, film_id, season_id, episode_id, hdate from History where history_id = @HistoryID;

	SET IDENTITY_INSERT History OFF;
	DBCC CHECKIDENT ('History', RESEED, @NewHistoryID);

	delete from History where history_id = @HistoryID;
END
GO

--
-- Definition for stored procedure UpdateTypeId : 
--
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateTypeId]
	@TypeID int
AS
BEGIN
	DECLARE @NewTypeID int;
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select @NewTypeID = Max(type_id) + 1 from Type where type_id < @TypeID;

	SET IDENTITY_INSERT Type ON;
	insert into Type(type_id, tname)
	select @NewTypeID, tname from Type where type_id = @TypeID;

	SET IDENTITY_INSERT Type OFF;
	DBCC CHECKIDENT ('Type', RESEED, @NewTypeID);

	delete from Type where type_id = @TypeID;
END
GO

--
-- Data for table dbo.__MigrationHistory  (LIMIT 0,500)
--

INSERT INTO dbo.__MigrationHistory (MigrationId, ContextKey, Model, ProductVersion)
VALUES 
  (N'201904180144186_InitialCreate', N'WebFilm2015.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C6D6FE33612FE7EC0FD07419FEE0EA99597EE622FB05BA44E7C1774F38275B677DF16B4443BC44A942A516982A2BFEC3EDC4FEA5FE850A264892F7AB115DB29165844E4F099E170480E8743FFFEBFFF8FBF7F0E7CEB09C70909E9C43E191DDB16A66EE811BA9AD8295B7EF3C1FEFEBBBFFE657CE505CFD64F05DD19A783963499D88F8C45E78E93B88F3840C928206E1C26E1928DDC307090173AA7C7C7FF744E4E1C0C10366059D6F8534A190970F6019FD390BA386229F26F420FFB8928879A79866ADDA200271172F1C4FE0F5ECC881F9C1E9FBC1BE5D4B675E1130492CCB1BFB42D4469C8100339CF3F2778CEE290AEE6111420FFE125C240B7447E8285FCE76BF2AE5D393EE55D71D60D0B28374D5818F4043C3913BA71E4E61B69D82E7507DABB022DB317DEEB4C8313FBDAC359D1A7D00705C80CCFA77ECC8927F64DC9E222896E311B150D4739E42C06B85FC2F8EBA88A7864756E7754DAD2E9E898FF3BB2A6A9CFD2184F284E598CFC23EB3E5DF8C4FD11BF3C845F319D9C9D2C96671FDEBD47DED9FB6FF1D9BB6A4FA1AF40572B80A2FB388C700CB2E165D97FDB72EAED1CB961D9ACD226D70AD8124C0BDBBA41CF1F315DB1479830A71F6C6B469EB1579408E3FA4C09CC2268C4E2143E6F53DF470B1F97F54E234FFE7F03D7D377EF07E17A8B9EC82A1B7A893F4C9C18E6D527EC67B5C92389F2E9551BEF2F826C168701FFAEDB575EFB651EA6B1CB3B131A491E50BCC2AC2EDDD8591B6F2793E650C39B75817AF8A6CD2555CD5B4BCA3BB4C94C2858EC7A3614F2BE2EDFCE1677114530789969718D34199CBA598DA4D6475685666D3A275D4D874297FECC2BE15580883FC052D8810B78214B1207B8ECE50F21181EA2BD65BE4749022B81F76F943C36880E7F0E20FA1CBB690C063A6728885E9DDBFD6348F16D1A2CB8DDEF8ED76043F3F04B38432E0BE32BCA5B6D8DF73174BF8629BBA2DE2562F833730B40FEF94082EE00838873E1BA38496660CCD89B86E0641780D7949D9DF686E30BD4BE5D91A98F48A0F745A4A5F44B41BAF647F4148A4F6220D3F9254DA27E0C57847613B520358B9A53B48A2AC8FA8ACAC1BA492A28CD826604AD72E65483797AD9080DEFEA65B087EFEB6DB7799BD6828A1AE7B042E27F618A6358C6BC7BC4188EE97A04BAAC1BFB7016B2E1E34C5F7D6FCA38FD84FC7468561BCD866C11187E3664B0873F1B3231A1F88978DC2BE970002A8801BE13BDFE6CD53EE724C9763D1D6ADDDC35F3DDAC01A6E9729124A14BB259A0097D89C0455D7EF0E1ACF62846DE1B3912021D0343277CCB8312E89B2D1BD51DBDC43E66D8BA70F3D0E014252EF254354287BC1E82153BAA46B07544A42EDC3F149E60E938E68D103F042530530965EAB420D42511F25BB524B5ECB885F1BE973CE49A4B1C61CA19B66AA20B737D00840B50F29106A54D4363A76271CD8668F05A4D63DEE6C2AEC75D894BECC4265B7C67835D0AFFED550CB359633B30CE66957411C018CCDB87818AB34A5703900F2E8766A0D289C960A0C2A5DA8981D635B60703ADABE4CD19687E44ED3AFED279F5D0CCB37E50DEFDB6DEA8AE3DD8664D1F07669AB9EF096D18B4C0B16A9E970B5E899F99E67006728AF359225C5DD94438F81CB37AC866EDEF6AFD50A7194436A226C0B5A1B5808A6B40054899503D842B62798DD2092FA2076C11776B84156BBF045BB10115BB7A1D5A21345F9ACAC6D9E9F451F6ACB406C5C83B1D162A381A839017AF7AC73B28C514975515D3C517EEE30D573A2606A341412D9EAB4149456706D752619AED5AD239647D5CB2ADB424B94F062D159D195C4BC246DB95A4710A7AB8055BA9A8BE850F34D98A4847B9DB94756327CF92120563C7904E35BE415144E8AA925E254AAC799E5B35FD66DE3FE928C8311C37D1E41E95D2969C5818A315966A8135483A2371C22E11430BC4E33C532F50C8B47BAB61F92F5856B74F75108B7DA0A0E67FE72D3497F7B5BD56754604C60C7A18708F260BA36BC65FDFDCE2E96EC847B126723F0DFD34A06607CBDC3ABFBFABB6CF4B5484B123C9AF38508AB61437B7AEFA4E03A34E8A8106A9F45F361F28338449DD85F75955B8C92335A31401AA2A8A2968B5B781333932BD064BF611FB8F552BC2EBCC2B9198520510453D312AB90D0A58A5AE3B6A3DFDA48A59AFE98E28E5985421A5AA1E525633496A42562B36C23368544FD19D839A3B5245576BBB236BB248AAD09AEA0DB03532CB75DD5135892655604D7577EC75D689BC881EF0CE653CB96CBC75E587DBEDF62E03C6EBAC88C36C7D953BFC2A50A5B82796B8A557C044F9415A93F184B7B135E5318DEDACC980615E796AB7DFF585A7F1CADE8C59BBD2AE2DEE4D57FA66BC7E36FBAA96A11CF06492927B79D0930E746371B86A7F44A39CB67212DB2AD4081BFB4BC27030E204A3F9CFFED427982FE305C10DA264891396A771D86076A7D23B9CC37913E32489E76B0EA7A68731F531DB4146167D42B1FB8862353F628B77236B5025F47C4D3DFC3CB17FCD5A9D67510CFE57567C645D279F29F939858A8738C5D66F6ABEE73079F4CD87AC037DF5D05DABD7FFFD92373DB2EE629831E7D6B1A4CB4D46B8FE16A2973479D32DA4D9F885C4DB9D50B5E7075A5469426CFEDA6041D8202F0D0A29FF16A0E7BFF7154DFB9A602B44CD8B81A1F00651A1E945C02658C6D7001E7CB2EC3540BFCEEA5F076C229AF16500A1FDC1E47701DD97A1A2E51EB71ACD9968174B52A6E7D6BCEAAD922CF7BD3729E9D75B4D7435C5BA07DC1669D41B58C61BCB401E6C77D424180F86BD4FD37EF5ACE24349245EA778EC377F789729C30DD7427FAA4CE103C86DD3E4EAEC3F1F78D7B6668AE31E785265BFACDF03333691C1B5FFDCDE5D1B9B29CC7BE0C6D62B83F7C06C6D5FFBE79E2DADF316BAF77C5C35B5C8701FA38B05B7E5DBE6817338E12F423082DCA3CC9F49EA13BC9A92535B18AE49CC4CCD9965326365E2287C158A66B6FDFA2A36FCC6CE0A9A66B6867CCC26DE62FD6FE42D689A791BB21CF79129ACCD33D4656FB7AC634D49506F2933B8D6939644F4369FB5F172FD2D25020FA294DAEC31DC11BF9DBCDF415432E4D4E991E7AB5EF7C2DE59F96545D8BF13B25A43F0DF59A4D8ADED9A25CD355D86C5E62D49549048119A1BCC90075BEA45CCC812B90CAA798C397BE79DC5EDF84DC7027BD7F42E6551CAA0CB3858F8B5801777029AF867C9CC7599C77751F69325437401C4243C367F477F4889EF9572CF3431210304F72E4444978F25E391DDD54B89741BD28E40427DA553F48083C807B0E48ECED113DE443630BF8F7885DC977504D004D23E1075B58F2F095AC5284804C6BA3D7C820D7BC1F3777F009621F90760540000, N'6.1.3-40302')
GO

INSERT INTO dbo.__MigrationHistory (MigrationId, ContextKey, Model, ProductVersion)
VALUES 
  (N'201907140629431_Added User Name', N'WebFilm2015.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE336167E2FB0FF41D0D36E915AB9EC0CA681DD2275E236D8DC30CEB4FB36A025DA2146A254894A1314FD657DE84FDABFB0A4AE142F1265CB9714058A3179F89DC3C343F290FA98FFFDF9D7F8FB97C0B79E619CA0104FEC93D1B16D41EC861EC2AB899D92E5371FECEFBFFBC757E32B2F78B17E2EE5CE981C6D899389FD444874EE3889FB0403908C02E4C661122EC9C80D030778A1737A7CFCAD7372E2400A61532CCB1A7F4C314101CC7ED09FD310BB302229F06F430FFA49514E6BE619AA7507029844C08513FB17B898213F383D3E7937CAA56DEBC247805A3287FED2B600C6210184DA79FE298173128778358F6801F01F5F2348E596C04F6061FF792D6EDA95E353D615A76E5842B96942C2A027E0C959E11B476CBE9687EDCA77D47B57D4CBE495F53AF3E0C4BEF66056F431F4A9034485E7533F66C213FBB65271914477908CCA86A31C721653B8DFC2F8CB88473CB28CDB1D55B1743A3A66FF1D59D3D427690C2718A62406FE91F5902E7CE4FE07BE3E865F209E9C9D2C96671FDEBD07DED9FB7FC3B3777C4F695FA95CA380163DC46104636A1B5C56FDB72DA7D9CE111B56CDB836B957682CD169615BB7E0E506E21579A213E6F4836DCDD00BF4CA9222B83E614467116D44E294FEBC4B7D1F2C7C58D53BAD3AD9FF5BB49EBE7B3F88D63BF08C56D9D00BFAE9C489E9BCFA08FDAC367942513EBD1AE3FDB9109BC561C07E37E32BAFFD3C0FD3D8659D09B5228F205E41D2B46EECD4C16B14D20C6AF8B02E510F3FB499A572782B455987D69909A58A5DCF86D2DEEDEA358EB88B28A283978516F3485BC0C99BD548687D64713275E89C98860EA65DFA3BAF84331427A46339A4FF3452DDAEE916799E0F77A2EA06ECA84F570140FE001B8981169AC32D511CC02A467E08E9B405B8F7883F8024A1EBA8F713489EB6EEA03974D3984EEF390141B4756D0F4F21867769B060ABC6EE740D36348FBF8533E09230BEC2ACD5C67837A1FB254CC915F62E01819F885B02B29F8F28300718C49C0BD7854932A3C10CBD69488F2825E0352667A7BDE1D8F2BEEF446EEA0314A833396123FA5C8AD6D99C5A42CAE83462AAACAECDD49B7085B099A9A5A8DED45CA2D3D442ACAFA90CCCCCD242526F6826D069672E35589E9C8DD0F08972067BF899F266A98F6E2DE0DC38A72B24FC116218D365CC7B0084C018D72360B26EEC23D5CA868F29DDFADE9469FA19F8E9D0AAD69A0DD92230FC6CC8600F7F366466D2E267E4B1ACC4E0F8580A53782379F5C9B47BCE0996ED7A3A34BAB96BE5BB590374D3E52249421765B3407171585CFB34EDA7399CD57D0794F746BC47A21DA3818ED896474B68DF6C31A8EEF125F42181D6859B5FAC4E41E2024F7623ED90D7C3B07247551856DF27358DFB5AD249231DC6AC116087A084CE5484893C2D10765104FC4E2F092D0DB730D6F74A87587309238899C24E4F9828575F1F31032A3DC2A0747968EC7011D71E889AAC5537E65D296C3DEED2ADCE4E62B22377D6C46591BF6D2530DB3DB683E06C77898901DAABD07D04687156310D00F1E07268012A9C9834015AA4543B09D0A6C7F610A04D97BCB900CD8FA8A6E32F9C570F2D3C9B07E5DD6FEBADEEDA436C36FC7160A199E79EB40DA12D602C87E7E58255C217A2389C513B8BF35952A4BA628830F03924CD2B9B3ADF55E6A14E3B8818446D8075A07580161F5125206942F530AEBCCB6BB5AEC8227AC096F76EADB0C5DA2FC072312063F31F933941FD276731388D4E1F55CFAA689082DCE8B0C0E12802425CBC9A1D37708AEE5E56768C492EDC271BE63A560C468B833A32578D93CACE0CEEA53234BBBDA44AC8FAA4641B7949489F345E2A3B33B8978A18ED76922229E891166CE4A2E6163ED0642B6F3AAADDA6AA1B3B39C7AC28183B1A32DAF8164411C22B8E9C569458F39C9936FD66DE9FB215E4188E9B28985B95B5952612C66005855AAA9A5A9A7D29BF04042C00BBE7997A8124A6DC5B35CB7FA992DF3EE5412CF781529AFD3B6FA1A03E34F65A3919293066B48701CB68B26B74C5F8AB9B5B8C2C087C102B6EEEA7A19F06589F60E95BE7DFEFF8F679898C307604FBA5044AF29694E6365D6F3430F2A4186890AAFC65FD81D243E8DC5D669FBCC37519A91EA5BCA0E2517497567B1B385D22D36BB0C41CB1FF5875226C675E71B41E1E842B36C7E2893B3C185F6E8E56737378ACBAD41CA920DFF03045514F0C8EBF21817175E6A84D8A0D8FD9AC31471478343CA450D5C34A9E2DD33092AF580B4FE351B584B906991FC3A3CBB53DA25266CA34C253AE5E035B61B358678EAA20D3F0C08A6A73EC9A59236E1407BC3B6B4F676B6FCFF9017EB3FD5983B19D557F98ED9DE329F0405C714FAC8289208115E507194DDA53ECDAD194DFDB6C164D1A0CFDCAD3F8C2DF5C785A69097ACCC667FBC6E2DE465BD0E3F58BD9AD4686748815452AEDD5615638B48E8B0364F7332BE944998BD856E946BAB1BF2604062326309AFFEA4F7D04D9325E0ADC028C9630213955C5A661772ABCD43A9C57534E9278BEE200AE7B3AD51CB31DB0CEF03388DD2710CB1C900D5E16D5A0D2F5FA35F6E0CBC4FE3D6B759EDDD4B07F65C547D675F209A35F535AF118A7D0FA43E6B40EF3D2A2FD2079A0EF62CCBD7AFDDFCF79D323EB3EA633E6DC3A167CB9CE08375FCBF4B2266FBA81356BBFA179BB134A7AA05222FF33002FFFE2E1D67B84B2119CF8D06423B0C66312A5FF84A9BFFEDB91052283BC1BD9A8BFCAB7211B212ADE7F0C8537880B75EF3BD6C1D2BEEDF0E84F92BDEDE819CBCAB71EEB98A67DE781707F30F19587F9825BB6DCE3A6AA38FDED62F1CDFCDCC992DF8832BBEF5D5822D36F34D165C27C0FB80D48F16B44C61BE3930F960728E8E28361EF33B4B7CE113F145A784DD8D92F1B7C9704F0968F7C7F2BDEF701301515CCABFDB3BB771D6BBA1BEB03A7C8F6E3701F58B0157CBCFD33B5771D6CBA0BED030FB65E7CEC038BB57DED9F7B8E34E32D74EFEC6A9928A6F9F2A4BAF5EE624FE79F08E8097F11D220C833CAFCD1AB9AAED74635EE50588BE895EA7982A26269E2487A258976B5FDFA5A6CF8AD9D2D64DAD56AD8B56DBA8BF5BF557721D3AE5BC359DD07EF5BC91A5571F13BD6B1364ADB5BE279377AD2F1ACA02B676DA511BC255AF7204E69CC1ECDD7F0B7C3E21EC425434E9D1EAC6DF9C336DD3BB9BF324AF7EF04AD6A08F6374731741BBB6625738D9761B9790B169522E2771B488047B7D48B98A0257009AD6677CCD9ABFDECDE8E7DE95840EF1ADFA7244A09ED320C167EE3C28B25016DFA336A7AD3E6F17D94FD019A21BA40CD44EC6EFE1EFF9022DFABEC9E29EE8434102CBB286E74D9581276B3BB7AAD90EE426C0854B8AF4A8A1E6110F9142CB9C773F00CD7B18D86DF0D5C01F7B5BE01D481740F44D3EDE34B045631089202A36E4F7FD218F68297EFFE0F72D07DCD6C570000, N'6.1.3-40302')
GO

--
-- Data for table dbo.AspNetUsers  (LIMIT 0,500)
--

INSERT INTO dbo.AspNetUsers (Id, Email, EmailConfirmed, PasswordHash, SecurityStamp, PhoneNumber, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEndDateUtc, LockoutEnabled, AccessFailedCount, UserName, FirstName, MiddleName, LastName)
VALUES 
  (N'6b223f21-e9c0-4954-b331-6c3e10f2fde1', N'CmDtbC3Nbo@yandex.ru', 0, CHAR(0) + CHAR(0) + N'H' + CHAR(0) + CHAR(3) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(3) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + N'￿' + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(4) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + N'(' + CHAR(0) + N'CmDtbC3Nbo@y', CHAR(3) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(3) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0), NULL, 0, 0, NULL, 1, 0, N'CmDtbC3Nbo@yandex.ru', CHAR(0) + CHAR(0) + CHAR(16) + CHAR(0), CHAR(0) + CHAR(0) + CHAR(14) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0), CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + N'ʢ')
GO

INSERT INTO dbo.AspNetUsers (Id, Email, EmailConfirmed, PasswordHash, SecurityStamp, PhoneNumber, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEndDateUtc, LockoutEnabled, AccessFailedCount, UserName, FirstName, MiddleName, LastName)
VALUES 
  (N'851f93ae-c152-43b5-b5e3-346ec1215e0b', N'pb_prof@yahoo.com', 0, CHAR(0) + CHAR(0) + N'H' + CHAR(0) + CHAR(3) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(3) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + N'￿' + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(4) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(14) + CHAR(0) + N'ranger7' + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0), CHAR(3) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(3) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0), NULL, 0, 0, NULL, 1, 0, N'ranger7', CHAR(0) + CHAR(0) + CHAR(16) + CHAR(0) + CHAR(0) + CHAR(0), CHAR(0) + CHAR(0) + CHAR(16) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0), CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + N'ʢ' + CHAR(0))
GO

INSERT INTO dbo.AspNetUsers (Id, Email, EmailConfirmed, PasswordHash, SecurityStamp, PhoneNumber, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEndDateUtc, LockoutEnabled, AccessFailedCount, UserName, FirstName, MiddleName, LastName)
VALUES 
  (N'90737e38-baa0-45c5-bf57-f413119b1f06', N'pcaptor@gmail.com', 0, CHAR(0) + CHAR(0) + N'H' + CHAR(0) + CHAR(3) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(3) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + N'￿' + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(4) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(12) + CHAR(0) + N'sadmin' + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0), CHAR(3) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(3) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0), NULL, 0, 0, NULL, 1, 0, N'sadmin', NULL, NULL, NULL)
GO

INSERT INTO dbo.AspNetUsers (Id, Email, EmailConfirmed, PasswordHash, SecurityStamp, PhoneNumber, PhoneNumberConfirmed, TwoFactorEnabled, LockoutEndDateUtc, LockoutEnabled, AccessFailedCount, UserName, FirstName, MiddleName, LastName)
VALUES 
  (N'b65291ec-ca46-4a54-bdd7-ddba44e91d99', N'net_prof@yahoo.com', 0, CHAR(0) + CHAR(0) + N'H' + CHAR(0) + CHAR(3) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(3) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + N'￿' + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(4) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(16) + CHAR(0) + N'Sadmin_1' + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0), CHAR(3) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(3) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(1) + CHAR(0), NULL, 0, 0, NULL, 1, 0, N'Sadmin_1', CHAR(0) + CHAR(0) + CHAR(16) + CHAR(0) + CHAR(0) + CHAR(0), CHAR(0) + CHAR(0) + N'
' + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0), CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0) + CHAR(0))
GO

--
-- Data for table dbo.Country  (LIMIT 0,500)
--

INSERT INTO dbo.Country (country_id, cname, cname_full, code)
VALUES 
  (1, N'Россия', N'Российская Федерация', N'ru')
GO

INSERT INTO dbo.Country (country_id, cname, cname_full, code)
VALUES 
  (2, N'США', N'Соединённые Штаты Америки', N'us')
GO

INSERT INTO dbo.Country (country_id, cname, cname_full, code)
VALUES 
  (3, N'Англия', N'Великобритания', N'gb')
GO

INSERT INTO dbo.Country (country_id, cname, cname_full, code)
VALUES 
  (4, N'Франция', N'Франция', N'fr')
GO

INSERT INTO dbo.Country (country_id, cname, cname_full, code)
VALUES 
  (5, N'Германия', N'Федеративная Республика Германия', N'de')
GO

INSERT INTO dbo.Country (country_id, cname, cname_full, code)
VALUES 
  (6, N'Канада', N'Канада', N'ca')
GO

INSERT INTO dbo.Country (country_id, cname, cname_full, code)
VALUES 
  (7, N'Италия', N'Италия', N'it')
GO

INSERT INTO dbo.Country (country_id, cname, cname_full, code)
VALUES 
  (8, N'Дания', N'Дания', N'dk')
GO

--
-- Data for table dbo.Episode  (LIMIT 0,500)
--

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (1, N'1 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (2, N'2 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (3, N'3 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (4, N'4 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (5, N'5 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (6, N'6 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (7, N'7 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (8, N'8 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (9, N'9 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (10, N'10 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (11, N'11 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (12, N'12 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (13, N'13 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (14, N'14 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (15, N'15 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (16, N'16 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (17, N'17 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (18, N'18 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (19, N'19 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (20, N'20 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (21, N'21 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (22, N'22 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (23, N'23 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (24, N'24 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (25, N'25 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (26, N'26 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (27, N'27 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (28, N'28 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (29, N'29 серия')
GO

INSERT INTO dbo.Episode (episode_id, ename)
VALUES 
  (30, N'30 серия')
GO

--
-- Data for table dbo.Film  (LIMIT 0,500)
--

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (1, N'Американская история преступлений', N'The People v. O.J. Simpson: American Crime Story', 1, 2, 2016, 1, 10, N'', N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (2, N'Хэп и Леонард', N'Hap and Leonard', 1, 2, 2016, 1, 2, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (3, N'Миллиарды', N'Billions', 1, 2, 2016, 2, 5, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (4, N'Цари и пророки', N'Of Kings and Prophets', 1, 2, 2016, 1, 2, N'Древнееврейская сага', N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (5, N'Винил', N'Vinyl', 1, 2, 2016, 1, 10, N'', N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (6, N'Беовульф', N'Beowulf: Return to the Shieldlands', 4, 2, 2016, 1, 12, N'', N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (7, N'Ранчо', N'The Ranch', 2, 2, 2016, 1, 2, N'', N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (8, N'Клоун', N'Baskets', 2, 2, 2016, 1, 5, N'', N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (9, N'Элементарно', N'Elementary', 3, 2, 2015, 5, 19, N'Канал CBS рад представить зрителю криминальный детектив «Элементарно», который основан на легендарном произведении писателя Артура Конан Дойля.', N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (10, N'Волшебники', N'The Magicians', 4, 2, 2016, 1, 13, N'', N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (11, N'Бесстыдники', N'Shameless (USA)', 2, 2, 2011, 1, 3, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (12, N'Шанс', N'Chance', 1, 2, 2016, 1, 10, N'Криминальная драма', N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (13, N'Корпорация', N'Incorporated', 4, 2, 2016, 1, 3, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (14, N'Люцифер', N'Lucifer', 4, 2, 2016, 2, 2, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (15, N'Мастера секса', N'Masters of Sex', 1, 2, 2016, 4, 9, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (16, N'Мик', N'The Mick', 2, 2, 2017, 1, 2, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (17, N'Живем сегодняшним днем', N'One Day at a Time', 2, 2, 2017, 1, 1, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (18, N'Табу', N'Taboo', 1, 3, 2017, 1, 8, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (19, N'Ложное обвинение', N'Conviction', 1, 2, 2016, 1, 1, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (20, N'Последний человек на Земле', N'The Last Man on Earth', 2, 2, 2015, 3, 11, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (21, N'Готэм', N'Gotham', 4, 2, 2016, 3, 12, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (22, N'Мегрэ', N'Maigret', 3, 3, 2016, 1, 1, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (23, N'Вне времени', N'Timeless', 4, 2, 2016, 1, 10, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (24, N'Смертельное оружие', N'Lethal Weapon', 3, 2, 2016, 1, 14, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (25, N'Хитрый Пит', N'Sneaky Pete', 1, 2, 2015, 1, 10, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (26, N'Сексуальное убийство', N'Sexy Murder', 2, 3, 2016, 1, 3, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (27, N'Шиттс Крик', N'Schitt''s Creek', 2, 2, 2016, 3, 10, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (28, N'МакГайвер', N'MacGyver', 3, 2, 2016, 1, 16, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (29, N'Ходячие мертвецы', N'The Walking Dead', 5, 2, 2010, 7, 4, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (30, N'Лучшие пончики', N'Superior Donuts', 2, 2, 2017, 1, 2, N'Комедийный сериал о забавных приключениях владельца магазина пончиков и его товарищей.', N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (31, N'Жизнь в деталях', N'Life in Pieces', 2, 2, 2015, 1, 10, NULL, N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (32, N'Болотная тварь', N'Swamp Thing', 5, 2, 2019, 1, 4, N'ужасы на болоте', N'90737e38-baa0-45c5-bf57-f413119b1f06')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (33, N'Элементарно', N'Elementary', 3, 2, 2015, 1, 2, N'детектив', N'851f93ae-c152-43b5-b5e3-346ec1215e0b')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (34, N'Инстинкт', N'Instinct', 1, 2, 2019, 1, 2, N'драма', N'851f93ae-c152-43b5-b5e3-346ec1215e0b')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (35, N'Куртизанки', N'Harlots', 1, 2, 2017, 1, 2, N'Harlots descr', N'851f93ae-c152-43b5-b5e3-346ec1215e0b')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (36, N'Люцифер', N'Lucifer', 5, 2, 2016, 1, 2, N'Lucifer descr2', N'851f93ae-c152-43b5-b5e3-346ec1215e0b')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (37, N'Крик', N'Scream', 5, 2, 2016, 1, 3, N'test descr21', N'851f93ae-c152-43b5-b5e3-346ec1215e0b')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (38, N'9-1-1', N'9-1-1', 1, 2, 2018, 1, 2, N'test756', N'851f93ae-c152-43b5-b5e3-346ec1215e0b')
GO

INSERT INTO dbo.Film (film_id, fname, fname_eng, type_id, country_id, year, season_id, episode_id, description, AspUserId)
VALUES 
  (39, N'Третий день', N'The Third Day', 1, 2, 2020, 1, 1, N'', N'b65291ec-ca46-4a54-bdd7-ddba44e91d99')
GO

--
-- Data for table dbo.FUser  (LIMIT 0,500)
--

SET IDENTITY_INSERT dbo.FUser ON
GO

INSERT INTO dbo.FUser (user_id, login, password, lastname, firstname, middlename, email, birthday, gender)
VALUES 
  (1, N'sadmin', N'sadmin', N'Дорофеев', N'Сергей', N'Валентинович', N'pcaptor@gmail.com', '19670816', 1)
GO

INSERT INTO dbo.FUser (user_id, login, password, lastname, firstname, middlename, email, birthday, gender)
VALUES 
  (2, N'pb_prof@yahoo.com', N'pb_prof@yahoo.com', N'pb_prof@yahoo.com', N'pb_prof@yahoo.com', N'pb_prof@yahoo.com', N'pb_prof@yahoo.com', NULL, NULL)
GO

INSERT INTO dbo.FUser (user_id, login, password, lastname, firstname, middlename, email, birthday, gender)
VALUES 
  (3, N'sa10', N'sql108', N'sa10', N'sa10', N'sa10', N'sa10', NULL, NULL)
GO

SET IDENTITY_INSERT dbo.FUser OFF
GO

--
-- Data for table dbo.History  (LIMIT 0,500)
--

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (1, 1, 1, 10, '20161207 02:36:57.403')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (2, 2, 1, 1, '20161207 02:36:57.403')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (3, 3, 1, 12, '20161207 02:36:57.403')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (4, 4, 1, 2, '20161207 02:36:57.407')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (5, 5, 1, 10, '20161207 02:36:57.407')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (6, 6, 1, 12, '20161207 02:36:57.407')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (7, 7, 1, 2, '20161207 02:36:57.407')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (8, 8, 1, 5, '20161207 02:36:57.407')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (9, 9, 5, 8, '20161207 02:36:57.407')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (10, 10, 1, 13, '20161207 02:36:57.407')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (11, 11, 1, 1, '20161207 03:01:58.557')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (12, 11, 1, 2, '20161207 03:02:13.463')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (13, 12, 1, 1, '20161208 06:17:55.513')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (14, 12, 1, 2, '20161212 21:41:02.463')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (15, 12, 1, 3, '20161215 02:22:41.637')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (16, 12, 1, 4, '20161215 10:10:57.713')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (17, 12, 1, 5, '20161215 10:11:09.277')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (18, 12, 1, 6, '20161215 19:54:37.823')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (19, 12, 1, 7, '20161215 23:38:47.573')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (20, 13, 1, 1, '20161216 09:13:06.423')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (21, 12, 1, 8, '20161217 02:54:03.300')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (22, 12, 1, 9, '20161219 02:16:13.457')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (23, 11, 1, 3, '20161219 09:16:13.680')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (24, 13, 1, 2, '20161220 01:29:43.423')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (25, 13, 1, 3, '20161224 03:04:39.033')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (26, 12, 1, 10, '20161224 03:16:01.293')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (27, 9, 5, 9, '20161224 03:54:22.727')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (28, 9, 5, 10, '20161225 00:09:24.643')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (29, 2, 1, 2, '20161225 00:23:17.070')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (30, 14, 2, 1, '20161225 04:07:16.757')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (31, 15, 4, 9, '20161228 11:25:52.477')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (32, 14, 2, 2, '20161228 11:26:17.950')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (33, 16, 1, 1, '20170104 07:35:06.227')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (34, 16, 1, 2, '20170104 07:37:24.770')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (35, 17, 1, 1, '20170108 03:09:11.017')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (36, 18, 1, 1, '20170108 05:21:42.543')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (37, 19, 1, 1, '20170109 09:48:33.330')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (38, 20, 3, 6, '20170114 04:20:30.437')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (39, 20, 3, 7, '20170114 04:20:51.390')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (40, 20, 3, 8, '20170115 02:14:51.200')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (41, 21, 3, 11, '20170118 11:01:23.363')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (42, 21, 3, 12, '20170118 11:01:39.580')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (43, 22, 1, 1, '20170121 05:52:40.537')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (44, 23, 1, 10, '20170123 11:30:04.310')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (45, 24, 1, 12, '20170131 10:05:08.077')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (46, 24, 1, 13, '20170131 10:05:25.327')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (47, 25, 1, 9, '20170131 10:08:36.923')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (48, 25, 1, 10, '20170131 10:09:01.410')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (49, 26, 1, 2, '20170131 11:20:06.810')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (50, 26, 1, 3, '20170131 11:28:49.147')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (51, 27, 3, 1, '20170201 11:04:29.920')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (52, 27, 3, 2, '20170201 11:04:43.203')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (53, 27, 3, 3, '20170201 11:04:52.190')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (54, 27, 3, 4, '20170201 11:05:01.673')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (55, 24, 1, 14, '20170210 08:48:26.953')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (56, 28, 1, 1, '20170210 10:00:10.973')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (57, 28, 1, 2, '20170210 10:34:07.227')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (58, 28, 1, 3, '20170213 01:54:41.780')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (59, 28, 1, 4, '20170213 02:06:32.610')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (60, 28, 1, 5, '20170213 03:55:28.030')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (61, 29, 7, 1, '20170213 05:03:20.827')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (62, 28, 1, 6, '20170214 06:13:22.033')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (63, 28, 1, 7, '20170214 06:24:06.420')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (64, 28, 1, 8, '20170214 06:39:35.583')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (65, 28, 1, 9, '20170214 23:30:47.543')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (66, 28, 1, 10, '20170215 03:51:12.730')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (67, 28, 1, 11, '20170216 06:30:58.703')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (68, 18, 1, 2, '20170217 03:06:48.730')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (69, 18, 1, 3, '20170220 06:09:38.493')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (70, 18, 1, 4, '20170224 03:18:34.010')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (71, 28, 1, 12, '20170224 06:49:42.823')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (72, 18, 1, 5, '20170225 00:56:51.360')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (73, 3, 2, 1, '20170307 04:34:43.633')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (74, 20, 3, 9, '20170307 05:42:02.293')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (75, 30, 1, 1, '20170307 06:25:56.760')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (76, 30, 1, 2, '20170307 07:20:18.020')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (77, 9, 5, 11, '20170307 08:34:34.260')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (78, 3, 2, 2, '20170313 11:38:25.817')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (79, 18, 1, 6, '20170316 11:50:36.793')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (80, 3, 2, 3, '20170322 11:53:21.510')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (81, 18, 1, 7, '20170331 03:27:14.373')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (82, 18, 1, 8, '20170402 07:57:39.230')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (83, 29, 7, 2, '20170405 10:58:42.580')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (84, 29, 7, 3, '20170408 04:13:32.100')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (85, 28, 1, 13, '20170408 04:27:48.233')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (86, 29, 7, 4, '20170414 01:30:58.760')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (87, 27, 3, 5, '20170414 01:32:15.280')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (88, 28, 1, 14, '20170414 01:32:47.707')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (89, 27, 3, 6, '20170424 20:29:17.880')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (90, 27, 3, 7, '20170427 11:52:08.807')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (91, 28, 1, 15, '20170427 11:52:19.447')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (92, 20, 3, 10, '20170428 06:49:45.810')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (93, 27, 3, 8, '20170501 04:26:16.853')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (94, 27, 3, 9, '20170509 09:02:18.277')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (95, 3, 2, 4, '20170509 09:03:06.143')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (96, 27, 3, 10, '20170511 07:27:19.540')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (97, 31, 1, 1, '20170514 00:21:55.397')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (98, 31, 1, 2, '20170524 07:43:40.247')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (99, 20, 3, 11, '20170524 07:43:50.540')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (100, 31, 1, 3, '20170530 01:55:27.773')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (101, 28, 1, 16, '20170530 01:55:57.373')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (102, 3, 2, 5, '20170603 06:52:11.887')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (103, 9, 5, 12, '20170604 09:25:40.217')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (104, 31, 1, 4, '20170605 06:09:26.517')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (105, 31, 1, 5, '20170612 04:12:49.173')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (106, 9, 5, 13, '20170612 04:13:21.970')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (107, 31, 1, 6, '20170613 00:54:14.860')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (108, 31, 1, 7, '20170615 11:22:24.413')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (109, 31, 1, 8, '20170616 02:19:37.760')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (110, 9, 5, 14, '20170617 07:14:41.120')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (111, 31, 1, 9, '20170619 12:08:09.017')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (112, 31, 1, 10, '20170710 12:13:11.640')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (113, 9, 5, 15, '20171225 15:39:14.263')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (114, 9, 5, 16, '20171225 18:21:42.023')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (115, 9, 5, 17, '20190414 01:39:38.533')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (116, 9, 5, 19, '20190721 09:57:51.897')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (117, 32, 1, 1, '20190721 09:59:20.920')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (118, 32, 1, 2, '20190721 09:59:55.590')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (119, 32, 1, 3, '20190721 10:20:28.403')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (120, 33, 1, 1, '20190721 10:22:14.190')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (121, 33, 1, 2, '20190721 10:22:50.353')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (122, 32, 1, 4, '20190721 10:28:16.080')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (123, 34, 1, 1, '20190728 05:38:59.307')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (124, 34, 1, 2, '20190728 05:41:30.960')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (125, 35, 1, 1, '20190728 05:46:35.110')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (126, 35, 1, 2, '20190728 05:47:06.287')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (127, 36, 1, 1, '20190728 06:01:14.273')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (128, 36, 1, 2, '20190728 06:01:34.913')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (129, 37, 1, 1, '20190728 13:46:14.067')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (130, 37, 1, 2, '20190728 13:56:44.187')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (131, 38, 1, 1, '20190728 14:03:02.237')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (132, 38, 1, 2, '20190728 14:03:16.967')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (133, 37, 1, 3, '20190728 14:25:27.307')
GO

INSERT INTO dbo.History (history_id, film_id, season_id, episode_id, hdate)
VALUES 
  (134, 39, 1, 1, '20200918 10:25:42.527')
GO

--
-- Data for table dbo.Season  (LIMIT 0,500)
--

INSERT INTO dbo.Season (season_id, sname)
VALUES 
  (1, N'1 сезон')
GO

INSERT INTO dbo.Season (season_id, sname)
VALUES 
  (2, N'2 сезон')
GO

INSERT INTO dbo.Season (season_id, sname)
VALUES 
  (3, N'3 сезон')
GO

INSERT INTO dbo.Season (season_id, sname)
VALUES 
  (4, N'4 сезон')
GO

INSERT INTO dbo.Season (season_id, sname)
VALUES 
  (5, N'5 сезон')
GO

INSERT INTO dbo.Season (season_id, sname)
VALUES 
  (6, N'6 сезон')
GO

INSERT INTO dbo.Season (season_id, sname)
VALUES 
  (7, N'7 сезон')
GO

INSERT INTO dbo.Season (season_id, sname)
VALUES 
  (8, N'8 сезон')
GO

INSERT INTO dbo.Season (season_id, sname)
VALUES 
  (9, N'9 сезон')
GO

INSERT INTO dbo.Season (season_id, sname)
VALUES 
  (10, N'10 сезон')
GO

--
-- Data for table dbo.Type  (LIMIT 0,500)
--

INSERT INTO dbo.Type (type_id, tname)
VALUES 
  (1, N'Драма')
GO

INSERT INTO dbo.Type (type_id, tname)
VALUES 
  (2, N'Комедия')
GO

INSERT INTO dbo.Type (type_id, tname)
VALUES 
  (3, N'Криминал')
GO

INSERT INTO dbo.Type (type_id, tname)
VALUES 
  (4, N'Фэнтези')
GO

INSERT INTO dbo.Type (type_id, tname)
VALUES 
  (5, N'Ужасы')
GO

INSERT INTO dbo.Type (type_id, tname)
VALUES 
  (6, N'Документальные')
GO

INSERT INTO dbo.Type (type_id, tname)
VALUES 
  (7, N'Программирование')
GO

--
-- Data for table dbo.UserProfile  (LIMIT 0,500)
--

SET IDENTITY_INSERT dbo.UserProfile ON
GO

INSERT INTO dbo.UserProfile (UserId, UserName)
VALUES 
  (2, N'sa10')
GO

INSERT INTO dbo.UserProfile (UserId, UserName)
VALUES 
  (1, N'sadmin')
GO

SET IDENTITY_INSERT dbo.UserProfile OFF
GO

--
-- Definition for indices : 
--

CREATE UNIQUE NONCLUSTERED INDEX RoleNameIndex ON dbo.AspNetRoles
  (Name)
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ONLINE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

CREATE UNIQUE NONCLUSTERED INDEX UserNameIndex ON dbo.AspNetUsers
  (UserName)
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ONLINE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX IX_UserId ON dbo.AspNetUserClaims
  (UserId)
WITH (
  PAD_INDEX = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ONLINE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX IX_UserId ON dbo.AspNetUserLogins
  (UserId)
WITH (
  PAD_INDEX = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ONLINE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX IX_RoleId ON dbo.AspNetUserRoles
  (RoleId)
WITH (
  PAD_INDEX = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ONLINE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX IX_UserId ON dbo.AspNetUserRoles
  (UserId)
WITH (
  PAD_INDEX = OFF,
  DROP_EXISTING = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  SORT_IN_TEMPDB = OFF,
  ONLINE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

ALTER TABLE dbo.UserProfile
ADD UNIQUE NONCLUSTERED (UserName)
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

--
-- Definition for foreign keys : 
--

ALTER TABLE dbo.AspNetUserClaims
ADD CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY (UserId) 
  REFERENCES dbo.AspNetUsers (Id) 
  ON UPDATE NO ACTION
  ON DELETE CASCADE
GO

ALTER TABLE dbo.AspNetUserLogins
ADD CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY (UserId) 
  REFERENCES dbo.AspNetUsers (Id) 
  ON UPDATE NO ACTION
  ON DELETE CASCADE
GO

ALTER TABLE dbo.AspNetUserRoles
ADD CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY (RoleId) 
  REFERENCES dbo.AspNetRoles (Id) 
  ON UPDATE NO ACTION
  ON DELETE CASCADE
GO

ALTER TABLE dbo.AspNetUserRoles
ADD CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY (UserId) 
  REFERENCES dbo.AspNetUsers (Id) 
  ON UPDATE NO ACTION
  ON DELETE CASCADE
GO

ALTER TABLE dbo.History
ADD CONSTRAINT FK_History_Episode FOREIGN KEY (episode_id) 
  REFERENCES dbo.Episode (episode_id) 
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
GO

ALTER TABLE dbo.History
ADD CONSTRAINT FK_History_Film FOREIGN KEY (film_id) 
  REFERENCES dbo.Film (film_id) 
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
GO

ALTER TABLE dbo.History
ADD CONSTRAINT FK_History_Season FOREIGN KEY (season_id) 
  REFERENCES dbo.Season (season_id) 
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
GO

ALTER TABLE dbo.Film
ADD CONSTRAINT FK_Film_AspUser FOREIGN KEY (AspUserId) 
  REFERENCES dbo.AspNetUsers (Id) 
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
GO

ALTER TABLE dbo.Film
ADD CONSTRAINT FK_Film_Country FOREIGN KEY (country_id) 
  REFERENCES dbo.Country (country_id) 
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
GO

ALTER TABLE dbo.Film
ADD CONSTRAINT FK_Film_Episode FOREIGN KEY (episode_id) 
  REFERENCES dbo.Episode (episode_id) 
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
GO

ALTER TABLE dbo.Film
ADD CONSTRAINT FK_Film_Season FOREIGN KEY (season_id) 
  REFERENCES dbo.Season (season_id) 
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
GO

ALTER TABLE dbo.Film
ADD CONSTRAINT FK_Film_Type FOREIGN KEY (type_id) 
  REFERENCES dbo.Type (type_id) 
  ON UPDATE NO ACTION
  ON DELETE NO ACTION
GO

--
-- Definition for triggers : 
--
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER dbo.Film_for_update_trigger ON dbo.Film
WITH EXECUTE AS CALLER
FOR INSERT, UPDATE
AS
BEGIN

/*
DECLARE @film_id INT;
DECLARE @episode_id INT;
DECLARE @film_id2 INT;
DECLARE @episode_id2 INT;
DECLARE @film_id3 INT;
DECLARE @episode_id3 INT;

select @film_id = film_id, @episode_id = episode_id from inserted;
select @film_id2 = film_id, @episode_id2 = episode_id from deleted;
select @film_id3 = film_id, @episode_id3 = episode_id from Film where film_id = 1;

PRINT 'inserted.film_id = ' + CONVERT(varchar(5), @film_id);
PRINT 'inserted.episode_id = ' + CONVERT(varchar(5), @episode_id);

PRINT 'deleted.film_id = ' + CONVERT(varchar(5), @film_id2);
PRINT 'deleted.episode_id = ' + CONVERT(varchar(5), @episode_id2);

PRINT 'Film.film_id = ' + CONVERT(varchar(5), @film_id3);
PRINT 'Film.episode_id = ' + CONVERT(varchar(5), @episode_id3);
*/

IF EXISTS (SELECT * FROM deleted d JOIN inserted AS i ON d.film_id = i.film_id AND ((d.season_id <> i.season_id OR d.episode_id <> i.episode_id) OR
(d.fname = '' and d.fname_eng = '' and i.fname <> '' and d.season_id = 1 and d.episode_id = 1))) OR NOT EXISTS (SELECT * FROM deleted)
BEGIN
	DECLARE @NewID int;
	SELECT @NewID = Coalesce(Max(history_id), 0) + 1 from History;

	/*
	PRINT '@NewID = ' + convert(varchar(5), @NewID);

	DECLARE @Count int;
	select @Count = count(*) from inserted;
	PRINT 'Count = ' + convert(varchar(5), @Count);
	*/

	INSERT INTO [FilmDB1].[dbo].[History]
	( [history_id],
	  [film_id],
	  [season_id],
	  [episode_id],
	  [hdate]
	)
	SELECT @NewID,
    	inserted.[film_id],
		inserted.[season_id],
		inserted.[episode_id],
		GETDATE()
	FROM inserted;
	END;
END;
GO

