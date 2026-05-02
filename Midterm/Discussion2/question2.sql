-- first get customers with atleast one line item late from their order
-- get all of the orders from that customer

SELECT DISTINCT o2.ID
FROM Orders o
JOIN LineItems l ON o.ID = l.orderId
JOIN Orders o2 ON o.customerID = o2.customerID
WHERE l.shipDate > o.orderDate;
