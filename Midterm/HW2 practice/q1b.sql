select c.name, coalesce(count(b.lno), 0)
from customer c left join borrower b on c.name = b.cname
group by c.name