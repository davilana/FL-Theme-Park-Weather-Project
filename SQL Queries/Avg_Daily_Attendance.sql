CREATE TABLE "Average Daily Attendance" AS
SELECT
    Park_Name,
    ROUND(AVG(Adjusted_Visitors),0) AS Avg_Daily_Visitors
FROM Adjusted_Model
GROUP BY Park_Name
ORDER BY Avg_Daily_Visitors DESC;
