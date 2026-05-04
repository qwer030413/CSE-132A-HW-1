PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS borrower;
DROP TABLE IF EXISTS loan;
DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
    name        TEXT PRIMARY KEY,
    credit      INTEGER
);
CREATE TABLE loan (
    no          TEXT PRIMARY KEY,
    type        TEXT,
    minCredit   INTEGER NOT NULL,
    amount      INTEGER NOT NULL
);
CREATE TABLE borrower (
    cname       TEXT REFERENCES customer(name),
    lno         TEXT REFERENCES loan(no),
    due         TEXT,
    PRIMARY KEY (cname, lno)
);

INSERT INTO customer (name, credit) VALUES
    ('Alice Johnson', 720),
    ('Bob Lee', 680),
    ('Carol Davis', 800),
    ('David Kim', 760),
    ('Emma Wilson', 740),
    ('Jane Doe', 650),
    ('John Smith', 710),
    ('Maria Garcia', 790),
    ('Nina Patel', 600),
    ('Omar Brown', 830);

INSERT INTO loan (no, type, minCredit, amount) VALUES
    ('L100', 'jumbo mortgage', 700, 5000),
    ('L101', 'student', 0, 3000),
    ('L102', 'auto', 650, 8000),
    ('L103', 'jumbo mortgage', 760, 12000),
    ('L104', 'personal', 600, 2000),
    ('L105', 'business', 750, 15000),
    ('L106', 'student', 0, 7000),
    ('L107', 'home equity', 720, 15000),
    ('L108', 'jumbo mortgage', 820, 9000);

INSERT INTO borrower (cname, lno, due) VALUES
    ('Alice Johnson', 'L100', '2026-06-15'),
    ('Bob Lee', 'L101', '2026-07-01'),
    ('Carol Davis', 'L103', '2026-08-20'),
    ('Carol Davis', 'L105', '2026-09-15'),
    ('David Kim', 'L102', '2026-07-30'),
    ('David Kim', 'L105', '2026-10-10'),
    ('Emma Wilson', 'L106', '2026-11-01'),
    ('Jane Doe', 'L100', '2026-06-30'),
    ('Jane Doe', 'L104', '2026-12-05'),
    ('John Smith', 'L100', '2026-06-10'),
    ('John Smith', 'L101', '2026-07-12'),
    ('John Smith', 'L103', '2026-08-05'),
    ('Maria Garcia', 'L108', '2026-09-01'),
    ('Nina Patel', 'L101', '2026-07-22'),
    ('Nina Patel', 'L106', '2026-11-18'),
    ('Omar Brown', 'L107', '2026-10-25');
