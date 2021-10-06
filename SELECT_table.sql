USE ANS_CUSTOM_CI;
-- USE ANS_CUSTOM_MVP;


-- TABLE TEST ----------------------------------------

/* COL: MANAGER             */
/* COL: START_TIME          */
/* COL: END_TIME            */
/* COL: AFSTEMRESULTAT      */

-- SELECT * FROM AFSTEMNING;
-- GO


/* COL: CREATED             */
/* COL: MGRNAME             */
/* COL: START_TIME          */
/* COL: END_TIME            */

-- SELECT * FROM AUDIT_LOGERROR;
-- GO


/* COL: MGR                 */
/* Hvad/Hvor er DEST table  */
/* INGEN TIMESTAMP          */

-- SELECT * FROM DEST_TABLE;
-- GO


/* COL: KEY (START_TIME)    */
/* COL: TIMESTAMP           */
/* COL: KEY (END_TIME)      */

-- SELECT * FROM ENGINE_PROPERTIES;
-- GO


/* Col: LOG_TIME            */

-- SELECT * FROM HEALTH_REPORT;
-- GO


/* COL: STARTTIME           */
/* SAMME SOM                */
/* COL: ENDTIME             */
/* COL: RUNTIME             */

-- SELECT * FROM MANAGER_TRACKING;
-- GO


/* COL: ID                  */
/* INGEN TIMESTAMP          */

-- SELECT * FROM MIGRATION_FILE;
-- GO


/* COL: CREATED             */

-- SELECT * FROM STATEMENT_COLUMNS;
-- GO


/* COL: CREATED             */

-- SELECT * FROM STATEMENT_JOINS;
-- GO


/* COL: CREATED             */

-- SELECT * FROM STATEMENT_TABLES;
-- GO


/* COL: MGR                 */
/* INGEN TIMESTAMP          */

-- SELECT * FROM SYS_HOUSEKEEPING;
-- GO


/* INFO TABLE               */

-- SELECT * FROM AUDIT_LOGINFO_TYPES;
-- GO


-- SELECT * FROM AUDIT_FK_ERRORS;          /* Blank */
-- GO

-- SELECT * FROM AUDIT_LOGINFO;            /* Blank */
-- GO

-- SELECT * FROM COLUMN_VALUE;             /* Blank */
-- GO

-- SELECT * FROM SEQUENCE_TRACKING;        /* Blank */
-- GO

-- SELECT * FROM LOGGING;                  /* Blank */
-- GO

-- SELECT * FROM LOGGING_CONTEXT;          /* Blank */
-- GO

-- SELECT * FROM SYS_HOUSEKEEPING_UUID;    /* Blank */
-- GO

-- SELECT * FROM TABLE_LOG;                /* Blank */
-- GO

-- SELECT * FROM VOTE_COMBINATION;         /* Blank */
-- GO

-- SELECT * FROM VOTE_RESULT;              /* Blank */
-- GO
