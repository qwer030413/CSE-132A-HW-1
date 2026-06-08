with temp as(
    select w.day, coalesce(count(r.sname), 0) as num
    from weekday w left join reservation r on r.day = w.day
    group by w.day
),
maxRes as(
    select max(num) as num
    from temp
),
secondMax as(
    select max(t.num) as num
    from temp t, maxRes m
    where m.num <> t.num
)
select day from temp where num = (select * from secondMax)