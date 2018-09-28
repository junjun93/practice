USE [SCM]
GO
/****** Object:  StoredProcedure [dbo].[HW_SHDSC]    Script Date: 08/06/2018 16:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<ZMY>
-- Create date: <20160830>
-- DescriptiON:	<生成进货单>
-- =============================================
ALTER PROCEDURE [dbo].[HW_SHDSC]
	-- Add the parameters for the stored procedure here
	@ID VARCHAR(20)

AS
DECLARE @AA INT ,@BB INT
    SELECT @AA = COUNT(*) FROM PURCD WHERE ZID = @ID
    SELECT @BB = COUNT(*) FROM PURCD WHERE ZID = @ID GROUP BY cInvCode
    /*IF @AA != @BB
    BEGIN
        RAISERROR ('每张单据暂时只可以输入一种物料，请知悉！！', 16, 1)
    END */

--1.送货单审核状态
DECLARE @A1 VARCHAR(20),@B1 VARCHAR(20),@C1 VARCHAR(40),@D1 VARCHAR(20),@E1 VARCHAR(200),@F1 VARCHAR(20),@G1 VARCHAR(20)
SELECT @A1 = ID,@B1 = iverifystate FROM PURCC WHERE ID = @ID
	SET @C1 = '送货单' + @A1 + '已经审核！！！'
	IF @B1 = 'Y'
	BEGIN
		RAISERROR (@C1, 16, 3);
	END

--2.同一送货单业务员是否是同一个人
SELECT @D1 = count(*)
FROM (SELECT C = COUNT(ZID),cPersonCode
      FROM PURCD
        INNER JOIN UFDATA_002_2013..PO_Podetails ON iPOsID = ID
        INNER JOIN UFDATA_002_2013..PO_Pomain ON PO_Podetails.POID = PO_Pomain.POID
      WHERE ZID = @ID
      GROUP BY  cPersonCode) A
	SET @E1 = '送货单要求本单中的业务员是同一个人！！'
	IF @D1 > 1
	BEGIN
		RAISERROR (@E1,16,3);
	END

--3.送货单重复送货
DECLARE @A VARCHAR(20),@B VARCHAR(20),@C VARCHAR(40),@D VARCHAR(20),@E VARCHAR(20),@F VARCHAR(20),@G VARCHAR(20),@H VARCHAR(20)
  SELECT @A = ID,@B = cDefine1 FROM PURCC WHERE ID = @ID AND iverifystate = 'Y'
  SET @C = '送货单'+ @A +'送货,不可以重复送货！！！'
  IF @B = 'Y'
  BEGIN
    RAISERROR (@C,16,3);
  END
  
BEGIN
  SELECT @D = MAX (cCode) FROM UFDATA_005_2017..PU_ArrivalVouch WHERE CONVERT(VARCHAR(20),dDate,112) = CONVERT(VARCHAR(20),GETDATE(),112)
  SELECT @H = SUBSTRING(@D,3,10)
  SELECT @E = MAX(ID) FROM UFDATA_005_2017..PU_ArrivalVouch       ------ 选取用友平台主表最大的自动号
  SELECT @F = MAX(Autoid) FROM UFDATA_005_2017..PU_ArrivalVouchS    ----选取用友平台子表最大的序列号
  SELECT @G = MIN(Autoid)-1 FROM PURCD WHERE ZID = @ID   -----------------选取平台此单身最小的序列号

  ---分单号
  INSERT INTO INVMB (MB001,MB002,MB003)
  SELECT ROW_NUMBER() OVER (ORDER BY cInvCode DESC) AS ROW,ZID,cInvCode FROM (SELECT DISTINCT ZID,cInvCode FROM PURCD WHERE ZID=@ID)com.junjun.demo.a

  IF @D IS NULL OR @D = ''
    BEGIN
      ----要先在审核里判断送货单身的信息：采购部门、业务员一致
      ---UPDATE PURCC SET cCode = 'DH'+SUBSTRING(CONVERT(VARCHAR(20),GETDATE(),112),3,6) + '0001' WHERE ID = @ID
      -----先更新用友的到货单号，作为关联
      INSERT INTO UFDATA_005_2017..PU_ArrivalVouch (iVTid,ID,cCode,cPTCode,dDate,cVenCode,cDepCode,cPersonCode,cexch_name,iExchRate,
      iTaxRate,cBusType,cMaker,bNegative,cDefine10,iBillType,cMakeTime,cpocode,cDefine2,cMemo)

      SELECT '8169',@E+MB001,'DH'+SUBSTRING(CONVERT(VARCHAR(20),GETDATE(),112),3,6)+dbo.GenXH(MB001),'1', GETDATE(),cVenCode,
      '010',cPersonCode,'人民币','1',iTaxRate,'普通采购','何芳青',bNegative,MF002,iBillType,GETDATE(),cpocode,ID,ISNULL(cMemo,'')+'供应商生成'
      FROM PURCC
        INNER JOIN ADMMF ON MF001 = cVenCode COLLATE Chinese_PRC_BIN
        INNER JOIN INVMB ON MB002 = ID
      WHERE ID = @ID AND cDefine1 != 'Y'

      ----插入到货单子表
      INSERT INTO UFDATA_005_2017..PU_ArrivalVouchs
      (Autoid,ID,cWhCode,cInvCode,iQuantity,iOriCost,iOriTaxCost,iOriMoney,iOriTaxPrice,iOriSum,iCost,
      iMoney,iTaxPrice,iSum,iTaxRate,iPOsID,bGsp,SoDId,SoType,iInvMPCost,csocode,cordercode,iorderdid,iordertype,csoordercode,
      iorderseq,ivouchrowno,carrivalcode ,PlanLotNumber,bTaxCost,cDefine23)

      SELECT @F+Autoid-@G,@E+MB001,cDefWareHouse,PURCD.cInvCode,iQuantity,iOriCost,iOriTaxCost,iOriMoney,iOriTaxPrice,iOriSum,iCost,
      iMoney,iTaxPrice,iSum,PURCD.iTaxRate,iPOsID,bPropertyCheck,SoDId,SoType,PURCD.iInvMPCost,csocode,PURCD.cFree5,iorderdid,iordertype,csoordercode,
      iorderseq,@G,'DH'+SUBSTRING(CONVERT(VARCHAR(20),GETDATE(),112),3,6)+dbo.GenXH(MB001),PlanLotNumber,bTaxCost,ZID
      FROM PURCD
        INNER JOIN UFDATA_005_2017..Inventory ON PURCD.cInvCode=Inventory.cInvCode   ----@E+1 此处有疑问,@F处疑问更大
        INNER JOIN INVMB ON MB002 = ZID AND MB003 = PURCD.cInvCode
      WHERE ZID = @ID
    END

