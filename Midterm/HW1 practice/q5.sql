SELECT l.no from loan l
join borrower b on b.lno = l.no
group by l.no
having count(distinct b.cname) >= 2