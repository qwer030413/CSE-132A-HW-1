WITH max_discount AS (
    SELECT  MAX(discount) AS value FROM Sales
)
SELECT  DISTINCT c.name
FROM     Customers c
WHERE  NOT EXISTS (SELECT 1
    FROM     Sales s, max_discount m
    WHERE  s.cust = c.name AND s.discount <> m.value
)