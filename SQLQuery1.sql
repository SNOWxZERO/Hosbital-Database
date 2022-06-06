create database Hospital;

create table Patient (
	P_ID int primary key,
	P_F_NAME varchar(15),
	P_L_NAME varchar(15),
	P_Gender varchar(6) check(P_Gender = 'male' or P_Gender = 'female'),
	P_Date_of_Birth date,
	P_Address varchar(50),
	Relative_PhoneNo varchar(20),
	P_Diagnosis varchar(20),
	Dept_ID int foreign key references Department(Dept_ID)
);

create table Department(
	Dept_ID int primary key,
	Dept_Name varchar(20),
	Dept_Manager varchar(20)
);

create table Doctor(
	D_ID int primary key,
	D_F_NAME varchar(15),
	D_L_NAME varchar(15),
	D_Gender varchar(6) check(D_Gender = 'male' or D_Gender = 'female'),
	D_Date_of_Birth date,
	D_Address varchar(50),
	D_PhoneNo varchar(20),
	D_Salary float,
	Dept_ID int foreign key references Department(Dept_ID),
	D_Title varchar(20),
	D_Speciality varchar(20)
);

create table Nurse(
	N_ID int primary key,
	N_F_NAME varchar(15),
	N_L_NAME varchar(15),
	N_Gender varchar(6) check(N_Gender = 'male' or N_Gender = 'female'),
	N_Date_of_Birth date,
	N_Address varchar(50),
	N_PhoneNo varchar(20),
	N_Salary float,
	Dept_ID int foreign key references Department(Dept_ID),
);

create table Room(
	Room_ID int primary key,
	FloorNo int,
	No_of_Beds int,
	No_of_Reserved_beds int
);

create table Patient_Registeration(
	P_ID int foreign key references Patient(P_ID),
	Room_ID int foreign key references Room(Room_ID),
	Registeration_Date date
);

create table Doctor_Room_Responsibility(
	Room_ID int foreign key references Room(Room_ID),
	D_ID int foreign key references Doctor(D_ID),
	Day_shift varchar(10)
);

create table Nurse_Room_Responsibility(
	Room_ID int foreign key references Room(Room_ID),
	N_ID int foreign key references Nurse(N_ID),
	Day_shift varchar(10)
);


