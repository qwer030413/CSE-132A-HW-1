
SELECT DISTINCT c.name AS name, COALESCE(COUNT(b.lno), 0) AS loanCount
FROM customer c
LEFT JOIN borrower b ON b.cname = c.name
GROUP BY c.name