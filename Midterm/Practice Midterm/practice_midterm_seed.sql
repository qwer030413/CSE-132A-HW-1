PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Coffees;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
  name TEXT PRIMARY KEY,
  address TEXT
);

CREATE TABLE Coffees (
  name TEXT PRIMARY KEY,
  origin TEXT,
  pricePerPound REAL
);

CREATE TABLE Sales (
  coffee TEXT NOT NULL,
  cust TEXT NOT NULL,
  date DATE,
  discount INTEGER,
  pounds REAL,
  PRIMARY KEY (coffee, cust, date),
  FOREIGN KEY (coffee) REFERENCES Coffees(name),
  FOREIGN KEY (cust) REFERENCES Customers(name)
);

INSERT INTO Customers(name, address) VALUES
  ('Ava', '101 First St'),
  ('Blake', '202 Second St'),
  ('Carmen', '303 Third St'),
  ('Devon', '404 Fourth St'),
  ('Emi', '505 Fifth St'),
  ('Farid', '606 Sixth St'),
  ('Gia', '707 Seventh St');

INSERT INTO Coffees(name, origin, pricePerPound) VALUES
  ('Andes Light', 'Colombia', 12.00),
  ('Bogota Dark', 'Colombia', 15.00),
  ('Yirgacheffe', 'Ethiopia', 18.00),
  ('Sidamo', 'Ethiopia', 16.00),
  ('Sumatra Bold', 'Indonesia', 14.00),
  ('Java Estate', 'Indonesia', 13.00),
  ('Kona Reserve', 'Hawaii', 30.00),
  ('Tarrazú', 'Costa Rica', 17.00);

INSERT INTO Sales(coffee, cust, date, discount, pounds) VALUES
  ('Andes Light', 'Ava', '2026-01-03', 10, 2.0),
  ('Bogota Dark', 'Blake', '2026-01-05', 25, 1.0),
  ('Yirgacheffe', 'Ava', '2026-01-08', 25, 1.5),
  ('Sidamo', 'Carmen', '2026-01-10', 0, 3.0),
  ('Sumatra Bold', 'Devon', '2026-01-12', 25, 2.5),
  ('Java Estate', 'Emi', '2026-01-14', 15, 4.0),
  ('Sumatra Bold', 'Emi', '2026-01-16', 25, 1.0),
  ('Bogota Dark', 'Devon', '2026-01-20', 25, 2.0),
  ('Sidamo', 'Farid', '2026-01-22', 25, 2.0);
