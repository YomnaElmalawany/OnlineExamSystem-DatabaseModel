-- stotored procedures to select,insert,update and delete into Questions table
create proc InsertIntoQuestions @q_id int, @q_statement varchar(150),@q_modelAnswer varchar(5)
,@q_weight int,@q_type varchar(5),@subj_id int
As 
begin 
insert into Questions (q_id ,q_statement,q_modelAnswer,q_weight,q_type,subj_id) values (@q_id, @q_statement,@q_modelAnswer,@q_weight,@q_type,@subj_id)
end

go
create proc SelectQuestions @q_id int
As 
begin 
select q_statement,q_modelAnswer,q_type,q_weight,subj_id
 from Questions 
 where  q_id =@q_id
end
go
create proc UpdateQuestions @q_id int, @q_statement varchar(150),@q_modelAnswer varchar(5)
,@q_weight int,@q_type varchar(5),@subj_id int
As 
begin 
update  Questions 
set  q_statement=@q_statement,
     q_modelAnswer =@q_modelAnswer,
	 q_type=@q_type,
	 q_weight=@q_weight,
	 subj_id=@subj_id
 where  q_id =@q_id
end
go

create proc DeleteFromQuestions @q_id int
As 
begin 
Delete  from Questions 
 where  q_id =@q_id
end
go

