CREATE TABLE [dbo].[DatabaseLog] (
    [DatabaseLogID] INT            IDENTITY (1, 1) NOT NULL,
    [PostTime]      DATETIME       NOT NULL,
    [DatabaseUser]  [sysname]      NOT NULL,
    [Event]         [sysname]      NOT NULL,
    [Schema]        [sysname]      NULL,
    [Object]        [sysname]      NULL,
    [TSQL]          NVARCHAR (MAX) NOT NULL,
    [XmlEvent]      XML            NOT NULL,
    CONSTRAINT [PK_DatabaseLog_DatabaseLogID] PRIMARY KEY NONCLUSTERED ([DatabaseLogID] ASC)
);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for DatabaseLog records.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DatabaseLog', @level2type = N'COLUMN', @level2name = N'DatabaseLogID';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Audit table tracking all DDL changes made to the AdventureWorks database. Data is captured by the database trigger ddlDatabaseTriggerLog.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DatabaseLog';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The type of DDL statement that was executed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DatabaseLog', @level2type = N'COLUMN', @level2name = N'Event';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The user who implemented the DDL change.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DatabaseLog', @level2type = N'COLUMN', @level2name = N'DatabaseUser';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date and time the DDL change occurred.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DatabaseLog', @level2type = N'COLUMN', @level2name = N'PostTime';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The raw XML data generated by database trigger.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DatabaseLog', @level2type = N'COLUMN', @level2name = N'XmlEvent';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The schema to which the changed object belongs.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DatabaseLog', @level2type = N'COLUMN', @level2name = N'Schema';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The exact Transact-SQL statement that was executed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DatabaseLog', @level2type = N'COLUMN', @level2name = N'TSQL';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The object that was changed by the DDL statment.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DatabaseLog', @level2type = N'COLUMN', @level2name = N'Object';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (nonclustered) constraint', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'DatabaseLog', @level2type = N'CONSTRAINT', @level2name = N'PK_DatabaseLog_DatabaseLogID';


GO

