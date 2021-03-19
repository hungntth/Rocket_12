create database Testing_System_Assignment_1;
use Testing_System_Assignment_1;
CREATE TABLE Department (
    DepartmentID int primary key not null auto_increment,
    DepartmentName varchar(255) not null unique
);
CREATE TABLE Positionn (
    PositionID int primary key not null auto_increment,
    PositionName varchar(255) not null unique
);
CREATE TABLE Accountt (
    AccountID int not null auto_increment,
    Email varchar(255) unique not null,
    Username varchar(255) unique not null,
    FullName varchar(255) not null,
    DepartmentID int not null,
    PositionID int not null,
	PRIMARY KEY (AccountID),
	FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
	FOREIGN KEY (PositionID) REFERENCES Positionn (PositionID),
    CreateDate date
);
CREATE TABLE groupp (
    GroupID int  not null auto_increment primary key,
    GroupName varchar(255) not null unique,
    CreatorID int not null unique ,
    CreateDate date
);

create table GroupAccount (
		GroupID int not null,
        AccountID int not null,
        JoinDate date,
        foreign key (GroupID) references groupp(GroupID),
		foreign key (AccountID) references Accountt(AccountID)
);

create table TypeQuestion (
	TypeID int not null primary key auto_increment,
    TypeName varchar(255) not null unique

);

create table CategoryQuestion (
	CategoryID int not null primary key auto_increment,
    CategoryName varchar(255) not null unique
);

create table Question (
	QuestionID int not null primary key auto_increment,
    Content text ,
    CategoryID int not null,
    TypeID int not null,
	CreatorID int not null unique,
    CreateDate date,
    foreign key (CategoryID) references CategoryQuestion(CategoryID),
    foreign key (TypeID) references TypeQuestion(TypeID),
    foreign key (CreatorID) references groupp(CreatorID)
);

create table Answer (
AnswerID int not null primary key auto_increment,
Content text ,
QuestionID int not null ,
isCorrect boolean,
foreign key (QuestionID) references Question(QuestionID)

);

create table Exam (
ExamID int not null primary key auto_increment,
CodeExam varchar(10) not null unique,
Title varchar(255) not null,
CategoryID int not null,
Duration time,
CreatorID int not null unique,
CreateDate date,
foreign key (CategoryID) references CategoryQuestion(CategoryID),
foreign key (CreatorID) references groupp(CreatorID)

);

create table ExamQuestion(
	ExamID int not null,
    QuestionID int not null,
    foreign key (QuestionID) references Question(QuestionID),
    foreign key (ExamID) references Exam(ExamID)

);

INSERT INTO Department (DepartmentName) VALUES ('Sales Department'); 
INSERT INTO Department (DepartmentName) VALUES ('Marketing Department'); 
INSERT INTO Department (DepartmentName) VALUES ('Human Resource Department'); 
INSERT INTO Department (DepartmentName) VALUES ('Purchase Department'); 
INSERT INTO Department (DepartmentName) VALUES ('General Management'); 

INSERT INTO Positionn (PositionName) values ('Dev');
INSERT INTO Positionn (PositionName) values ('Test');
INSERT INTO Positionn (PositionName) values ('Project Manager');
INSERT INTO Positionn (PositionName) values ('Scrum Master');
INSERT INTO Positionn (PositionName) values ('CRM');

INSERT INTO Accountt (Email,Username,FullName,DepartmentID,PositionID,CreateDate) values ('emailtest1@mail.com','user01','Presley Dominguez','1','1','2012-01-01');
INSERT INTO Accountt (Email,Username,FullName,DepartmentID,PositionID,CreateDate) values ('emailtest2@mail.com','user02','Jadon Zuniga','2','2','2012-01-01');
INSERT INTO Accountt (Email,Username,FullName,DepartmentID,PositionID,CreateDate) values ('emailtest3@mail.com','user03','Frida Guzman','3','3','2012-01-01');
INSERT INTO Accountt (Email,Username,FullName,DepartmentID,PositionID,CreateDate) values ('emailtest4@mail.com','user04','Gilberto Moreno','4','4','2012-01-01');
INSERT INTO Accountt (Email,Username,FullName,DepartmentID,PositionID,CreateDate) values ('emailtest5@mail.com','user05','Sebastian Silva','5','5','2012-01-01');


