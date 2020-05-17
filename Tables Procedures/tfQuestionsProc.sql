-- stotored procedures to select,insert,update and delete into mcqQuestions table
create proc InsertIntoTFQuestions @q_id int, @choiceA varchar(50),@choiceB varchar(50)
As 
begin 
insert into tfQuestions(q_id ,choiceA,choiceB) values (@q_id,@choiceA,@choiceB)
end

go
create proc SelectTFQuestions @q_id int
As 
begin 
select choiceA,choiceB
 from tfQuestions 
 where  q_id =@q_id
end
go
create proc UpdateTfQuestions @q_id int, @choiceA varchar(50),@choiceB varchar(50)
As 
begin 
update  tfQuestions 
set  choiceA =@choiceA,
     choiceB =@choiceB
	 
 where  q_id =@q_id
end
go

create proc DeleteFromTFQuestions @q_id int
As 
begin 
Delete  from tfQuestions 
 where  q_id =@q_id
end
go

