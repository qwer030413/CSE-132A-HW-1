select l.no from loan l
join borrower b on b.lno = l.no
where b.cname = 'john smih' and
l.mincredit = (select max(l1.mincredit) from loan l1 join borrower b1 on b1.lno = l1.no
where b.cname = 'john smith')