SELECT c1.name AS name1, c2.name AS name2
FROM customer c1 JOIN customer c2 ON c1.name > c2.name
--see if there is a loan taken by c1 but not by c2
WHERE NOT EXISTS(
    SELECT b1.lno FROM borrower b1 WHERE b1.cname = c1.name
    AND NOT EXISTS(
        SELECT b2.cname, b2.lno FROM borrower b2 WHERE b2.cname = c2.name AND b1.lno = b2.lno
    )
)

-- opposite, c2 but not c1
AND NOT EXISTS(
    SELECT b2.lno FROM borrower b2 WHERE b2.cname = c2.name
        AND NOT EXISTS(
            SELECT b1.cname, b1.lno FROM borrower b1 WHERE b1.cname = c1.name AND b1.lno = b2.lno
        )
)