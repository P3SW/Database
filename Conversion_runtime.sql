WITH TIMEDATA
AS (
	SELECT *
	FROM (
		SELECT *
		FROM (
			SELECT MANAGER
				,[KEY]
				,[VALUE]
				,RUN_NO
			FROM v_engine_properties
			) AS a
		WHERE [KEY] IN (
				'START_TIME'
				,'END_TIME'
				,'Læste rækker'
				,'Skrevne rækker'
				,'BUILD_JOB'
				,'BUILD_NUMBER'
				,'RUN_JOB'
				,'JENKINS_NODE'
				)
		) AS b
	pivot(MIN([VALUE]) FOR [KEY] IN (
				[START_TIME]
				,[END_TIME]
				,[Læste rækker]
				,[Skrevne rækker]
				,[BUILD_JOB]
				,[BUILD_NUMBER]
				,[RUN_JOB]
				,[JENKINS_NODE]
				)) AS c
	)
	,RUN_DATA
AS (
	SELECT MANAGER
		,SUBSTRING(MANAGER, CHARINDEX('.', MANAGER) + 1, LEN(MANAGER)) MANAGER_SHORT
		,START_TIME
		,END_TIME
		,ROWS_READ
		,ROWS_WRITTEN
		,BUILD
		,RUN_JOB
		,JENKINS_NODE
		,RUN_NO
	FROM (
		SELECT replace(replace(td.MANAGER, 'dk.aes.ans.konvertering.managers.', ''), 'com.netcompany.konvertering.', '') MANAGER
			,td.START_TIME START_TIME
			,td.END_TIME END_TIME
			,td.[Læste rækker] ROWS_READ
			,td.[Skrevne rækker] ROWS_WRITTEN
			,td.BUILD_JOB + '#' + td.BUILD_NUMBER AS BUILD
			,td.RUN_JOB RUN_JOB
			,td.JENKINS_NODE JENKINS_NODE
			,td.RUN_NO
		FROM TIMEDATA td
		) td
	)
	,TOTAL_RUNTIME
AS (
	SELECT MIN(START_TIME) START_TIME
		,MAX(END_TIME) END_TIME
	FROM RUN_DATA
	)
SELECT MANAGER_SHORT
	,START_TIME
	,END_TIME
	,FORMAT(CONVERT(DATETIME, ISNULL(CONVERT(DATETIME, END_TIME, 120), CURRENT_TIMESTAMP) - CONVERT(DATETIME, START_TIME, 120)), 'HH:mm:ss') DURATION_SHORT
	,ROWS_READ
	,ROWS_WRITTEN
FROM RUN_DATA
ORDER BY DURATION_SHORT DESC
