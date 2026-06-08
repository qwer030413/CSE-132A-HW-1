
-- so group by day and get average rating for the day
-- the average rating of sailors having reservations on that day.
with temp as(
    select distinct r.sname, r.day from reservation r
)
select w.day, avg(s.rating)
from weekday w left join temp t
on w.day = t.day
left join sailor s on s.sname = t.sname
group by w.day;
