CREATE TABLE "Weather vs Attendance" AS
SELECT
    r.Park_Name,
    w.Rainfall,
    ROUND(AVG(r.Estimated_Visitors),0) AS Avg_Visitors
FROM "Attendance & Revenue" r
JOIN Weather w 
ON r.Date = w.Date
GROUP BY r.Park_Name, w.Rainfall
ORDER BY r.Park_Name
