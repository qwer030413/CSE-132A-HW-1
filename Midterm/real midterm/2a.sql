select distinct b.bname from boat b
join reservation r on r.bname = b.bname
join sailor on s.sname = r.sname
where s.rating >= b.rating
