USE [OFFICESUPPLIES]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_CustomerList]    Script Date: 4/6/2020 6:31:22 PM ******/
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
ALTER PROC [dbo].[BLD_WRK_CustomerList]

AS
BEGIN

-- =============================================
-- CREATE TABLE
-- =============================================
IF OBJECT_ID('WRK_CustomerList') IS NOT NULL
DROP TABLE [WRK_CustomerList]

-- =============================================
-- CREATE TABLE
-- =============================================
CREATE TABLE [WRK_CustomerList]
(
	[Row Number]		INT IDENTITY(1,1)
	,[Customer ID]		VARCHAR(100)
	,[City]				VARCHAR(1000)
	,[ZipCode]			VARCHAR(5)
	,[Gender]			VARCHAR(1)
	,[Age]				FLOAT
)

-- =============================================
-- TRUNCATE TABLE
-- =============================================
TRUNCATE TABLE [WRK_CustomerList]

-- =============================================
-- INSERT INTO
-- =============================================
INSERT INTO [WRK_CustomerList]
(
	[Customer ID]		
	,[City]				
	,[ZipCode]			
	,[Gender]			
	,[Age]				
)
SELECT
	RIGHT('0000000'+[Customer ID],7) -- Need to add leading zeros to match Customer ID column in other tables
	,[City]
	,[ZipCode]
	,[Gender]
	,[Age]
FROM RAW_CustomerList_20200324
--(43 rows affected)

END

/* Checks:
SELECT * FROM RAW_CustomerList_20200324

SELECT * FROM WRK_CustomerList

SELECT COUNT(*) FROM WRK_CustomerList

*/
