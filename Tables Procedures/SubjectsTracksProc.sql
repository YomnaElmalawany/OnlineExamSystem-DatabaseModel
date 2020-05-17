
CREATE PROC selectSubj_Track @tID INT 
AS
SELECT *
FROM dbo.Subjects_tracks
WHERE t_id=@tID
