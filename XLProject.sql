Use exproject;

-- 1. Average Attrition rate for all Departments

SELECT 
    Department,
    CONCAT(ROUND((COUNT(CASE
                        WHEN Attrition = 'Yes' THEN 1
                    END) / COUNT(*)) * 100,
                    0),
            ' %') AS Attrition1
FROM
    hr1
GROUP BY department;

-- 2. Average Hourly rate of Male Research Scientist

select round(avg(HourlyRate), 2) as'Avg_Hourly_Rate_Of_Male_Research_Scientist'
from hr1
Where Gender = 'Male' and JobRole = 'Research Scientist';

-- 3. Attrition rate Vs Monthly income stats

SELECT Department,
       SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) AS No_of_attrition,
       ROUND(AVG(h2.MonthlyIncome),2) AS Average_monthly_income,
       ROUND(AVG(h1.JobSatisfaction),2) AS Average_job_satisfaction
FROM hr1 as h1
JOIN hr2 as h2
on H1.EmployeeNumber = H2.EmployeeID
GROUP BY Department;



-- 4. Average working years for each Department

SELECT 
    H1.Department,
    ROUND(AVG(H2.TotalWorkingYears), 2) AS Average_working_years
FROM
    HR1 AS H1
        JOIN
    HR2 AS H2 ON H1.EmployeeNumber = H2.EmployeeID
GROUP BY Department
Order BY Department, Average_working_years;


-- 5. Job Role Vs Work life balance

SELECT 
    H1.JobRole, ROUND(AVG(H2.WorkLifeBalance), 2) AS WorkLifeBal
FROM
    hr1 AS H1
        JOIN
    hr2 AS H2 ON H1.EmployeeNumber = H2.EmployeeID
GROUP BY H1.JobRole;

-- 6. Male Vs. Female Attrition

SELECT 
    CONCAT(ROUND((SUM(CASE
                        WHEN Gender = 'Male' AND Attrition = 'Yes' THEN 1
                        ELSE 0
                    END) / SUM(CASE
                        WHEN Attrition = 'Yes' THEN 1
                        ELSE 0
                    END) * 100),
                    2),
            '%') AS TotalMaleATT,
    CONCAT(ROUND((SUM(CASE
                        WHEN Gender = 'Female' AND Attrition = 'Yes' THEN 1
                        ELSE 0
                    END) / SUM(CASE
                        WHEN Attrition = 'Yes' THEN 1
                        ELSE 0
                    END) * 100),
                    2),
            '%') AS TotalFemaleATT
FROM
    hr1;
    
-- 7 Work Life Balance Vs. Martial Status Vs. Distance from Home

SELECT 
    ROUND(AVG(CASE
                WHEN
                    h1.MaritalStatus = 'Single'
                        AND h2.WorkLifeBalance = 1
                THEN
                    h1.DistanceFromHome
                ELSE 0
            END),
            2) AS SingleDist1,
    ROUND(AVG(CASE
                WHEN
                    h1.MaritalStatus = 'Single'
                        AND h2.WorkLifeBalance = 2
                THEN
                    h1.DistanceFromHome
                ELSE 0
            END),
            2) AS SingleDist2,
    ROUND(AVG(CASE
                WHEN
                    h1.MaritalStatus = 'Single'
                        AND h2.WorkLifeBalance = 3
                THEN
                    h1.DistanceFromHome
                ELSE 0
            END),
            2) AS SingleDist3,
    ROUND(AVG(CASE
                WHEN
                    h1.MaritalStatus = 'Single'
                        AND h2.WorkLifeBalance = 4
                THEN
                    h1.DistanceFromHome
                ELSE 0
            END),
            2) AS SingleDist4,
    ROUND(AVG(CASE
                WHEN
                    MaritalStatus = 'Married'
                        AND h2.WorkLifeBalance = 1
                THEN
                    h1.DistanceFromHome
                ELSE 0
            END),
            2) AS MarriedDist1,
    ROUND(AVG(CASE
                WHEN
                    MaritalStatus = 'Married'
                        AND h2.WorkLifeBalance = 2
                THEN
                    h1.DistanceFromHome
                ELSE 0
            END),
            2) AS MarriedDist2,
    ROUND(AVG(CASE
                WHEN
                    MaritalStatus = 'Married'
                        AND h2.WorkLifeBalance = 3
                THEN
                    h1.DistanceFromHome
                ELSE 0
            END),
            2) AS MarriedDist3,
    ROUND(AVG(CASE
                WHEN
                    MaritalStatus = 'Married'
                        AND h2.WorkLifeBalance = 4
                THEN
                    h1.DistanceFromHome
                ELSE 0
            END),
            2) AS MarriedDist4,
    ROUND(AVG(CASE
                WHEN
                    MaritalStatus = 'Divorced'
                        AND h2.WorkLifeBalance = 1
                THEN
                    DistanceFromHome
                ELSE 0
            END),
            2) AS DivorcedDist1,
    ROUND(AVG(CASE
                WHEN
                    MaritalStatus = 'Divorced'
                        AND h2.WorkLifeBalance = 2
                THEN
                    DistanceFromHome
                ELSE 0
            END),
            2) AS DivorcedDist2,
    ROUND(AVG(CASE
                WHEN
                    MaritalStatus = 'Divorced'
                        AND h2.WorkLifeBalance = 3
                THEN
                    DistanceFromHome
                ELSE 0
            END),
            2) AS DivorcedDist3,
    ROUND(AVG(CASE
                WHEN
                    MaritalStatus = 'Divorced'
                        AND h2.WorkLifeBalance = 4
                THEN
                    DistanceFromHome
                ELSE 0
            END),
            2) AS DivorcedDist4
FROM
    hr1 AS h1
        JOIN
    hr2 AS h2 ON H1.EmployeeNumber = H2.EmployeeID;

-- 7. Job Satisfaction Male Vs. Female

SELECT 
    SUM(CASE
        WHEN JobSatisfaction = 1 AND gender = 'Male' THEN employeecount
        ELSE 0
    END) AS Male1,
    SUM(CASE
        WHEN JobSatisfaction = 2 AND gender = 'Male' THEN employeecount
        ELSE 0
    END) AS Male2,
    SUM(CASE
        WHEN JobSatisfaction = 3 AND gender = 'Male' THEN employeecount
        ELSE 0
    END) AS Male3,
    SUM(CASE
        WHEN JobSatisfaction = 4 AND gender = 'Male' THEN employeecount
        ELSE 0
    END) AS Male4,
    SUM(CASE
        WHEN
            JobSatisfaction = 1
                AND gender = 'Female'
        THEN
            employeecount
        ELSE 0
    END) AS Female1,
    SUM(CASE
        WHEN
            JobSatisfaction = 2
                AND gender = 'Female'
        THEN
            employeecount
        ELSE 0
    END) AS Female2,
    SUM(CASE
        WHEN
            JobSatisfaction = 3
                AND gender = 'Female'
        THEN
            employeecount
        ELSE 0
    END) AS Female3,
    SUM(CASE
        WHEN
            JobSatisfaction = 4
                AND gender = 'Female'
        THEN
            employeecount
        ELSE 0
    END) AS Female4
FROM
    hr1;