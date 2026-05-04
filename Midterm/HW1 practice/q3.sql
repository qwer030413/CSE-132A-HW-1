SELECT DISTINCT c.name AS name FROM customer c 
JOIN borrower b ON b.cname = c.name
JOIN loan l ON l.no = b.lno
WHERE l.type IN ('jumbo mortgage', 'student')
GROUP BY c.name
HAVING COUNT(DISTINCT l.type) = 2;
