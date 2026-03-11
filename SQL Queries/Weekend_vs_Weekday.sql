CREATE table "Weekend vs Weekday Avg_Visitors" AS
SELECT
Park_Name,
CASE
    WHEN Is_Weekend = 1 THEN 'Weekend'
    ELSE 'Weekday'
END AS Day_Type,
ROUND(AVG(Adjusted_Visitors),0) AS Avg_Visitors
FROM Adjusted_Model
GROUP BY Park_Name, Day_Type;
