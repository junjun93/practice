USE [DSSCM]
GO
/****** Object:  StoredProcedure [dbo].[MYSCMG_KKMXB]    Script Date: 2018/9/20 10:50:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<ZMY>
-- Create date: <20160718>
-- Description:	<供应商-扣款明细表>
-- =============================================
ALTER PROCEDURE [dbo].[MYSCMG_KKMXB]
	@LoginID VARCHAR(20),
	@iBeginDate VARCHAR(10),
	@iEndDate VARCHAR(10),
	@XM VARCHAR(20)---扣款项目

AS

SELECT @iBeginDate=REPLACE (@iBeginDate,'-',''),@iEndDate=REPLACE (@iEndDate,'-','')
  IF @iEndDate IS NULL OR @iEndDate=''
    BEGIN
       SET @iEndDate='20491230'
    END

  IF @iBeginDate IS NULL OR @iBeginDate=''
    BEGIN
       SET @iBeginDate='20180101'
    END

  IF @XM IS NULL OR @XM =''

    SELECT * FROM SCMPC INNER JOIN SCMPD ON PD001=PC001
    WHERE PC002 >=@iBeginDate AND PC002 <= @iEndDate AND PC005=@LoginID AND PC014='Y'

  ELSE

    SELECT * FROM SCMPC INNER JOIN SCMPD ON PD001=PC001
    WHERE PC002 >=@iBeginDate AND PC002 <= @iEndDate AND PC005=@LoginID AND PC014='Y'



