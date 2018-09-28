--老
ALTER TRIGGER [trig_COPTD_UPDATEdyxs] ON [dbo].[COPTD]
after  insert, update
AS
BEGIN TRAN
--门头：款式颜色拉手铰链（数量）门铃   猫眼锁具
DECLARE @PZFA VARCHAR(20),@ph varchar(20)
SET @PZFA='%'
set @ph=''
select @ph=TD004, @PZFA=TD053 from INSERTED
--订单门
if( @ph like '1%' and substring(@ph,6,2)='99' )-- len(rtrim(@PZFA))>1   --20120815调整len()>1-->substring()='99'
BEGIN
	DECLARE @mkys  char(30)      --门框样式
	set	@mkys='无 '
	select @mkys =  substring(C.MB002,1,charindex('/',C.MB002)-1) FROM COPTR A
	JOIN inserted B ON A.TR002=B.TD053 and TR001=TD004
	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 LIKE '256011%' AND A.TR017 = 'Y'

	DECLARE @kuanshi  char(30),@kuanshi1 char(30),@kuanshi2 char(30)   --款式
	set @kuanshi='无 '
	select @kuanshi1 = min(RTRIM(C.MB002)+rtrim(C.MB003)),@kuanshi2=max(RTRIM(C.MB002)+rtrim(C.MB003))
	FROM COPTR A
	INNER JOIN inserted B ON A.TR002= B.TD053 AND A.TR001=B.TD004
	INNER JOIN INVMB C ON A.TR009=C.MB001
	WHERE  A.TR009 >= '25102000' and A.TR009 < '25102800' AND A.TR017 = 'Y'
	if(rtrim(@kuanshi1) = rtrim(@kuanshi2))
	begin
		set @kuanshi=@kuanshi1
	end
	else
		set @kuanshi=rtrim(@kuanshi1)+'+'+rtrim(@kuanshi2)

	DECLARE @yanse  char(30)     --颜色
	set @yanse='无  '
	select @yanse = substring(C.MB002,1,15) FROM COPTR A
	JOIN inserted B ON A.TR002= B.TD053 and TR001=TD004
	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 LIKE '25603%' AND A.TR017 = 'Y'

	DECLARE @lashou  char(50),@lashou1 varchar(25),@lashou2 varchar(25)     --拉手
	set @lashou='无 '
	select @lashou1 = min(RTRIM(C.MB002)+C.MB003),@lashou2=max(RTRIM(C.MB002)+C.MB003)
	FROM COPTR A
	INNER JOIN inserted B ON A.TR002= B.TD053 AND A.TR001=B.TD004
	INNER JOIN INVMB C ON A.TR009=C.MB001
	WHERE  A.TR009 LIKE '30303%' AND A.TR017 = 'Y'

	if(rtrim(@lashou1) = rtrim(@lashou2))
	begin
		set @lashou=@lashou1
	end
	else
	begin
		set @lashou=rtrim(@lashou1)+'+'+rtrim(@lashou2)
	END

	DECLARE @jiaolian  char(30), @jlsl    char(5)     --铰链
	set @jiaolian='无 '
	select @jiaolian = substring(C.MB002,1,15),@jlsl=CAST(cast(TR010/TR011 as smallint) AS CHAR(5)) FROM COPTR A
	JOIN inserted B ON A.TR002=B.TD053 and TR001=TD004
	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 LIKE '25604%' AND A.TR017 = 'Y'

	DECLARE @jiegou  char(30)     --结构
		set @jiegou='无 '
	select @jiegou =  substring(C.MB002,1,15) FROM COPTR A
	JOIN inserted B ON A.TR002= B.TD053
	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 LIKE '251029%' AND A.TR017 = 'Y' and TR001=TD004

	DECLARE @kaixiang  char(30)     --开向
	set @kaixiang='  '
	select @kaixiang = substring(C.MB002,1,15) FROM COPTR A
	JOIN inserted B ON A.TR002= B.TD053
	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 > '25607990' and A.TR009 < '25607995' AND A.TR017 = 'Y' and TR001=TD004

	DECLARE @zhusuo  char(30)     --主锁
	set @zhusuo='无 '
	select @zhusuo  = substring(C.MB002,8,15) FROM COPTR A
	JOIN inserted B ON A.TR002= B.TD053
	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 LIKE '25605%' AND A.TR017 = 'Y' and TR001=TD004


	DECLARE @suoxin  char(30)     --锁芯
	set @suoxin='无 '
	select @suoxin  = substring(C.MB002,1,20) FROM COPTR A  --20130423，len(C.MB002)-1-->20
	JOIN inserted B ON A.TR002= B.TD053 and A.TR001=B.TD004
	JOIN INVMB C ON A.TR009=C.MB001
	join COPTR COPB ON COPB.TR002= B.TD053 and COPB.TR001=B.TD004 AND A.TR004=COPB.TR009
	WHERE A.TR009 LIKE '30302%'  AND COPB.TR017 = 'Y'  and MB002 <> '侧锁点'

	DECLARE @maoyan  char(30)     --猫眼
	set @maoyan='无 '
	select @maoyan  = substring(C.MB002,1,7) FROM COPTR A
	JOIN inserted B ON A.TR002= B.TD053 and A.TR001=B.TD004
	JOIN INVMB C ON A.TR009=C.MB001
	WHERE A.TR009 LIKE '30311%' and A.TR009<> '30311009'  AND A.TR017 = 'Y'

	--下档类型：2560798开头。20120813添加。
	DECLARE @xiadang  char(30)     --下档类型
	set @xiadang='无 '
	select @xiadang  = substring(C.MB002,1,8) FROM COPTR A
	JOIN inserted B ON A.TR002= B.TD053 and TR001=TD004
	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 LIKE '2560798%' AND A.TR017 = 'Y'

	DECLARE @totalString1 char(90),@totalString2 char(90),@totalString3 char(100),@totalString4 char(90),@totalString5  char(90),@totalString6  char(90)     --要显示的字符串
	set @totalString1=rtrim(@kaixiang)+'/'+rtrim(@maoyan) --+'/'+
	set @totalString2=rtrim(@jiaolian)+':'+rtrim(@jlsl)
	set @totalString3=rtrim(@zhusuo)+'/'+rtrim(@suoxin)--+'-'+--+@qichuang+@jiaolian
	set @totalString4=rtrim(@lashou)--+'/'+rtrim(@mkys)
	set @totalString5=rtrim(@yanse )--+'/'+rtrim()
	set @totalString6=rtrim(@xiadang)

	update A SET A.UDF01=@totalString1,A.UDF02=@totalString2,A.UDF03=@totalString3,A.UDF04=@totalString4,A.UDF05=@totalString5,A.UDF06=@totalString6  --20130108调整,UDF06-->TD027
			--,A.TD006=A.UDF51 +'*'+A.UDF52
			,A.UDF53=CONVERT(numeric(6,2) ,LEFT(A.TD005,CHARINDEX('cm',A.TD005)-1)  )*10
	FROM COPTD A JOIN inserted B ON A.TD001=B.TD001
	WHERE A.TD002=B.TD002 AND A.TD003=B.TD003
