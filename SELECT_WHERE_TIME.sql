USE ANS_CUSTOM_CI;

DECLARE @increse_in_sec AS int = 60;

DECLARE @start_time AS DATETIME = '2021-09-24 01:29:29.887';

SELECT * FROM AFSTEMNING
WHERE START_TIME = CONVERT(datetime, '2021-09-24 01:29:29.887')
GO

DECLARE @next_time DATE;


PRINT @start_time;
PRINT DATEADD(ss, @increse_in_sec, @start_time);

PRINT @increse_in_sec;
PRINT @start_time;