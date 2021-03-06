USE [OFFICESUPPLIES]
GO
/****** Object:  StoredProcedure [dbo].[BLD_DRV_RevenueByCustomerGender]    Script Date: 4/6/2020 7:15:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	    FC	
-- Create date: 2020-03-24
-- Description:	WRK -> DRV
--              COMBINING TABLES: WRK_CustomerList
--                                WRK_TransactionalData
--              TO UNDERSTAND REVENUE SPLIT BY GENDER
-- Mod Date:
-- =============================================
ALTER PROC [dbo].[BLD_DRV_RevenueByCustomerGender]

AS
BEGIN

/*
DROP TABLE DRV_RevenueByCustomerGender
*/

SELECT 
	A.[Customer ID] 
	,A.Gender
	,B.Units * B.[Unit Price] AS Revenue
INTO DRV_RevenueByCustomerGender
FROM WRK_CustomerList A
LEFT JOIN WRK_TransactionalData B
ON A.[Customer ID] = B.[Customer ID]
--(43 rows affected)

END