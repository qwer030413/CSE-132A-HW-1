
WITH temp AS(
    SELECT l.type AS loanType, COUNT(b.cname) AS cnt
    FROM loan l
    LEFT JOIN borrower b ON b.lno = l.no
    GROUP BY l.type
)
SELECT loanType FROM temp
WHERE cnt = (SELECT MIN(cnt) FROM temp)