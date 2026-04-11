
-- last line makes sure jumbo * 2 or something doesnt pass
SELECT DISTINCT c.name AS name 
FROM customer c 
JOIN borrower b on c.name = b.cname
JOIN loan l ON b.lno = l.no
WHERE l.type IN ('jumbo mortgage', 'student')
GROUP BY c.name
HAVING COUNT(DISTINCT l.type) = 2;