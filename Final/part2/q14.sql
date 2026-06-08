-- student(sid, name, major)
-- course(cid, title, dept)
-- enroll(sid, cid, quarter, grade)
-- required(major, cid)
-- Find students who are not enrolled in any course.

select s.name from student s
where not exists(
    select * from enroll e
    where e.sid = s.sid
)