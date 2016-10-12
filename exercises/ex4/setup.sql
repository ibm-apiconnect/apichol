CREATE TABLE `employees` 
  ( 
     `emp_no`     INT(11) NOT NULL, 
     `birth_date` DATE NOT NULL, 
     `first_name` VARCHAR(14) NOT NULL, 
     `last_name`  VARCHAR(16) NOT NULL, 
     `gender`     ENUM('M', 'F') NOT NULL, 
     `hire_date`  DATE NOT NULL, 
     PRIMARY KEY (`emp_no`) 
  ) 
engine=innodb 
DEFAULT charset=latin1;
