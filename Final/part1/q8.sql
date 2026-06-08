-- For each day of the week, count the number of reservations on that day. Include days with zero reservations.
select w.day, coalesce(count(r.sname), 0) from weekday w
left join reservation r on w.day = r.day
group by w.day