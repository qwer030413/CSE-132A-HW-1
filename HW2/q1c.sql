WITH temp AS(
    SELECT l.type, COUNT(b.cname) AS cnt    
    FROM loan l LEFT JOIN borrower b ON l.no = b.lno
    GROUP BY l.type
)
SELECT DISTINCT type AS loanType
FROM temp WHERE cnt = (SELECT MIN(cnt) FROM temp)

-- SELECT DISTINCT l.type AS loanType
-- WHERE loan l