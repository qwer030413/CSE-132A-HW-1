-- sailor(sname, rating)
-- boat(bname, rating)
-- reservation(sname, bname, day)
-- weekday(day)
-- Find the names of sailors who have reserved at least one boat they are qualified to sail.
select distinct s.sname from sailor s
join reservation r on r.sname = s.sname
join boat b on b.bname = r.bname
where b.rating <= s.rating
