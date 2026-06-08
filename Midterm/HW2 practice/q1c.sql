-- write on cheat sheet
-- List the loan type(s) with the smallest number of borrowers.
-- The output schema should be (loanType).
WITH temp as(
    select l.type, count(b.cname) as cnt
    from loan l left join borrower b on l.no = b.lno
    group by l.type
)
select distinct type as loanType
from temp where cnt = (SELECT MIN(cnt) FROM temp)