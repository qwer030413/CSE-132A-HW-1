-- Find the other classes taken by MAS201 students.
-- List student name and class name.

SELECT s.first_name, s.last_name, c2.name
FROM students s, classes c, classes c2, enrollment e, enrollment e2
WHERE s.id = e.student AND c.id = e.class AND c.number = 'MAS201'
AND e2.student = s.id AND e2.class = c2.id AND c.id <> c2.id