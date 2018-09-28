SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:
-- Create date: 20180907
-- Description:	客户订单单身信息档
-- =============================================
ALTER TRIGGER [trig_COPTD_UPDATEdyxs] ON [dbo].[COPTD]
  AFTER INSERT, UPDATE
AS
  BEGIN TRAN

  --1.门头：款式颜色拉手铰链（数量）门铃   猫眼锁具
  DECLARE @PZFA VARCHAR(20), @ph VARCHAR(20)
  SET @PZFA = '%'
  SET @ph = ''
  SELECT @ph = TD004, @PZFA = TD053 FROM INSERTED
  --2.订单门  COPTR产品配置单身档 TR009品号
  IF( @ph LIKE '1%' AND SUBSTRING(@ph,6,2)='99' )-- len(RTRIM(@PZFA))>1   --20120815调整len()>1-->SUBSTRING()='99'
  BEGIN
    DECLARE @mkys CHAR(30)      --201门框样式
    SET	@mkys = '无 '
    SELECT @mkys = SUBSTRING(C.MB002,1,CHARindex('/',C.MB002)-1) FROM COPTR A
    JOIN inserted B ON A.TR002 = B.TD053 AND TR001 = TD004
    JOIN INVMB C ON A.TR009 = C.MB001 WHERE A.TR009 LIKE '256011%' AND A.TR017 = 'Y'

    DECLARE @kuanshi CHAR(30),@kuanshi1 CHAR(30),@kuanshi2 CHAR(30)   --202款式
    SET @kuanshi = '无 '
    SELECT @kuanshi1 = MIN(RTRIM(C.MB002)+RTRIM(C.MB003)),@kuanshi2 = MAX(RTRIM(C.MB002)+RTRIM(C.MB003))
    FROM COPTR A
    INNER JOIN inserted B ON A.TR002 = B.TD053 AND A.TR001 = B.TD004
    INNER JOIN INVMB C ON A.TR009 = C.MB001
    WHERE  A.TR009 >= '25102000' AND A.TR009 < '25102800' AND A.TR017 = 'Y'
    IF(RTRIM(@kuanshi1) = RTRIM(@kuanshi2))
    BEGIN
      SET @kuanshi = @kuanshi1
    END
    ELSE
      SET @kuanshi = RTRIM(@kuanshi1)+'+'+RTRIM(@kuanshi2)

    DECLARE @yanse  CHAR(30)     --203颜色
    SET @yanse = '无  '
    SELECT @yanse = SUBSTRING(C.MB002,1,15) FROM COPTR A
    JOIN inserted B ON A.TR002 = B.TD053 AND TR001 = TD004
    JOIN INVMB C ON A.TR009 = C.MB001  WHERE A.TR009 LIKE '25603%' AND A.TR017 = 'Y'

    DECLARE @lashou CHAR(50),@lashou1 VARCHAR(25),@lashou2 VARCHAR(25)     --204拉手
    SET @lashou = '无 '
    SELECT @lashou1 = MIN(RTRIM(C.MB002)+C.MB003),@lashou2 = MAX(RTRIM(C.MB002)+C.MB003)
    FROM COPTR A
    INNER JOIN inserted B ON A.TR002 = B.TD053 AND A.TR001 = B.TD004
    INNER JOIN INVMB C ON A.TR009 = C.MB001
    WHERE  A.TR009 LIKE '30303%' AND A.TR017 = 'Y'

    IF(RTRIM(@lashou1) = RTRIM(@lashou2))
    BEGIN
      SET @lashou = @lashou1
    END
    ELSE
    BEGIN
      SET @lashou = RTRIM(@lashou1)+'+'+RTRIM(@lashou2)
    END

    DECLARE @jiaolian CHAR(30), @jlsl CHAR(5)     --205铰链
    SET @jiaolian = '无 '
    SELECT @jiaolian = SUBSTRING(C.MB002,1,15),@jlsl = CAST(cast(TR010/TR011 as smallint) AS CHAR(5)) FROM COPTR A
    JOIN inserted B ON A.TR002 = B.TD053 AND TR001 = TD004
    JOIN INVMB C ON A.TR009 = C.MB001  WHERE A.TR009 LIKE '25604%' AND A.TR017 = 'Y'

    DECLARE @jiegou CHAR(30)     --206结构
      SET @jiegou = '无 '
    SELECT @jiegou = SUBSTRING(C.MB002,1,15) FROM COPTR A
    JOIN inserted B ON A.TR002 = B.TD053
    JOIN INVMB C ON A.TR009 = C.MB001 WHERE A.TR009 LIKE '251029%' AND A.TR017 = 'Y' AND TR001 = TD004

    DECLARE @kaixiang CHAR(30)     --207开向
    SET @kaixiang = '  '
    SELECT @kaixiang = SUBSTRING(C.MB002,1,15) FROM COPTR A
    JOIN inserted B ON A.TR002 = B.TD053
    JOIN INVMB C ON A.TR009 = C.MB001  WHERE A.TR009 > '25607990' AND A.TR009 < '25607995' AND A.TR017 = 'Y' AND TR001=TD004

    DECLARE @zhusuo CHAR(30)     --208主锁
    SET @zhusuo = '无 '
    SELECT @zhusuo = SUBSTRING(C.MB002,8,15) FROM COPTR A
    JOIN inserted B ON A.TR002 = B.TD053
    JOIN INVMB C ON A.TR009 = C.MB001  WHERE A.TR009 LIKE '25605%' AND A.TR017 = 'Y' AND TR001 = TD004



    DECLARE @suoxin CHAR(30)     --209锁芯
    SET @suoxin = '无 '
    SELECT @suoxin = SUBSTRING(C.MB002,1,20) FROM COPTR A  --20130423，len(C.MB002)-1-->20
    JOIN inserted B ON A.TR002 = B.TD053 AND A.TR001 = B.TD004
    JOIN INVMB C ON A.TR009 = C.MB001
    join COPTR COPB ON COPB.TR002 = B.TD053 AND COPB.TR001 = B.TD004 AND A.TR004 = COPB.TR009
    WHERE A.TR009 LIKE '30302%'  AND COPB.TR017 = 'Y'  AND MB002 <> '侧锁点'

    DECLARE @maoyan CHAR(30)     --210猫眼
    SET @maoyan = '无 '
    SELECT @maoyan = SUBSTRING(C.MB002,1,7) FROM COPTR A
    JOIN inserted B ON A.TR002 = B.TD053 AND A.TR001 = B.TD004
    JOIN INVMB C ON A.TR009 = C.MB001
    WHERE A.TR009 LIKE '30311%' AND A.TR009 <> '30311009' AND A.TR017 = 'Y'

    --下档类型：2560798开头。20120813添加。
    DECLARE @xiadang CHAR(30)     --211下档类型
    SET @xiadang = '无 '
    SELECT @xiadang = SUBSTRING(C.MB002,1,8) FROM COPTR A
    JOIN inserted B ON A.TR002 = B.TD053 AND TR001 = TD004
    JOIN INVMB C ON A.TR009 = C.MB001  WHERE A.TR009 LIKE '2560798%' AND A.TR017 = 'Y'

    DECLARE @totalString1 CHAR(90),@totalString2 CHAR(90),@totalString3 CHAR(100),@totalString4 CHAR(90),@totalString5  CHAR(90),@totalString6  CHAR(90)     --要显示的字符串
    SET @totalString1 = RTRIM(@kaixiang)+'/'+RTRIM(@maoyan) --+'/'+
    SET @totalString2 = RTRIM(@jiaolian)+':'+RTRIM(@jlsl)
    SET @totalString3 = RTRIM(@zhusuo)+'/'+RTRIM(@suoxin)--+'-'+--+@qichuang+@jiaolian
    SET @totalString4 = RTRIM(@lashou)--+'/'+RTRIM(@mkys)
    SET @totalString5 = RTRIM(@yanse )--+'/'+RTRIM()
    SET @totalString6 = RTRIM(@xiadang)

    UPDATE A SET A.UDF01 = @totalString1,A.UDF02 = @totalString2,A.UDF03 = @totalString3,A.UDF04 = @totalString4,A.UDF05 = @totalString5,A.UDF06 = @totalString6  --20130108调整,UDF06-->TD027
        --,A.TD006=A.UDF51 +'*'+A.UDF52
        ,A.UDF53 = CONVERT(NUMERIC(6,2), LEFT(A.TD005,CHARINDEX('cm',A.TD005)-1))*10
    FROM COPTD A JOIN inserted B ON A.TD001 = B.TD001
    WHERE A.TD002 = B.TD002 AND A.TD003 = B.TD003
  END
  ELSE IF(@ph LIKE '1%')--20120815添加    3.库存门
  BEGIN
    --301门框样式
    SET	@mkys ='无 '
    SELECT @mkys = SUBSTRING(C.MB002,1,CHARindex('/',C.MB002)-1) FROM COPTR A
    JOIN inserted B ON A.TR002 = B.TD053 AND TR001 = TD004
    JOIN INVMB C ON A.TR009 = C.MB001  WHERE A.TR009 LIKE '256011%' --AND A.TR017 = 'Y'
    --302款式
    SET @kuanshi = '无 '
    SELECT @kuanshi1 = min(RTRIM(C.MB002)+RTRIM(C.MB003)),@kuanshi2 = max(RTRIM(C.MB002)+RTRIM(C.MB003))
    FROM COPTR A
    INNER JOIN inserted B ON A.TR002 = B.TD053 AND A.TR001 = B.TD004
    INNER JOIN INVMB C ON A.TR009 = C.MB001
    WHERE  A.TR009 >= '25102000' AND A.TR009 < '25102800' --AND A.TR017 = 'Y'
    IF(RTRIM(@kuanshi1) = RTRIM(@kuanshi2))
    BEGIN
      SET @kuanshi = @kuanshi1
    END
    ELSE
      SET @kuanshi = RTRIM(@kuanshi1)+'+'+RTRIM(@kuanshi2)
    --303颜色
    SET @yanse='无  '
    SELECT @yanse = SUBSTRING(C.MB002,1,15) FROM COPTR A
    JOIN inserted B ON A.TR002 = B.TD053 AND TR001 = TD004
    JOIN INVMB C ON A.TR009 = C.MB001 WHERE A.TR009 LIKE '25603%' --AND A.TR017 = 'Y'
    --304拉手
    SET @lashou = '无 '
    SELECT @lashou1 = min(RTRIM(C.MB002)+C.MB003),@lashou2 = max(RTRIM(C.MB002)+C.MB003)
    FROM COPTR A
    INNER JOIN inserted B ON A.TR002 = B.TD053 AND A.TR001 = B.TD004
    INNER JOIN INVMB C ON A.TR009 = C.MB001
    WHERE  A.TR009 LIKE '30303%' --AND A.TR017 = 'Y'

    IF(RTRIM(@lashou1) = RTRIM(@lashou2))
    BEGIN
      SET @lashou = @lashou1
    END
    ELSE
    BEGIN
      SET @lashou = RTRIM(@lashou1)+'+'+RTRIM(@lashou2)
    END
    --305铰链
    SET @jiaolian = '无 '
    SELECT @jiaolian = SUBSTRING(C.MB002,1,15),@jlsl = CAST(cast(TR010/TR011 as smallint) AS CHAR(5)) FROM COPTR A
    JOIN inserted B ON A.TR002 = B.TD053 AND TR001 = TD004
    JOIN INVMB C ON A.TR009 = C.MB001  WHERE A.TR009 LIKE '25604%'

    --306开向
    SET @kaixiang = '  '
    SELECT @kaixiang = SUBSTRING(C.MB002,1,15) FROM COPTR A
    JOIN inserted B ON A.TR002 = B.TD053 AND TR001 = TD004
    JOIN INVMB C ON A.TR009 = C.MB001  WHERE A.TR009 > '25607990' AND A.TR009 < '25607995' --AND A.TR017 = 'Y'

    --307主锁
    SET @zhusuo = '无 '
    SELECT @zhusuo = SUBSTRING(C.MB002,8,15) FROM COPTR A
    JOIN inserted B ON A.TR002 = B.TD053 AND TR001 = TD004
    JOIN INVMB C ON A.TR009 = C.MB001  WHERE A.TR009 LIKE '25605%' --AND A.TR017 = 'Y'
    --308锁芯
    SET @suoxin = '无 '
    SELECT @suoxin = SUBSTRING(C.MB002,1,20) FROM COPTR A--20130423，len(C.MB002)-1-->20
    JOIN inserted B ON A.TR002 = B.TD053 AND TR001 = TD004
    JOIN INVMB C ON A.TR009 = C.MB001  WHERE A.TR009 LIKE '30302%'  AND MB002 <> '侧锁点' --AND A.TR017 = 'Y'

    --309猫眼
    SET @maoyan = '无 '
    SELECT @maoyan = SUBSTRING(C.MB002,1,7) FROM COPTR A
    JOIN inserted B ON A.TR002 = B.TD053 AND TR001 = TD004
    JOIN INVMB C ON A.TR009 = C.MB001  WHERE A.TR009 LIKE '30311%' AND A.TR009 <> '30311009' --AND A.TR017 = 'Y'


    SET @xiadang='无 '
    SELECT @xiadang = SUBSTRING(C.MB002,1,8) FROM COPTR A
    JOIN inserted B ON A.TR002 = B.TD053 AND TR001 = TD004
    JOIN INVMB C ON A.TR009 = C.MB001  WHERE A.TR009 LIKE '2560798%' --AND A.TR017 = 'Y'

    --要显示的字符串
    SET @totalString1 = RTRIM(@kaixiang)+'/'+RTRIM(@maoyan) --+'/'+
    SET @totalString2 = RTRIM(@jiaolian)+':'+RTRIM(@jlsl)
    SET @totalString3 = RTRIM(@zhusuo)+'/'+RTRIM(@suoxin)--+'-'+--+@qichuang+@jiaolian
    SET @totalString4 = RTRIM(@lashou)--+'/'+RTRIM(@mkys)
    SET @totalString5 = RTRIM(@yanse)--+'/'+RTRIM()
    SET @totalString6 = RTRIM(@xiadang)

    UPDATE A SET A.UDF01 = @totalString1,A.UDF02 = @totalString2,A.UDF03 = @totalString3,A.UDF05 = @totalString5,A.UDF06 = @totalString6,A.UDF04 = @totalString4
        --,A.TD006=A.UDF51 +'*'+A.UDF52
      ,A.UDF53 = CONVERT(NUMERIC(6,2) ,LEFT(A.TD005,CHARINDEX('cm',A.TD005)-1))*10
    FROM COPTD A JOIN inserted B ON A.TD001 = B.TD001
    WHERE A.TD002 = B.TD002 AND A.TD003 = B.TD003
  END


  IF @@ERROR <> 0
    BEGIN
      ROLLBACK TRAN
      RETURN
    END
  COMMIT TRAN

--MB008、MC006、MF012、TB009、TD011