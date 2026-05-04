-- Find all students whose first name is John.
-- List all their attributes.

SELECT s.first_name, s.last_name FROM students s
WHERE s.first_name = 'John';
