WITH loanCount AS (
    SELECT l.no, l.type, count(b.cname) AS cnt
    FROM loan l
    LEFT JOIN borrower b ON l.no = b.lno
    GROUP BY l.no,l.type
),
average AS(
    SELECT type, AVG(cnt) AS aver
    FROm loanCount
    GROUP BY type
)
SELECT lc.no
FROM loanCount lc
JOIN average av ON lc.type = av.type
WHERE lc.cnt > av.aver