END
else if( @ph like '1%')--20120815添加    库存门
BEGIN
	--门框样式
	set	@mkys='无 '
	select @mkys =  substring(C.MB002,1,charindex('/',C.MB002)-1) FROM COPTR A
	JOIN inserted B ON A.TR002=B.TD053 and TR001=TD004
	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 LIKE '256011%' --AND A.TR017 = 'Y'
	--款式
	set @kuanshi='无 '
	select @kuanshi1 = min(RTRIM(C.MB002)+rtrim(C.MB003)),@kuanshi2=max(RTRIM(C.MB002)+rtrim(C.MB003))
	FROM COPTR A
	INNER JOIN inserted B ON A.TR002= B.TD053 AND A.TR001=B.TD004
	INNER JOIN INVMB C ON A.TR009=C.MB001
	WHERE  A.TR009 >= '25102000' and A.TR009 < '25102800' --AND A.TR017 = 'Y'
	if(rtrim(@kuanshi1) = rtrim(@kuanshi2))
	begin
		set @kuanshi=@kuanshi1
	end
	else
		set @kuanshi=rtrim(@kuanshi1)+'+'+rtrim(@kuanshi2)
	--颜色
	set @yanse='无  '
	select @yanse = substring(C.MB002,1,15) FROM COPTR A
	JOIN inserted B ON A.TR002= B.TD053 and TR001=TD004
	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 LIKE '25603%' --AND A.TR017 = 'Y'
	--拉手
	set @lashou='无 '
	select @lashou1 = min(RTRIM(C.MB002)+C.MB003),@lashou2=max(RTRIM(C.MB002)+C.MB003)
	FROM COPTR A
	INNER JOIN inserted B ON A.TR002= B.TD053 AND A.TR001=B.TD004
	INNER JOIN INVMB C ON A.TR009=C.MB001
	WHERE  A.TR009 LIKE '30303%' --AND A.TR017 = 'Y'

	if(rtrim(@lashou1) = rtrim(@lashou2))
	begin
		set @lashou=@lashou1
	end
	else
	begin
		set @lashou=rtrim(@lashou1)+'+'+rtrim(@lashou2)
	END
