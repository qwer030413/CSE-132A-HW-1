SELECT DISTINCT c.name FROM Customer
JOIN borrower ON b.cname = c.name
JOIN loan ON l.no = b.lno
WHERE l.type = 'jumbo'