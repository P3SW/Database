USE [master]
GO


/* Linux */
/* N'/var/opt/mssql/data/ANS_DB_P3.mdf' 	 */
/* N'/var/opt/mssql/data/ANS_DB_P3_log.ldf' */

/* Windows */
/*N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\ANS_DB_P3.mdf'	 	*/
/*N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\ANS_DB_P3_log.ldf' 	*/

/* Original */
/*N'S:\SQLDB01\Database\ANS_DB_P3.mdf' 		*/
/*N'S:\SQLLog01\Log\ANS_DB_P3_log.ldf' 		*/


/****** Object:  Database [ANS_DB_P3]    Script Date: 27-09-2021 12:08:41 ******/
CREATE DATABASE [ANS_DB_P3]	
 CONTAINMENT = NONE
 ON  PRIMARY
( NAME = N'ANS_DB_P3', FILENAME = N'/var/opt/mssql/data/ANS_DB_P3.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )					
 LOG ON 
( NAME = N'ANS_DB_P3_log', FILENAME = N'/var/opt/mssql/data/ANS_DB_P3_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ANS_DB_P3] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ANS_DB_P3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ANS_DB_P3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET ARITHABORT OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ANS_DB_P3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ANS_DB_P3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ANS_DB_P3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ANS_DB_P3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET RECOVERY FULL 
GO
ALTER DATABASE [ANS_DB_P3] SET  MULTI_USER 
GO
ALTER DATABASE [ANS_DB_P3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ANS_DB_P3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ANS_DB_P3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ANS_DB_P3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ANS_DB_P3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ANS_DB_P3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ANS_DB_P3] SET QUERY_STORE = OFF
GO
USE [ANS_DB_P3]
GO
/****** Object:  User [aes]    Script Date: 27-09-2021 12:08:41 ******/
CREATE USER [aes] FOR LOGIN [aes] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [aes]
GO
/****** Object:  Table [dbo].[ENGINE_PROPERTIES]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ENGINE_PROPERTIES](
	[MANAGER] [nvarchar](200) NULL,
	[KEY] [nvarchar](400) NULL,
	[VALUE] [nvarchar](400) NULL,
	[TIMESTAMP] [datetime] NULL,
	[RUN_NO] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_ENGINE_PROPERTIES]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   VIEW [dbo].[V_ENGINE_PROPERTIES] AS
SELECT A.MANAGER, A.[KEY], A.VALUE, A.RUN_NO, A.[TIMESTAMP]
FROM (SELECT ENGINE_PROPERTIES.*, ROW_NUMBER() OVER (PARTITION BY MANAGER, [KEY], RUN_NO ORDER BY TIMESTAMP DESC) R
      FROM ENGINE_PROPERTIES) A
WHERE A.R = 1
;
GO
/****** Object:  Table [dbo].[AFSTEMNING]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AFSTEMNING](
	[ID] [nvarchar](400) NOT NULL,
	[AFSTEMTDATO] [datetime] NOT NULL,
	[DESCRIPTION] [nvarchar](4000) NOT NULL,
	[MANAGER] [nvarchar](400) NULL,
	[CONTEXT] [nvarchar](400) NULL,
	[SRCANTAL] [int] NULL,
	[DSTANTAL] [int] NULL,
	[CUSTOMANTAL] [int] NULL,
	[AFSTEMRESULTAT] [nvarchar](4000) NULL,
	[RUN_JOB] [nvarchar](400) NULL,
	[TOOLKIT_ID] [int] NULL,
	[SRC_SQL_COST] [int] NULL,
	[DST_SQL_COST] [int] NULL,
	[CUSTOM_SQL_COST] [int] NULL,
	[SRC_SQL] [nvarchar](4000) NULL,
	[DST_SQL] [nvarchar](4000) NULL,
	[CUSTOM_SQL] [nvarchar](4000) NULL,
	[SRC_SQL_TIME] [int] NULL,
	[DST_SQL_TIME] [int] NULL,
	[CUSTOM_SQL_TIME] [int] NULL,
	[START_TIME] [datetime] NULL,
	[END_TIME] [datetime] NULL,
	[AFSTEMNINGSDATA] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AUDIT_FK_ERRORS]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUDIT_FK_ERRORS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TABLENAME] [nvarchar](400) NULL,
	[FOREIGN_KEY_VIOLATED] [nvarchar](400) NULL,
	[ROWDATA] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AUDIT_LOGERROR]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUDIT_LOGERROR](
	[ID] [nvarchar](400) NOT NULL,
	[MGRNAME] [nvarchar](200) NOT NULL,
	[CREATED] [datetime] NOT NULL,
	[SOURCEROWS] [nvarchar](4000) NOT NULL,
	[MESSAGE] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AUDIT_LOGINFO]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUDIT_LOGINFO](
	[ID] [nvarchar](400) NOT NULL,
	[MGRNAME] [nvarchar](200) NOT NULL,
	[CREATED] [datetime] NOT NULL,
	[BUSINESSID] [int] NULL,
	[CPRNR] [nvarchar](400) NULL,
	[MESSAGE] [nvarchar](1999) NULL,
	[RECONCILIATIONVALUE] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AUDIT_LOGINFO_TYPES]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUDIT_LOGINFO_TYPES](
	[ID] [int] NOT NULL,
	[TITLE] [nvarchar](500) NULL,
	[ENUMNAME] [nvarchar](500) NULL,
	[DESCRIPTION] [nvarchar](1999) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COLUMN_VALUE]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COLUMN_VALUE](
	[ID] [nvarchar](400) NOT NULL,
	[COLUMN_NAME] [nvarchar](400) NOT NULL,
	[VALUE] [nvarchar](400) NOT NULL,
	[CREATED] [datetime] NOT NULL,
	[VOTE_COMBINATION_FK] [nvarchar](400) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEST_TABLE]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEST_TABLE](
	[MGR] [nvarchar](400) NULL,
	[ID_PREFIX] [nvarchar](25) NULL,
	[TABLE_NAME] [nvarchar](400) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EXECUTIONS]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXECUTIONS](
	[EXECUTION_ID] [bigint] NULL,
	[EXECUTION_UUID] [nvarchar](400) NULL,
	[CREATED] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HEALTH_REPORT]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HEALTH_REPORT](
	[ROW_NO] [int] NULL,
	[MONITOR_NO] [int] NULL,
	[EXECUTION_ID] [int] NULL,
	[REPORT_TYPE] [nvarchar](400) NULL,
	[REPORT_KEY] [nvarchar](max) NULL,
	[REPORT_STRING_VALUE] [nvarchar](max) NULL,
	[REPORT_NUMERIC_VALUE] [bigint] NULL,
	[REPORT_VALUE_TYPE] [nvarchar](400) NULL,
	[REPORT_VALUE_HUMAN] [varchar](250) NULL,
	[LOG_TIME] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOGGING]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGGING](
	[CREATED] [datetime] NULL,
	[LOG_MESSAGE] [nvarchar](max) NULL,
	[LOG_LEVEL] [nvarchar](80) NULL,
	[EXECUTION_ID] [bigint] NULL,
	[CONTEXT_ID] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOGGING_CONTEXT]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGGING_CONTEXT](
	[CONTEXT_ID] [bigint] NOT NULL,
	[EXECUTION_ID] [bigint] NULL,
	[CONTEXT] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MANAGER_TRACKING]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MANAGER_TRACKING](
	[MGR] [nvarchar](400) NULL,
	[STATUS] [nvarchar](400) NULL,
	[RUNTIME] [int] NULL,
	[PERFORMANCECOUNTROWSREAD] [int] NULL,
	[PERFORMANCECOUNTROWSWRITTEN] [int] NULL,
	[STARTTIME] [datetime] NULL,
	[ENDTIME] [datetime] NULL,
	[WEEK] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MIGRATION_FILE]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MIGRATION_FILE](
	[ID] [nvarchar](400) NOT NULL,
	[CONTENT] [varbinary](max) NULL,
	[FILE_NAME] [nvarchar](400) NOT NULL,
	[RELATIVE_PATH] [nvarchar](400) NULL,
	[JENKINS_JOB] [nvarchar](400) NULL,
	[TITLE] [nvarchar](400) NULL,
	[CREATED] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SEQUENCE_TRACKING]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEQUENCE_TRACKING](
	[MGR] [nvarchar](200) NULL,
	[START_SEQ_VAL] [int] NULL,
	[END_SEQ_VAL] [int] NULL,
	[TABLE_NAME] [nvarchar](400) NULL,
	[COLUMN_NAME] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STATEMENT_COLUMNS]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATEMENT_COLUMNS](
	[MGR] [nvarchar](400) NULL,
	[IDENTIFIER] [nvarchar](400) NULL,
	[IDENTIFIER_SHORT] [nvarchar](60) NULL,
	[SCHEMA_NAME] [nvarchar](60) NULL,
	[SCHEMA_NAME_FULL] [nvarchar](60) NULL,
	[TABLE_NAME] [nvarchar](400) NULL,
	[COLUMN_NAME] [nvarchar](40) NULL,
	[CREATED] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STATEMENT_JOINS]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATEMENT_JOINS](
	[MGR] [nvarchar](400) NULL,
	[IDENTIFIER] [nvarchar](400) NULL,
	[IDENTIFIER_SHORT] [nvarchar](60) NULL,
	[SCHEMA_NAME_1] [nvarchar](60) NULL,
	[SCHEMA_NAME_FULL_1] [nvarchar](60) NULL,
	[TABLE_NAME_1] [nvarchar](400) NULL,
	[COLUMN_NAME_1] [nvarchar](40) NULL,
	[SCHEMA_NAME_2] [nvarchar](60) NULL,
	[SCHEMA_NAME_FULL_2] [nvarchar](60) NULL,
	[TABLE_NAME_2] [nvarchar](400) NULL,
	[COLUMN_NAME_2] [nvarchar](40) NULL,
	[SCHEMA_NAME_3] [nvarchar](60) NULL,
	[SCHEMA_NAME_FULL_3] [nvarchar](60) NULL,
	[TABLE_NAME_3] [nvarchar](400) NULL,
	[COLUMN_NAME_3] [nvarchar](40) NULL,
	[CRITERION] [nvarchar](400) NULL,
	[CREATED] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STATEMENT_TABLES]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATEMENT_TABLES](
	[MGR] [nvarchar](400) NULL,
	[IDENTIFIER] [nvarchar](400) NULL,
	[IDENTIFIER_SHORT] [nvarchar](60) NULL,
	[SCHEMA_NAME] [nvarchar](60) NULL,
	[SCHEMA_NAME_FULL] [nvarchar](60) NULL,
	[TABLE_NAME] [nvarchar](400) NULL,
	[CREATED] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYS_HOUSEKEEPING]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYS_HOUSEKEEPING](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SRC_SCHEMA] [nvarchar](400) NULL,
	[SRC_TBL] [nvarchar](400) NULL,
	[MGR] [nvarchar](400) NULL,
	[SRC_PRIMARYKEY] [nvarchar](400) NULL,
	[KEYFROM] [int] NULL,
	[KEYTO] [int] NULL,
	[CLN_SCHEMA] [nvarchar](400) NULL,
	[CLN_TBL] [nvarchar](400) NULL,
	[CLN_PRIMARYKEY] [nvarchar](400) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYS_HOUSEKEEPING_UUID]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYS_HOUSEKEEPING_UUID](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SRC_SCHEMA] [nvarchar](400) NULL,
	[SRC_TBL] [nvarchar](400) NULL,
	[MGR] [nvarchar](400) NULL,
	[SRC_PRIMARYKEY] [nvarchar](400) NULL,
	[ID_PREFIX] [nvarchar](400) NULL,
	[CLN_SCHEMA] [nvarchar](400) NULL,
	[CLN_TBL] [nvarchar](400) NULL,
	[CLN_PRIMARYKEY] [nvarchar](400) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TABLE_LOG]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TABLE_LOG](
	[ID] [nvarchar](400) NOT NULL,
	[SCHEMA_NAME] [nvarchar](400) NOT NULL,
	[TABLE_NAME] [nvarchar](400) NOT NULL,
	[STATE] [nvarchar](400) NOT NULL,
	[CREATED] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VOTE_COMBINATION]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VOTE_COMBINATION](
	[ID] [nvarchar](400) NOT NULL,
	[VOTE_NAME] [nvarchar](400) NOT NULL,
	[SCHEMA_NAME] [nvarchar](400) NOT NULL,
	[TABLE_NAME] [nvarchar](400) NOT NULL,
	[CREATED] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VOTE_RESULT]    Script Date: 27-09-2021 12:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VOTE_RESULT](
	[ID] [nvarchar](400) NOT NULL,
	[VOTE_NAME] [nvarchar](400) NOT NULL,
	[PASSED] [nvarchar](1) NOT NULL,
	[VOTE_MESSAGE] [nvarchar](4000) NULL,
	[CREATED] [datetime] NOT NULL
) ON [PRIMARY]
GO