SELECT l.no AS loanNo FROM loan l
WHERE l.amount = (SELECT MAX(amount) FROM loan)