USE [OFFICESUPPLIES]
GO
/****** Object:  StoredProcedure [dbo].[zzz_bckp_20200313_BLD_WRK_TransactionalData]    Script Date: 4/6/2020 6:50:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		FC
-- Create date: 2020-03-14
-- Description:	RAW -> WRK
-- Mod Date:
-- =============================================
ALTER PROC [dbo].[zzz_bckp_20200313_BLD_WRK_TransactionalData]

AS
BEGIN

-- =============================================
-- CREATE TABLE
-- =============================================
IF OBJECT_ID('WRK_TransactionalData') IS NOT NULL
DROP TABLE [WRK_TransactionalData]

-- =============================================
-- CREATE TABLE
-- =============================================
CREATE TABLE [WRK_TransactionalData]
(
	[Row Number]		INT IDENTITY(1,1)
	,[Order ID]			VARCHAR(100)
	,[Order Date]		DATE
	,[Customer ID]		VARCHAR(100)
	,[Region]			VARCHAR(1)
	,[Rep]				VARCHAR(100)
	,[Item]				VARCHAR(1000)
	,[Units]			INT
	,[Unit Price]		DECIMAL
)

-- =============================================
-- TRUNCATE TABLE
-- =============================================
TRUNCATE TABLE [WRK_TransactionalData]

-- =============================================
-- INSERT INTO
-- =============================================
INSERT INTO [WRK_TransactionalData]
(
	[Order ID]			
	,[Order Date]		
	,[Customer ID]		
	,[Region]			
	,[Rep]				
	,[Item]				
	,[Units]			
	,[Unit Price]		
)
SELECT -- Will demonstrate explicitly converting data; note that these conversions are not necessary
	[Order ID]			
	,CONVERT(DATE,[Order Date],20)		
	,[Customer ID]		
	,[Region]			
	,[Rep]				
	,[Item]				
	,CAST([Units] as INT)			
	,CAST([Unit Price] as FLOAT)
FROM RAW_TransactionalData_20200324
--(43 rows affected)

END

/* Checks:
SELECT * FROM RAW_TransactionalData_20200324

SELECT * FROM WRK_TransactionalData

SELECT COUNT(*) FROM WRK_TransactionalData

*/