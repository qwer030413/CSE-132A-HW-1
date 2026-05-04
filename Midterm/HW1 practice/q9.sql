SELECT l.no AS loanNo FROM loan l 
JOIN borrower b ON b.lno = l.no
WHERE b.cname = 'John Smith'
AND l.minCredit = (
    SELECT MAX(l2.minCredit) FROM loan l2
    JOIN borrower b2 ON b2.lno = l2.no
    WHERE b2.cname = 'John Smith'
)