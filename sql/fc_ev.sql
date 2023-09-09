-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
DROP FUNCTION IF EXISTS dbo.fc_ev
;

CREATE FUNCTION dbo.fc_ev
(
	@p_pod_in_bb float
   ,@p_win_rate  float
   ,@p_fold_rate float
   ,@p_bet_in_bb float
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @V_EV float = null
	;

	SELECT @V_EV = CASE WHEN isnull(@p_fold_rate,0.0) = 0.0
	                    THEN @p_win_rate*(isnull(@p_pod_in_bb,0)+isnull(@p_bet_in_bb,0))   - (1-@p_win_rate)*(@p_bet_in_bb)
						ELSE (@p_win_rate+isnull(@p_fold_rate,0))*(isnull(@p_pod_in_bb,0)+isnull(2*@p_bet_in_bb,0)) - (1-isnull(@p_fold_rate,0)-@p_win_rate)*(@p_bet_in_bb)
				   END
	;
	-- Return the result of the function
	RETURN @V_EV

END
GO

USE [Poker]
GO

declare 
   @p_pod_in_bb float = 3
  ,@p_win_rate  float = 0.15
  ,@p_fold_rate float = 0.2
  ,@p_bet_in_bb float = 1
;

SELECT [dbo].[fc_ev]
(
   @p_pod_in_bb
  ,@p_win_rate
  ,@p_fold_rate
  ,@p_bet_in_bb
)
GO


