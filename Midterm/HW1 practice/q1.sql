SELECT DISTINCT c.name FROM customer c 
JOIN borrower b ON b.cname = c.name
JOIN loan l ON b.lno = l.no AND l.type = "jumbo mortgage"