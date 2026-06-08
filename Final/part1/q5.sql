-- Sailors Who Reserved Every Boat They Are Qualified For
-- sailor - sailor who did not reserve every boat qualified
select s.sname from sailor s
where not exists(
    select * from boat b
    where s.rating >= b.rating
    and not exists(
        select * from reservation r
        where r.sname = s.sname
        and r.bname = b.bname
    )
)