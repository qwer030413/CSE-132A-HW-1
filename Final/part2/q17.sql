-- student(sid, name, major)
-- course(cid, title, dept)
-- enroll(sid, cid, quarter, grade)
-- required(major, cid)
-- Find majors such that every student in that major has taken every required course for that major.
-- there does not exist a student who is missing a required course
select s.major from student s\
-- there does not exist a student who is not enrolled in a required course
where not exists(
    SELECT *
    FROM required r
    WHERE r.major = s.major
    -- not enrolled in required course
      AND NOT EXISTS (
        -- enrolled in required course
            SELECT *
            FROM enroll e
            WHERE e.sid = s.sid
              AND e.cid = r.cid
      )
)