CREATE DATABASE hospital;

CREATE TABLE HOSPITAL_DATA(Hospital_Name VARCHAR(100),
Location VARCHAR(50),
Department VARCHAR(50),
Doctors_Count INT,
Patients_Count INT,
Admission_Date DATE,
Discharge_Date DATE,
Medical_Expenses NUMERIC(10,2)
);
SELECT * FROM HOSPITAL_DATA;

--1.TOTAL NUMBER OF PATIENTS
--WRITE SQL QUERY TO FIND THE TOTAL NUMBER OF PATIENTS ACROSS ALL HOSPITALS.
SELECT SUM(Patients_Count) FROM HOSPITAL_DATA;

--2.AVERAGE NUMBER OF DOCTORS PER HOSPITAL
--RETRIVE THE AVERAGE COUNT OF DOCTORS AVAILABLE IN EACH HOSPITAL.
select Hospital_Name,
AVG(Doctors_Count) AS average_count FROM HOSPITAL_DATA
group by Hospital_Name; 


--3.TOP 3 DEPARTMENTS WITH HIGHER NUMBER OF PATIENTS
--FIND THE TOP 3 HOSPITAL DEPARTMENTS THAT HAVE THE HIGHEST NUMBER OF PATIENTS.
SELECT department,Patients_Count FROM HOSPITAL_DATA
order by(Patients_Count) desc limit 3;



--4.HOSPITAL WITH MAXIMUM MEDICAL EXPENSES.
--IDENTIFY THE HOSPITAL THAT RECORDED THE HIGHEST MEDICAL EXPENSES.
select Hospital_Name,Medical_expenses from HOSPITAL_DATA
ORDER BY(Medical_Expenses) desc limit 1;


--5.DAILY AVERAGE MEDICAL EXPENSES.
--CALCULATE THE AVERAGE MEDICAL EXPENSES PER DAY FOR EACH HOSPITAL.
select Hospital_Name, 
    AVG(Medical_Expenses/COALESCE((Discharge_Date-Admission_Date),0))AS Avg_Expense_Per_Day
FROM HOSPITAL_DATA
GROUP BY Hospital_Name;


--6.Longest Hospital Stay
-- Find the patient with longesr stay by calculating difference between Discharge Date and Admission Date.
select Hospital_name,Patients_Count,Admission_Date,Discharge_Date,(Discharge_Date-Admission_Date)
as Days_Difference from HOSPITAL_DATA ORDER by Days_Difference desc limit 1;


--7.Total pateints Treated per City
--Count the total number of patients treated in each city
select distinct Location, count(Patients_Count) as Total_number_of_patients_per_city from HOSPITAL_DATA
GROUP BY dISTINCT Location;



--8. average length of stay per department
--calculate the average number of days patients spend in each department.

select Department, avg(Discharge_Date-Admission_Date) as avergae_number_of_days_patients_spend
from HOSPITAL_DATA GROUP BY Department;



--9.identify the department with lowest number of patients
--find the department with least number of patients.

Select Department, Count(Patients_Count) as Number_of_patients 
from HOSPITAL_DATA group by Department
ORDER BY Number_of_patients limit 1;


--10. Monthly medical Expenses Report
--Group the data by month and calculate the total medical expenses for each month.
SELECT DATE_FORMAT (STR_TO-DATE(Admission_Date,dd-mm-yy,),YY-MM) AS Year_Month, 
    SUM(Medical_Expenses) AS Total_Medical_Expenses
FROM HOSPITAL_DATA
GROUP BY Year_Month
ORDER BY Year_Month;



 