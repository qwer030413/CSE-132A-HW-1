PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS borrower;
DROP TABLE IF EXISTS loan;
DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
  name TEXT PRIMARY KEY,
  credit INTEGER
);

CREATE TABLE loan (
  no TEXT PRIMARY KEY,
  type TEXT,
  minCredit INTEGER NOT NULL,
  amount INTEGER NOT NULL
);

CREATE TABLE borrower (
  cname TEXT,
  lno TEXT,
  due DATE,
  PRIMARY KEY (cname, lno),
  FOREIGN KEY (cname) REFERENCES customer(name),
  FOREIGN KEY (lno) REFERENCES loan(no)
);

INSERT INTO customer(name, credit) VALUES
  ('Anna', 720),
  ('Ben', 680),
  ('Cara', 620),
  ('Dan', 590),
  ('Elle', 750),
  ('Finn', 450),
  ('Gina', 560),
  ('Hank', 710),
  ('Iris', 310),
  ('Jade', 500);

INSERT INTO loan(no, type, minCredit, amount) VALUES
  ('L1', 'jumbo mortgage', 700, 500000),
  ('L2', 'jumbo mortgage', 650, 300000),
  ('L3', 'standard mortgage', 600, 250000),
  ('L4', 'auto', 500, 22000),
  ('L5', 'student', 300, 12000),
  ('L6', 'student', 0, 8000),
  ('L7', 'personal', 550, 15000),
  ('L8', 'business', 700, 90000),
  ('L9', 'auto', 650, 35000),
  ('L10', 'personal', 400, 5000);

INSERT INTO borrower(cname, lno, due) VALUES
  ('Anna', 'L1', '2026-09-01'),
  ('Anna', 'L3', '2026-09-01'),
  ('Anna', 'L4', '2026-09-01'),
  ('Anna', 'L5', '2026-09-01'),
  ('Anna', 'L7', '2026-09-01'),
  ('Anna', 'L8', '2026-09-01'),

  ('Ben', 'L1', '2026-10-15'),
  ('Ben', 'L3', '2026-10-15'),
  ('Ben', 'L4', '2026-10-15'),
  ('Ben', 'L5', '2026-10-15'),
  ('Ben', 'L7', '2026-10-15'),
  ('Ben', 'L8', '2026-10-15'),

  ('Cara', 'L2', '2026-11-01'),
  ('Cara', 'L6', '2026-11-01'),
  ('Cara', 'L9', '2026-11-01'),

  ('Dan', 'L3', '2026-08-20'),
  ('Dan', 'L4', '2026-08-20'),

  ('Finn', 'L5', '2026-12-01'),
  ('Finn', 'L6', '2026-12-01'),

  ('Gina', 'L7', '2026-07-10'),
  ('Gina', 'L10', '2026-07-10'),

  ('Hank', 'L8', '2026-06-30'),

  ('Iris', 'L5', '2026-12-15'),
  ('Iris', 'L6', '2026-12-15');
