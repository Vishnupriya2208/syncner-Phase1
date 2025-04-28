
WITH DateRanges AS (
    SELECT
        
        CASE 
            WHEN MONTH(GETDATE()) BETWEEN 1 AND 3 THEN 'Q1' 
            WHEN MONTH(GETDATE()) BETWEEN 4 AND 6 THEN 'Q2' 
            WHEN MONTH(GETDATE()) BETWEEN 7 AND 9 THEN 'Q3' 
            WHEN MONTH(GETDATE()) BETWEEN 10 AND 12 THEN 'Q4' 
        END AS current_quarter,
        
        CASE 
            WHEN MONTH(GETDATE()) BETWEEN 1 AND 3 THEN 'Q4' 
            WHEN MONTH(GETDATE()) BETWEEN 4 AND 6 THEN 'Q1' 
            WHEN MONTH(GETDATE()) BETWEEN 7 AND 9 THEN 'Q2' 
            WHEN MONTH(GETDATE()) BETWEEN 10 AND 12 THEN 'Q3' 
        END AS previous_quarter
),
RepeatCustomers AS (
    
    SELECT 
        o1.customer_id
    FROM 
        Orders o1
    INNER JOIN 
        Orders o2 ON o1.customer_id = o2.customer_id
    WHERE
        
        o1.order_date >= DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE()), 0) AND o1.order_date <= DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE()), 3)
        
        AND o2.order_date >= DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE()) - 1, 0) AND o2.order_date <= DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE()) - 1, 3)
    GROUP BY 
        o1.customer_id
)
SELECT 
    COUNT(DISTINCT customer_id) AS repeat_customers_count
FROM 
    RepeatCustomers;