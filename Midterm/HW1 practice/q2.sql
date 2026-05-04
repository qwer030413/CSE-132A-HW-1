SELECT DISTINCT c.name AS name FROM customer c 
LEFT JOIN borrower b ON b.cname = c.name
LEFT JOIN loan l ON l.no = b.lno
WHERE l.type = 'jumbo mortgage' OR c.credit >= 750
