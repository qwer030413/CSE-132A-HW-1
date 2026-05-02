SELECT p.ID, p.Name, (
    SELECT SUM(l.amountOfProductUnits) FROM LineItems l
    JOIN Orders o ON l.orderID = o.ID
    WHERE l.shipDate <> o.orderDate AND
    p.ID = l.productID 
) FROM Products p