select l.no as loanNo from loan l
where l.amount = (select max(amount) from loan)