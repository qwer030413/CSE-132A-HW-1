-- Find the enrolled students and total credits for which they have registered.
-- Output student id, first and last name, and total credits.

SELECT s.id, s.first_name, s.last_name, SUM(e.credits)
FROM students s
JOIN enrollment e ON e.student = s.id
GROUP BY s.id;