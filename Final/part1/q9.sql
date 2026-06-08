-- Find the day or days with the highest number of reservations.
-- Include days with zero reservations in the counting table.
-- If multiple days tie for highest, return all of them.


with temp as(
    select w.day, count(r.sname) as cnt from weekday w
    left join reservation r on r.day = w.day
    group by w.day
)
select t.day from temp t
where t.cnt = (select max(cnt) from temp)