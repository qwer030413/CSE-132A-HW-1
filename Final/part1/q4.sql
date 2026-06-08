-- sailor(sname, rating)
-- boat(bname, rating)
-- reservation(sname, bname, day)
-- weekday(day)



-- Find boats that have no reservation by any sailor qualified to sail them.


select b.bname from boat b
where not exists(
    select * from reservation r
    join sailor s on r.sname = s.sname
    where r.bname == b.bname
    and s.rating >= b.rating
)