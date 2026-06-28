#Database Understanding

#Use Database
USE hr_employee_attrition;

#Verify Current Database
SELECT DATABASE() AS Current_Database;

#Show All Tables
SHOW TABLES;

#load the dataset
SELECT *
FROM `hr-employee-attrition`;

#View Table Structure
DESCRIBE `hr-employee-attrition`;

#Count Total Columns
SELECT COUNT(*) AS Total_Columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='hr_employee_attrition'
AND TABLE_NAME='hr-employee-attrition';

#Count Total Records
SELECT COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`;

#Display First 10 Records
SELECT *
FROM `hr-employee-attrition`
LIMIT 10;

#Check Column Data Types
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='hr_employee_attrition'
AND TABLE_NAME='hr-employee-attrition';

#Check Storage Engine
SHOW TABLE STATUS
WHERE Name='hr-employee-attrition';

#Schema Analysis

#Display Complete Table Structure
DESCRIBE `hr-employee-attrition`;

#Display Detailed Column Information
SHOW FULL COLUMNS
FROM `hr-employee-attrition`;

#Check Total Number of Columns
SELECT
    COUNT(*) AS Total_Columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='hr_employee_attrition'
AND TABLE_NAME='hr-employee-attrition';

#List All Column Names
SELECT
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='hr_employee_attrition'
AND TABLE_NAME='hr-employee-attrition'
ORDER BY ORDINAL_POSITION;

#Check Data Types
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='hr_employee_attrition'
AND TABLE_NAME='hr-employee-attrition';

#Check Primary Key
SELECT
    COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA='hr_employee_attrition'
AND TABLE_NAME='hr-employee-attrition'
AND CONSTRAINT_NAME='PRIMARY';

#Check Foreign Keys
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA='hr_employee_attrition'
AND TABLE_NAME='hr-employee-attrition'
AND REFERENCED_TABLE_NAME IS NOT NULL;

#Check Auto Increment Column
SELECT
    COLUMN_NAME,
    EXTRA
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='hr_employee_attrition'
AND TABLE_NAME='hr-employee-attrition'
AND EXTRA LIKE '%auto_increment%';

#Check Storage Engine
SHOW TABLE STATUS
WHERE Name='hr-employee-attrition';

#Schema Summary
SELECT
    TABLE_NAME,
    TABLE_ROWS,
    ENGINE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA='hr_employee_attrition'
AND TABLE_NAME='hr-employee-attrition';

#Data Dictionary

#List All Columns
SELECT
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='hr_employee_attrition'
AND TABLE_NAME='hr-employee-attrition'
ORDER BY ORDINAL_POSITION;

#Column Name with Data Type
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='hr_employee_attrition'
AND TABLE_NAME='hr-employee-attrition'
ORDER BY ORDINAL_POSITION;

#Complete Metadata
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='hr_employee_attrition'
AND TABLE_NAME='hr-employee-attrition'
ORDER BY ORDINAL_POSITION;

#Total Number of Columns
SELECT
    COUNT(*) AS Total_Columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='hr_employee_attrition'
AND TABLE_NAME='hr-employee-attrition';

#Candidate Primary Key Validation
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT EmployeeNumber) AS Unique_Employee_IDs
FROM `hr-employee-attrition`;


#Data Quality Checks

#Total Records
SELECT COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`;

#Check Duplicate Employee IDs
SELECT
    EmployeeNumber,
    COUNT(*) AS Duplicate_Count
FROM `hr-employee-attrition`
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

#Check Missing Employee IDs
SELECT COUNT(*) AS Missing_Employee_ID
FROM `hr-employee-attrition`
WHERE EmployeeNumber IS NULL;

#Check Missing Values in Important Columns
SELECT
    SUM(CASE WHEN Attrition IS NULL THEN 1 ELSE 0 END) AS Missing_Attrition,
    SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Missing_Department,
    SUM(CASE WHEN JobRole IS NULL THEN 1 ELSE 0 END) AS Missing_JobRole,
    SUM(CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 END) AS Missing_MonthlyIncome,
    SUM(CASE WHEN OverTime IS NULL THEN 1 ELSE 0 END) AS Missing_OverTime
FROM `hr-employee-attrition`;

#Check Invalid Monthly Income
SELECT *
FROM `hr-employee-attrition`
WHERE MonthlyIncome <= 0;

#Validate Attrition Values
SELECT DISTINCT Attrition
FROM `hr-employee-attrition`;

