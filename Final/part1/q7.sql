-- sailor(sname, rating)
-- boat(bname, rating)
-- reservation(sname, bname, day)
-- weekday(day)
-- For each day of the week, find the average rating of sailors who have at least one reservation on that day.
-- Include days with no reservations.
-- For days with no reservations, avg_rating should be NULL.
-- If a sailor has multiple reservations on the same day, count that sailor only once.
with temp as(
    select distinct w.day, s.sname, s.rating from weekday w
    left join reservation r on r.day = w.day
    join sailor s on s.sname = r.sname
)
select t.day, avg(t.rating) from temp t
group by t.day