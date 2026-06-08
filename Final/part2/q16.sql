-- -- student(sid, name, major)
-- course(cid, title, dept)
-- enroll(sid, cid, quarter, grade)
-- required(major, cid)
-- For each student, list the required courses for their major that they have not taken.

select s.sid, s.name, c.cid, c.title from student s
join required r on r.major = s.major
where not exists(
    select * from enroll e
    WHERE e.sid = s.sid
      AND e.cid = r.cid
    
)