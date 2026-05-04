
SELECT DISTINCT cu.name FROM customer cu
JOIN Sales s ON s.cust = cu.name
WHERE s.discount = (
    SELECT MAX(discount) FROM Sales
);

