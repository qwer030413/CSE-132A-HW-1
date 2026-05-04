-- Find students who take every class that John Smith takes.
-- List id, first and last name.

WITH temp AS(
    SELECT c2.id FROM classes c2
    JOIN enrollment e2 on e2.class = c2.id
    JOIN students s2 on s2.id = e2.student WHERE s2.first_name = 'John' AND s2.last_name = 'Smith'
)

SELECT DISTINCT s.id, s.first_name, s.last_name
from students s
-- there is no class t that john takes and the other student does NOT take
WHERE NOT EXISTS(
    SELECT 1 from temp t
    -- student does not take class t
    WHERE NOT EXISTS(
        SELECT 1
        FROM enrollment e
        WHERE e.student = s.id
        AND e.class = t.id
    )
)

-- SELECT DISTINCT s.id, s.first_name, s.last_name FROM students s
-- JOIN enrollment e on e.student = s.id
-- JOIN classes c on c.id = e.class
-- WHERE c.id IN (
--     SELECT * FROM temp 
-- )
-- GROUP BY s.id HAVING COUNT(DISTINCT c.id) = (SELECT COUNT(*) FROM temp);
