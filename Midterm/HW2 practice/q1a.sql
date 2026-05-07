SELECT c.name, l.no FROM customer c
JOIN borrower b ON b.cname = c.name
JOIN loan l ON l.no = b.lno
WHERE c.credit < l.minCredit