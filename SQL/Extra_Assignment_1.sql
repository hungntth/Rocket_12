create database sql_assignment1;
use sql_assignment1;
create table Trainee(
	TraineeID int not null auto_increment,
    Full_Name varchar(255) not null,
    Birth_Date date,
    Gender enum( 'male','female','unknown'),
    ET_IQ int,
    ET_Gmath int,
    ET_English int,
    Training_Class varchar(255) not null,
    Evaluation_Notes text,
    CONSTRAINT ET_IQ_kiemtra CHECK (ET_IQ BETWEEN 1 AND 20),
    CONSTRAINT  ET_Gmath_kiemtra CHECK ( ET_Gmath BETWEEN 1 AND 20),
    CONSTRAINT ET_English_kiemtra CHECK (ET_English BETWEEN 1 AND 50)
);
alter table Trainee add VTI_Account varchar(255) not null unique ;
create table Data_Types(
	id_Data_Types int not null auto_increment,
    Name_Data_Types varchar(255) not null,
    Code_Data_Types nvarchar(255) not null,
    ModifiedDate datetime
); 
create table Data_Types(
	id_Data_Types int not null auto_increment,
     Name_Data_Types varchar(255) not null,
     BirthDate date,
     Gender enum('male','female','unknown'),
     IsDeletedFlag enum('1','0')
);


