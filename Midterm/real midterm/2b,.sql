-- for each boat, for each sailor that is quilified, check if they reserved

select b.bname from boat b
where not exists(
    select * from sailor s where s.rating >= b.rating
    and not exists(
        select * from reservation r where r.bname = b.bname and r.sname = s.sname
    )
)