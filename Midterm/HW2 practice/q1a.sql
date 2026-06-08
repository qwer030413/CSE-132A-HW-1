select b.cname, l.no from loan l join borrower b on b.lno = l.no
join customer c on c.name = b.cname
where c.credit < l.minCredit