ELSE --条件是到货单不空
  BEGIN
    ---UPDATE PURCC SET cCode = 'DH'+@H WHERE ID=@ID
    -----先更新用友的到货单号，作为关联
    ----要先在审核里判断送货单身的信息：采购部门，业务员一致
    INSERT INTO UFDATA_005_2017..PU_ArrivalVouch (iVTid,ID,cCode,cPTCode,dDate,cVenCode,cDepCode,cPersonCode,cexch_name,iExchRate,
    iTaxRate,cBusType,cMaker,bNegative,cDefine10,iBillType,cMakeTime,cpocode,cDefine2,cMemo)

    SELECT '8169',@E+MB001,'DH'+CONVERT(VARCHAR(20),(@H+MB001)),'1', GETDATE(),cVenCode,
    '010',cPersonCode,'人民币','1',iTaxRate,'普通采购','何芳青',bNegative,MF002,iBillType,GETDATE(),cpocode,ID,ISNULL(cMemo,'')+'供应商生成'
    FROM PURCC
      INNER JOIN ADMMF ON MF001 = cVenCode COLLATE Chinese_PRC_BIN
      INNER JOIN INVMB ON MB002 = ID
    WHERE ID =@ID AND cDefine1 != 'Y'

    ----插入到货单子表
    INSERT INTO UFDATA_005_2017..PU_ArrivalVouchs
    (Autoid,ID,cWhCode,cInvCode,iQuantity,iOriCost,iOriTaxCost,iOriMoney,iOriTaxPrice,iOriSum,iCost,
    iMoney,iTaxPrice,iSum,iTaxRate,iPOsID,bGsp,SoDId,SoType,iInvMPCost,csocode,cordercode,iorderdid,iordertype,csoordercode,
    iorderseq,ivouchrowno,carrivalcode ,PlanLotNumber,bTaxCost,cDefine23)

    SELECT @F+Autoid-@G,@E+MB001,cDefWareHouse,PURCD.cInvCode,iQuantity,iOriCost,iOriTaxCost,iOriMoney,iOriTaxPrice,iOriSum,iCost,
    iMoney,iTaxPrice,iSum,PURCD.iTaxRate,iPOsID,bPropertyCheck,SoDId,SoType,PURCD.iInvMPCost,csocode,PURCD.cFree5,iorderdid,iordertype,csoordercode,
    iorderseq,@G,'DH'+CONVERT(VARCHAR(20),(@H+MB001)),PlanLotNumber,bTaxCost,ZID
    FROM PURCD
      INNER JOIN UFDATA_005_2017..Inventory ON PURCD.cInvCode = Inventory.cInvCode   ----@E+1 此处有疑问,@F处疑问更大
      INNER JOIN INVMB ON MB002 = ZID AND MB003 = PURCD.cInvCode
    WHERE ZID = @ID
  END

    UPDATE PURCD SET UDF02 = A.carrivalcode FROM PURCD
      INNER JOIN UFDATA_005_2017..PU_ArrivalVouchs AS A ON PURCD.cInvCode = A.cInvCode AND A.cDefine23 = PURCD.ZID
    WHERE ZID = @ID

    DELETE INVMB WHERE MB002 = @ID
END

UPDATE PURCC SET cDefine1 = 'Y'  WHERE ID = @ID
UPDATE PURCC SET iverifystate = 'Y' WHERE ID = @ID