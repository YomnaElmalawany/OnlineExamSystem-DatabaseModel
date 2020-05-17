-- stotored procedures to select,insert,update and delete into Subject table
create proc InsertIntoSubject @subj_id int, @subj_name varchar(10),@t_id int
As 
begin 
insert into Subjects (subj_id ,subj_name,t_id) values (@subj_id,@subj_name,@t_id)
end

--exec InsertIntoSubject  3,Laravel,2
go
create proc SelectSubjects @subj_id int
As 
begin 
select subj_name,t_id
 from Subjects 
 where  subj_id =@subj_id
end
go
--exec  SelectSubjects 3
create proc UpdateSubjects @subj_id int,@subj_name varchar(10), @t_id int
As 
begin 
update  Subjects 
set subj_name =@subj_name,
  	 t_id =@t_id
 where  subj_id =@subj_id
end
go
--exec  UpdateSubjects 3, mysql,2 
create proc DeleteSubjects @subj_id int
As 
begin 
Delete  from Subjects 
 where  subj_id =@subj_id
end
go

