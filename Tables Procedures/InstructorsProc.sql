
CREATE PROC selectInstr @id INT 
AS
SELECT *
FROM dbo.Instructors 
WHERE instr_id=@id
go
CREATE PROC insertInstr @id INT, @instName VARCHAR(10)
AS
INSERT INTO dbo.Instructors
VALUES(0,@instName)
go
CREATE PROC deleteInstr @id INT
AS
DELETE FROM dbo.Instructors WHERE instr_id=@id
go
CREATE PROC updateInstr @id INT, @instName VARCHAR(10)
AS
UPDATE dbo.Instructors SET instr_name=@instName WHERE instr_id=@id