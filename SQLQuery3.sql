insert into Department values ( 1 , 'surgery' ,'Gad');
insert into Department values ( 2 , 'Dental' ,'Asker');
insert into Department values ( 3 , 'Pharmacy' ,'Saad');

Exec Add_Doctor 1 , 'ali' , 'maged' ,'male' ,'1995-11-12','talkha','123',3000,
			1,'gamed','surgen';
Exec Add_Doctor 2 , 'Mohamed' , 'Gad' , 'male' , '2000-10-05' , 'talkha' , '010', 5000,
			2,'Snow' , 'psychologist';
Exec Add_Doctor 3 , 'Mohamed' , 'Badawi' , 'male' , '1999-11-04' , 'Gidela' , '010',999999,
			3,'Sccary' , 'chemist';
Exec Add_Doctor 4 , 'Abdelrahman' , 'Ata' , 'male' , '2000-02-20' , 'Bashbish' , '011',12000,
			2,'Galdiator' , 'Psychiatrist';
Exec Add_Doctor 5 , 'Fras' , 'Askar' , 'male' , '2000-11-02' , 'Torail' , '015', 30000,
			3,'Skidoosh' , 'Meditation';
Exec Add_Doctor 6 , 'Ahmed' , 'Saad' , 'male' , '2000-11-24' , 'Koom el Derbi' , '010', 10000,
			1,'S3' , 'Oculist';

Exec Add_Nurse 1 , 'Sarah' , 'Ali' , 'female' , '2002-10-05' , 'El mahala' , '011', 2000,3;
Exec Add_Nurse 2 , 'Salma' , 'El nagar' , 'female' , '2001-09-09' , 'Tanta' , '011', 3000,2;
Exec Add_Nurse 3 , 'Reem' , 'Saad' , 'female' , '1995-01-20' , 'Mansoura' , '010', 6000,1;

Exec Add_Patient 1 , 'Fayez' , 'Ali' , 'male' , '1998-02-22' , 'Ras el Bar' , '010', 'COVID-19',1;
Exec Add_Patient 2 , 'Samira' , 'Morsi' , 'female' , '1996-02-22' , 'Magar' , '011', 'ADHD',2;
Exec Add_Patient 3 , 'Abanob' , 'Gergs' , 'male' , '1998-02-22' , 'Saint Catherine' , '012', 'Poisoning',1;
