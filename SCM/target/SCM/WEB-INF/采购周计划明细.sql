USE [SCM]
GO
/****** Object:  StoredProcedure [dbo].[MySCM_zjh]    Script Date: 07/11/2018 14:26:02 ******/
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
	@csocode VARCHAR(20), --销售订单号
	@cVenAbbName VARCHAR(20),--供应商
	@dPODate VARCHAR(20),--订单日期
	@cInvCode VARCHAR(20),--存货编码
	@cInvName VARCHAR(20),--存货名称
	@dArriveDate VARCHAR(20)--计划到货日期
AS
IF @csocode IS NULL OR @csocode = ''
	BEGIN
	IF @cVenAbbName IS NULL OR @cVenAbbName = ''
		BEGIN
		IF @dPODate IS NULL OR @dPODate = ''
			BEGIN
			IF @cInvCode IS NULL OR @cInvCode = ''
				BEGIN
				IF @cInvName IS NULL OR @cInvName = ''
					BEGIN
					IF @dArriveDate IS NULL OR @dArriveDate = ''
						BEGIN
							SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,csocode,CONVERT(varchar(20),
								PO_Podetails.cDefine30-isnull(Inventory.cInvDefine13,0),112)as A,
								PO_Podetails.cDefine30,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode,cbMemo,PO_Podetails.cInvCode,
								substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,
								fPoArrQuantity,fPoRetQuantity,fPoValidQuantity,fPoRefuseQuantity,freceivedqty
							FROM UFDATA_005_2017..PO_Pomain
								left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
								left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
								inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID
								inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode
								left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
							where cState='1' --AND PO_Podetails.cDefine30 IS NOT NULL
						END
					ELSE
						BEGIN
							SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,csocode,CONVERT(varchar(20),
								PO_Podetails.cDefine30-isnull(Inventory.cInvDefine13,0),112)as A,
								PO_Podetails.cDefine30,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode,cbMemo,PO_Podetails.cInvCode,
								substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,
								fPoArrQuantity,fPoRetQuantity,fPoValidQuantity,fPoRefuseQuantity,freceivedqty
							FROM UFDATA_005_2017..PO_Pomain
								left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
								left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
								inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID
								inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode
								left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
							where cState='1' AND dArriveDate = @dArriveDate
						END
					END
				ELSE
					IF @dArriveDate IS NULL OR @dArriveDate = ''
						BEGIN
							SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,csocode,CONVERT(varchar(20),
								PO_Podetails.cDefine30-isnull(Inventory.cInvDefine13,0),112)as A,
								PO_Podetails.cDefine30,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode,cbMemo,PO_Podetails.cInvCode,
								substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,
								fPoArrQuantity,fPoRetQuantity,fPoValidQuantity,fPoRefuseQuantity,freceivedqty
							FROM UFDATA_005_2017..PO_Pomain
								left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
								left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
								inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID
								inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode
								left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
							where cState='1' AND cInvName = @cInvName
						END
					ELSE
						BEGIN
							SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,csocode,CONVERT(varchar(20),
								PO_Podetails.cDefine30-isnull(Inventory.cInvDefine13,0),112)as A,
								PO_Podetails.cDefine30,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode,cbMemo,PO_Podetails.cInvCode,
								substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,
								fPoArrQuantity,fPoRetQuantity,fPoValidQuantity,fPoRefuseQuantity,freceivedqty
							FROM UFDATA_005_2017..PO_Pomain
								left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
								left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
								inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID
								inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode
								left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
							where cState='1' AND cInvName = @cInvName AND dArriveDate = @dArriveDate
						END
				END
			ELSE
				BEGIN
				IF @cInvName IS NULL OR @cInvName = ''
					BEGIN
					IF @dArriveDate IS NULL OR @dArriveDate = ''
						BEGIN
							SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,csocode,CONVERT(varchar(20),
								PO_Podetails.cDefine30-isnull(Inventory.cInvDefine13,0),112)as A,
								PO_Podetails.cDefine30,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode,cbMemo,PO_Podetails.cInvCode,
								substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,
								fPoArrQuantity,fPoRetQuantity,fPoValidQuantity,fPoRefuseQuantity,freceivedqty
							FROM UFDATA_005_2017..PO_Pomain
								left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
								left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
								inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID
								inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode
								left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
							where cState='1' AND dPODate = @dPODate AND PO_Podetails.cInvCode = @cInvCode
						END
					ELSE
						BEGIN
							SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,csocode,CONVERT(varchar(20),
								PO_Podetails.cDefine30-isnull(Inventory.cInvDefine13,0),112)as A,
								PO_Podetails.cDefine30,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode,cbMemo,PO_Podetails.cInvCode,
								substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,
								fPoArrQuantity,fPoRetQuantity,fPoValidQuantity,fPoRefuseQuantity,freceivedqty
							FROM UFDATA_005_2017..PO_Pomain
								left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
								left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
								inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID
								inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode
								left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
							where cState='1'  AND PO_Podetails.cInvCode = @cInvCode AND dArriveDate = @dArriveDate
						END
					END
				ELSE
					IF @dArriveDate IS NULL OR @dArriveDate = ''
						BEGIN
							SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,csocode,CONVERT(varchar(20),
								PO_Podetails.cDefine30-isnull(Inventory.cInvDefine13,0),112)as A,
								PO_Podetails.cDefine30,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode,cbMemo,PO_Podetails.cInvCode,
								substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,
								fPoArrQuantity,fPoRetQuantity,fPoValidQuantity,fPoRefuseQuantity,freceivedqty
							FROM UFDATA_005_2017..PO_Pomain
								left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
								left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
								inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID
								inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode
								left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
							where cState='1' AND PO_Podetails.cInvCode = @cInvCode AND cInvName = @cInvName
						END
					ELSE
						BEGIN
							SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,csocode,CONVERT(varchar(20),
								PO_Podetails.cDefine30-isnull(Inventory.cInvDefine13,0),112)as A,
								PO_Podetails.cDefine30,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode,cbMemo,PO_Podetails.cInvCode,
								substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,
								fPoArrQuantity,fPoRetQuantity,fPoValidQuantity,fPoRefuseQuantity,freceivedqty
							FROM UFDATA_005_2017..PO_Pomain
								left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
								left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
								inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID
								inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode
								left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
							where cState='1' AND PO_Podetails.cInvCode = @cInvCode AND cInvName = @cInvName AND dArriveDate = @dArriveDate
						END
				END
			END
		ELSE
			BEGIN
				SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,csocode,CONVERT(varchar(20),
					PO_Podetails.cDefine30-isnull(Inventory.cInvDefine13,0),112)as A,
					PO_Podetails.cDefine30,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode,cbMemo,PO_Podetails.cInvCode,
					substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,
					fPoArrQuantity,fPoRetQuantity,fPoValidQuantity,fPoRefuseQuantity,freceivedqty
				FROM UFDATA_005_2017..PO_Pomain
					left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
					left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
					inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID
					inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode
					left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
				where cState='1' AND dPODate = @dPODate AND PO_Podetails.cInvCode = @cInvCode AND cInvName = @cInvName AND dArriveDate = @dArriveDate
			END
		END
	ELSE
		BEGIN
			SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,csocode,CONVERT(varchar(20),
				PO_Podetails.cDefine30-isnull(Inventory.cInvDefine13,0),112)as A,
				PO_Podetails.cDefine30,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode,cbMemo,PO_Podetails.cInvCode,
				substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,
				fPoArrQuantity,fPoRetQuantity,fPoValidQuantity,fPoRefuseQuantity,freceivedqty
			FROM UFDATA_005_2017..PO_Pomain
				left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
				left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
				inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID
				inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode
				left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
			where cState='1' AND cVenAbbName = @cVenAbbName AND dPODate = @dPODate AND PO_Podetails.cInvCode = @cInvCode AND cInvName = @cInvName AND dArriveDate = @dArriveDate
		END
	END
