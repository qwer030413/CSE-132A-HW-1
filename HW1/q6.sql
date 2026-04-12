SELECT DISTINCT c.name as name
FROM customer c
JOIN borrower b on c.name = b.cname
JOIN loan l on l.no = b.lno
GROUP BY c.name
-- where is before group by and having is after
-- WHERE SUM(l.amount) >= 13000;
HAVING SUM(l.amount) >= 13000;