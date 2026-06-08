SELECT c.name FROM customer c
JOIN borrower ON b.cname = c.name
JOIN loan ON l.no = b.lno
WHERE l.type IN ('jumbo', 'student')
group by c.name
HAVING COUNT(DISTINCT l.type) = 2;