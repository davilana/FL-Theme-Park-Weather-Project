CREATE table "Temperature Attendance"AS
SELECT
    Park_Name,
CASE
    WHEN Max_Temp < 70 THEN 'Cool'
    WHEN Max_Temp BETWEEN 70 AND 90 THEN 'Ideal'
    ELSE 'Hot'
END AS Temp_Category,
ROUND(AVG(Adjusted_Visitors),0) AS Avg_Visitors
FROM Adjusted_Model
GROUP BY Park_Name,Temp_Category;