--铰链
	set @jiaolian='无 '
	select @jiaolian = substring(C.MB002,1,15),@jlsl=CAST(cast(TR010/TR011 as smallint) AS CHAR(5)) FROM COPTR A
	JOIN inserted B ON A.TR002=B.TD053 and TR001=TD004
	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 LIKE '25604%'
 --结构  20120928去掉
--	set @jiegou='无 '
--	select @jiegou =  substring(C.MB002,1,15) FROM COPTR A
--	JOIN inserted B ON A.TR002= B.TD053 and TR001=TD004
--	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 LIKE '251029%' --AND A.TR017 = 'Y'

--开向
	set @kaixiang='  '
	select @kaixiang = substring(C.MB002,1,15) FROM COPTR A
	JOIN inserted B ON A.TR002= B.TD053 and TR001=TD004
	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 > '25607990' and A.TR009 < '25607995' --AND A.TR017 = 'Y'

	--主锁
	set @zhusuo='无 '
	select @zhusuo  = substring(C.MB002,8,15) FROM COPTR A
	JOIN inserted B ON A.TR002= B.TD053 and TR001=TD004
	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 LIKE '25605%' --AND A.TR017 = 'Y'
	--锁芯
	set @suoxin='无 '
	select @suoxin  = substring(C.MB002,1,20) FROM COPTR A--20130423，len(C.MB002)-1-->20
	JOIN inserted B ON A.TR002= B.TD053 and TR001=TD004
	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 LIKE '30302%'  and MB002 <> '侧锁点' --AND A.TR017 = 'Y'

	--猫眼
	set @maoyan='无 '
	select @maoyan  = substring(C.MB002,1,7) FROM COPTR A
	JOIN inserted B ON A.TR002= B.TD053 and TR001=TD004
	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 LIKE '30311%' and A.TR009<> '30311009' --AND A.TR017 = 'Y'

--	--下档
--	set @xiadang='无'
--	select @xiadang = substring(C.MB002,1,5) FROM COPTR A
--	JOIN inserted B ON A.TR002= B.TD053 and TR001=TD004
--	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 LIKE  '34403%'   --AND  A.TR017 = 'Y'

--	--包边  20120928去掉
--	set @baobian='无 '
--	select @baobian  = substring(C.MB002,1,15) FROM COPTR A
--	JOIN inserted B ON A.TR002= B.TD053 and TR001=TD004
--	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 LIKE '251028%' --AND A.TR017 = 'Y'

	--下档类型：2560798开头。20120813添加。
	--下档类型
	set @xiadang='无 '
	select @xiadang  = substring(C.MB002,1,8) FROM COPTR A
	JOIN inserted B ON A.TR002= B.TD053 and TR001=TD004
	JOIN INVMB C ON A.TR009=C.MB001  WHERE A.TR009 LIKE '2560798%' --AND A.TR017 = 'Y'

	--要显示的字符串
	set @totalString1=rtrim(@kaixiang)+'/'+rtrim(@maoyan) --+'/'+
	set @totalString2=rtrim(@jiaolian)+':'+rtrim(@jlsl)
	set @totalString3=rtrim(@zhusuo)+'/'+rtrim(@suoxin)--+'-'+--+@qichuang+@jiaolian
	set @totalString4=rtrim(@lashou)--+'/'+rtrim(@mkys)
	set @totalString5=rtrim(@yanse )--+'/'+rtrim()
	set @totalString6=rtrim(@xiadang)

	update A SET A.UDF01=@totalString1,A.UDF02=@totalString2,A.UDF03=@totalString3,A.UDF05=@totalString5,A.UDF06=@totalString6,A.UDF04=@totalString4
			--,A.TD006=A.UDF51 +'*'+A.UDF52
			,A.UDF53=CONVERT(numeric(6,2) ,LEFT(A.TD005,CHARINDEX('cm',A.TD005)-1)  )*10
	FROM COPTD A JOIN inserted B ON A.TD001=B.TD001
	WHERE A.TD002=B.TD002 AND A.TD003=B.TD003
