CREATE TABLE Adjusted_Model AS
SELECT 
    r.Date,
    r.Park_Name,
    r.Is_Weekend,
    r.Is_Holiday,

    CAST(r.Ticket_Price AS INTEGER) AS Ticket_Price,
    CAST(r.Estimated_Visitors AS INTEGER) AS Base_Visitors,

    CAST(w.Max_Temp AS INTEGER) AS Max_Temp,
    CAST(w.Avg_Temp AS INTEGER) AS Avg_Temp,
    CAST(w.Rainfall AS REAL) AS Rainfall,

    CAST(ROUND(
        r.Estimated_Visitors
        *
        CASE
            WHEN w.Rainfall > 0.5 THEN 0.8
            WHEN w.Rainfall > 0 THEN 0.9
            ELSE 1
        END
        *
        CASE
            WHEN w.Max_Temp > 100 THEN 0.9
            WHEN w.Max_Temp > 95 THEN 0.95
            ELSE 1
        END
        *
        CASE
            WHEN w.Avg_Temp < 55 THEN 0.95
            ELSE 1
        END
    ) AS INTEGER) AS Adjusted_Visitors,

    CAST(ROUND(
        r.Estimated_Visitors
        *
        CASE
            WHEN w.Rainfall > 0.5 THEN 0.8
            WHEN w.Rainfall > 0 THEN 0.9
            ELSE 1
        END
        *
        CASE
            WHEN w.Max_Temp > 100 THEN 0.9
            WHEN w.Max_Temp > 95 THEN 0.95
            ELSE 1
        END
        *
        CASE
            WHEN w.Avg_Temp < 55 THEN 0.95
            ELSE 1
        END
        * r.Ticket_Price
    ) AS INTEGER) AS Adjusted_Revenue

FROM "Attendance & Revenue" r
JOIN Weather w
ON r.Date = w.Date;
