SELECT b.cname AS name FROM borrower b
JOIN loan l ON l.no = b.lno
GROUP BY b.cname HAVING COUNT(DISTINCT l.type) = (
    SELECT COUNT(DISTINCT type) FROM loan
)