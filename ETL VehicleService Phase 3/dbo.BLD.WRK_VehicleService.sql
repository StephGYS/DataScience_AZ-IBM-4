USE [DSTRAINING]
GO
/****** Object:  StoredProcedure [dbo].[__tmp1__BLD_WRK_VehicleService]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Steph GYS	
-- Create date: 20230912
-- Description:	RAW -> WRK
-- MOD DATE:   
-- =============================================


ALTER PROC [dbo].[BLD_WRK_VehicleService]


AS
BEGIN

-- =============================================
-- DROP TABLE    
-- =============================================
IF OBJECT_ID('WRK_VehicleService') IS NOT NULL
DROP TABLE [WRK_VehicleService]

-- =============================================
-- CREATE TABLE    
-- =============================================
CREATE TABLE [WRK_VehicleService]
(
	   [RowNumber]		 INT IDENTITY(1,1)
	  ,[CustomerID]		 VARCHAR(100)
      ,[CustomerSince]   DATE
      ,[Vehicle]		 VARCHAR(100)
      ,[2014]			 FLOAT
      ,[2015]			 FLOAT
      ,[2016E]			 FLOAT
 
)

-- =============================================
-- TRUNCATE TABLE     
-- =============================================
TRUNCATE TABLE [WRK_VehicleService]


-- =============================================
-- INSERT INTO     
-- =============================================
INSERT INTO [WRK_VehicleService]
(
	  [CustomerID]
      ,[CustomerSince]
      ,[Vehicle]
      ,[2014]
      ,[2015]
      ,[2016E]			 	 		 
)
SELECT
	   [CustomerID]
      ,[CustomerSince]
      ,[Vehicle]
      ,[2014]
      ,[2015]
      ,[2016E] 
FROM [Raw_VehicleService]
--EXCLUSION 
 WHERE ISNUMERIC([2015]) = 1 -- numerique
 OR [2015] = '' --non vide
--(1049998 ligne(s) affectée(s))

/*
--EXCLUDED ROW
  Select *
  FROM [DSTRAINING].[dbo].[Raw_VehicleService]
  WHERE ISNUMERIC([2015]) = 0 --pas numerique --1e error
  AND [2015] <> ''							 --2e error
*/

/*
--ADDITIONAL CHECKS
  --Afficher les doublons de CustomerID
SELECT [CustomerID], count(*)
FROM [WRK_VehicleService]
GROUP BY [CustomerID]
HAVING COUNT(*) > 1

SELECT *									 --3e error
FROM [WRK_VehicleService]
WHERE [CustomerID] like '3490750'

 --Anciennes DATES
SELECT *									--4e error
FROM [WRK_VehicleService]
WHERE [CustomerSince] < '1965-01-01'

SELECT avg([2014])
FROM [WRK_VehicleService]

SELECT max([2014])
FROM [WRK_VehicleService]

SELECT *									--5 error
FROM [WRK_VehicleService]
WHERE [2014] > 800

SELECT SUM([2016E])
FROM [WRK_VehicleService]
*/


END

/*

	SELECT * FROM [dbo].[Raw_VehicleService]

	SELECT * FROM [dbo].[WRK_VehicleService]
END
*/