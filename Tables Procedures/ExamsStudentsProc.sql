
CREATE PROC selectE_St @eID INT
AS
SELECT *
FROM dbo.Exams_Students
WHERE e_id=@eID
GO
CREATE PROC insertE_St @eID INT, @stID INT, @sGrade INT
AS
IF EXISTS(SELECT st_id FROM dbo.Students WHERE st_id=@stID)
	IF EXISTS(SELECT e_id FROM dbo.Exams_Questions WHERE e_id=@eID)
		INSERT INTO dbo.Exams_Students VALUES(@eID,@stID,@sGrade)
GO
CREATE PROC updateE_St @e_ID INT, @sGrade INT
AS
UPDATE dbo.Exams_Students SET grade_percentage=@sGrade WHERE e_id=@e_ID

