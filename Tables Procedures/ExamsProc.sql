
CREATE PROC selectExams @subjID INT
AS
SELECT *
FROM dbo.Exams
WHERE subj_id=@subjID

