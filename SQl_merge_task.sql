use Projects_sql
select* from HRA_R
create table new_record2 (Emp_no int,E_Age int,E_Department varchar(40))

MERGE INTO new_record2 as Target
USING HRA_R as Source
ON (TARGET.Emp_no=source.Employeenumber)
WHEN NOT MATCHED BY TARGET 
THEN 
INSERT (emp_no,E_Age,E_Department)---INSERT COLUMN IN TARGET TABLE 
VALUES (source.Employeenumber,source.Age,source.Department)
WHEN MATCHED THEN UPDATE ---UPADTE TARGET TABLE
SET TARGET.Emp_no=SOURCE.Employeenumber,
TARGET.E_AGE=SOURCE.AGE,
TARGET.E_Department=SOURCE.Department
WHEN NOT MATCHED BY SOURCE ---DELETE RECORD NOT IN TARGET TABLE 
THEN DELETE;  
select* from HRA_R
SELECT * FROM new_record2 
insert into new_record2 VALUES(102,60,'software')

update new_record2 set E_Department='Soft' where E_Age=54

SELECT EMP_NO,E_AGE,E_Department FROM new_record2 WHERE E_Department='Hardware' and E_Age=26








--new
---select Employeenumber,age,department from HRA_R where age=26 and department='hardware'


