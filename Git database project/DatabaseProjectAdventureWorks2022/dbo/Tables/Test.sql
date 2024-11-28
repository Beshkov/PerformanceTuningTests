CREATE TABLE [dbo].[Test]
(
    [TestTableID]   INTEGER         IDENTITY(1,1) NOT NULL,
    [TestTableNote] VARCHAR(150)    NULL,
    [NoteDate]      SMALLDATETIME   CONSTRAINT DF_TestTableNoteDate DEFAULT(getdate()) NOT NULL,
    CONSTRAINT PK_TestTableID PRIMARY KEY CLUSTERED ([TestTableID])
);