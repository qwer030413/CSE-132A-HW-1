-- Student(sid INT, name TEXT, major TEXT, gpa FLOAT)

-- Course(cid INT, title TEXT, dept TEXT)

-- Enroll(sid INT, cid INT, grade TEXT)

-- Professor(pid INT, name TEXT, dept TEXT)

-- Teaches(pid INT, cid INT)

-- Find students whose name starts with 'A'
SELECT s.name FROM Student s
WHERE s.name LIKE 'A%';

-- MULTI-JOIN
-- Find names of students taught by professor 'Smith'
-- Use DISTINCT because a student could take multiple courses taught by Smith.
SELECT DISTINCT s.name FROM Student s
JOIN Enroll e ON e.sid = s.sid
JOIN Course c ON c.cid = e.cid
JOIN teaches t ON t.cid = c.cid
JOIN Professor p on p.pid = t.pid
WHERE p.name = 'Smith'


-- Average GPA for each major
SELECT s.major, AVG(s.gpa) FROM student s
GROUP BY s.major

-- Majors with average GPA > 3.5
SELECT s.major FROM student s GROUP BY s.major HAVING AVG(s.gpa)> 3.5

-- Number of students in each course
SELECT c.cid, c.title, COUNT(e.sid) FROM course c
JOIN enroll e ON e.cid = c.cid
GROUP BY c.cid, c.title;

-- if you want courses with 0 people too:
SELECT c.cid, c.title, COUNT(e.sid)
FROM Course c
LEFT JOIN Enroll e ON c.cid = e.cid
GROUP BY c.cid, c.title;

-- IN
-- Find students who are enrolled in at least one course
SELECT s.sid 
FROM Student s
WHERE s.sid IN(
    SELECT sid FROM enroll
)
-- using exists:
SELECT s.name
FROM Student s
WHERE EXISTS (
  SELECT *
  FROM Enroll e
  WHERE e.sid = s.sid
);

-- Students not enrolled in any course
SELECT s.name
FROM Student s
WHERE NOT EXISTS(
    SELECT *
    FROM Enroll e
    WHERE e.sid = s.sid
)

-- DOUBLE NEGATION
-- Find students who take ALL courses
-- Find students such that there does NOT exist a course
-- that the student is NOT enrolled in.
SELECT s.name FROM Student s
WHERE NOT EXISTS(
    SELECT c.cid
    FROM Course c
    WHERE NOT EXISTS(
        SELECT * 
        FROM enroll e
        WHERE e.sid = s.sid
        AND e.cid = c.cid
    )
)

-- EXISTS (CORRELATED)
-- Find students who share at least one course with student 'Alice'
SELECT DISTINCT s2.name
FROM Student s1, Student s2, Enroll e1, Enroll e2
WHERE s1.sid = e1.sid
  AND s2.sid = e2.sid
  AND e1.cid = e2.cid
  AND s1.name = 'Alice'
  AND s2.sid <> s1.sid;