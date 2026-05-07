SELECT c.name, COALSCE(COUNT(l.no), 0) AS loanCount FROM customer c
JOIN borrower b ON b.cname = c.name
GROUP BY c.name