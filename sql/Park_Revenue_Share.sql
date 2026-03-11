CREATE TABLE "Park Revenue Share" AS
SELECT 
    Park_Name,
    SUM(Adjusted_Revenue) AS Park_Revenue,
ROUND(
    SUM(Adjusted_Revenue) * 100/
	(SELECT SUM(Adjusted_Revenue) FROM Adjusted_Model),2) AS Revenue_Percentage
FROM Adjusted_Model
GROUP BY Park_Name
ORDER BY Revenue_Percentage DESC;
