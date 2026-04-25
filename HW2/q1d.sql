SELECT c.name FROM customer c  
JOIN borrower b on c.name = b.cname JOIN loan l on l.no = b.lno
GROUP BY c.name HAVING COUNT(DISTINCT l.type) = (
    SELECT COUNT(DISTINCT type) FROM loan
)
