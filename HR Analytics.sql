USE HR_Analytics;
GO

-- 1. Overall attrition rate
SELECT 
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS Attrition_Rate_Pct
FROM HR_Attrition;

-- 2. Attrition by Department
SELECT 
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS Attrition_Rate_Pct
FROM HR_Attrition
GROUP BY Department
ORDER BY Attrition_Rate_Pct DESC;

-- 3. Attrition by Job Role
SELECT 
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS Attrition_Rate_Pct
FROM HR_Attrition
GROUP BY JobRole
ORDER BY Attrition_Rate_Pct DESC;

-- 4. Attrition by Gender
SELECT 
    Gender,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS Attrition_Rate_Pct
FROM HR_Attrition
GROUP BY Gender;

-- 5. Attrition by Age Group
SELECT 
    CASE 
        WHEN Age < 25 THEN '18-24'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS Attrition_Rate_Pct
FROM HR_Attrition
GROUP BY 
    CASE 
        WHEN Age < 25 THEN '18-24'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END
ORDER BY Age_Group;

-- 6. Attrition by OverTime status
SELECT 
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS Attrition_Rate_Pct
FROM HR_Attrition
GROUP BY OverTime;

-- 7. Average Monthly Income: stayed vs left
SELECT 
    Attrition,
    COUNT(*) AS Employee_Count,
    AVG(MonthlyIncome) AS Avg_Monthly_Income
FROM HR_Attrition
GROUP BY Attrition;

-- 8. Average Monthly Income by Job Role (highest to lowest)
SELECT 
    JobRole,
    AVG(MonthlyIncome) AS Avg_Monthly_Income,
    COUNT(*) AS Employee_Count
FROM HR_Attrition
GROUP BY JobRole
ORDER BY Avg_Monthly_Income DESC;

-- 9. Attrition by Marital Status
SELECT 
    MaritalStatus,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS Attrition_Rate_Pct
FROM HR_Attrition
GROUP BY MaritalStatus
ORDER BY Attrition_Rate_Pct DESC;

-- 10. Attrition by Business Travel frequency
SELECT 
    BusinessTravel,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS Attrition_Rate_Pct
FROM HR_Attrition
GROUP BY BusinessTravel
ORDER BY Attrition_Rate_Pct DESC;

-- 11. Average Years at Company: stayed vs left
SELECT 
    Attrition,
    AVG(YearsAtCompany) AS Avg_Years_At_Company,
    AVG(YearsInCurrentRole) AS Avg_Years_In_Role,
    AVG(YearsSinceLastPromotion) AS Avg_Years_Since_Promotion
FROM HR_Attrition
GROUP BY Attrition;

-- 12. Attrition by Work-Life Balance rating
SELECT 
    WorkLifeBalance,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS Attrition_Rate_Pct
FROM HR_Attrition
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- 13. Attrition by Job Satisfaction rating
SELECT 
    JobSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS Attrition_Rate_Pct
FROM HR_Attrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- 14. Attrition by Number of Companies Worked
SELECT 
    NumCompaniesWorked,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS Attrition_Rate_Pct
FROM HR_Attrition
GROUP BY NumCompaniesWorked
ORDER BY NumCompaniesWorked;

-- 15. Top 5 highest-risk Department + JobRole combos
SELECT TOP 5
    Department,
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS Employees_Left,
    CAST(SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS Attrition_Rate_Pct
FROM HR_Attrition
GROUP BY Department, JobRole
HAVING COUNT(*) >= 10
ORDER BY Attrition_Rate_Pct DESC;