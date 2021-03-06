USE [DSSCM]
GO
/****** Object:  StoredProcedure [dbo].[MySCM_ExpeditorDetail_P]    Script Date: 2018/9/3 17:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		SHENXIN
-- Create date: 20130916
-- Description:	集团化催料表
-- =============================================
ALTER PROCEDURE [dbo].[Group_BUYERFEED]
	@LoginID VARCHAR(20),
	@iCankaoNo VARCHAR(20)

AS

BEGIN

  IF @iCankaoNo IS NULL OR @iCankaoNo = ''

    SELECT SUBSTRING(DS2010..PURTD.UDF01,1,4)+'-'+SUBSTRING(DS2010..PURTD.UDF01,5,2)+'-'+SUBSTRING(DS2010..PURTD.UDF01,7,2) AS UDF01,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+SUBSTRING(TD012,7,2) AS TD012,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,
      CAST(TD008-TD015 AS int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,TC004,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024
    FROM DS2010..PURTD INNER JOIN DS2010..INVMB ON MB001 = TD004
      INNER JOIN DS2010..PURTC ON TC001 = TD001 AND TC002 = TD002
      LEFT JOIN DS2010..PURMA ON MA001 = TC004
    WHERE TC011 = @LoginID AND TC014 = 'Y' AND TD016 = 'N' AND DS2010..PURTD.UDF02 = 'Y'
    AND TD012 <= CONVERT(VARCHAR(8), GETDATE()-1,112)
    --ORDER BY TD012,TD021,TD004
    UNION
    SELECT SUBSTRING(DS2018..PURTD.UDF01,1,4)+'-'+SUBSTRING(DS2018..PURTD.UDF01,5,2)+'-'+SUBSTRING(DS2018..PURTD.UDF01,7,2) AS UDF01,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+SUBSTRING(TD012,7,2) AS TD012,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,
      CAST(TD008-TD015 AS int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,TC004,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024
    FROM DS2018..PURTD INNER JOIN DS2018..INVMB ON MB001 = TD004
      INNER JOIN DS2018..PURTC ON TC001 = TD001 AND TC002 = TD002
      LEFT JOIN DS2018..PURMA ON MA001 = TC004
    WHERE TC011 = @LoginID AND TC014 = 'Y' AND TD016 = 'N' AND DS2018..PURTD.UDF02 = 'Y'
    AND TD012 <= CONVERT(VARCHAR(8), GETDATE()-1,112)
    --ORDER BY TD012,TD021,TD004
    UNION
    SELECT SUBSTRING(DS201803..PURTD.UDF01,1,4)+'-'+SUBSTRING(DS201803..PURTD.UDF01,5,2)+'-'+SUBSTRING(DS201803..PURTD.UDF01,7,2) AS UDF01,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+SUBSTRING(TD012,7,2) AS TD012,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,
      CAST(TD008-TD015 AS int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,TC004,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024
    FROM DS201803..PURTD INNER JOIN DS201803..INVMB ON MB001 = TD004
      INNER JOIN DS201803..PURTC ON TC001 = TD001 AND TC002 = TD002
      LEFT JOIN DS201803..PURMA ON MA001 = TC004
    WHERE TC011 = @LoginID AND TC014 = 'Y' AND TD016 = 'N' AND DS201803..PURTD.UDF02 = 'Y'
    AND TD012 <= CONVERT(VARCHAR(8), GETDATE()-1,112)
    --ORDER BY TD012,TD021,TD004
    UNION
    SELECT SUBSTRING(DS201805..PURTD.UDF01,1,4)+'-'+SUBSTRING(DS201805..PURTD.UDF01,5,2)+'-'+SUBSTRING(DS201805..PURTD.UDF01,7,2) AS UDF01,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+SUBSTRING(TD012,7,2) AS TD012,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,
      CAST(TD008-TD015 AS int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,TC004,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024
    FROM DS201805..PURTD INNER JOIN DS201805..INVMB ON MB001 = TD004
      INNER JOIN DS201805..PURTC ON TC001 = TD001 AND TC002 = TD002
      LEFT JOIN DS201805..PURMA ON MA001 = TC004
    WHERE TC011 = @LoginID AND TC014 = 'Y' AND TD016 = 'N' AND DS201805..PURTD.UDF02 = 'Y'
    AND TD012 <= CONVERT(VARCHAR(8), GETDATE()-1,112)
    --ORDER BY TD012,TD021,TD004
    UNION
    SELECT SUBSTRING(DS201808..PURTD.UDF01,1,4)+'-'+SUBSTRING(DS201808..PURTD.UDF01,5,2)+'-'+SUBSTRING(DS201808..PURTD.UDF01,7,2) AS UDF01,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+SUBSTRING(TD012,7,2) AS TD012,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,
      CAST(TD008-TD015 AS int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,TC004,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024
    FROM DS201808..PURTD INNER JOIN DS201808..INVMB ON MB001 = TD004
      INNER JOIN DS201808..PURTC ON TC001 = TD001 AND TC002 = TD002
      LEFT JOIN DS201808..PURMA ON MA001 = TC004
    WHERE TC011 = @LoginID AND TC014 = 'Y' AND TD016 = 'N' AND DS201808..PURTD.UDF02 = 'Y'
    AND TD012 <= CONVERT(VARCHAR(8), GETDATE()-1,112)
    --ORDER BY TD012,TD021,TD004
    UNION
    SELECT SUBSTRING(DS201810..PURTD.UDF01,1,4)+'-'+SUBSTRING(DS201810..PURTD.UDF01,5,2)+'-'+SUBSTRING(DS201810..PURTD.UDF01,7,2) AS UDF01,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+SUBSTRING(TD012,7,2) AS TD012,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,
      CAST(TD008-TD015 AS int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,TC004,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024
    FROM DS201810..PURTD INNER JOIN DS201810..INVMB ON MB001 = TD004
      INNER JOIN DS201810..PURTC ON TC001 = TD001 AND TC002 = TD002
      LEFT JOIN DS201810..PURMA ON MA001 = TC004
    WHERE TC011 = @LoginID AND TC014 = 'Y' AND TD016 = 'N' AND DS201810..PURTD.UDF02 = 'Y'
    AND TD012 <= CONVERT(VARCHAR(8), GETDATE()-1,112)
    --ORDER BY TD012,TD021,TD004

  ELSE

    SELECT SUBSTRING(DS2010..PURTD.UDF01,1,4)+'-'+SUBSTRING(DS2010..PURTD.UDF01,5,2)+'-'+SUBSTRING(DS2010..PURTD.UDF01,7,2) AS UDF01,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+SUBSTRING(TD012,7,2) AS TD012,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,
      CAST(TD008-TD015 AS int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,TC004,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024
    FROM DS2010..PURTD INNER JOIN DS2010..INVMB ON MB001 = TD004
      INNER JOIN DS2010..PURTC ON TC001 = TD001 AND TC002 = TD002
      LEFT JOIN DS2010..PURMA ON MA001 = TC004
    WHERE TC011 = @LoginID AND (TD013+'-'+TD021) = @iCankaoNo AND TC014 = 'Y'
    AND TD012 <= CONVERT(VARCHAR(8), GETDATE()-1,112) AND TD016 = 'N' AND DS2010..PURTD.UDF02 = 'Y'
    --ORDER BY TD012,TD021,TD004
    UNION
    SELECT SUBSTRING(DS2018..PURTD.UDF01,1,4)+'-'+SUBSTRING(DS2018..PURTD.UDF01,5,2)+'-'+SUBSTRING(DS2018..PURTD.UDF01,7,2) AS UDF01,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+SUBSTRING(TD012,7,2) AS TD012,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,
      CAST(TD008-TD015 AS int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,TC004,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024
    FROM DS2018..PURTD INNER JOIN DS2018..INVMB ON MB001 = TD004
      INNER JOIN DS2018..PURTC ON TC001 = TD001 AND TC002 = TD002
      LEFT JOIN DS2018..PURMA ON MA001 = TC004
    WHERE TC011 = @LoginID AND (TD013+'-'+TD021) = @iCankaoNo AND TC014 = 'Y'
    AND TD012 <= CONVERT(VARCHAR(8), GETDATE()-1,112) AND TD016 = 'N' AND DS2018..PURTD.UDF02 = 'Y'
    --ORDER BY TD012,TD021,TD004
    UNION
    SELECT SUBSTRING(DS201803..PURTD.UDF01,1,4)+'-'+SUBSTRING(DS201803..PURTD.UDF01,5,2)+'-'+SUBSTRING(DS201803..PURTD.UDF01,7,2) AS UDF01,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+SUBSTRING(TD012,7,2) AS TD012,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,
      CAST(TD008-TD015 AS int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,TC004,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024
    FROM DS201803..PURTD INNER JOIN DS201803..INVMB ON MB001 = TD004
      INNER JOIN DS201803..PURTC ON TC001 = TD001 AND TC002 = TD002
      LEFT JOIN DS201803..PURMA ON MA001 = TC004
    WHERE TC011 = @LoginID AND (TD013+'-'+TD021) = @iCankaoNo AND TC014 = 'Y'
    AND TD012 <= CONVERT(VARCHAR(8), GETDATE()-1,112) AND TD016 = 'N' AND DS201803..PURTD.UDF02 = 'Y'
    --ORDER BY TD012,TD021,TD004
    UNION
    SELECT SUBSTRING(DS201805..PURTD.UDF01,1,4)+'-'+SUBSTRING(DS201805..PURTD.UDF01,5,2)+'-'+SUBSTRING(DS201805..PURTD.UDF01,7,2) AS UDF01,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+SUBSTRING(TD012,7,2) AS TD012,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,
      CAST(TD008-TD015 AS int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,TC004,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024
    FROM DS201805..PURTD INNER JOIN DS201805..INVMB ON MB001 = TD004
      INNER JOIN DS201805..PURTC ON TC001 = TD001 AND TC002 = TD002
      LEFT JOIN DS201805..PURMA ON MA001 = TC004
    WHERE TC011 = @LoginID AND (TD013+'-'+TD021) = @iCankaoNo AND TC014 = 'Y'
    AND TD012 <= CONVERT(VARCHAR(8), GETDATE()-1,112) AND TD016 = 'N' AND DS201805..PURTD.UDF02 = 'Y'
    --ORDER BY TD012,TD021,TD004
    UNION
    SELECT SUBSTRING(DS201808..PURTD.UDF01,1,4)+'-'+SUBSTRING(DS201808..PURTD.UDF01,5,2)+'-'+SUBSTRING(DS201808..PURTD.UDF01,7,2) AS UDF01,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+SUBSTRING(TD012,7,2) AS TD012,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,
      CAST(TD008-TD015 AS int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,TC004,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024
    FROM DS201808..PURTD INNER JOIN DS201808..INVMB ON MB001 = TD004
      INNER JOIN DS201808..PURTC ON TC001 = TD001 AND TC002 = TD002
      LEFT JOIN DS201808..PURMA ON MA001 = TC004
    WHERE TC011 = @LoginID AND (TD013+'-'+TD021) = @iCankaoNo AND TC014 = 'Y'
    AND TD012 <= CONVERT(VARCHAR(8), GETDATE()-1,112) AND TD016 = 'N' AND DS201808..PURTD.UDF02 = 'Y'
    --ORDER BY TD012,TD021,TD004
    UNION
    SELECT SUBSTRING(DS201810..PURTD.UDF01,1,4)+'-'+SUBSTRING(DS201810..PURTD.UDF01,5,2)+'-'+SUBSTRING(DS201810..PURTD.UDF01,7,2) AS UDF01,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+SUBSTRING(TD012,7,2) AS TD012,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,
      CAST(TD008-TD015 AS int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,TC004,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024
    FROM DS201810..PURTD INNER JOIN DS201810..INVMB ON MB001 = TD004
      INNER JOIN DS201810..PURTC ON TC001 = TD001 AND TC002 = TD002
      LEFT JOIN DS201810..PURMA ON MA001 = TC004
    WHERE TC011 = @LoginID AND (TD013+'-'+TD021) = @iCankaoNo AND TC014 = 'Y'
    AND TD012 <= CONVERT(VARCHAR(8), GETDATE()-1,112) AND TD016 = 'N' AND DS201810..PURTD.UDF02 = 'Y'
    --ORDER BY TD012,TD021,TD004

END

