-- Write a sequence of SQL commands that deletes all sailors who are not qualified to sail any boat, along with their reservations.
DELETE from reservation where sname in(
    select s.sname from sailor s 
    where not exists(
        select * from boat b
        where s.rating >= b.rating
    )
)

delete from sailor where sname in(
    select s.sname from sailor s 
    where not exists(
        select * from boat b
        where s.rating >= b.rating
    )
)