CREATE TABLE "Top Revenue Day per Park" AS
SELECT 
    Date,
    Park_Name,
    Adjusted_Revenue
FROM (
    SELECT
        Date,
        Park_Name,
        Adjusted_Revenue,
        ROW_NUMBER() OVER (
            PARTITION BY Park_Name
        	ORDER BY Adjusted_Revenue DESC
        ) AS rank
    FROM Adjusted_Model
)
WHERE rank = 1;
