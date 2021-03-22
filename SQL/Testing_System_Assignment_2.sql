use testingsystem;
-- bai 1
select DepartmentName from department;
-- bai 2
select DepartmentID from department where DepartmentName = 'Sale';
-- bai 3
select max(length(Username)),Username from `account` ;
-- bai 4
select GroupName from `group` where CreateDate < '2019-04-09' ;
-- bai 5
SELECT QuestionID,count(QuestionID) as 'Tong so cau hoi' from answer 
group by QuestionID
having count(QuestionID) >= 4;
-- bai 6
SELECT GroupName,CreateDate from `group` order by CreateDate DESC LIMIT 5;
-- bai 8
DELETE FROM exam where CreateDate < '2019-04-05';
-- bai 9
update `account` set Fullname = N'Nguyễn Bá Lộc',Email = 'loc.nguyenba@vti.com.vn' where AccountID =5;
-- bai 10
SELECT `account`.AccountID,`account`.FullName,department.DepartmentName FROM `account` INNER Join department
on `account`.DepartmentID = department.DepartmentID;
-- bai 11
SELECT `account`.AccountID,`account`.FullName,department.DepartmentName FROM `account` INNER Join department
on `account`.DepartmentID = department.DepartmentID
having DepartmentName = 'Marketing';
-- bai 12
SELECT department.DepartmentName, count(`account`.DepartmentID) as 'SL NV' 
from department
inner join `account`
on `account`.DepartmentID = department.DepartmentID
group by `account`.DepartmentID
having count(`account`.DepartmentID) >= 3;
-- bai 13
SELECT examquestion.QuestionID,count(examquestion.QuestionID),question.Content from examquestion 
inner join question
on examquestion.QuestionID = question.QuestionID
group by examquestion.QuestionID
order by count(examquestion.QuestionID) DESC;
-- bai 14
SELECT categoryquestion.CategoryID,categoryquestion.CategoryName, count(question.CategoryID) as 'SL SD'
from categoryquestion
inner join question
on categoryquestion.CategoryID = question.CategoryID
group by question.CategoryID;
-- bai 15
select question.QuestionID,question.Content,count(answer.QuestionID) 
from question
inner join answer
on answer.QuestionID = question.QuestionID
group by answer.QuestionID
order by count(answer.QuestionID) DESC
Limit 1;
-- bai 16
select department.DepartmentName, count(`account`.departmentID)
from department
inner join `account`
on department.DepartmentID = `account`.departmentID
group by `account`.departmentID
order by count(`account`.departmentID) ASC
-- bai 17





