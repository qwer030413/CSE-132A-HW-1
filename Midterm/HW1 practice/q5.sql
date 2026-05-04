SELECT b.lno AS loanNo FROM borrower b
GROUP BY b.lno HAVING COUNT(DISTINCT b.cname) >= 2