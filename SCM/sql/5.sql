USE [DSSCM]
GO
/****** Object:  StoredProcedure [dbo].[MySCM_BuyerOntimeTTL_M]    Script Date: 2018/9/11 14:53:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		SHENXIN
-- Create date: 20130920
-- Description:	集团化采购员按期率统计表(采购员+物控主管用)
-- =============================================
ALTER PROCEDURE [dbo].[Group_BuyerOntimeTTL_M]
	@iBuyer VARCHAR(20),
	@iBeginDate VARCHAR(10),
	@iEndDate VARCHAR(10)

AS

BEGIN
  SELECT @iBeginDate = REPLACE (@iBeginDate,'-',''),@iEndDate = REPLACE (@iEndDate,'-','')

  IF @iBuyer IS  NULL OR @iBuyer=''

    SELECT TG003,TC011,SUM(ONTIMECOUNT) AS ONTIMECOUNT,SUM(TTLCOUNT) AS TTLCOUNT,
    CAST(ROUND(SUM(ONTIMECOUNT)*100/SUM(TTLCOUNT),2) AS VARCHAR)+'%' AS ONTIMEBITE,MV002
    FROM
    (
      SELECT LEFT(TG003,6) AS TG003, TC011,COUNT(*) AS ONTIMECOUNT, 0 AS TTLCOUNT,MV002
      FROM DS2010..PURTD AS PURTD INNER JOIN DS2010..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS2010..PURTH AS PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS2010..PURTG ON TG001=TH001 AND TG002=TH002
      LEFT JOIN DS2010..CMSMV ON MV001=TC011
      WHERE TG013='Y'  AND  SUBSTRING(PURTH.CREATE_DATE,1,8)<=TD012 AND SUBSTRING(PURTH.CREATE_DATE,1,8)>=PURTD.UDF01  and TG003>=REPLACE(@iBeginDate, '-', '') AND TG003<=REPLACE(@iEndDate, '-', '')
      GROUP BY LEFT(TG003,6),TC011,MV002
      UNION
      SELECT LEFT(TG003,6) AS TG003,TC011, 0 AS ONTIMECOUNT, COUNT(*) AS TTLCOUNT,MV002
      FROM DS2010..PURTD INNER JOIN DS2010..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS2010..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS2010..PURTG ON TG001=TH001 AND TG002=TH002
      LEFT JOIN DS2010..CMSMV ON MV001=TC011
      WHERE TG013='Y'   and TG003>=REPLACE(@iBeginDate, '-', '') AND TG003<=REPLACE(@iEndDate, '-', '')
      GROUP BY LEFT(TG003,6),TC011,MV002
    )
    MYSCMSQL GROUP BY TG003,TC011,MV002
    --ORDER BY TG003,TC011

    UNION

    SELECT TG003,TC011,SUM(ONTIMECOUNT) AS ONTIMECOUNT,SUM(TTLCOUNT) AS TTLCOUNT,
    CAST(ROUND(SUM(ONTIMECOUNT)*100/SUM(TTLCOUNT),2) AS VARCHAR)+'%' AS ONTIMEBITE,MV002
    FROM
    (
      SELECT LEFT(TG003,6) AS TG003, TC011,COUNT(*) AS ONTIMECOUNT, 0 AS TTLCOUNT,MV002
      FROM DS2018..PURTD AS PURTD INNER JOIN DS2018..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS2018..PURTH AS PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS2018..PURTG ON TG001=TH001 AND TG002=TH002
      LEFT JOIN DS2018..CMSMV ON MV001=TC011
      WHERE TG013='Y'  AND  SUBSTRING(PURTH.CREATE_DATE,1,8)<=TD012 AND SUBSTRING(PURTH.CREATE_DATE,1,8)>=PURTD.UDF01  and TG003>=REPLACE(@iBeginDate, '-', '') AND TG003<=REPLACE(@iEndDate, '-', '')
      GROUP BY LEFT(TG003,6),TC011,MV002
      UNION
      SELECT LEFT(TG003,6) AS TG003,TC011, 0 AS ONTIMECOUNT, COUNT(*) AS TTLCOUNT,MV002
      FROM DS2018..PURTD INNER JOIN DS2018..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS2018..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS2018..PURTG ON TG001=TH001 AND TG002=TH002
      LEFT JOIN DS2018..CMSMV ON MV001=TC011
      WHERE TG013='Y'   and TG003>=REPLACE(@iBeginDate, '-', '') AND TG003<=REPLACE(@iEndDate, '-', '')
      GROUP BY LEFT(TG003,6),TC011,MV002
    )
    MYSCMSQL GROUP BY TG003,TC011,MV002
    --ORDER BY TG003,TC011

    UNION

    SELECT TG003,TC011,SUM(ONTIMECOUNT) AS ONTIMECOUNT,SUM(TTLCOUNT) AS TTLCOUNT,
    CAST(ROUND(SUM(ONTIMECOUNT)*100/SUM(TTLCOUNT),2) AS VARCHAR)+'%' AS ONTIMEBITE,MV002
    FROM
    (
      SELECT LEFT(TG003,6) AS TG003, TC011,COUNT(*) AS ONTIMECOUNT, 0 AS TTLCOUNT,MV002
      FROM DS201803..PURTD AS PURTD INNER JOIN DS201803..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS201803..PURTH AS PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS201803..PURTG ON TG001=TH001 AND TG002=TH002
      LEFT JOIN DS201803..CMSMV ON MV001=TC011
      WHERE TG013='Y'  AND  SUBSTRING(PURTH.CREATE_DATE,1,8)<=TD012 AND SUBSTRING(PURTH.CREATE_DATE,1,8)>=PURTD.UDF01  and TG003>=REPLACE(@iBeginDate, '-', '') AND TG003<=REPLACE(@iEndDate, '-', '')
      GROUP BY LEFT(TG003,6),TC011,MV002
      UNION
      SELECT LEFT(TG003,6) AS TG003,TC011, 0 AS ONTIMECOUNT, COUNT(*) AS TTLCOUNT,MV002
      FROM DS201803..PURTD INNER JOIN DS201803..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS201803..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS201803..PURTG ON TG001=TH001 AND TG002=TH002
      LEFT JOIN DS201803..CMSMV ON MV001=TC011
      WHERE TG013='Y'   and TG003>=REPLACE(@iBeginDate, '-', '') AND TG003<=REPLACE(@iEndDate, '-', '')
      GROUP BY LEFT(TG003,6),TC011,MV002
    )
    MYSCMSQL GROUP BY TG003,TC011,MV002
    --ORDER BY TG003,TC011

    UNION

    SELECT TG003,TC011,SUM(ONTIMECOUNT) AS ONTIMECOUNT,SUM(TTLCOUNT) AS TTLCOUNT,
    CAST(ROUND(SUM(ONTIMECOUNT)*100/SUM(TTLCOUNT),2) AS VARCHAR)+'%' AS ONTIMEBITE,MV002
    FROM
    (
      SELECT LEFT(TG003,6) AS TG003, TC011,COUNT(*) AS ONTIMECOUNT, 0 AS TTLCOUNT,MV002
      FROM DS201805..PURTD AS PURTD INNER JOIN DS201805..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS201805..PURTH AS PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS201805..PURTG ON TG001=TH001 AND TG002=TH002
      LEFT JOIN DS201805..CMSMV ON MV001=TC011
      WHERE TG013='Y'  AND  SUBSTRING(PURTH.CREATE_DATE,1,8)<=TD012 AND SUBSTRING(PURTH.CREATE_DATE,1,8)>=PURTD.UDF01  and TG003>=REPLACE(@iBeginDate, '-', '') AND TG003<=REPLACE(@iEndDate, '-', '')
      GROUP BY LEFT(TG003,6),TC011,MV002
      UNION
      SELECT LEFT(TG003,6) AS TG003,TC011, 0 AS ONTIMECOUNT, COUNT(*) AS TTLCOUNT,MV002
      FROM DS201805..PURTD INNER JOIN DS201805..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS201805..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS201805..PURTG ON TG001=TH001 AND TG002=TH002
      LEFT JOIN DS201805..CMSMV ON MV001=TC011
      WHERE TG013='Y'   and TG003>=REPLACE(@iBeginDate, '-', '') AND TG003<=REPLACE(@iEndDate, '-', '')
      GROUP BY LEFT(TG003,6),TC011,MV002
    )
    MYSCMSQL GROUP BY TG003,TC011,MV002
    --ORDER BY TG003,TC011

    UNION

    SELECT TG003,TC011,SUM(ONTIMECOUNT) AS ONTIMECOUNT,SUM(TTLCOUNT) AS TTLCOUNT,
    CAST(ROUND(SUM(ONTIMECOUNT)*100/SUM(TTLCOUNT),2) AS VARCHAR)+'%' AS ONTIMEBITE,MV002
    FROM
    (
      SELECT LEFT(TG003,6) AS TG003, TC011,COUNT(*) AS ONTIMECOUNT, 0 AS TTLCOUNT,MV002
      FROM DS201808..PURTD AS PURTD INNER JOIN DS201808..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS201808..PURTH AS PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS201808..PURTG ON TG001=TH001 AND TG002=TH002
      LEFT JOIN DS201808..CMSMV ON MV001=TC011
      WHERE TG013='Y'  AND  SUBSTRING(PURTH.CREATE_DATE,1,8)<=TD012 AND SUBSTRING(PURTH.CREATE_DATE,1,8)>=PURTD.UDF01  and TG003>=REPLACE(@iBeginDate, '-', '') AND TG003<=REPLACE(@iEndDate, '-', '')
      GROUP BY LEFT(TG003,6),TC011,MV002
      UNION
      SELECT LEFT(TG003,6) AS TG003,TC011, 0 AS ONTIMECOUNT, COUNT(*) AS TTLCOUNT,MV002
      FROM DS201808..PURTD INNER JOIN DS201808..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS201808..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS201808..PURTG ON TG001=TH001 AND TG002=TH002
      LEFT JOIN DS201808..CMSMV ON MV001=TC011
      WHERE TG013='Y'   and TG003>=REPLACE(@iBeginDate, '-', '') AND TG003<=REPLACE(@iEndDate, '-', '')
      GROUP BY LEFT(TG003,6),TC011,MV002
    )
    MYSCMSQL GROUP BY TG003,TC011,MV002
    --ORDER BY TG003,TC011

    UNION

    SELECT TG003,TC011,SUM(ONTIMECOUNT) AS ONTIMECOUNT,SUM(TTLCOUNT) AS TTLCOUNT,
    CAST(ROUND(SUM(ONTIMECOUNT)*100/SUM(TTLCOUNT),2) AS VARCHAR)+'%' AS ONTIMEBITE,MV002
    FROM
    (
      SELECT LEFT(TG003,6) AS TG003, TC011,COUNT(*) AS ONTIMECOUNT, 0 AS TTLCOUNT,MV002
      FROM DS201810..PURTD AS PURTD INNER JOIN DS201810..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS201810..PURTH AS PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS201810..PURTG ON TG001=TH001 AND TG002=TH002
      LEFT JOIN DS201810..CMSMV ON MV001=TC011
      WHERE TG013='Y'  AND  SUBSTRING(PURTH.CREATE_DATE,1,8)<=TD012 AND SUBSTRING(PURTH.CREATE_DATE,1,8)>=PURTD.UDF01  and TG003>=REPLACE(@iBeginDate, '-', '') AND TG003<=REPLACE(@iEndDate, '-', '')
      GROUP BY LEFT(TG003,6),TC011,MV002
      UNION
      SELECT LEFT(TG003,6) AS TG003,TC011, 0 AS ONTIMECOUNT, COUNT(*) AS TTLCOUNT,MV002
      FROM DS201810..PURTD INNER JOIN DS201810..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS201810..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS201810..PURTG ON TG001=TH001 AND TG002=TH002
      LEFT JOIN DS201810..CMSMV ON MV001=TC011
      WHERE TG013='Y'   and TG003>=REPLACE(@iBeginDate, '-', '') AND TG003<=REPLACE(@iEndDate, '-', '')
      GROUP BY LEFT(TG003,6),TC011,MV002
    )
    MYSCMSQL GROUP BY TG003,TC011,MV002
    --ORDER BY TG003,TC011
  ELSE

    SELECT TG003,TC011,SUM(ONTIMECOUNT) AS ONTIMECOUNT,SUM(TTLCOUNT) AS TTLCOUNT,
    CAST(ROUND(SUM(ONTIMECOUNT)*100/SUM(TTLCOUNT),2) AS VARCHAR)+'%' AS ONTIMEBITE
    FROM
    (
      SELECT LEFT(TG003,6) AS TG003, TC011,COUNT(*) AS ONTIMECOUNT, 0 AS TTLCOUNT
      FROM DS2010..PURTD INNER JOIN DS2010..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS2010..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS2010..PURTG ON TG001=TH001 AND TG002=TH002
      WHERE TG013='Y'  AND TG013<=TD012 AND TG013>=DS2010..PURTD.UDF01 AND TC011=@iBuyer  and TG003>=@iBeginDate AND TG003<=@iEndDate
      GROUP BY LEFT(TG003,6),TC011
      UNION
      SELECT LEFT(TG003,6) AS TG003,TC011, 0 AS ONTIMECOUNT, COUNT(*) AS TTLCOUNT
      FROM DS2010..PURTD INNER JOIN DS2010..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS2010..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS2010..PURTG ON TG001=TH001 AND TG002=TH002
      WHERE TG013='Y'  AND TC011=@iBuyer  and TG003>=@iBeginDate AND TG003<=@iEndDate
      GROUP BY LEFT(TG003,6),TC011
    )
    MYSCMSQL GROUP BY TG003,TC011
    --ORDER BY TG003,TC011

    UNION

    SELECT TG003,TC011,SUM(ONTIMECOUNT) AS ONTIMECOUNT,SUM(TTLCOUNT) AS TTLCOUNT,
    CAST(ROUND(SUM(ONTIMECOUNT)*100/SUM(TTLCOUNT),2) AS VARCHAR)+'%' AS ONTIMEBITE
    FROM
    (
      SELECT LEFT(TG003,6) AS TG003, TC011,COUNT(*) AS ONTIMECOUNT, 0 AS TTLCOUNT
      FROM DS2018..PURTD INNER JOIN DS2018..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS2018..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS2018..PURTG ON TG001=TH001 AND TG002=TH002
      WHERE TG013='Y'  AND TG013<=TD012 AND TG013>=DS2018..PURTD.UDF01 AND TC011=@iBuyer  and TG003>=@iBeginDate AND TG003<=@iEndDate
      GROUP BY LEFT(TG003,6),TC011
      UNION
      SELECT LEFT(TG003,6) AS TG003,TC011, 0 AS ONTIMECOUNT, COUNT(*) AS TTLCOUNT
      FROM DS2018..PURTD INNER JOIN DS2018..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS2018..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS2018..PURTG ON TG001=TH001 AND TG002=TH002
      WHERE TG013='Y'  AND TC011=@iBuyer  and TG003>=@iBeginDate AND TG003<=@iEndDate
      GROUP BY LEFT(TG003,6),TC011
    )
    MYSCMSQL GROUP BY TG003,TC011
    --ORDER BY TG003,TC011

    UNION

    SELECT TG003,TC011,SUM(ONTIMECOUNT) AS ONTIMECOUNT,SUM(TTLCOUNT) AS TTLCOUNT,
    CAST(ROUND(SUM(ONTIMECOUNT)*100/SUM(TTLCOUNT),2) AS VARCHAR)+'%' AS ONTIMEBITE
    FROM
    (
      SELECT LEFT(TG003,6) AS TG003, TC011,COUNT(*) AS ONTIMECOUNT, 0 AS TTLCOUNT
      FROM DS201803..PURTD INNER JOIN DS201803..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS201803..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS201803..PURTG ON TG001=TH001 AND TG002=TH002
      WHERE TG013='Y'  AND TG013<=TD012 AND TG013>=DS201803..PURTD.UDF01 AND TC011=@iBuyer  and TG003>=@iBeginDate AND TG003<=@iEndDate
      GROUP BY LEFT(TG003,6),TC011
      UNION
      SELECT LEFT(TG003,6) AS TG003,TC011, 0 AS ONTIMECOUNT, COUNT(*) AS TTLCOUNT
      FROM DS201803..PURTD INNER JOIN DS201803..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS201803..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS201803..PURTG ON TG001=TH001 AND TG002=TH002
      WHERE TG013='Y'  AND TC011=@iBuyer  and TG003>=@iBeginDate AND TG003<=@iEndDate
      GROUP BY LEFT(TG003,6),TC011
    )
    MYSCMSQL GROUP BY TG003,TC011
    --ORDER BY TG003,TC011

    UNION

    SELECT TG003,TC011,SUM(ONTIMECOUNT) AS ONTIMECOUNT,SUM(TTLCOUNT) AS TTLCOUNT,
    CAST(ROUND(SUM(ONTIMECOUNT)*100/SUM(TTLCOUNT),2) AS VARCHAR)+'%' AS ONTIMEBITE
    FROM
    (
      SELECT LEFT(TG003,6) AS TG003, TC011,COUNT(*) AS ONTIMECOUNT, 0 AS TTLCOUNT
      FROM DS201805..PURTD INNER JOIN DS201805..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS201805..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS201805..PURTG ON TG001=TH001 AND TG002=TH002
      WHERE TG013='Y'  AND TG013<=TD012 AND TG013>=DS201805..PURTD.UDF01 AND TC011=@iBuyer  and TG003>=@iBeginDate AND TG003<=@iEndDate
      GROUP BY LEFT(TG003,6),TC011
      UNION
      SELECT LEFT(TG003,6) AS TG003,TC011, 0 AS ONTIMECOUNT, COUNT(*) AS TTLCOUNT
      FROM DS201805..PURTD INNER JOIN DS201805..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS201805..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS201805..PURTG ON TG001=TH001 AND TG002=TH002
      WHERE TG013='Y'  AND TC011=@iBuyer  and TG003>=@iBeginDate AND TG003<=@iEndDate
      GROUP BY LEFT(TG003,6),TC011
    )
    MYSCMSQL GROUP BY TG003,TC011
    --ORDER BY TG003,TC011

    UNION

    SELECT TG003,TC011,SUM(ONTIMECOUNT) AS ONTIMECOUNT,SUM(TTLCOUNT) AS TTLCOUNT,
    CAST(ROUND(SUM(ONTIMECOUNT)*100/SUM(TTLCOUNT),2) AS VARCHAR)+'%' AS ONTIMEBITE
    FROM
    (
      SELECT LEFT(TG003,6) AS TG003, TC011,COUNT(*) AS ONTIMECOUNT, 0 AS TTLCOUNT
      FROM DS201808..PURTD INNER JOIN DS201808..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS201808..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS201808..PURTG ON TG001=TH001 AND TG002=TH002
      WHERE TG013='Y'  AND TG013<=TD012 AND TG013>=DS201808..PURTD.UDF01 AND TC011=@iBuyer  and TG003>=@iBeginDate AND TG003<=@iEndDate
      GROUP BY LEFT(TG003,6),TC011
      UNION
      SELECT LEFT(TG003,6) AS TG003,TC011, 0 AS ONTIMECOUNT, COUNT(*) AS TTLCOUNT
      FROM DS201808..PURTD INNER JOIN DS201808..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS201808..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS201808..PURTG ON TG001=TH001 AND TG002=TH002
      WHERE TG013='Y'  AND TC011=@iBuyer  and TG003>=@iBeginDate AND TG003<=@iEndDate
      GROUP BY LEFT(TG003,6),TC011
    )
    MYSCMSQL GROUP BY TG003,TC011
    --ORDER BY TG003,TC011

    UNION

    SELECT TG003,TC011,SUM(ONTIMECOUNT) AS ONTIMECOUNT,SUM(TTLCOUNT) AS TTLCOUNT,
    CAST(ROUND(SUM(ONTIMECOUNT)*100/SUM(TTLCOUNT),2) AS VARCHAR)+'%' AS ONTIMEBITE
    FROM
    (
      SELECT LEFT(TG003,6) AS TG003, TC011,COUNT(*) AS ONTIMECOUNT, 0 AS TTLCOUNT
      FROM DS201810..PURTD INNER JOIN DS201810..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS201810..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS201810..PURTG ON TG001=TH001 AND TG002=TH002
      WHERE TG013='Y'  AND TG013<=TD012 AND TG013>=DS201810..PURTD.UDF01 AND TC011=@iBuyer  and TG003>=@iBeginDate AND TG003<=@iEndDate
      GROUP BY LEFT(TG003,6),TC011
      UNION
      SELECT LEFT(TG003,6) AS TG003,TC011, 0 AS ONTIMECOUNT, COUNT(*) AS TTLCOUNT
      FROM DS201810..PURTD INNER JOIN DS201810..PURTC ON TC001=TD001 AND TC002=TD002
      INNER JOIN DS201810..PURTH ON TH011=TD001 AND TH012=TD002 AND TH013=TD003
      INNER JOIN DS201810..PURTG ON TG001=TH001 AND TG002=TH002
      WHERE TG013='Y'  AND TC011=@iBuyer  and TG003>=@iBeginDate AND TG003<=@iEndDate
      GROUP BY LEFT(TG003,6),TC011
    )
    MYSCMSQL GROUP BY TG003,TC011
    --ORDER BY TG003,TC011
END

