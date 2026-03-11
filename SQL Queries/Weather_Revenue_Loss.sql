CREATE TABLE "Revenue Lost due to Weather" AS
SELECT
    Park_Name, 
    SUM(Base_Visitors - Adjusted_Visitors) * Ticket_Price AS Weather_Revenue_Loss
FROM Adjusted_Model
GROUP BY
    Park_Name
ORDER BY
    Weather_Revenue_Loss DESC;
