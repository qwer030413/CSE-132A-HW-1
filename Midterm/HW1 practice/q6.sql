SELECT c.name AS name FROM customer c
JOIN borrower b ON b.cname = c.name
JOIN loan l ON l.no = b.lno
GROUP BY c.name HAVING SUM(l.amount) >= 13000