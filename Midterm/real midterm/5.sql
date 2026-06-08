select sname from sailor
where sname not in(
    select s.sname from sailor s
    JOIN boat b on s.sname = b.sname 
    where s.rating >= b.rating
)

-- *** is query above
delete from reservation where sname in (***)
delete from sailor where sname in (***);