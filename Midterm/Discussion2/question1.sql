
SELECT c.name AS name
FROM Customers c JOIN Orders o ON c.ID = o.customerID
JOIN LineItems l ON o.ID = l.orderID WHERE l.productID = 25
GROUP BY c.ID, c.name
HAVING SUM(l.amountOfProductUnits) > 10