ELSE
	BEGIN
		SELECT top 100 percent ROW_NUMBER() OVER (ORDER BY ID ASC) AS XUHAO,csocode,CONVERT(varchar(20),
			PO_Podetails.cDefine30-isnull(Inventory.cInvDefine13,0),112)as A,
			PO_Podetails.cDefine30,cVenAbbName, PO_Pomain.cPOID,cPersonName,dPODate,PO_Pomain.POID,PO_Pomain.cPersonCode,cbMemo,PO_Podetails.cInvCode,
			substring(CONVERT(VARCHAR(40),dArriveDate,120 ),1,10) as dArriveDate1,iMoney,iQuantity,iUnitPrice,cInvStd,Inventory.cInvName,cComUnitName,
			fPoArrQuantity,fPoRetQuantity,fPoValidQuantity,fPoRefuseQuantity,freceivedqty
		FROM UFDATA_005_2017..PO_Pomain
			left join UFDATA_005_2017..Person oN PO_Pomain.cPersonCode=Person.cPersonCode
			left join UFDATA_005_2017..Vendor on PO_Pomain.cVenCode=Vendor.cVenCode
			inner join  UFDATA_005_2017..PO_Podetails on PO_Pomain.POID =PO_Podetails.POID
			inner join UFDATA_005_2017..Inventory ON PO_Podetails.cInvCode=Inventory.cInvCode
			left join UFDATA_005_2017..ComputationUnit on cUnitRefInvCode=PO_Podetails.cInvCode
		where cState='1' AND csocode = @csocode AND cVenAbbName = @cVenAbbName AND dPODate = @dPODate AND PO_Podetails.cInvCode = @cInvCode AND cInvName = @cInvName AND dArriveDate = @dArriveDate
	END


