SELECT l.no AS loanNo
FROM loan l
JOIN borrower b ON b.lno = l.no
JOIN customer c ON c.name = b.cname
-- GROUP BY c.name
WHERE c.name = 'John Smith'
AND l.minCredit = (
    SELECT MAX(l1.minCredit)
    FROM loan l1
    JOIN borrower b1 ON b1.lno = l1.no 
    JOIN customer c1 ON b1.cname = c1.name
    WHERE c1.name = 'John Smith'
)
