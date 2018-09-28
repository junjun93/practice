USE [DSSCM]
GO
/****** Object:  StoredProcedure [dbo].[WeekPlan]    Script Date: 2018/9/12 9:09:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		SHENXIN
-- Create date: 20130916
-- Description:	集团化周计划
-- =============================================
ALTER PROCEDURE [dbo].[WeekPlan]
	-- 周计划查询（采购员用）
	@LoginID VARCHAR(20),
	@iSupplier VARCHAR(20)

AS
BEGIN


IF @iSupplier IS  NULL OR @iSupplier=''
BEGIN
	SELECT SUBSTRING(TA009,1,4)+'-'+SUBSTRING(TA009,5,2)+'-'+SUBSTRING(TA009,7,2) AS TA009,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+ SUBSTRING(TD012,7,2) AS TD012,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+ SUBSTRING(TC024,7,2) AS TC024,TC004,TC021,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,cast(TD008 as int) as TD008,cast(TD015 as int) as TD015
	,CAST(TD008-TD015-CAST(ISNULL(SUMTH015,'0') AS INT) as int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,SUBSTRING(PURTD.UDF01,1,4)+'-'+SUBSTRING(PURTD.UDF01,5,2)+'-'+SUBSTRING(PURTD.UDF01,7,2) AS UDF01,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024,CAST(ISNULL(SUMTH015,'0') AS INT) AS CASTSUMTH015,CAST(ISNULL(MB064,'0') AS INT) AS MB064,PURTD.UDF04 as UDF04
	FROM DS2010..PURTD AS PURTD INNER JOIN DS2010..INVMB ON MB001=TD004
	INNER JOIN DS2010..PURTC AS PURTC ON TC001=TD001 AND TC002=TD002
	LEFT JOIN DS2010..PURMA ON MA001=TC004
	LEFT JOIN DS2010..MOCTA ON TD013=TA001 AND TD021=TA002
	LEFT JOIN (SELECT TH011,TH012,TH013,SUM(TH007) AS SUMTH015 FROM DS2010..PURTH WHERE TH030='N' GROUP BY TH011,TH012,TH013) AS PURTHDATE
		ON PURTHDATE.TH011=PURTD.TD001 AND PURTHDATE.TH012=PURTD.TD002 AND PURTHDATE.TH013=PURTD.TD003
	UNION
	SELECT SUBSTRING(TA009,1,4)+'-'+SUBSTRING(TA009,5,2)+'-'+SUBSTRING(TA009,7,2) AS TA009,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+ SUBSTRING(TD012,7,2) AS TD012,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+ SUBSTRING(TC024,7,2) AS TC024,TC004,TC021,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,cast(TD008 as int) as TD008,cast(TD015 as int) as TD015
	,CAST(TD008-TD015-CAST(ISNULL(SUMTH015,'0') AS INT) as int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,SUBSTRING(PURTD.UDF01,1,4)+'-'+SUBSTRING(PURTD.UDF01,5,2)+'-'+SUBSTRING(PURTD.UDF01,7,2) AS UDF01,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024,CAST(ISNULL(SUMTH015,'0') AS INT) AS CASTSUMTH015,CAST(ISNULL(MB064,'0') AS INT) AS MB064,PURTD.UDF04 as UDF04
	FROM DS2018..PURTD AS PURTD INNER JOIN DS2018..INVMB ON MB001=TD004
	INNER JOIN DS2018..PURTC AS PURTC ON TC001=TD001 AND TC002=TD002
	LEFT JOIN DS2018..PURMA ON MA001=TC004
	LEFT JOIN DS2018..MOCTA ON TD013=TA001 AND TD021=TA002
	LEFT JOIN (SELECT TH011,TH012,TH013,SUM(TH007) AS SUMTH015 FROM DS2018..PURTH WHERE TH030='N' GROUP BY TH011,TH012,TH013) AS PURTHDATE
		ON PURTHDATE.TH011=PURTD.TD001 AND PURTHDATE.TH012=PURTD.TD002 AND PURTHDATE.TH013=PURTD.TD003
	UNION
	SELECT SUBSTRING(TA009,1,4)+'-'+SUBSTRING(TA009,5,2)+'-'+SUBSTRING(TA009,7,2) AS TA009,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+ SUBSTRING(TD012,7,2) AS TD012,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+ SUBSTRING(TC024,7,2) AS TC024,TC004,TC021,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,cast(TD008 as int) as TD008,cast(TD015 as int) as TD015
	,CAST(TD008-TD015-CAST(ISNULL(SUMTH015,'0') AS INT) as int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,SUBSTRING(PURTD.UDF01,1,4)+'-'+SUBSTRING(PURTD.UDF01,5,2)+'-'+SUBSTRING(PURTD.UDF01,7,2) AS UDF01,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024,CAST(ISNULL(SUMTH015,'0') AS INT) AS CASTSUMTH015,CAST(ISNULL(MB064,'0') AS INT) AS MB064,PURTD.UDF04 as UDF04
	FROM DS201803..PURTD AS PURTD INNER JOIN DS201803..INVMB ON MB001=TD004
	INNER JOIN DS201803..PURTC AS PURTC ON TC001=TD001 AND TC002=TD002
	LEFT JOIN DS201803..PURMA ON MA001=TC004
	LEFT JOIN DS201803..MOCTA ON TD013=TA001 AND TD021=TA002
	LEFT JOIN (SELECT TH011,TH012,TH013,SUM(TH007) AS SUMTH015 FROM DS201803..PURTH WHERE TH030='N' GROUP BY TH011,TH012,TH013) AS PURTHDATE
		ON PURTHDATE.TH011=PURTD.TD001 AND PURTHDATE.TH012=PURTD.TD002 AND PURTHDATE.TH013=PURTD.TD003
	UNION
	SELECT SUBSTRING(TA009,1,4)+'-'+SUBSTRING(TA009,5,2)+'-'+SUBSTRING(TA009,7,2) AS TA009,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+ SUBSTRING(TD012,7,2) AS TD012,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+ SUBSTRING(TC024,7,2) AS TC024,TC004,TC021,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,cast(TD008 as int) as TD008,cast(TD015 as int) as TD015
	,CAST(TD008-TD015-CAST(ISNULL(SUMTH015,'0') AS INT) as int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,SUBSTRING(PURTD.UDF01,1,4)+'-'+SUBSTRING(PURTD.UDF01,5,2)+'-'+SUBSTRING(PURTD.UDF01,7,2) AS UDF01,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024,CAST(ISNULL(SUMTH015,'0') AS INT) AS CASTSUMTH015,CAST(ISNULL(MB064,'0') AS INT) AS MB064,PURTD.UDF04 as UDF04
	FROM DS201805..PURTD AS PURTD INNER JOIN DS201805..INVMB ON MB001=TD004
	INNER JOIN DS201805..PURTC AS PURTC ON TC001=TD001 AND TC002=TD002
	LEFT JOIN DS201805..PURMA ON MA001=TC004
	LEFT JOIN DS201805..MOCTA ON TD013=TA001 AND TD021=TA002
	LEFT JOIN (SELECT TH011,TH012,TH013,SUM(TH007) AS SUMTH015 FROM DS201805..PURTH WHERE TH030='N' GROUP BY TH011,TH012,TH013) AS PURTHDATE
		ON PURTHDATE.TH011=PURTD.TD001 AND PURTHDATE.TH012=PURTD.TD002 AND PURTHDATE.TH013=PURTD.TD003
	UNION
	SELECT SUBSTRING(TA009,1,4)+'-'+SUBSTRING(TA009,5,2)+'-'+SUBSTRING(TA009,7,2) AS TA009,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+ SUBSTRING(TD012,7,2) AS TD012,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+ SUBSTRING(TC024,7,2) AS TC024,TC004,TC021,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,cast(TD008 as int) as TD008,cast(TD015 as int) as TD015
	,CAST(TD008-TD015-CAST(ISNULL(SUMTH015,'0') AS INT) as int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,SUBSTRING(PURTD.UDF01,1,4)+'-'+SUBSTRING(PURTD.UDF01,5,2)+'-'+SUBSTRING(PURTD.UDF01,7,2) AS UDF01,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024,CAST(ISNULL(SUMTH015,'0') AS INT) AS CASTSUMTH015,CAST(ISNULL(MB064,'0') AS INT) AS MB064,PURTD.UDF04 as UDF04
	FROM DS201808..PURTD AS PURTD INNER JOIN DS201808..INVMB ON MB001=TD004
	INNER JOIN DS201808..PURTC AS PURTC ON TC001=TD001 AND TC002=TD002
	LEFT JOIN DS201808..PURMA ON MA001=TC004
	LEFT JOIN DS201808..MOCTA ON TD013=TA001 AND TD021=TA002
	LEFT JOIN (SELECT TH011,TH012,TH013,SUM(TH007) AS SUMTH015 FROM DS201808..PURTH WHERE TH030='N' GROUP BY TH011,TH012,TH013) AS PURTHDATE
		ON PURTHDATE.TH011=PURTD.TD001 AND PURTHDATE.TH012=PURTD.TD002 AND PURTHDATE.TH013=PURTD.TD003
	UNION
	SELECT SUBSTRING(TA009,1,4)+'-'+SUBSTRING(TA009,5,2)+'-'+SUBSTRING(TA009,7,2) AS TA009,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+ SUBSTRING(TD012,7,2) AS TD012,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+ SUBSTRING(TC024,7,2) AS TC024,TC004,TC021,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,cast(TD008 as int) as TD008,cast(TD015 as int) as TD015
	,CAST(TD008-TD015-CAST(ISNULL(SUMTH015,'0') AS INT) as int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,SUBSTRING(PURTD.UDF01,1,4)+'-'+SUBSTRING(PURTD.UDF01,5,2)+'-'+SUBSTRING(PURTD.UDF01,7,2) AS UDF01,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024,CAST(ISNULL(SUMTH015,'0') AS INT) AS CASTSUMTH015,CAST(ISNULL(MB064,'0') AS INT) AS MB064,PURTD.UDF04 as UDF04
	FROM DS201810..PURTD AS PURTD INNER JOIN DS201810..INVMB ON MB001=TD004
	INNER JOIN DS201810..PURTC AS PURTC ON TC001=TD001 AND TC002=TD002
	LEFT JOIN DS201810..PURMA ON MA001=TC004
	LEFT JOIN DS201810..MOCTA ON TD013=TA001 AND TD021=TA002
	LEFT JOIN (SELECT TH011,TH012,TH013,SUM(TH007) AS SUMTH015 FROM DS201810..PURTH WHERE TH030='N' GROUP BY TH011,TH012,TH013) AS PURTHDATE
		ON PURTHDATE.TH011=PURTD.TD001 AND PURTHDATE.TH012=PURTD.TD002 AND PURTHDATE.TH013=PURTD.TD003

	WHERE TC011=@LoginID AND TC014='Y' AND TD016='N' and DS201810..PURTD.UDF02='Y'
END


ELSE
BEGIN
  SELECT SUBSTRING(TA009,1,4)+'-'+SUBSTRING(TA009,5,2)+'-'+SUBSTRING(TA009,7,2) AS TA009,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+ SUBSTRING(TD012,7,2) AS TD012,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+ SUBSTRING(TC024,7,2) AS TC024,TC004,TC021,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,cast(TD008 as int) as TD008,cast(TD015 as int) as TD015
	,CAST(TD008-TD015-CAST(ISNULL(SUMTH015,'0') AS INT) as int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,SUBSTRING(PURTD.UDF01,1,4)+'-'+SUBSTRING(PURTD.UDF01,5,2)+'-'+SUBSTRING(PURTD.UDF01,7,2) AS UDF01,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024,CAST(ISNULL(SUMTH015,'0') AS INT) AS CASTSUMTH015,CAST(ISNULL(MB064,'0') AS INT) AS MB064,PURTD.UDF04 as UDF04
	FROM DS2010..PURTD AS PURTD INNER JOIN DS2010..INVMB ON MB001=TD004
	INNER JOIN DS2010..PURTC AS PURTC ON TC001=TD001 AND TC002=TD002
	LEFT JOIN DS2010..PURMA ON MA001=TC004
	LEFT JOIN DS2010..MOCTA ON TD013=TA001 AND TD021=TA002
	LEFT JOIN (SELECT TH011,TH012,TH013,SUM(TH007) AS SUMTH015 FROM DS2010..PURTH WHERE TH030='N' GROUP BY TH011,TH012,TH013) AS PURTHDATE
		ON PURTHDATE.TH011=PURTD.TD001 AND PURTHDATE.TH012=PURTD.TD002 AND PURTHDATE.TH013=PURTD.TD003
	UNION
	SELECT SUBSTRING(TA009,1,4)+'-'+SUBSTRING(TA009,5,2)+'-'+SUBSTRING(TA009,7,2) AS TA009,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+ SUBSTRING(TD012,7,2) AS TD012,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+ SUBSTRING(TC024,7,2) AS TC024,TC004,TC021,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,cast(TD008 as int) as TD008,cast(TD015 as int) as TD015
	,CAST(TD008-TD015-CAST(ISNULL(SUMTH015,'0') AS INT) as int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,SUBSTRING(PURTD.UDF01,1,4)+'-'+SUBSTRING(PURTD.UDF01,5,2)+'-'+SUBSTRING(PURTD.UDF01,7,2) AS UDF01,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024,CAST(ISNULL(SUMTH015,'0') AS INT) AS CASTSUMTH015,CAST(ISNULL(MB064,'0') AS INT) AS MB064,PURTD.UDF04 as UDF04
	FROM DS2018..PURTD AS PURTD INNER JOIN DS2018..INVMB ON MB001=TD004
	INNER JOIN DS2018..PURTC AS PURTC ON TC001=TD001 AND TC002=TD002
	LEFT JOIN DS2018..PURMA ON MA001=TC004
	LEFT JOIN DS2018..MOCTA ON TD013=TA001 AND TD021=TA002
	LEFT JOIN (SELECT TH011,TH012,TH013,SUM(TH007) AS SUMTH015 FROM DS2018..PURTH WHERE TH030='N' GROUP BY TH011,TH012,TH013) AS PURTHDATE
		ON PURTHDATE.TH011=PURTD.TD001 AND PURTHDATE.TH012=PURTD.TD002 AND PURTHDATE.TH013=PURTD.TD003
	UNION
	SELECT SUBSTRING(TA009,1,4)+'-'+SUBSTRING(TA009,5,2)+'-'+SUBSTRING(TA009,7,2) AS TA009,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+ SUBSTRING(TD012,7,2) AS TD012,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+ SUBSTRING(TC024,7,2) AS TC024,TC004,TC021,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,cast(TD008 as int) as TD008,cast(TD015 as int) as TD015
	,CAST(TD008-TD015-CAST(ISNULL(SUMTH015,'0') AS INT) as int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,SUBSTRING(PURTD.UDF01,1,4)+'-'+SUBSTRING(PURTD.UDF01,5,2)+'-'+SUBSTRING(PURTD.UDF01,7,2) AS UDF01,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024,CAST(ISNULL(SUMTH015,'0') AS INT) AS CASTSUMTH015,CAST(ISNULL(MB064,'0') AS INT) AS MB064,PURTD.UDF04 as UDF04
	FROM DS201803..PURTD AS PURTD INNER JOIN DS201803..INVMB ON MB001=TD004
	INNER JOIN DS201803..PURTC AS PURTC ON TC001=TD001 AND TC002=TD002
	LEFT JOIN DS201803..PURMA ON MA001=TC004
	LEFT JOIN DS201803..MOCTA ON TD013=TA001 AND TD021=TA002
	LEFT JOIN (SELECT TH011,TH012,TH013,SUM(TH007) AS SUMTH015 FROM DS201803..PURTH WHERE TH030='N' GROUP BY TH011,TH012,TH013) AS PURTHDATE
		ON PURTHDATE.TH011=PURTD.TD001 AND PURTHDATE.TH012=PURTD.TD002 AND PURTHDATE.TH013=PURTD.TD003
	UNION
	SELECT SUBSTRING(TA009,1,4)+'-'+SUBSTRING(TA009,5,2)+'-'+SUBSTRING(TA009,7,2) AS TA009,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+ SUBSTRING(TD012,7,2) AS TD012,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+ SUBSTRING(TC024,7,2) AS TC024,TC004,TC021,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,cast(TD008 as int) as TD008,cast(TD015 as int) as TD015
	,CAST(TD008-TD015-CAST(ISNULL(SUMTH015,'0') AS INT) as int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,SUBSTRING(PURTD.UDF01,1,4)+'-'+SUBSTRING(PURTD.UDF01,5,2)+'-'+SUBSTRING(PURTD.UDF01,7,2) AS UDF01,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024,CAST(ISNULL(SUMTH015,'0') AS INT) AS CASTSUMTH015,CAST(ISNULL(MB064,'0') AS INT) AS MB064,PURTD.UDF04 as UDF04
	FROM DS201805..PURTD AS PURTD INNER JOIN DS201805..INVMB ON MB001=TD004
	INNER JOIN DS201805..PURTC AS PURTC ON TC001=TD001 AND TC002=TD002
	LEFT JOIN DS201805..PURMA ON MA001=TC004
	LEFT JOIN DS201805..MOCTA ON TD013=TA001 AND TD021=TA002
	LEFT JOIN (SELECT TH011,TH012,TH013,SUM(TH007) AS SUMTH015 FROM DS201805..PURTH WHERE TH030='N' GROUP BY TH011,TH012,TH013) AS PURTHDATE
		ON PURTHDATE.TH011=PURTD.TD001 AND PURTHDATE.TH012=PURTD.TD002 AND PURTHDATE.TH013=PURTD.TD003
	UNION
	SELECT SUBSTRING(TA009,1,4)+'-'+SUBSTRING(TA009,5,2)+'-'+SUBSTRING(TA009,7,2) AS TA009,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+ SUBSTRING(TD012,7,2) AS TD012,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+ SUBSTRING(TC024,7,2) AS TC024,TC004,TC021,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,cast(TD008 as int) as TD008,cast(TD015 as int) as TD015
	,CAST(TD008-TD015-CAST(ISNULL(SUMTH015,'0') AS INT) as int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,SUBSTRING(PURTD.UDF01,1,4)+'-'+SUBSTRING(PURTD.UDF01,5,2)+'-'+SUBSTRING(PURTD.UDF01,7,2) AS UDF01,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024,CAST(ISNULL(SUMTH015,'0') AS INT) AS CASTSUMTH015,CAST(ISNULL(MB064,'0') AS INT) AS MB064,PURTD.UDF04 as UDF04
	FROM DS201808..PURTD AS PURTD INNER JOIN DS201808..INVMB ON MB001=TD004
	INNER JOIN DS201808..PURTC AS PURTC ON TC001=TD001 AND TC002=TD002
	LEFT JOIN DS201808..PURMA ON MA001=TC004
	LEFT JOIN DS201808..MOCTA ON TD013=TA001 AND TD021=TA002
	LEFT JOIN (SELECT TH011,TH012,TH013,SUM(TH007) AS SUMTH015 FROM DS201808..PURTH WHERE TH030='N' GROUP BY TH011,TH012,TH013) AS PURTHDATE
		ON PURTHDATE.TH011=PURTD.TD001 AND PURTHDATE.TH012=PURTD.TD002 AND PURTHDATE.TH013=PURTD.TD003
	UNION
	SELECT SUBSTRING(TA009,1,4)+'-'+SUBSTRING(TA009,5,2)+'-'+SUBSTRING(TA009,7,2) AS TA009,SUBSTRING(TD012,1,4)+'-'+SUBSTRING(TD012,5,2)+'-'+ SUBSTRING(TD012,7,2) AS TD012,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+ SUBSTRING(TC024,7,2) AS TC024,TC004,TC021,TD001+'-'+TD002+'-'+TD003 AS DOCNO,TD004,MB002,MB003,TD009,cast(TD008 as int) as TD008,cast(TD015 as int) as TD015
	,CAST(TD008-TD015-CAST(ISNULL(SUMTH015,'0') AS INT) as int) AS SCMQUANTITY,TD013+'-'+TD021 AS CANKAONO,SUBSTRING(PURTD.UDF01,1,4)+'-'+SUBSTRING(PURTD.UDF01,5,2)+'-'+SUBSTRING(PURTD.UDF01,7,2) AS UDF01,MA002,SUBSTRING(TC024,1,4)+'-'+SUBSTRING(TC024,5,2)+'-'+SUBSTRING(TC024,7,2) AS TC024,CAST(ISNULL(SUMTH015,'0') AS INT) AS CASTSUMTH015,CAST(ISNULL(MB064,'0') AS INT) AS MB064,PURTD.UDF04 as UDF04
	FROM DS201810..PURTD AS PURTD INNER JOIN DS201810..INVMB ON MB001=TD004
	INNER JOIN DS201810..PURTC AS PURTC ON TC001=TD001 AND TC002=TD002
	LEFT JOIN DS201810..PURMA ON MA001=TC004
	LEFT JOIN DS201810..MOCTA ON TD013=TA001 AND TD021=TA002
	LEFT JOIN (SELECT TH011,TH012,TH013,SUM(TH007) AS SUMTH015 FROM DS201810..PURTH WHERE TH030='N' GROUP BY TH011,TH012,TH013) AS PURTHDATE
		ON PURTHDATE.TH011=PURTD.TD001 AND PURTHDATE.TH012=PURTD.TD002 AND PURTHDATE.TH013=PURTD.TD003
  WHERE TC011=@LoginID AND TC014='Y' AND TD016='N' AND TC004=@iSupplier AND PURTD.UDF02='Y'

END

END
