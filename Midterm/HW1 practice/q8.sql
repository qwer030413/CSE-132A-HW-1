-- use coalesce to get first non null val

SELECT COALESCE(SUM(l.amount), 0) AS borrowedAmount FROM loan l
JOIN borrower b ON b.lno = l.no
WHERE b.cname = "John Smith"