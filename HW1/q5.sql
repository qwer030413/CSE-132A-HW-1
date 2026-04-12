-- SELECT l1.no AS Lno1, l2.no AS Lno2
-- FROM loan l1
-- JOIN loan l2 
-- on l1.no = l2.no
SELECT lno as loanNo
FROM borrower
group by lno HAVING COUNT(DISTINCT cname) >= 2;

