-- Student(sid, name, major, gpa)

-- Course(cid, title, dept)

-- Enroll(sid, cid, grade)

-- Professor(pid, name, dept)

-- Teaches(pid, cid)


-- Find students who are NOT enrolled in any course.
SELECT s.name FROM Student s
WHERE NOT EXISTS(
    SELECT cid FROM Enroll
    WHERE sid = s.sid
)


-- Find students taking more courses than the average student.
-- cheat sheet
SELECT DISTINCT s.name FROM Student s
JOIN Enroll e ON e.sid = s.sid
GROUP BY s.sid WHERE COUNT(e.cid) > (
    SELECT AVG(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM Enroll
        GROUP BY sid
    ) t
)

-- Find courses with the maximum enrollment. 
SELECT DISTINCT c.cid FROM Course c
JOIN Enroll e ON e.cid = c.cid
GROUP BY c.cid HAVING COUNT(e.sid) = (
    SELECT MAX(cnt)
    FROM(
        SELECT COUNT(*) AS cnt
        FROM Enroll
        GROUP BY cid
    ) t
)

-- Find students who take all CS courses using WITH.
SELECT DISTINCT s.name FROM Student s
WHERE NOT EXISTS(
    SELECT * FROM Course c
    WHERE c.dept = 'CS'
    AND NOT EXISTS(
        SELECT * FROM Enroll e
        WHERE e.sid = s.sid
        AND e.cid = c.cid
    )
)

-- Student(sid, name, major, gpa)

-- Course(cid, title, dept)

-- Enroll(sid, cid, grade)

-- Professor(pid, name, dept)

-- Teaches(pid, cid)

-- Find students who are NOT enrolled in any CS course.
SELECT DISTINCT s.name FROM Student s
WHERE NOT EXISTS(
    SELECT * FROM Course c
    JOIN Enroll e ON e.cid = c.cid
    WHERE c.dept = 'CS' AND e.sid = s.sid
)

-- Find courses that have no students enrolled.
SELECT c.cid, c.title
FROM Course c
WHERE NOT EXISTS (
    SELECT *
    FROM Enroll e
    WHERE e.cid = c.cid
);

-- Professors Who Teach Every CS Course
-- there does not exist a CS cource that the professor does not teach
SELECT DISTINCT p.name
FROM Professor p
WHERE NOT EXISTS(
    SELECT * FROM Course c
    WHERE c.dept = 'CS'
    AND NOT EXISTS(
        SELECT * FROM Teaches t
        WHERE t.pid = p.pid
        AND c.cid = t.cid
    )
)



-- Students in More Than 2 Courses
SELECT s.sid, s.name, COUNT(e.cid) FROM Student s
JOIN Enroll e ON e.sid = s.sid
GROUP BY s.sid, s.name HAVING COUNT(e.cid) >= 2


-- Courses With Average GPA > 3.5
SELECT c.cid, c.name FROM Course c
JOIN Enroll e ON e.cid = c.cid
JOIN Student s ON s.sid = e.sid
group by c.cid, c.name having avg(s.gpa) > 3.5



-- Student(sid, name, major, gpa)

-- Course(cid, title, dept)

-- Enroll(sid, cid, grade)

-- Professor(pid, name, dept)

-- Teaches(pid, cid)

-- Find majors whose average GPA exceeds 3.5.
SELECT major
FROM Student
GROUP BY major
HAVING AVG(gpa) > 3.5;