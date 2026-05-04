
SELECT c.name AS name, l.no AS no 
FROM customer c
JOIN borrower b ON c.name = b.cname
JOIN loan l ON l.no = b.lno
WHERE c.credit < l.minCredit