-- student(sid, name, major)
-- course(cid, title, dept)
-- enroll(sid, cid, quarter, grade)
-- required(major, cid)
-- Find students who have taken every course required for their major.
select s.sid, s.name from student s
where not exists(
    select * from required r
    where r.major = s.major
    and not exists(
        select * from enroll e
        where e.sid = s.sid
        and e.cid = r.cid
    )
)
