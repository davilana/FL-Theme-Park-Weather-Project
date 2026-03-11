CREATE TABLE "Weather Resilient Park Analysis" AS
SELECT
    a.Park_Name,
    ROUND(AVG(a.Adjusted_Visitors),0) AS Avg_Visiotrs_Bad_Weather,
    ROUND(AVG(a.Adjusted_Revenue),0) AS Avg_Revenue_Bad_Weather
FROM Adjusted_Model a
JOIN Weather w
ON a.Date = w.Date
WHERE w.Rainfall > 0.5
GROUP BY a.Park_Name
ORDER BY Avg_Revenue_Bad_Weather
