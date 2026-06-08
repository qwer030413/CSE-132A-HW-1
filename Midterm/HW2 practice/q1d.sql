-- [15pts] List the customers who took every type of loan (at least one loan from every type). 
-- The output schema should be (name).

-- there does not exist a loan tyoe that the customer did not take a loan in
-- cheatsheet
-- not exists means it has to be empty
-- 

select c.name from customer c
where not exists(
    select l.type from loan l
    where not exists(
        select * from borrower b
        join loan l2 on b.lno = l2.no
        where b.cname = c.cname
        and l2.type = l.type
    )
)