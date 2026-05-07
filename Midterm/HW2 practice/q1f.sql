-- Find the pairs of customers who took the exact same loans
-- (i.e. all loans taken by one are taken by the other and viceversa;
-- or, equivalently, for every loan l, customer 1 takes l if and only if so does customer 2).

-- The output schema should be (name1, name2).
-- The answer should contain exactly one tuple for each pair of customers who take exactly 
-- the same loans. For each pair of such customers, always          
-- choose the tuple that is lexicographically smaller 
-- (e.g. “(Jane,John)” but not “(John,Jane)”). Do not list customers with themselves.

SELECT c1.name AS name1, c2.name AS name2
FROM customer c1 JOIN customer c2 ON c1.name < c2.name

--see if there is a loan taken by c1 but not by c2
WHERE NOT EXISTS(
    SELECT b1.lno FROM borrower b1
    WHERE b1.cname = c1.name
    AND NOT EXISTS(
        SELECT b2.lno FROM borrower b2
        WHERE b2.cname = c2.name
        AND b1.lno = b2.lno
    )
)

-- opposite, c2 but not c1
AND NOT EXISTS(
    SELECT b2.lno FROM borrower b2
    WHERE b2.cname = c2.name
    AND NOT EXISTS(
        SELECT b1.cname, b1.lno FROM borrower b1 WHERE b1.cname = c1.name AND b1.lno = b2.lno
    )
)
