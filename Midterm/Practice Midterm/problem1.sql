
SELECT DISTINCT co.origin FROM Coffees co
-- the == is for "does a sale exist for this particular coffee?"
WHERE NOT EXISTS(
    SELECT s.coffee FROM Sales s WHERE s.coffee = co.name
)