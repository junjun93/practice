USE [JALCRM]
GO
/****** Object:  StoredProcedure [dbo].[JALCRM_JALWWGD]    Script Date: 08/17/2018 11:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ZMY
-- Create date: 20160830
-- Description:	委外工单明细表（1009）
-- =============================================
ALTER PROCEDURE [dbo].[JALCRM_JALWWGD]
	@GYS VARCHAR(10) = NULL,
	@ZLH VARCHAR(20) = NULL,
	@BeginDate datetime = NULL,
	@EndDate datetime = NULL
	--@LoginID VARCHAR(20)

AS

  DECLARE @sqlStr VARCHAR(MAX)
  SET @sqlStr = 'SELECT TA001,TA002,TA003,TA006,TA033,TA034,TA035,TA015,TA022,TA032,TA036,TA037 FROM JAL..MOCTA WHERE TA030 = ''2'' AND TA013 =''Y'' AND (TA011=''1'' OR TA011=''2'' OR TA011=''3'')'

	IF @GYS != ''
	  SET @sqlStr = @sqlStr + 'AND TA032 =' + @GYS

  IF @ZLH != ''
    SET @sqlStr = @sqlStr + 'AND TA033 LIKE ''@ZLH%'''  --AND TB004 LIKE' + '''%' + @PM + '%'''

  IF @BeginDate != ''
    SET @sqlStr = @sqlStr + 'AND TA003 >=' + @BeginDate

  IF @EndDate != ''
    SET @sqlStr = @sqlStr + 'AND TA003 <=' + @EndDate

  EXEC(@sqlStr)