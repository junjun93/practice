USE [SCM]
GO
/****** Object:  StoredProcedure [dbo].[MySCM_CUILIAO_P]    Script Date: 07/12/2018 14:00:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		SHENXIN
-- Create date: 20130916
-- Description:	采购员采购催交表
-- =============================================
ALTER PROCEDURE [dbo].[MySCM_CUILIAO_P]
	@LoginID VARCHAR(20),
	@iCodeID VARCHAR(20),
	@DH VARCHAR(20),
	@GYS VARCHAR(20)

AS
if @GYS IS NULL OR @GYS =''
BEGIN
IF @iCodeID IS NULL OR @iCodeID =''
BEGIN
IF @DH IS NULL OR @DH =''
BEGIN
SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,PO_Podetails.cDefine22,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode
,cbMemo,PO_Podetails.cInvCode, substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,fPoArrQuantity,fPoRetQuantity,
fPoValidQuantity,fPoRefuseQuantity,freceivedqty
FROM UFDATA_005_2017..PO_Pomain left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID  inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
WHERE  (PO_Pomain.cDefine1 is null and  (cbCloseDate is null or cbCloseDate='' )and iQuantity>ISNULL(fPoArrQuantity ,0)
and substring(CONVERT(VARCHAR(40),dArriveDate-isnull(Inventory.cInvDefine13,0),120 ),1,10) < =substring(CONVERT(VARCHAR(40),GETDATE(),112 ),1,10))
OR PO_Podetails.cDefine22='Y'
order by cPOID desc
END
ELSE
BEGIN
SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,PO_Podetails.cDefine22,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode
,cbMemo,PO_Podetails.cInvCode, substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,fPoArrQuantity,fPoRetQuantity,
fPoValidQuantity,fPoRefuseQuantity,freceivedqty
FROM UFDATA_005_2017..PO_Pomain left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID  inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
WHERE  PO_Pomain.cDefine1 is null and  (cbCloseDate is null or cbCloseDate='' ) AND PO_Pomain.cPOID =@DH AND iQuantity>ISNULL(fPoArrQuantity ,0)
and substring(CONVERT(VARCHAR(40),dArriveDate-isnull(Inventory.cInvDefine13,0),120 ),1,10) < =substring(CONVERT(VARCHAR(40),GETDATE(),112 ),1,10)
 OR PO_Podetails.cDefine22='Y'
 order by cPOID desc
END
END

ELSE ---全表第二大部分----有品号
BEGIN
IF @DH IS NULL OR @DH =''
BEGIN
SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,PO_Podetails.cDefine22,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode
,cbMemo,PO_Podetails.cInvCode, substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as  dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,fPoArrQuantity,fPoRetQuantity,
fPoValidQuantity,fPoRefuseQuantity,freceivedqty
FROM UFDATA_005_2017..PO_Pomain left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID  inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
WHERE  PO_Pomain.cDefine1 is null and  (cbCloseDate is null or cbCloseDate='' ) AND PO_Podetails.cInvCode=@iCodeID  AND iQuantity>ISNULL(fPoArrQuantity ,0)
and substring(CONVERT(VARCHAR(40),dArriveDate-isnull(Inventory.cInvDefine13,0),120 ),1,10) < =substring(CONVERT(VARCHAR(40),GETDATE(),112 ),1,10)
OR PO_Podetails.cDefine22='Y'
order by cPOID desc
END
ELSE
BEGIN
SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,PO_Podetails.cDefine22, cVenAbbName,PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode
,cbMemo,PO_Podetails.cInvCode, substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,fPoArrQuantity,fPoRetQuantity,
fPoValidQuantity,fPoRefuseQuantity,freceivedqty
FROM UFDATA_005_2017..PO_Pomain left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID  inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
WHERE PO_Pomain.cDefine1 is null and  (cbCloseDate is null or cbCloseDate='' ) AND PO_Pomain.cPOID =@DH AND PO_Podetails.cInvCode=@iCodeID AND iQuantity>ISNULL(fPoArrQuantity ,0)
and substring(CONVERT(VARCHAR(40),dArriveDate-isnull(Inventory.cInvDefine13,0),120 ),1,10) < =substring(CONVERT(VARCHAR(40),GETDATE(),112 ),1,10)
OR PO_Podetails.cDefine22='Y'
order by cPOID desc
END
END
END -----@GYS

ELSE --@GYS  供应商编号不为空
BEGIN
IF @iCodeID IS NULL OR @iCodeID =''
BEGIN
IF @DH IS NULL OR @DH =''
BEGIN
SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,PO_Podetails.cDefine22,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode
,cbMemo,PO_Podetails.cInvCode, substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,fPoArrQuantity,fPoRetQuantity,
fPoValidQuantity,fPoRefuseQuantity,freceivedqty
FROM UFDATA_005_2017..PO_Pomain left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID  inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
WHERE PO_Pomain.cDefine1 is null and  (cbCloseDate is null or cbCloseDate='' )  and PO_Pomain.cVenCode=@GYS AND iQuantity>ISNULL(fPoArrQuantity ,0)
and substring(CONVERT(VARCHAR(40),dArriveDate-isnull(Inventory.cInvDefine13,0),120 ),1,10) < =substring(CONVERT(VARCHAR(40),GETDATE(),112 ),1,10)
OR PO_Podetails.cDefine22='Y'
order by cPOID desc
END
ELSE
BEGIN
SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,PO_Podetails.cDefine22,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode
,cbMemo,PO_Podetails.cInvCode, substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,fPoArrQuantity,fPoRetQuantity,
fPoValidQuantity,fPoRefuseQuantity,freceivedqty
FROM UFDATA_005_2017..PO_Pomain left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID  inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
WHERE  PO_Pomain.cDefine1 is null and  (cbCloseDate is null or cbCloseDate='' ) AND PO_Pomain.cPOID =@DH  and PO_Pomain.cVenCode=@GYS AND iQuantity>ISNULL(fPoArrQuantity ,0)
and substring(CONVERT(VARCHAR(40),dArriveDate-isnull(Inventory.cInvDefine13,0),120 ),1,10) < =substring(CONVERT(VARCHAR(40),GETDATE(),112 ),1,10)
 OR PO_Podetails.cDefine22='Y'
 order by cPOID desc
END
END

ELSE ---全表第二大部分----有品号
BEGIN
IF @DH IS NULL OR @DH =''
BEGIN
SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,PO_Podetails.cDefine22,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode
,cbMemo,PO_Podetails.cInvCode, substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as  dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,fPoArrQuantity,fPoRetQuantity,
fPoValidQuantity,fPoRefuseQuantity,freceivedqty
FROM UFDATA_005_2017..PO_Pomain left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID  inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
WHERE  PO_Pomain.cDefine1 is null and  (cbCloseDate is null or cbCloseDate='' ) AND PO_Podetails.cInvCode=@iCodeID   and PO_Pomain.cVenCode=@GYS AND iQuantity>ISNULL(fPoArrQuantity ,0)
and substring(CONVERT(VARCHAR(40),dArriveDate-isnull(Inventory.cInvDefine13,0),120 ),1,10) < =substring(CONVERT(VARCHAR(40),GETDATE(),112 ),1,10)
OR PO_Podetails.cDefine22='Y'
order by cPOID desc
END
ELSE
BEGIN
SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,PO_Podetails.cDefine22,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode
,cbMemo,PO_Podetails.cInvCode, substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,fPoArrQuantity,fPoRetQuantity,
fPoValidQuantity,fPoRefuseQuantity,freceivedqty
FROM UFDATA_005_2017..PO_Pomain left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID  inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
WHERE  PO_Pomain.cDefine1 is null and  (cbCloseDate is null or cbCloseDate='' ) AND PO_Pomain.cPOID =@DH AND PO_Podetails.cInvCode=@iCodeID  and PO_Pomain.cVenCode=@GYS
and substring(CONVERT(VARCHAR(40),dArriveDate-isnull(Inventory.cInvDefine13,0),120 ),1,10) < =substring(CONVERT(VARCHAR(40),GETDATE(),112 ),1,10) AND iQuantity>ISNULL(fPoArrQuantity ,0)
OR PO_Podetails.cDefine22='Y'
order by cPOID desc
END
END
END -----@GYS