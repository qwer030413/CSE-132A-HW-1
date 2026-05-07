-- Problem 1 Find the origins that have not sold (no coffee with that origin has been sold).
SELECT DISTINCT c.origin FROM Coffees c
WHERE NOT EXISTS(
    SELECT c2.origin FROM Coffees c2
    JOIN Sales s ON s.coffee = c2.name
    WHERE c2.origin = c.origin
)



-- Problem 2  Find the total revenue (i.e. sum of sales prices) per origin. The result schema is
-- (coff_origin: string, revenue: float). List non-selling origins with 0 revenue.
SELECT c.origin AS coff_origin, COALESCE(SUM((c.pricePerPound * s.pounds) * (1.0 - (s.discount / 100))), 0) AS revenue
FROM Coffees c
LEFT JOIN Sales s ON s.coffee = c.name
GROUP BY c.origin


-- Problem 3  Find the maximum discount over all sales.
SELECT MAX(discount) FROM Sales

-- Problem 4  Find the names of customers involved in at least one sale with the maximum discount.
SELECT cu.name FROM Customers cu
JOIN Sales s ON s.cust = cu.name
WHERE s.discount IN(
    SELECT MAX(discount) FROM Sales 
)



-- Problem 5  Find the names of customers who bought coffees only at the maximum discount.
-- If they bought nothing, they qualify.

SELECT cu.name FROM Customers cu
WHERE NOT EXISTS(
    SELECT * FROM Sales s
    WHERE s.cust = cu.name AND s.discount <> (SELECT MAX(discount) FROM Sales)
)