USE [SCM]
GO
/****** Object:  StoredProcedure [dbo].[MySCM_PRINTMX]    Script Date: 10/13/2018 15:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		SHENXIN
-- Create date: 20130916
-- Description:	送货单(0006)-报表
-- =============================================
ALTER PROCEDURE [dbo].[MySCM_PRINTMX]
	@ID VARCHAR(20),
 	@Xprintfront varchar(2000) OUTPUT,
	@Xprintend varchar(2000) OUTPUT,
	--@ZJ VARCHAR(40),
	@LoginID varchar(20),
	@BEGIN VARCHAR(20),
    @END VARCHAR(20)
AS

SELECT @BEGIN = REPLACE (@BEGIN,'-','')
SELECT @END = REPLACE (@END,'-','')
IF @BEGIN IS NULL OR @BEGIN = ''
	BEGIN
	 SET @BEGIN = REPLACE (CONVERT(VARCHAR(20),GETDATE(),112),'-','')
	END
IF @END IS NULL OR @END = ''
	BEGIN
	 SET @END =  REPLACE (CONVERT(VARCHAR(20),GETDATE(),112),'-','')
	END

 DECLARE @OFFICE VARCHAR(255),@DATE VARCHAR(20),@NUMBER VARCHAR(20),@AA VARCHAR(20)

 SELECT @OFFICE = cVenName FROM UFDATA_005_2017..Vendor WHERE cVenCode = LEFT(@LoginID,6)
 SELECT @DATE = convert(varchar(20),GETDATE(),112)
 --SELECT @AA = ID FROM PURCC FOR XML PATH
    SET @Xprintfront =
    '<table border="0" style="width: 100%">
		<tr>
			<td style="font-size: 15px">送货单号:'+@ID+'</td>
			<td style="font-size: 15px">供应商:'+@OFFICE+'</td>
			<td style="font-size: 15px">日期:'+@DATE+'</td>
		</tr>
	 </table>'

	--SET @Xprintfront = @Xprintfront + @LoginID
	SET @Xprintend =
	'<table border="0" style="width: 100%">
		<tr>
			<td style="font-size: 15px">收料员:</td>
			<td style="font-size: 15px">检验员:</td>
			<td style="font-size: 15px">仓管员:</td>
		</tr>
	</table>
	<div style="text-align:center">
		到货单作为送检依据,待检验合格后方入库（不合格做退料处理）入库单作为对账依据
	</div>'

BEGIN
	SELECT  ROW_NUMBER() OVER (ORDER BY PURCD.ZID ASC) AS XUHAO,cFree5,cInvCode,cFree3,cFree4,cFree2,CAST(PURCD.iQuantity AS DECIMAL(16,2)) as AA,
	cFree7,cFree8,cFree9,cFree10,PURCD.UDF01,ltrim(rtrim(isnull(cbMemo,'')))+'/'+ltrim(rtrim(ISNULL(PURCD.UDF02,''))) AS cbMemo,ZID
	-----,  ltrim(rtrim(ZID)) AS ZJ
	FROM PURCD
	INNER JOIN PURCC ON ID = PURCD.ZID--ZID
	WHERE ID = @ID AND dDate <= @END AND dDate >= @BEGIN
END

ALTER PROCEDURE [dbo].[BiaoTie]

	@Xprintfront VARCHAR(MAX) OUTPUT
	--@printEnd VARCHAR(2000) OUTPUT

AS
  DECLARE @cVenCode VARCHAR(30),
          @cFree3 VARCHAR(30),
          @cFree4 VARCHAR(30),
          @iQuantity VARCHAR(30),
          @UDF01 VARCHAR(30),
          @ID VARCHAR(30)

	SELECT  @cVenCode = cVenCode,
          @cFree3 = cFree3,
          @cFree4 = cFree4,
          @iQuantity = iQuantity,
          @UDF01 = PURCD.UDF01,
          @ID = ID
	--iQuantity(进货数量),UDF01,ID,(仓管员)
	FROM PURCC JOIN PURCD ON ID = ZID;