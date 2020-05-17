
CREATE PROC selectTopic @id INT 
AS
SELECT *
FROM dbo.Topics 
WHERE top_id=@id
go
CREATE PROC insertTopic @id INT, @TopicName VARCHAR(10), @subjId INT
AS
IF EXISTS(SELECT subj_id FROM dbo.Subjects WHERE subj_id=@subjId)
	INSERT INTO dbo.Topics VALUES(@id,@TopicName,@subjId)
go
CREATE PROC deleteTopic @id INT
AS
DELETE FROM dbo.Topics WHERE top_id=@id
go
CREATE PROC updateTopic @id INT, @TopicName VARCHAR(10), @subjId INT
AS
IF EXISTS(SELECT subj_id FROM dbo.Subjects WHERE subj_id=@subjId)
	UPDATE dbo.Topics SET top_name=@TopicName,subj_id=@subjId WHERE top_id=@id

