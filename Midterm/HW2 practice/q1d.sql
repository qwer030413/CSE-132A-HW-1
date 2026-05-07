-- [15pts] List the customers who took every type of loan (at least one loan from every type). 
-- The output schema should be (name).

-- there does not exist a loan tyoe that the customer did not take a loan in
-- cheatsheet
SELECT c.name FROM customer c  
JOIN borrower b on c.name = b.cname JOIN loan l on l.no = b.lno
GROUP BY c.name HAVING COUNT(DISTINCT l.type) = (
    SELECT COUNT(DISTINCT type) FROM loan
)
