create view TSODPD AS
select Department.Dept_Name , sum(D_Salary) as Salary_Sum 
from Doctor
join Department on (Department.Dept_ID = Doctor.Dept_ID)
group by Department.Dept_Name

select * from TSODPD order by Salary_Sum desc;
--------------------------------------------------
create view TSONPD AS
select Department.Dept_Name , sum(N_Salary) as Salary_Sum 
from Nurse
join Department on (Department.Dept_ID = Nurse.Dept_ID)
group by Department.Dept_Name

select * from TSONPD order by Salary_Sum desc;
--------------------------------------------------
create view Available_Rooms As
select Room.Room_ID , Room.FloorNo,CONCAT(Doctor.D_F_NAME,' ',Doctor.D_L_NAME) as D_Name,
		CONCAT(Nurse.N_F_NAME,' ',Nurse.N_L_NAME) as N_Name
from Room 
full outer join Doctor_Room_Responsibility as drr on drr.Room_ID = Room.Room_ID  
full outer join Nurse_Room_Responsibility as nrr on nrr.Room_ID = Room.Room_ID
full outer join Doctor on Doctor.D_ID = drr.D_ID
full outer join Nurse on Nurse.N_ID = nrr.N_ID
where Room.No_of_Beds > Room.No_of_Reserved_Beds

select * from Available_Rooms;
--------------------------------------------------
create view Full_Rooms as
select count(*) as Full_Rooms
from Room
where Room.No_of_Beds = Room.No_of_Reserved_Beds

select * from Full_Rooms;
--------------------------------------------------
create view Resgisteration_Days as
select CONCAT(Patient.P_F_NAME,' ',Patient.P_L_NAME) as P_Name , DATEDIFF(DAY,Registeration_Date,GETDATE()) as Staying_Days
from Patient
join Patient_Registeration as PR on Patient.P_ID = PR.P_ID

select * from Resgisteration_Days
order by Staying_Days desc