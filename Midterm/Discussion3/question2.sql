-- 2. Same query, do not use MAX.
SELECT r.A 
FROM R r 
-- sub q: is there any row in R where B value is greater than this row's B?
-- so after not exists, there does NOT exist any row with r.b > r1.B
WHERE NOT EXISTS(
    SELECT * FROM R r1 WHERE r1.B > r.B
)