INSERT INTO groupp (GroupName,CreatorID,CreateDate) VALUES ('group 1','1111','2013-03-03');
INSERT INTO groupp (GroupName,CreatorID,CreateDate) VALUES ('group 2','1212','2013-03-03');
INSERT INTO groupp (GroupName,CreatorID,CreateDate) VALUES ('group 3','3333','2013-03-03');
INSERT INTO groupp (GroupName,CreatorID,CreateDate) VALUES ('group 4','1414','2013-03-03');
INSERT INTO groupp (GroupName,CreatorID,CreateDate) VALUES ('group 5','5050','2013-03-03');

INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES ('1','1','2013-04-04');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES ('2','2','2013-04-04');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES ('3','3','2013-04-04');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES ('4','4','2013-04-04');
INSERT INTO GroupAccount (GroupID,AccountID,JoinDate) VALUES ('5','5','2013-04-04');

INSERT INTO TypeQuestion(TypeName) VALUES ('Essay');
INSERT INTO TypeQuestion(TypeName) VALUES ('Multiple-choice');
INSERT INTO TypeQuestion(TypeName) VALUES ('Practice');

insert INTO CategoryQuestion(CategoryName) VALUES ('Ruby,');
insert INTO CategoryQuestion(CategoryName) VALUES ('C#');
insert INTO CategoryQuestion(CategoryName) VALUES ('JAVA');
insert INTO CategoryQuestion(CategoryName) VALUES ('Postman,');
insert INTO CategoryQuestion(CategoryName) VALUES ('.NET');

INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate) valUES ('Lorem ipsum ','1','1','1111','2013-05-04');
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate) valUES ('Lorem ipsum ','2','2','1212','2013-05-05');
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate) valUES ('Lorem ipsum ','3','3','3333','2013-05-06');
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate) valUES ('Lorem ipsum ','4','1','1414','2013-05-07');
INSERT INTO Question(Content,CategoryID,TypeID,CreatorID,CreateDate) valUES ('Lorem ipsum ','5','2','5050','2013-05-08');

INSERT INTO Answer(Content,QuestionID,isCorrect) values ('Content Answer 1','1',True);
INSERT INTO Answer(Content,QuestionID,isCorrect) values ('Content Answer 2','2',FALSE);
INSERT INTO Answer(Content,QuestionID,isCorrect) values ('Content Answer 3','3',True);
INSERT INTO Answer(Content,QuestionID,isCorrect) values ('Content Answer 4','4',True);
INSERT INTO Answer(Content,QuestionID,isCorrect) values ('Content Answer 5','5',FALSE);

INSERT INTO Exam(CodeExam,Title,CategoryID,Duration,CreatorID,CreateDate) VALUES ('A001','ABC1','1','40:00:00','1111','2013-06-08');
INSERT INTO Exam(CodeExam,Title,CategoryID,Duration,CreatorID,CreateDate) VALUES ('A002','ABC2','2','45:00:00','1212','2013-06-08');
INSERT INTO Exam(CodeExam,Title,CategoryID,Duration,CreatorID,CreateDate) VALUES ('B003','ABC3','3','50:00:00','3333','2013-06-08');
INSERT INTO Exam(CodeExam,Title,CategoryID,Duration,CreatorIcatagoriesD,CreateDate) VALUES ('C004','ABC4','4','60:00:00','1414','2013-06-08');
INSERT INTO Exam(CodeExam,Title,CategoryID,Duration,CreatorID,CreateDate) VALUES ('D005','ABC5','5','30:00:00','5050','2013-06-08');

INSERT INTO ExamQuestion(ExamID,QuestionID) values ('1','2');
INSERT INTO ExamQuestion(ExamID,QuestionID) values ('2','5');
INSERT INTO ExamQuestion(ExamID,QuestionID) values ('3','4');
INSERT INTO ExamQuestion(ExamID,QuestionID) values ('4','1');
INSERT INTO ExamQuestion(ExamID,QuestionID) values ('5','3');
