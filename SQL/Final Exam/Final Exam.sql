create database Final_Exam_3;
use Final_Exam_3;
CREATE table Country(
Country_id int primary key auto_increment,
country_name varchar(255)
);
CREATE TABLE Location(
location_id int primary key auto_increment,
street_address varchar(255), 
postal_code varchar(255), 
country_id int,
FOREIGN KEY (country_id) REFERENCES Country(country_id)
);
CREATE TABLE Employee(
employee_id int primary key auto_increment, 
full_name varchar(255), 
email varchar(255), 
location_id int,
FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

INSERT INTO Country(country_name) Values ('Vietnamese'),('Canada'),('Comoros'),('Guernsey'),('Macao');
INSERT INTO Location(street_address,postal_code,country_id) VALUES 

('127 Nguyen Trai12, Ha Noi','100000','1'),
('127 Nguyen Trai2, Ha Noi','100000','1'),
('127 Nguyen Trai3, Ha Noi','100000','1'),
('127 Nguyen Tra4, Ha Noi','100000','1'),
('127 Nguyen Trai5, Ha Noi','100000','1'),
('127 Nguyen Trai6, Ha Noi','100000','1'),
('127 Nguyen Trai7, Ha Noi','100000','1'),
('127 Nguyen Trai, Ha Noi','100000','1'),
('350 Quang Trung, Da Nang','550000','1'),
('12 Ly Thai To, Ho Chi Minh','700000','1'),
('27 Hill Field Dr.San Antonio','78213','2'),
('8729 Roberts St.New Milford','06776','2'),
('9165 North Green Lake Court Southfield','48076','3'),
('9217 Cemetery RoadLongview','70004','4'),
('8183 Pulaski St.Milwaukee','53204','5'),
('50 Oak Meadow Road Depew','14043','5');
INSERT INTO Employee(full_name,email,location_id) VALUES 
('Nguyen Minh Tai','8tainn03@gmail.com','1'),
('Tran Van Trong','trongacc@gmail.com','2'),
('Doan Ba Nam','namdang@gmail.com','3'),
('Maeve Solis','bbirth@gmail.com','4'),
('Cailyn Welch','mattynn03@gmail.com','5'),
('Anderson Blair','moinefounn03@gmail.com','6'),
('Kendal Hanna','pakaste@gmail.com','7'),
('Carter Dominguez','glenn03@gmail.com','8'),
('Jan Mclean','daveewart@gmail.com','9');

-- bai 2
-- a
SELECT a.employee_id,a.full_name
FROM Employee a
LEFT Join Location b On a.location_id = b.location_id
LEFT Join Country c On b.country_id = c.Country_id
WHERE country_name = 'Vietnamese';
-- b
SELECT a.country_ID,a.country_name 
From Country a
RIGHT JOIN Location b ON a.country_id = b.country_id
RIGHT JOIN Employee c ON c.location_id =b.location_id
    
WHERE c.email Like '%nn03@gmail.com';
-- c
SELECT y.country_name,count(x.country_id) AS SLCT
FROM (SELECT a.country_id,b.street_address,count(b.location_id) AS SLLCT
FROM Country a
LEFT JOIN Location b ON a.country_id = b.country_id
LEFT JOIN Employee c ON c.location_id =b.location_id
GROUP BY b.location_id) x
LEFT JOIN Country y ON y.country_id = x.country_id

GROUP BY x.country_id;

SELECT b.street_address,count(b.location_id) AS SLLCT
FROM Country a
LEFT JOIN Location b ON a.country_id = b.country_id
LEFT JOIN Employee c ON c.location_id =b.location_id
GROUP BY b.location_id;

-- bai 3
-- tao view
DROP VIEW IF EXISTS View_3;
CREATE VIEW View_3 AS
 SELECT y.country_name,count(x.country_id) AS SLCT
FROM (SELECT a.country_id,b.street_address,count(b.location_id) AS SLLCT
FROM Country a
LEFT JOIN Location b ON a.country_id = b.country_id
LEFT JOIN Employee c ON c.location_id =b.location_id
GROUP BY b.location_id) x
LEFT JOIN Country y ON y.country_id = x.country_id

GROUP BY x.country_id;
;
-- tao trigger
DROP TRIGGER IF EXISTS TRIGGER_Bai3;
DELIMITER $$
CREATE TRIGGER TRIGGER_Bai3
Before insert on Employee
for each row
begin 
	if View_3.SLCT <= 10
    then signal SQLSTATE '12345'
	set MESSAGE_TEXT = 'Full';
	end if;
end $$
delimiter ; 


