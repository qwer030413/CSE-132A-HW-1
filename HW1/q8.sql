-- use coalesce to get first non null val
SELECT COALESCE(SUM(l.amount), 0) AS borrowedAmount
FROM borrower b 
JOIN loan l ON l.no = b.lno
JOIN customer c ON c.name = b.cname
WHERE c.name = 'John Smith';