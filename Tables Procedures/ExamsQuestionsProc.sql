-- stotored procedures to select,insert,update and delete into exam table
CREATE proc InsertExam_QuesTable @e_id int, @q_id int,@q_ans varchar(5)
As 
begin 
insert into Exams_Questions(e_id,q_id,q_ans) values (@e_id,@q_id,@q_ans)
end

go
CREATE proc selectExam_QuesTable @e_id int
As 
begin
select q_id,q_ans
 from Exams_Questions 
 where  e_id=@e_id
end
go

CREATE proc UpdatExam_QuesTable @e_id int,@q_id int, 
@q_ans varchar(5)
As 
begin 
update  Exams_Questions 
set @q_id =@q_id,
  	 q_ans=@q_ans
 where  e_id =@e_id
end
go
CREATE proc DeleteFromExam_QuesTable @e_id int
As 
begin 
Delete  from Exams_Questions 
 where  e_id =@e_id
end