END
--ELSE if len(rtrim(@PZFA))< 2
--BEGIN
--	declare @suoti varchar(20),@maoyan varchar(20),
--			@jiaolian varchar(20),@xiadang varchar(20)
--	set @suoti=''
--	set @suoxin=''
--	set @maoyan=''
--	set @lashou=''
--	set @jiaolian=''
--	set @xiadang='';
--	--递归查询
--DECLARE @guige varchar(30)
-- set @guige='';
--	with hgo as
--	(
--	   select *,0 as rank from BOMMD where MD001=@ph
--	   union all
--	   select h.*,h1.rank+1 from BOMMD h join hgo h1 on h.MD001=h1.MD003
--	)
--
--	select @suoti=MB002,@guige=MB003  from hgo join INVMB ON MD003=MB001 WHERE MD003 LIKE '30301%';  --锁体
--	 if @guige is  null
--		set @suoti=@suoti
--	else
--	 set @suoti=@suoti+@guige;
--set @guige='';
--	with hgo as
--	(
--	   select *,0 as rank from BOMMD where MD001=@ph
--	   union all
--	   select h.*,h1.rank+1 from BOMMD h join hgo h1 on h.MD001=h1.MD003
--	)
-- 	select @suoxin=MB002,@guige=MB003 from hgo join INVMB ON MD003=MB001 WHERE MD003 LIKE '30302%' ; --锁芯
--	if @guige is  null
--		set @suoxin=@suoxin
--	else
--	 set @suoxin=@suoxin+@guige;
--	set @guige='';
--	with hgo as
--	(
--	   select *,0 as rank from BOMMD where MD001=@ph
--	   union all
--	   select h.*,h1.rank+1 from BOMMD h join hgo h1 on h.MD001=h1.MD003
--	)
--	select @maoyan=MB002,@guige=MB003 from hgo join INVMB ON MD003=MB001 WHERE MD003 LIKE '30311%' and MD003 <> '30311009';  --猫眼
--	if @guige is  null
--		set @maoyan=@maoyan
--	else
--	 set @maoyan=@maoyan+@guige;
--	set @guige='';
--	with hgo as
--	(
--	   select *,0 as rank from BOMMD where MD001=@ph
--	   union all
--	   select h.*,h1.rank+1 from BOMMD h join hgo h1 on h.MD001=h1.MD003
--	)
--	select @lashou=MB002,@guige=MB003 from hgo join INVMB ON MD003=MB001 WHERE MD003 LIKE '30303%' ;  --拉手
--	if @guige is  null
--		set @lashou=@lashou
--	else
--	 set @lashou=@lashou+@guige;
--	declare @yongliang int
--	set @yongliang=0
--	set @guige='';
--	with hgo as
--	(
--	   select *,0 as rank from BOMMD where MD001=@ph
--	   union all
--	   select h.*,h1.rank+1 from BOMMD h join hgo h1 on h.MD001=h1.MD003
--	)
--	select @jiaolian=MB002,@guige=MB003,@yongliang=MD006 from hgo join INVMB ON MD003=MB001 WHERE MD003 LIKE '30304%'  --铰链
--	if @guige is  null
--		set @jiaolian=@jiaolian+' '+CAST(@yongliang as char(5))
--	else
--	 set @jiaolian=@jiaolian+@guige+' '+CAST(@yongliang as char(5));
--
--	update A SET A.UDF01=@suoti,A.UDF02=@suoxin,A.UDF03=@maoyan,A.UDF04=@lashou,A.UDF05=@jiaolian
--	FROM COPTD A JOIN inserted B ON A.TD001=B.TD001
--	WHERE A.TD002=B.TD002 AND A.TD003=B.TD003
--END
IF @@ERROR <>0
BEGIN
ROLLBACK TRAN
RETURN
END
COMMIT TRAN