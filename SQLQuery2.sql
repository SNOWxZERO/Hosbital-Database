create procedure Add_Doctor
@d_id int , @fname varchar(15) , @lname varchar(15) , @gender varchar(6) , 
@birth date , @address varchar(50) , @phone varchar(20) , @salary float , @dept_id int ,
@title varchar(20) , @speciality varchar(20)
as
begin
	insert into Doctor values(@d_id , @fname , @lname ,@gender ,@birth,@address,@phone,@salary,
			@dept_id,@title,@speciality)
	print('Doctor added successfully'); 
end
go

create procedure Add_Nurse
@n_id int , @fname varchar(15) , @lname varchar(15) , @gender varchar(6) , 
@birth date , @address varchar(50) , @phone varchar(20) , @salary float , @dept_id int
as
begin
	insert into Nurse values(@n_id , @fname , @lname ,@gender ,@birth,@address,@phone,@salary,
			@dept_id)
	print('Nurse added successfully'); 
end
go

create procedure Add_Patient
@p_id int , @fname varchar(15) , @lname varchar(15) , @gender varchar(6) , 
@birth date , @address varchar(50) , @phone varchar(20) , @diagnosis varchar(20),@dept_id int
as
begin
	insert into Patient values(@p_id , @fname , @lname ,@gender ,@birth,@address,@phone,@diagnosis,@dept_id)
	print('Patient added successfully'); 
end
go

create procedure Update_Patient_Diagnosis
@p_id int,@diagnosis varchar(20)
as
begin
	update Patient set P_Diagnosis = @diagnosis 
	where P_ID = @p_id
end
go

create procedure Update_Doctor_Speciality
@d_id int,@speciality varchar(20)
as
begin
	update Doctor set D_Speciality = @speciality 
	where D_ID = @d_id
end
go

create procedure Remove_Patient
@p_id int
as
begin
	delete from Patient  
	where P_ID = @p_id
end
go

create procedure Remove_Nurse
@n_id int
as
begin
	delete from Nurse  
	where N_ID = @n_id
end
go

create procedure Remove_Doctor
@d_id int
as
begin
	delete from Doctor  
	where D_ID = @d_id
end
go

create procedure Update_Doctor_Salary
@d_id int , @percentage decimal
as
begin
	update Doctor set D_Salary = D_Salary + @percentage * D_Salary
	where D_ID = @d_id
end
go

create procedure Update_Nurse_Salary
@n_id int , @percentage decimal
as
begin
	update Nurse set N_Salary = N_Salary + @percentage * N_Salary
	where N_ID = @n_id
end
go

create procedure Update_Salary_Dept
@dept_id int , @percentage decimal
as
begin
	update Nurse set N_Salary = N_Salary + @percentage * N_Salary
	where Dept_ID = @dept_id

	update Doctor set D_Salary = D_Salary + @percentage * D_Salary
	where Dept_ID = @dept_id
end
go

create procedure Update_All_Salaries
@percentage decimal
as
begin
	update Nurse set N_Salary = N_Salary + @percentage * N_Salary

	update Doctor set D_Salary = D_Salary + @percentage * D_Salary
end
go

create procedure Check_Available_Rooms_For_Registeration
as
begin
	select count(*) 
	from Room
	where No_of_Beds > No_of_Reserved_Beds
end
go

create procedure Leave_Hospital
@p_id int
as
begin
	begin transaction
		update Room set No_of_Reserved_beds = No_of_Reserved_beds -1 
		where Room_ID =(select Room_ID
						from Patient_Registeration
						where P_ID = @p_id)
		delete from Patient_Registeration 
		where P_ID = @p_id
		delete from Patient 
		where P_ID = @p_id
	commit transaction
end
go

create procedure Update_Doctor_Resposibility
@room_id int , @new_d_id int
as
begin
	update Doctor_Room_Responsibility set D_ID = @new_d_id 
	where Room_ID = @room_id
end
go

create procedure Update_Nurse_Resposibility
@room_id int , @new_n_id int
as
begin
	update Nurse_Room_Responsibility set N_ID = @new_n_id 
	where Room_ID = @room_id
end
go

create procedure Get_Patients
@dept_id int
as
begin
	select * from Patient
	where Dept_ID = @dept_id
end
go

create procedure Get_Doctors
@dept_id int
as
begin
	select * from Doctor
	where Dept_ID = @dept_id
end
go

create procedure Get_Nurses
@dept_id int
as
begin
	select * from Nurse
	where Dept_ID = @dept_id
end
go