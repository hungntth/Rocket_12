use testingsystem;
-- bai 1
DROP PROCEDURE IF EXISTS get_Q1;
DELIMITER $$
CREATE PROCEDURE get_Q1 (IN ten_phongban varchar(255))
BEGIN 
	SELECT a.AccountID,a.Email,a.Username,a.FullName
    FROM `account` a
    JOIN department b ON a.DepartmentID = b.DepartmentID
    WHERE b.DepartmentName = ten_phongban;
END$$
DELIMITER ;
call get_Q1('Sale');

-- bai 2
DROP PROCEDURE IF EXISTS get_Q2;
DELIMITER $$
CREATE PROCEDURE get_Q2 (IN nhaptengroup varchar(255))
BEGIN 
	SELECT a.groupID,count(*) AS SL
    FROM `group` a
    JOIN groupaccount b ON a.groupID = b.groupID
    WHERE a.groupID = nhaptengroup
    GROUP BY b.groupID;
END$$
DELIMITER ;
