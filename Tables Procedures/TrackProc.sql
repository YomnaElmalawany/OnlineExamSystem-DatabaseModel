-- stotored procedures to select,insert,update and delete into tracks table
create proc InsertIntoTracks @t_id int, @t_name varchar(10)
As 
begin 
insert into Tracks (t_id ,t_name) values (@t_id,@t_name)
end

--exec InsertIntoTracks  4,SA
go
create proc SelectTracks @t_id int
As 
begin 
select t_name
 from Tracks 
 where  t_id =@t_id
end
go
--exec  SelectTracks 4
create proc UpdateTracks @t_id int,@t_name varchar(10)
As 
begin 
update  Tracks 
set t_name =@t_name
 where  t_id =@t_id
end
go
--exec  UpdateTracks 4 , mobile 
create proc DeleteTracks @t_id int
As 
begin 
Delete  from Tracks 
 where  t_id =@t_id
end
go

--exec  DeleteTracks 4 
-------------------------------------------------------------