#Validate Overtime Values
SELECT DISTINCT OverTime
FROM `hr-employee-attrition`;

#Validate Constant Columns
SELECT
    COUNT(DISTINCT EmployeeCount) AS EmployeeCount_Values,
    COUNT(DISTINCT Over18) AS Over18_Values,
    COUNT(DISTINCT StandardHours) AS StandardHours_Values
FROM `hr-employee-attrition`;

#Check Data Quality Summary
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT EmployeeNumber) AS Unique_Employees,
    MIN(MonthlyIncome) AS Minimum_Income,
    MAX(MonthlyIncome) AS Maximum_Income
FROM `hr-employee-attrition`;

#Exploratory Data Analysis

#Total Employees by Attrition
SELECT
    Attrition,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY Attrition;

#Employees by Department
SELECT
    Department,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY Department
ORDER BY Total_Employees DESC;

#Attrition by Department
SELECT
    Department,
    Attrition,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY Department, Attrition
ORDER BY Department;

#Employees by Job Role
SELECT
    JobRole,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY JobRole
ORDER BY Total_Employees DESC;

#Attrition by Job Role
SELECT
    JobRole,
    Attrition,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY JobRole, Attrition
ORDER BY JobRole;

#Gender Distribution
SELECT
    Gender,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY Gender;

#Attrition by Gender
SELECT
    Gender,
    Attrition,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY Gender, Attrition;

#Employees by Age Group

SELECT
    CASE
        WHEN `ï»¿Age` BETWEEN 18 AND 25 THEN '18-25'
        WHEN `ï»¿Age` BETWEEN 26 AND 35 THEN '26-35'
        WHEN `ï»¿Age` BETWEEN 36 AND 45 THEN '36-45'
        WHEN `ï»¿Age` BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS Age_Group,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY Age_Group
ORDER BY Age_Group;

#Attrition by Overtime
SELECT
    OverTime,
    Attrition,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY OverTime, Attrition;

#Average Monthly Income by Department
SELECT
    Department,
    ROUND(AVG(MonthlyIncome),2) AS Avg_Monthly_Income
FROM `hr-employee-attrition`
GROUP BY Department
ORDER BY Avg_Monthly_Income DESC;


#KPI Analysis

