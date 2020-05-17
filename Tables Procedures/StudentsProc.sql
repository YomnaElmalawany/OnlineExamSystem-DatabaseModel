-- stotored procedures to select,insert,update and delete into Students table
create proc InsertIntoStudents @st_id int, @st_fname varchar(10),@st_lname varchar(10),@t_id int
As 
begin 
insert into Students(st_id ,st_fname,st_lname,t_id) values (@st_id,@st_fname,@st_lname,@t_id)
end

--exec InsertIntoStudents  6,Lila,amar,3
go
create proc SelectStudents @st_id int
As 
begin 
select st_fname,st_lname,t_id
 from Students 
 where  st_id =@st_id
end
go
--exec  SelectStudents 6
create proc UpdateStudentds @st_id int,@st_fname varchar(10),@st_lname varchar(10), @t_id int
As 
begin 
update  Students 
set st_fname =@st_fname,
     st_lname =@st_lname,
	 t_id =@t_id
 where  st_id =@st_id
end
go
--exec  UpdateStudentds 6, nour,mostafa,2 
create proc DeleteStudents @st_id int
As 
begin 
Delete  from Students 
 where  st_id =@st_id
end
go
 --DeleteStudents 6
