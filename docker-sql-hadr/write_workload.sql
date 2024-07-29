USE sandbox
IF @@TRANCOUNT>0
	ROLLBACK;
SET NOCOUNT ON;
IF OBJECT_ID('dbo.tbl') IS NULL
	CREATE TABLE dbo.tbl(id INT PRIMARY KEY CLUSTERED);
DECLARE @i int;
SELECT @i=COALESCE(MAX(id)+1,0) FROM dbo.tbl;
WHILE 1=1 
BEGIN
	BEGIN TRAN; 
	INSERT dbo.tbl(id) VALUES(@i);
	WAITFOR DELAY '00:00:00.050'
	COMMIT;
	SET @i += 1;
END 