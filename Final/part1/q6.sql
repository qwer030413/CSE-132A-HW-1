-- Find sailors who are qualified to sail every boat.
select s.sname from sailor s
where not exists(
    select b.bname from boat b
    where b.rating < s.rating
)