select b.cname from borrower b
join loan l on l.no = b.lno
group by c.name
having sum(l.amount) >= 13000