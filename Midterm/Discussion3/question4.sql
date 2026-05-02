
-- How should we change the schema so the two queries are NOT equivalent? Hint: Think
-- NULLS. Exhibit an instance where the two behave differently. Explain why

-- CREATE TABLE R (
-- A integer PRIMARY KEY,
-- B integer NOT NULL
-- );
-- INSERT INTO R VALUES (1, NULL);
-- INSERT INTO R VALUES (2, 13);
-- If B is NULL in tuple r, then r.B < r1.B fails for any choice of r1, so all A coupled with a NULL B
-- will be output by the second query. But not by the first.