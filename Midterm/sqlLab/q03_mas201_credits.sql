-- Find the pid, name, and MAS201 credits of students registered for MAS201.

SELECT s.pid, s.first_name, s.last_name, e.credits
FROM students s 
JOIN enrollment e ON e.student = s.id
JOIN classes c ON c.id = e.class
WHERE c.number = 'MAS201';

