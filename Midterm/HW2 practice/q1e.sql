-- get average of all 
-- ave num of borrowers for this specific type
-- SELECT l.no FROM loan l
-- JOIN borrower b ON b.lno = l.no
-- GROUP BY l.no HAVING COUNT(b.cname) > AVG

-- List the loans L that have a strictly greater number of borrowers 
-- than the average number of borrowers over all loans of L's type.

-- cheat sheet

-- counts borrowers for each individual loan.
WITH loanCount AS(
    SELECT l.no, l.type, count(b.name) AS cnt FROM loan l
    LEFT JOIN borrower b ON l.no = b.lno GROUP BY l.no, l.type
),
-- computes the average borrower count per loan type.
avearge AS(
    SELECT type, AVG(cnt) AS aver FROM loanCount GROUP BY type
)
SELECT lc.no
FROM loanCount lc
JOIN avearge a ON lc.type = a.type
WHERE lc.cnt > a.aver;
