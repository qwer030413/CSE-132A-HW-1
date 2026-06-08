-- Find the pairs of customers who took the exact same loans
-- (i.e. all loans taken by one are taken by the other and viceversa;
-- or, equivalently, for every loan l, customer 1 takes l if and only if so does customer 2).

-- The output schema should be (name1, name2).
-- The answer should contain exactly one tuple for each pair of customers who take exactly 
-- the same loans. For each pair of such customers, always          
-- choose the tuple that is lexicographically smaller 
-- (e.g. “(Jane,John)” but not “(John,Jane)”). Do not list customers with themselves.


select c1.name AS name1, c2.name as name2
FROM customer c1 JOIN customer c2 ON c1.name < c2.name
-- for c1, look at c1s loans and iterate through c2 loans and see if there is a dne
-- if dne, false, but if it all passes, then true
where not exists(
    select b1.lno from borrower b1
    where b1.cname = c1.name
    and not exists(
        select b2.cname, b2.lno where b2.cname = c2.name and b2.lno = b1.lno
    )
)
AND NOT EXISTS(
    SELECT b2.lno FROM borrower b2 WHERE b2.cname = c2.name
        AND NOT EXISTS(
            SELECT b1.cname, b1.lno FROM borrower b1 WHERE b1.cname = c1.name AND b1.lno = b2.lno
        )
)