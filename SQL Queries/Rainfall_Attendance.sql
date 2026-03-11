CREATE table "Rainfall Attendance" AS
SELECT
    Park_Name,
CASE
    WHEN Rainfall = 0 THEN 'No Rain'
    WHEN Rainfall <= 0.5 THEN 'Light Rain'
    ELSE 'Heavy Rain'
END AS Rain_Category,
ROUND(AVG(Adjusted_Visitors),0) AS Avg_Visitors
FROM Adjusted_Model
GROUP BY Park_Name,Rain_Category;
