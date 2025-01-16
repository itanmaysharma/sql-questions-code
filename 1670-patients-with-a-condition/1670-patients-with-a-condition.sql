# Write your MySQL query statement below
select * 
From Patients
-- Where conditions REGEXP '(^|\\s)DIAB1';
where conditions like "DIAB1%" or conditions like "% DIAB1%";