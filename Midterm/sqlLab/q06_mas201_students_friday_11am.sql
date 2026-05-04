-- Find the MAS201 students who take a Friday 11:00am class.
SELECT s.first_name || ' ' || s.last_name AS name, c2.name AS cname
FROM students s, classes c1, classes c2, enrollment e1, enrollment e2
WHERE s.id = e1.student and c1.id = e1.class and c1.number = 'MAS201' 
and s.id = e2.student and c2.id = e2.class and c2.date_code = 'F' and c2.start_time = '11:00';
