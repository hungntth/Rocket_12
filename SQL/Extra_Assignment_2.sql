SELECT * FROM sql_assignment1.trainee;
use sql_assignment1
-- bai 3
Select Length(FullName),FullName,Email,Username FROM `account`
order by Length(FullName) DESC
limit 1;
-- bai 4
SELECT * FROM trainee
where ET_IQ + ET_Gmath >=20
and ET_IQ >=8
and ET_Gmath>=8
and ET_English>=18;
-- bai 5
delete from trainee
where TraineeID = 6;
-- bai 6
update trainee
set Training_Class = 2
where TraineeID =5;

-- Exercise 2:
-- bai 1:
create table Department(
	Department_Number int primary key auto_increment,
    Department_Name varchar(255)
);
CREATE TABLE Employee_Table(
	Employee_Number int primary key auto_increment,
    Employee_Name varchar(255),
    Department_Number int ,
    foreign key (Department_Number) REFERENCES Department(Department_Number)
);
CREATE TABLE Employee_Skill_Table(
	Employee_Number int primary key auto_increment,
    Skill_Code varchar(255) ,
    Date_Registered date,
    foreign key (Employee_Number) REFERENCES Employee_Table(Employee_Number)
);
-- bai 2:
INSERT INTO Department ( Department_Name ) 
VALUES ('Sale'),('MKT'),('PM');
-- bai 3:
select Employee_Table.Employee_Name,Employee_Skill_Table.Skill_Code
FROM Employee_Table
inner join Employee_Skill_Table
on Employee_Table.Employee_Number = Employee_Skill_Table.Employee_Number
where Employee_Skill_Table.Skill_Code = 'Java';
-- bai 4:

SELECT Department.Department_Name, count(Employee_Table.Department_Number)
from Employee_Table
inner join Department
on Department.Department_Number = Employee_Table.Department_Number
group by Department.Department_Name
having count(Employee_Table.Department_Number) >=3;

-- bai 5

SELECT Department.Department_Name,Employee_Table.Employee_Name
from Department
inner join Employee_Table
on Department.Department_Number = Employee_Table.Department_Number;

-- bai 6
SELECT Employee_Table.Employee_Name, count(Employee_Skill_Table.Skill_Code) as 'Skill'
from Employee_Table
inner join Employee_Skill_Table
on Employee_Table.Employee_Number = Employee_Skill_Table.Employee_Number
group by Employee_Table.Employee_Name
having count(Employee_Skill_Table.Skill_Code) >1;

