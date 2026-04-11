-- SELECT * FROM customers WHERE 
-- customer and loan are not connected so use borrower
SELECT DISTINCT c.name AS name 
FROM customer c 
JOIN borrower b on c.name = b.cname
JOIN loan l ON b.lno = l.no
WHERE l.type = 'jumbo mortgage';


