USE [SCM]
GO
/****** Object:  StoredProcedure [dbo].[MySCM_zjh]    Script Date: 08/09/2018 15:05:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		fangjunjun
-- Create date: 20180712
-- Description:	采购周计划明细
-- =============================================
ALTER PROCEDURE [dbo].[MySCM_zjh]

	@csocode VARCHAR(30)=NULL,
 	@cVenAbbName VARCHAR(30)=NULL,
	@cPOID  VARCHAR(30)=NULL,
	@dPODateks datetime=NULL,
	@dPODatejs datetime=NULL,
	@cInvCode VARCHAR(30)=NULL,
	@cInvName VARCHAR(30)=NULL,
	@zjh VARCHAR(30)=NULL,
	@dArriveDateks datetime=NULL,
	@dArriveDatejs datetime=NULL,
	@ksshks datetime=NULL,
	@ksshjs datetime=NULL
AS


	DECLARE @sqlStr VARCHAR(max)
	SET @sqlStr = 'SELECT  top 100 percent    ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,PO_Podetails.csocode,PO_Podetails.cFree1,
		case when ISNULL(Inventory.cInvDefine13,0)>0 then  DATEADD(DAY,-1*Inventory.cInvDefine13,CASE WHEN ISNULL(zjh.TB007,dArriveDate)<dArriveDate THEN zjh.minTB007 ELSE dArriveDate END) else dArriveDate END as kssh,
		Inventory.cInvDefine13,Vendor.cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode,cbMemo,PO_Podetails.cInvCode,
		substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,cast(iQuantity as float) as iQuantity,cInvStd,Inventory.cInvName,ComputationUnit.cComUnitName,PO_Pomain.cVenCode,
		cast(fPoArrQuantity as float) as fPoArrQuantity, cast(fPoRetQuantity as float) as fPoRetQuantity,cast(fPoValidQuantity as float) as fPoValidQuantity,cast(fPoRefuseQuantity as float) as fPoRefuseQuantity,cast(freceivedqty as float) as freceivedqty,zjh.TB007,zjh.TA001
	FROM UFDATA_005_2017..PO_Pomain
		left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
		left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
		inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID
		inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode
		left join UFDATA_005_2017..ComputationUnit on ComputationUnit.cComunitCode=Inventory.cComUnitCode
	    ,(SELECT * FROM MOCTA	LEFT JOIN MOCTB ON TA001 = TB001 left join UFDATA_005_2017..mom_moallocate ON TB013=mom_moallocate.MoDId left join (SELECT MOCTB.TB003 as minTB003,MOCTB.TB006 as minTB006,MIN(MOCTB.TB007) as minTB007 FROM MOCTA LEFT JOIN MOCTB ON TA001 = TB001 where TB010=''Y'' GROUP BY MOCTB.TB003,MOCTB.TB006) as c on c.minTB003=MOCTB.TB003 and c.minTB006=MOCTB.TB006) as zjh
	WHERE cState=1 and (PO_Podetails.csocode is not null or PO_Podetails.cFree1 is not null) and (zjh.TB006=PO_Podetails.csocode or zjh.TB006=PO_Podetails.cFree1) and zjh.InvCode=PO_Podetails.cInvCode  and zjh.TA004=''Y'' '


IF @csocode != '' or @csocode is not null


		SET @sqlStr = @sqlStr + ' AND ( PO_Podetails.csocode LIKE' + '''%' + @csocode + '%'''	  + ' or PO_Podetails.cfree1 LIKE' + '''%' + @csocode + '%'')'


	IF @cVenAbbName != ''
		SET @sqlStr = @sqlStr + ' AND cVenAbbName LIKE' + '''%' + @cVenAbbName + '%'''
	 IF @cPOID != ''
		SET @sqlStr = @sqlStr + ' AND PO_Pomain.cPOID LIKE' + '''%' + @cPOID + '%'''



	IF @dPODateks != ''
		SET @sqlStr = @sqlStr + ' AND dPODate >=' +''''+CONVERT(varchar(100), @dPODateks, 120)  +''''

	IF @dPODatejs != ''
		SET @sqlStr = @sqlStr + ' AND dPODate <=' +''''+CONVERT(varchar(100), @dPODatejs, 120)   +''''

	IF @cInvCode != ''
		SET @sqlStr = @sqlStr + ' AND PO_Podetails.cInvCode LIKE' + '''%' + @cInvCode + '%'''
	IF @cInvName != ''
		SET @sqlStr = @sqlStr + ' AND cInvName LIKE' + '''%' + @cInvName + '%'''
	IF @dArriveDateks != ''
		SET @sqlStr = @sqlStr + ' AND dArriveDate >='+''''+CONVERT(varchar(100), @dArriveDateks, 120)  +''''
	IF @dArriveDatejs != ''
		SET @sqlStr = @sqlStr + 'AND dArriveDate <='+''''+CONVERT(varchar(100), @dArriveDatejs, 120) +''''
		IF @zjh != ''
		SET @sqlStr = @sqlStr + ' AND zjh.TA001 LIKE' + '''%' + @zjh + '%'''
	IF @ksshks != ''
		SET @sqlStr = @sqlStr + ' AND case when ISNULL(Inventory.cInvDefine13,0)>0 then  DATEADD(DAY,-1*Inventory.cInvDefine13,CASE WHEN ISNULL(zjh.TB007,dArriveDate)<dArriveDate THEN zjh.minTB007 ELSE dArriveDate END) else dArriveDate END >='+''''+CONVERT(varchar(100), @ksshks, 120)  +''''
	IF @ksshjs != ''
		SET @sqlStr = @sqlStr + ' AND case when ISNULL(Inventory.cInvDefine13,0)>0 then  DATEADD(DAY,-1*Inventory.cInvDefine13,CASE WHEN ISNULL(zjh.TB007,dArriveDate)<dArriveDate THEN zjh.minTB007 ELSE dArriveDate END) else dArriveDate END <='+''''+CONVERT(varchar(100), @ksshjs, 120) +''''
	exec(@sqlStr)
  