-- get average of all 
-- ave num of borrowers for this specific type


-- List the loans L that have a strictly greater number of borrowers 
-- than the average number of borrowers over all loans of L's type.

-- cheat sheet

-- counts borrowers for each individual loan.
-- for each loan there is this many borrowers
with temp as(
    select l.no, l.type, count(b.cname) as cnt from loan l
    left join borrower b on b.lno = l.no
    group by l.no, l.type
)
average as(
    select t.type, avg(cnt) as aver from temp t group by t.type
)
select t.no from temp 
join average a on a.type = t.type
where t.cnt > a.aver