#Total Employees
SELECT
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`;

#Total Employees Left
SELECT
    COUNT(*) AS Employees_Left
FROM `hr-employee-attrition`
WHERE Attrition = 'Yes';

#Active Employees
SELECT
    COUNT(*) AS Active_Employees
FROM `hr-employee-attrition`
WHERE Attrition = 'No';

#Overall Attrition Rate
SELECT
    CONCAT(
        ROUND(
            SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
            2
        ),
        '%'
    ) AS Attrition_Rate
FROM `hr-employee-attrition`; 

#Average Employee Age
SELECT
    ROUND(AVG(`ï»¿Age`),2) AS Average_Age
FROM `hr-employee-attrition`;

#Average Monthly Income
SELECT
    ROUND(AVG(MonthlyIncome),2) AS Average_Monthly_Income
FROM `hr-employee-attrition`;

#Average Years at Company
SELECT
    ROUND(AVG(YearsAtCompany),2) AS Average_Years_At_Company
FROM `hr-employee-attrition`;

#Average Job Satisfaction
SELECT
    ROUND(AVG(JobSatisfaction),2) AS Average_Job_Satisfaction
FROM `hr-employee-attrition`;

#Employees Working Overtime
SELECT
    COUNT(*) AS Overtime_Employees
FROM `hr-employee-attrition`
WHERE OverTime='Yes';

#Average Work-Life Balance
SELECT
    ROUND(AVG(WorkLifeBalance),2) AS Average_Work_Life_Balance
FROM `hr-employee-attrition`;


#Basic SQL Queries
#Display All Employees

SELECT *
FROM `hr-employee-attrition`;

#Display Required Columns Only
SELECT
    EmployeeNumber,
    ï»¿Age,
    Gender,
    Department,
    JobRole,
    MonthlyIncome,
    Attrition
FROM `hr-employee-attrition`;

#Employees Who Left the Company
SELECT
    EmployeeNumber,
    ï»¿Age,
    Department,
    JobRole
FROM `hr-employee-attrition`
WHERE Attrition = 'Yes';

#Employees Older Than 40
SELECT
    EmployeeNumber,
    `ï»¿Age`,
    Department,
    JobRole
FROM `hr-employee-attrition`
WHERE `ï»¿Age` > 40;

#Employees Working OvertimeSELECT
  SELECT 
    EmployeeNumber,     
    Department,     
    JobRole 
FROM `hr-employee-attrition` 
WHERE OverTime = 'Yes';

#Employees by Department
SELECT
    Department,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY Department;

#Departments Having More Than 100 Employees
SELECT
    Department,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY Department
HAVING COUNT(*) > 100;

#Employees Ordered by Monthly Income
SELECT
    EmployeeNumber,
    JobRole,
    MonthlyIncome
FROM `hr-employee-attrition`
ORDER BY MonthlyIncome DESC;

#Top 10 Highest Paid Employees
SELECT
    EmployeeNumber,
    JobRole,
    MonthlyIncome
FROM `hr-employee-attrition`
ORDER BY MonthlyIncome DESC
LIMIT 10;

#Employees Between Age 30 and 40
SELECT
    EmployeeNumber,
    ï»¿Age,
    Department,
    JobRole
FROM `hr-employee-attrition`
WHERE ï»¿Age BETWEEN 30 AND 40;


#Intermediate SQL Queries

#Categorize Employees by Age Group
SELECT
    EmployeeNumber,
    ï»¿Age,
    CASE
        WHEN ï»¿Age BETWEEN 18 AND 25 THEN 'Young'
        WHEN ï»¿Age BETWEEN 26 AND 35 THEN 'Early Career'
        WHEN ï»¿Age BETWEEN 36 AND 45 THEN 'Mid Career'
        ELSE 'Senior'
    END AS Age_Group
FROM `hr-employee-attrition`;

#Salary Category
SELECT
    EmployeeNumber,
    MonthlyIncome,
    CASE
        WHEN MonthlyIncome < 5000 THEN 'Low Salary'
        WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS Salary_Category
FROM `hr-employee-attrition`;

#Department-wise Average Salary
SELECT
    Department,
    ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM `hr-employee-attrition`
GROUP BY Department
ORDER BY Avg_Salary DESC;

#Job Roles with Above Average Salary
SELECT
    EmployeeNumber,
    JobRole,
    MonthlyIncome
FROM `hr-employee-attrition`
WHERE MonthlyIncome >
(
    SELECT AVG(MonthlyIncome)
    FROM `hr-employee-attrition`
);

#Employee Name Length (Using EmployeeNumber as Identifier)
SELECT
    EmployeeNumber,
    LENGTH(JobRole) AS JobRole_Length
FROM `hr-employee-attrition`;

#Department Name in Uppercase
SELECT
    Department,
    UPPER(Department) AS Department_Upper
FROM `hr-employee-attrition`;

#Highest Salary in Each Department
SELECT
    Department,
    MAX(MonthlyIncome) AS Highest_Salary
FROM `hr-employee-attrition`
GROUP BY Department;

#Employees with More Than 10 Years Experience
SELECT
    EmployeeNumber,
    TotalWorkingYears,
    Department
FROM `hr-employee-attrition`
WHERE TotalWorkingYears > 10;

#Average Job Satisfaction by Department
SELECT
    Department,
    ROUND(AVG(JobSatisfaction),2) AS Avg_Job_Satisfaction
FROM `hr-employee-attrition`
GROUP BY Department;

#Employees Earning More Than Their Department Average
SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome
FROM `hr-employee-attrition` e
WHERE MonthlyIncome >
(
    SELECT AVG(MonthlyIncome)
    FROM `hr-employee-attrition`
    WHERE Department = e.Department
);


#Advanced SQL Queries

#Department with Highest Attrition Rate
SELECT
    Department,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM `hr-employee-attrition`
GROUP BY Department
ORDER BY Attrition_Rate DESC;

#Top 5 Highest Paid Employees in Each Department
SELECT *
FROM (
    SELECT
        EmployeeNumber,
        Department,
        JobRole,
        MonthlyIncome,
        ROW_NUMBER() OVER(
            PARTITION BY Department
            ORDER BY MonthlyIncome DESC
        ) AS rn
    FROM `hr-employee-attrition`
) t
WHERE rn <= 5;

#Employees Earning More Than Their Job Role Average
SELECT
    EmployeeNumber,
    JobRole,
    MonthlyIncome
FROM `hr-employee-attrition` e
WHERE MonthlyIncome >
(
    SELECT AVG(MonthlyIncome)
    FROM `hr-employee-attrition`
    WHERE JobRole = e.JobRole
);


#Department with Highest Average Salary
SELECT
    Department,
    ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM `hr-employee-attrition`
GROUP BY Department
ORDER BY Avg_Salary DESC
LIMIT 1;

#Attrition Percentage by Job Role
SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM `hr-employee-attrition`
GROUP BY JobRole
ORDER BY Attrition_Rate DESC;

#Employees Above Overall Experience Average
SELECT
    EmployeeNumber,
    TotalWorkingYears
FROM `hr-employee-attrition`
WHERE TotalWorkingYears >
(
    SELECT AVG(TotalWorkingYears)
    FROM `hr-employee-attrition`
);

#High-Risk Employees
SELECT
    EmployeeNumber,
    Department,
    JobRole,
    OverTime,
    JobSatisfaction,
    WorkLifeBalance
FROM `hr-employee-attrition`
WHERE OverTime='Yes'
AND JobSatisfaction<=2
AND WorkLifeBalance<=2;

#Salary Distribution
SELECT
    CASE
        WHEN MonthlyIncome < 5000 THEN 'Low'
        WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium'
        ELSE 'High'
    END AS Salary_Band,
    COUNT(*) AS Employees
FROM `hr-employee-attrition`
GROUP BY Salary_Band;

#Department-wise Overtime Percentage
SELECT
    Department,
    ROUND(
        SUM(CASE WHEN OverTime='Yes' THEN 1 ELSE 0 END) *100.0 / COUNT(*),
        2
    ) AS Overtime_Percentage
FROM `hr-employee-attrition`
GROUP BY Department
ORDER BY Overtime_Percentage DESC;

#Employees with Maximum Experience in Each Department
SELECT
    Department,
    EmployeeNumber,
    TotalWorkingYears
FROM `hr-employee-attrition` e
WHERE TotalWorkingYears =
(
    SELECT MAX(TotalWorkingYears)
    FROM `hr-employee-attrition`
    WHERE Department=e.Department
);


#Window Functions

#ROW_NUMBER()
SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome,
    ROW_NUMBER() OVER(ORDER BY MonthlyIncome DESC) AS Row_Num
FROM `hr-employee-attrition`;

#RANK()
SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome,
    RANK() OVER(ORDER BY MonthlyIncome DESC) AS Salary_Rank
FROM `hr-employee-attrition`;

#DENSE_RANK()
SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome,
    DENSE_RANK() OVER(ORDER BY MonthlyIncome DESC) AS Denserank
FROM `hr-employee-attrition`;

#LAG()
SELECT
    EmployeeNumber,
    MonthlyIncome,
    LAG(MonthlyIncome)
    OVER(ORDER BY MonthlyIncome) AS Previous_Salary
FROM `hr-employee-attrition`;

#LEAD()
SELECT
    EmployeeNumber,
    MonthlyIncome,
    LEAD(MonthlyIncome)
    OVER(ORDER BY MonthlyIncome) AS Next_Salary
FROM `hr-employee-attrition`;

#FIRST_VALUE()
SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome,
    FIRST_VALUE(MonthlyIncome)
    OVER(
        PARTITION BY Department
        ORDER BY MonthlyIncome DESC
    ) AS Highest_Department_Salary
FROM `hr-employee-attrition`;

#LAST_VALUE()
SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome,
    LAST_VALUE(MonthlyIncome)
    OVER(
        PARTITION BY Department
        ORDER BY MonthlyIncome DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS Lowest_Department_Salary
FROM `hr-employee-attrition`;

#NTILE()
SELECT
    EmployeeNumber,
    MonthlyIncome,
    NTILE(4)
    OVER(ORDER BY MonthlyIncome DESC) AS Salary_Quartile
FROM `hr-employee-attrition`;

#PERCENT_RANK()
SELECT
    EmployeeNumber,
    MonthlyIncome,
    ROUND(
        PERCENT_RANK() OVER(ORDER BY MonthlyIncome),
        2
    ) AS PercentRank
FROM `hr-employee-attrition`;

#NTH_VALUE()
SELECT
    EmployeeNumber,
    Department,
    MonthlyIncome,
    NTH_VALUE(MonthlyIncome,2)
    OVER(
        PARTITION BY Department
        ORDER BY MonthlyIncome DESC
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS Second_Highest_Salary
FROM `hr-employee-attrition`;


#CTE (Common Table Expressions) Analysis

#Employees Earning Above Average Salary
WITH AvgSalary AS
(
    SELECT AVG(MonthlyIncome) AS Avg_Income
    FROM `hr-employee-attrition`
)

SELECT
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome
FROM `hr-employee-attrition`, AvgSalary
WHERE MonthlyIncome > Avg_Income;

#Department-wise Average Salary
WITH DepartmentSalary AS
(
    SELECT
        Department,
        ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
    FROM `hr-employee-attrition`
    GROUP BY Department
)

SELECT *
FROM DepartmentSalary
ORDER BY Avg_Salary DESC;

#High Attrition Departments
WITH AttritionDept AS
(
    SELECT
        Department,
        COUNT(*) AS Employees_Left
    FROM `hr-employee-attrition`
    WHERE Attrition='Yes'
    GROUP BY Department
)

SELECT *
FROM AttritionDept
ORDER BY Employees_Left DESC;

#Employees Above Department Average Salary
WITH DeptAvg AS
(
    SELECT
        Department,
        AVG(MonthlyIncome) AS AvgSalary
    FROM `hr-employee-attrition`
    GROUP BY Department
)

SELECT
    e.EmployeeNumber,
    e.Department,
    e.MonthlyIncome
FROM `hr-employee-attrition` e
JOIN DeptAvg d
ON e.Department=d.Department
WHERE e.MonthlyIncome>d.AvgSalary;

#Average Job Satisfaction by Department
WITH JobSat AS
(
    SELECT
        Department,
        ROUND(AVG(JobSatisfaction),2) AS Avg_Job_Satisfaction
    FROM `hr-employee-attrition`
    GROUP BY Department
)

SELECT *
FROM JobSat
ORDER BY Avg_Job_Satisfaction DESC;

#Employees with More Than Average Experience
WITH AvgExperience AS
(
    SELECT AVG(TotalWorkingYears) AS Avg_Experience
    FROM `hr-employee-attrition`
)

SELECT
    EmployeeNumber,
    TotalWorkingYears
FROM `hr-employee-attrition`, AvgExperience
WHERE TotalWorkingYears > Avg_Experience;

#Top Paid Employee in Each Department
WITH SalaryRank AS
(
    SELECT
        EmployeeNumber,
        Department,
        MonthlyIncome,
        ROW_NUMBER() OVER
        (
            PARTITION BY Department
            ORDER BY MonthlyIncome DESC
        ) AS rn
    FROM `hr-employee-attrition`
)

SELECT *
FROM SalaryRank
WHERE rn=1;

#Employees Working Overtime and Having Low Job Satisfaction
WITH HighRisk AS
(
    SELECT
        EmployeeNumber,
        Department,
        JobRole,
        OverTime,
        JobSatisfaction
    FROM `hr-employee-attrition`
    WHERE OverTime='Yes'
    AND JobSatisfaction<=2
)

SELECT *
FROM HighRisk;

#Department-wise Attrition Rate
WITH AttritionRate AS
(
    SELECT
        Department,
        ROUND(
            SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
            *100.0/COUNT(*),2
        ) AS Attrition_Rate
    FROM `hr-employee-attrition`
    GROUP BY Department
)

SELECT *
FROM AttritionRate
ORDER BY Attrition_Rate DESC;

#Employees with Maximum Experience in Each Department
WITH MaxExperience AS
(
    SELECT
        Department,
        MAX(TotalWorkingYears) AS Max_Experience
    FROM `hr-employee-attrition`
    GROUP BY Department
)

SELECT
    e.EmployeeNumber,
    e.Department,
    e.TotalWorkingYears
FROM `hr-employee-attrition` e
JOIN MaxExperience m
ON e.Department=m.Department
AND e.TotalWorkingYears=m.Max_Experience;

#Ranking Analysis

#Rank Employees by Monthly Income
SELECT
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome,
    RANK() OVER(ORDER BY MonthlyIncome DESC) AS Salary_Rank
FROM `hr-employee-attrition`;

#Top 3 Highest Paid Employees in Each Department
SELECT *
FROM
(
    SELECT
        EmployeeNumber,
        Department,
        JobRole,
        MonthlyIncome,
        DENSE_RANK() OVER
        (
            PARTITION BY Department
            ORDER BY MonthlyIncome DESC
        ) AS Salary_Rank
    FROM `hr-employee-attrition`
) t
WHERE Salary_Rank <= 3;

#Rank Departments by Average Salary
SELECT
    Department,
    ROUND(AVG(MonthlyIncome),2) AS Avg_Salary,
    RANK() OVER(ORDER BY AVG(MonthlyIncome) DESC) AS Department_Rank
FROM `hr-employee-attrition`
GROUP BY Department;

#Rank Job Roles by Attrition Rate
SELECT
    JobRole,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),2
    ) AS Attrition_Rate,
    DENSE_RANK() OVER
    (
        ORDER BY
        ROUND(
            SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
            *100.0/COUNT(*),2
        ) DESC
    ) AS Attrition_Rank
FROM `hr-employee-attrition`
GROUP BY JobRole;

#Rank Departments by Attrition Rate
SELECT
    Department,
    ROUND(
        SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        *100.0/COUNT(*),2
    ) AS Attrition_Rate,
    RANK() OVER
    (
        ORDER BY
        ROUND(
            SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
            *100.0/COUNT(*),2
        ) DESC
    ) AS Department_Rank
FROM `hr-employee-attrition`
GROUP BY Department;

#Rank Employees by Total Working Years
SELECT
    EmployeeNumber,
    Department,
    TotalWorkingYears,
    DENSE_RANK() OVER
    (
        ORDER BY TotalWorkingYears DESC
    ) AS Experience_Rank
FROM `hr-employee-attrition`;

#Rank Employees by Years at Company
SELECT
    EmployeeNumber,
    Department,
    YearsAtCompany,
    ROW_NUMBER() OVER
    (
        ORDER BY YearsAtCompany DESC
    ) AS Company_Tenure_Rank
FROM `hr-employee-attrition`;

#Rank Departments by Average Job Satisfaction
SELECT
    Department,
    ROUND(AVG(JobSatisfaction),2) AS Avg_Job_Satisfaction,
    RANK() OVER
    (
        ORDER BY AVG(JobSatisfaction) DESC
    ) AS Satisfaction_Rank
FROM `hr-employee-attrition`
GROUP BY Department;

#Rank Job Roles by Average Monthly Income
SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome),2) AS Avg_Monthly_Income,
    DENSE_RANK() OVER
    (
        ORDER BY AVG(MonthlyIncome) DESC
    ) AS Salary_Rank
FROM `hr-employee-attrition`
GROUP BY JobRole;

#Rank Employees by Work-Life Balance
SELECT
    EmployeeNumber,
    Department,
    WorkLifeBalance,
    DENSE_RANK() OVER
    (
        ORDER BY WorkLifeBalance DESC
    ) AS WorkLifeBalance_Rank
FROM `hr-employee-attrition`;

#Employee Segmentation Analysis

#Employee Segmentation by Age
SELECT
    CASE
        WHEN ï»¿Age BETWEEN 18 AND 25 THEN 'Young Employees'
        WHEN ï»¿Age BETWEEN 26 AND 35 THEN 'Early Career'
        WHEN ï»¿Age BETWEEN 36 AND 45 THEN 'Mid Career'
        ELSE 'Senior Employees'
    END AS Age_Segment,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY Age_Segment
ORDER BY Total_Employees DESC;

#Salary Segmentation
SELECT
    CASE
        WHEN MonthlyIncome < 5000 THEN 'Low Salary'
        WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS Salary_Segment,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY Salary_Segment
ORDER BY Total_Employees DESC;

#Experience Segmentation
SELECT
    CASE
        WHEN TotalWorkingYears < 5 THEN 'Junior'
        WHEN TotalWorkingYears BETWEEN 5 AND 10 THEN 'Mid-Level'
        ELSE 'Senior'
    END AS Experience_Segment,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY Experience_Segment;

#Department-wise Employee Segmentation
SELECT
    Department,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY Department
ORDER BY Total_Employees DESC;

#Job Role Segmentation
SELECT
    JobRole,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY JobRole
ORDER BY Total_Employees DESC;

#Job Satisfaction Segmentation
SELECT
    JobSatisfaction,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

#Work-Life Balance Segmentation
SELECT
    WorkLifeBalance,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

#Overtime Segmentation
SELECT
    OverTime,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY OverTime;

#Marital Status Segmentation
SELECT
    MaritalStatus,
    COUNT(*) AS Total_Employees
FROM `hr-employee-attrition`
GROUP BY MaritalStatus
ORDER BY Total_Employees DESC;

#High-Risk Employee Segmentation
SELECT
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome,
    OverTime,
    JobSatisfaction,
    WorkLifeBalance
FROM `hr-employee-attrition`
WHERE Attrition = 'Yes'
  AND OverTime = 'Yes'
  AND JobSatisfaction <= 2
  AND WorkLifeBalance <= 2;
  