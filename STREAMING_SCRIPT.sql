USE ANS_CUSTOM_CI;

-- Time interval const
DECLARE @increse_in_sec AS int = 30;

DECLARE @start_time AS DATETIME = CONVERT(datetime, '2021-09-24 01:29:29.887');
DECLARE @next_time AS DATETIME = DATEADD(ss, @increse_in_sec, @start_time);

-- SET @start_time = @next_time;


SELECT * FROM AFSTEMNING
WHERE START_TIME >= @start_time and START_TIME <= @next_time;
GO


DECLARE @i INT = 0;

WHILE @i < 10
BEGIN


   PRINT @i;
   PRINT @start_time;


   SET @i = @i + 1;
END;

PRINT 'Done';
GO