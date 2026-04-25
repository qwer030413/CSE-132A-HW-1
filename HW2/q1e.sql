WITH loanCount AS (
    SELECT l.no, l.type, count(b.cname) AS cnt FROM loan l
    LEFT JOIN borrower b ON l.no = b.lno GROUP by l.no, l.type
),
avearge AS(
    SELECT type, AVG(cnt) AS aver FROM loanCount GROUP BY type
)
SELECT lc.no
FROM loanCount lc
JOIN avearge ta ON lc.type = ta.type
WHERE lc.cnt > ta.aver;