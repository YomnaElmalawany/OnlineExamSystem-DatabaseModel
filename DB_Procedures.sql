use ExamSystem

--===========================================================================================
-- ExamGeneration procedure

alter proc ExamGeneration @Subj_name varchar(10),@TF int ,@mcq int
AS
insert into Exams(subj_id) 
select subj_id
from Subjects
where subj_name = @Subj_name

declare @lastRow int= IDENT_CURRENT ('Exams')

--InsertExams_QuestionsTable 
insert into Exams_Questions(e_id,q_id)
select top(@TF) @lastRow,q.q_id
from Questions q, Subjects subj
where q.q_type = 'tf' and q.subj_id=subj.subj_id and subj.subj_name=@Subj_name
order by NEWID() 

--InsertExams_QuestionsTable
set @mcq = 10 - @TF --make sure number of questions is not more nor less than 10
insert into Exams_Questions(e_id,q_id)
select top(@mcq) @lastRow,q.q_id
from Questions q, Subjects subj
where q.q_type = 'mcq' and q.subj_id=subj.subj_id and subj.subj_name=@Subj_name
order by NEWID() 

--ExamGeneration 'SQL',3,7

--===========================================================================================
-- ExamAnswers procedure

alter proc ExamAnswers @e_id int, @st_id int, @a1 varchar(5), @a2 varchar(5), @a3 varchar(5),
@a4 varchar(5), @a5 varchar(5), @a6 varchar(5), @a7 varchar(5), @a8 varchar(5), 
@a9 varchar(5), @a10 varchar(5)
As
insert into Exams_Students(e_id, st_id) values(@e_id, @st_id)

declare @temp table(e_id int,q_id int,q_ans varchar(5),rn int)
insert into @temp(e_id,q_id,q_ans,rn)  
(select e_id,q_id,q_ans, ROW_NUMBER() over (order by e_id) as rn
from Exams_Questions
where e_id=@e_id)

update @temp set q_ans=@a1 where e_id=@e_id and rn = 1
update @temp set q_ans=@a2 where e_id=@e_id and rn = 2
update @temp set q_ans=@a3 where e_id=@e_id and rn = 3
update @temp set q_ans=@a4 where e_id=@e_id and rn = 4
update @temp set q_ans=@a5 where e_id=@e_id and rn = 5
update @temp set q_ans=@a6 where e_id=@e_id and rn = 6
update @temp set q_ans=@a7 where e_id=@e_id and rn = 7
update @temp set q_ans=@a8 where e_id=@e_id and rn = 8
update @temp set q_ans=@a9 where e_id=@e_id and rn = 9
update @temp set q_ans=@a10 where e_id=@e_id and rn = 10

delete from Exams_Questions where e_id=@e_id
insert into Exams_Questions(e_id,q_id,q_ans)
(select e_id,q_id,q_ans
from @temp
where e_id=@e_id)

--ExamAnswers 117, 1, c,c,b,b,b,b,b,c,a,b 
           -- 117, 1, c,c,b,b,b,b,b,c,a,c --model answers
		   
--===========================================================================================
-- ExamCorrection procedure

alter proc ExamCorrection @e_id int
AS
Begin 
declare @t table (result varchar(5),w int, Qtype varchar(5));
insert into @t
select 
   case
      when  E.q_ans is NULL and Q.q_modelAnswer is NULL then 'true'  
      when E.q_ans=Q.q_modelAnswer then 'true' 
      else 'false' 
   end as result, Q.q_weight, Q.q_type
from Exams_Questions E
inner join Questions Q
on E.q_id=Q.q_id
where E.e_id=@e_id
declare t_cur cursor
	for select * from @t
	for read only
declare @count int=0;
declare @res varchar(5)
declare @w int
declare @QType varchar(5)
declare @total int=0
open t_cur 
fetch t_cur into @res,@w,@QType
begin
	While @@fetch_status=0
	begin
		if @res='true'
			begin
				set @count=@count+@w
			end
		if @QType = 'mcq'
			begin
				set @total=@total+2
			end
		else if @QType = 'tf'
			begin
				set @total=@total+1
			end
			fetch t_cur into @res ,@w,@QType
	end
end
select * from @t
select  @count
select  @total
set @count = (CAST(@count as float)/@total)*100 --calculate the grade_percentage percentage
update Exams_Students set grade_percentage=CAST(@count as int) where e_id=@e_id
--and st_id=@st_id
close t_cur
deallocate t_cur
end

--execute ExamCorrection 116
  
