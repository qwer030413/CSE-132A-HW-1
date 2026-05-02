-- Consider table R declared as follows:
-- CREATE TABLE R (
-- A integer PRIMARY KEY,
-- B integer NOT NULL
-- );
-- 1. Write a query that returns the A values associated with the maximum B value. Use the
-- MAX aggregate function.

SELECT r.A FROM R r WHERE r.B = (SELECT MAX(B) FROM R);