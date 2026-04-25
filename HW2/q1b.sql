SELECT DISTINCT c.name, COUNT(b.lno) AS loanCount
FROM customer c 
JOIN borrower b ON c.name = b.cname 
GROUP BY c.name;