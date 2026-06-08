-- sailor(sname, rating)
-- boat(bname, rating)
-- reservation(sname, bname, day)
-- weekday(day)

-- Find boats reserved by every sailor qualified to sail the boat.

select b.bname from boat b
where not exists(
    select s.sname from sailor s
    where s.rating >= b.rating
    and not exists(
        select * from reservation r
        where r.bname = b.bname and r.sname = s.sname
    )
)
