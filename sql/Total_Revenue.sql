CREATE TABLE "Total Revnue by Park" AS
SELECT
Park_Name,
SUM(Adjusted_Revenue) AS Total_Revenue
FROM Adjusted_Model
GROUP BY Park_Name
ORDER BY Total_Revenue DESC;
