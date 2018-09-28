USE [SCM]
GO
/****** Object:  StoredProcedure [dbo].[PROC_NumIndent]    Script Date: 09/03/2018 09:51:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		YUZONGJUE
-- Create date: 20140506
-- Description:
-- =============================================

ALTER PROC [dbo].[PROC_NumIndent]

	@indentNum VARCHAR(20) OUTPUT
AS
		DECLARE @date NVARCHAR(20)
		SET @date ='CG' + SUBSTRING(CONVERT(VARCHAR(20),GETDATE(),112),1,8) --+ @LoginID

		DECLARE @CountMax NVARCHAR(20)

		SELECT @CountMax = MAX(ID) FROM PURCC WHERE
		SUBSTRING(CONVERT(VARCHAR(20),RTRIM(LTRIM(ID))),3,8) = SUBSTRING(CONVERT(VARCHAR(20),GETDATE(),112),1,8) AND cBusType='普通采购'
		IF (@CountMax <> '')
			BEGIN
				DECLARE @num VARCHAR(20)
				SET @num = CONVERT(VARCHAR(20),CONVERT(INT,SUBSTRING(@CountMax,11,4)) + 1)
				SET @num = REPLICATE('0',4-LEN(@num)) + @num
				SET @indentNum = @date + @num
				  IF NOT EXISTS(SELECT ID = @indentNum FROM PURCC)
				    SELECT @indentNum
          ELSE
            SELECT CONVERT(VARCHAR, (CONVERT(INT, @indentNum) + 1))
			END

		ELSE

			 BEGIN
				 SET @indentNum = @date + '0001'
				 SELECT @indentNum
			 END