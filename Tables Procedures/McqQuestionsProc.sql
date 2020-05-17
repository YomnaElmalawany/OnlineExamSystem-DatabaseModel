-- stotored procedures to select,insert,update and delete into mcqQuestions table
create proc InsertIntomcqQuestions @q_id int, @choiceA varchar(50),@choiceB varchar(50),@choiceC varchar(50),@choiceD varchar(50)
As 
begin 
insert into mcqQuestions(q_id ,choiceA,choiceB,choiceC,choiceD) values (@q_id,@choiceA,@choiceB,@choiceC,@choiceD)
end

go
create proc SelectmcqQuestions @q_id int
As 
begin 
select choiceA,choiceA,choiceC,choiceD
 from mcqQuestions 
 where  q_id =@q_id
end
go
create proc UpdatemcqQuestions @q_id int, @choiceA varchar(50),@choiceB varchar(50),@choiceC varchar(50),@choiceD varchar(50)
As 
begin 
update  mcqQuestions 
set  choiceA =@choiceA,
     choiceB =@choiceB,
	 choiceC =@choiceC,
	 choiceD =@choiceD
 where  q_id =@q_id
end
go

create proc DeletemcqQuestions @q_id int
As 
begin 
Delete  from mcqQuestions 
 where  q_id =@q_id
end
go

