#create database healthcare;

use healthcare;

create table Diagnoses(
	DiagnosisID int primary key,
    DiagnosisName varchar(225)
    );
    
create table Outcomes(
	OutcomesID int primary key,
    OutcomesName varchar(255)
    );
    
create table Patients(
	PatientID int primary key,
    Name varchar(255),
    Age int,
    Gender char(1),
    DiagnosisID int,
    AdmissionDate Date,
    DischargeDate Date,
    OutcomesID int,
    TreatmentCost decimal(10,2),
    foreign key (DiagnosisID) references Diagnoses(DiagnosisID),
    foreign key (OutcomesID)  references Outcomes(OutcomesID)
    );
    
    
    
create table Lab(
	labID int primary key,
    PatientID int,
    TestName varchar(255),
    Result decimal(10,2),
    NormalRange varchar(255),
    foreign key (PatientID) references Patients(PatientID)
    );
    
alter table lab
rename  Lab;
    
select * from outcomes;
-- Retrieve Patient lab history 
select p.patientID, p.name,d.diagnosisname,o.OutcomesName,l.testname, l.result, l.NormalRange
from Patients p 
join diagnoses d on p.DiagnosisID = d.DiagnosisID
join outcomes o on p.OutcomesID = o.OutcomesID
join Lab l on p.PatientID = l.PatientID
order by p.PatientID, l.testname;

-- average lab Results by Diagnosis name
select d.DiagnosisName, l.testname, avg(l.result) as AvgResult
from Patients p 
join diagnoses d on p.DiagnosisID = d.DiagnosisID
join Lab l on p.PatientID = l.PatientID
group by d.DiagnosisName , l.testname;

-- abnormal patient

-- JOIN Lab l ON p.PatientID = l.PatientID → links patients with their lab results.
-- SUBSTRING_INDEX(l.NormalRange, '-', 1) → extracts the lower bound (before the dash).
-- SUBSTRING_INDEX(l.NormalRange, '-', -1) → extracts the upper bound (after the dash).
-- CAST(... AS DECIMAL(10,2)) → converts text into numbers for comparison.
-- WHERE l.Result NOT BETWEEN lower AND upper → filters abnormal results.
-- COUNT(*) AS AbnormalCount → counts how many abnormal tests each patient has.
-- GROUP BY p.PatientID, p.Name → groups results by patient.

SELECT p.PatientID, p.Name, COUNT(*) AS AbnormalCount
FROM Patients p
JOIN Lab l ON p.PatientID = l.PatientID
WHERE l.Result NOT BETWEEN
      CAST(SUBSTRING_INDEX(l.NormalRange, '-', 1) AS DECIMAL(10,2))
      AND CAST(SUBSTRING_INDEX(l.NormalRange, '-', -1) AS DECIMAL(10,2))
GROUP BY p.PatientID, p.Name 
order by AbnormalCount desc;

-- Diagnosis with highest treatment cost
select d.DiagnosisName , sum(p.treatmentcost) as total_cost
from Patients p
join diagnoses d on p.DiagnosisID = d.DiagnosisID
group by d.DiagnosisName
order by total_cost desc;

-- patient at risk by age and gender
select p.patientID,p.name , p.age, p.gender, d.diagnosisname,o.outcomesname
from Patients p 
join diagnoses d on p.DiagnosisID = d.DiagnosisID
join outcomes o on p.OutcomesID = o.OutcomesID
where age > 65 and o.OutcomesName != 'Recovered'
order by p.age desc;

-- lab trend over time for specific patient
SELECT p.admissionDate, l.TestName, l.Result, l.NormalRange
FROM Lab l
JOIN Patients p ON l.PatientID = p.PatientID
WHERE p.PatientID in (2,4,6,8,10,12);


-- distribution of outcomes by diagnonsis

select d.diagnosisname, o.outcomesname, count(*) as outcome_count
from patients p
join diagnoses d on p.diagnosisID = d.diagnosisID
join Outcomes o on p.outcomesID = o.OutcomesID
group by d.diagnosisname, o.outcomesname
order by d.diagnosisname, o.outcomesname;

-- Replace '/' with '-' in NormalRange
UPDATE Lab
SET NormalRange = REPLACE(NormalRange, '/', '-');

SET SQL_SAFE_UPDATES = 0;



-- Standardize TestName capitalization
UPDATE Lab
SET TestName = CASE 
    WHEN LOWER(TestName) LIKE 'blood sugar%' THEN 'Blood Sugar'
    WHEN LOWER(TestName) LIKE 'blood pressure%' THEN 'Blood Pressure'
    WHEN LOWER(TestName) LIKE 'cholesterol%' THEN 'Cholesterol'
    WHEN LOWER(TestName) LIKE 'creatinine%' THEN 'Creatinine'
    WHEN LOWER(TestName) LIKE 'hemoglobin%' THEN 'Hemoglobin'
    WHEN LOWER(TestName) LIKE 'vitamin d%' THEN 'Vitamin D'
    ELSE TestName END;




    
    