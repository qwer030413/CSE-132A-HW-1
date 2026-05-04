-- Find the other classes taken by students who take MAS201.
-- List just the class names, uniquely.
SELECT DISTINCT c2.name
FROM classes c1, classes c2, enrollment e1, enrollment e2, students s
WHERE c1.id = e1.class AND c1.number = 'MAS201' AND e1.student = s.id
AND e2.student = s.id AND e2.class = c2.id
