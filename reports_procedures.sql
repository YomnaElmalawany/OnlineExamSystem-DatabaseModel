
-- Report 1
create proc getstudbydept @trackNo int
as
select*from Students
where t_id=@trackNo

--getstudbydept 1

--==============================================================================================
-- Report 2
create proc getGrade @student_id int
as
select st_fname,subj_name ,MAX(grade_percentage) as grade
from Exams_Students Es,Students s,Subjects sub,Exams esub
where es.st_id=@student_id and es.e_id=esub.e_id and es.st_id=s.st_id
and esub.subj_id=sub.subj_id
group by st_fname, subj_name

--getgrade 4

--==============================================================================================
-- Report 3
alter proc getinstructor @instructor_id int
as
select inst.instr_id,inst.instr_Name,sub.subj_name , COUNT(st.st_id) as [Students Number]
from Instructors inst ,Subjects sub, Students st, Subjects_tracks subT
where inst.instr_id=sub.instr_id and inst.instr_id=@instructor_id and st.t_id=subT.t_id 
and sub.subj_id=subt.subj_id
group by inst.instr_id,inst.instr_Name,sub.subj_name

--getinstructor 3

--==============================================================================================
-- Report 4
alter proc CourseTopic @id int
As
select Topics.subj_id ,subj_name, top_name
from [dbo].[Topics],[dbo].[Subjects]
where [dbo].[Topics].[subj_id] = [dbo].[Subjects].[subj_id] and
 [dbo].[Topics].[subj_id] = @id

 --==============================================================================================
-- Report 5
 alter proc ExamQuest @id int
 As
 select eq.q_id , q_statement,choiceA,choiceB,choiceC,choiceD 
 from Exams_Questions eq inner join  Questions q
 on eq.q_id= q.q_id
 inner join mcqQuestions mcq
 on q.q_id=mcq.q_id

 where eq.q_id = q.q_id
 and eq.e_id = @id

 --ExamQuest 107
 -- ExamQuest 111

--==============================================================================================
-- Report 6
alter proc report6_proc @stId int, @eId int
as
SELECT        Exams_Questions.q_id, Exams_Questions.q_ans, Exams_Students.e_id
FROM            Exams_Questions INNER JOIN
                         Exams_Students ON Exams_Questions.e_id = Exams_Students.e_id INNER JOIN
                         Students ON Exams_Students.st_id = Students.st_id
WHERE        (Exams_Students.st_id = @stId) AND (Exams_Students.e_id = @eId)

--report6_proc 1,107

alter proc report6_2_proc @stId int
as
select e_id
from Exams_Students
where st_id=@stId

