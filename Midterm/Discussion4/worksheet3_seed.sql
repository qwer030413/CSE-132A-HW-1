PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS LineItems;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers(
  ID INTEGER PRIMARY KEY,
  name VARCHAR(30)
);

CREATE TABLE Orders(
  ID INTEGER PRIMARY KEY,
  orderDate DATE,
  customerID INTEGER REFERENCES Customers(ID)
);

CREATE TABLE Products(
  ID INTEGER PRIMARY KEY,
  name VARCHAR(30)
);

CREATE TABLE LineItems(
  ID INTEGER PRIMARY KEY,
  shipDate DATE,
  orderID INTEGER REFERENCES Orders(ID),
  productID INTEGER REFERENCES Products(ID),
  amountOfProductUnits INTEGER
);

INSERT INTO Customers(ID, name) VALUES
  (1, 'Alice'),
  (2, 'Bob'),
  (3, 'Carla'),
  (4, 'Diego'),
  (5, 'Erin'),
  (6, 'Farah');

INSERT INTO Products(ID, name) VALUES
  (10, 'Notebook'),
  (15, 'Pencil'),
  (20, 'Backpack'),
  (25, 'Calculator'),
  (30, 'Binder'),
  (35, 'Ruler');

INSERT INTO Orders(ID, orderDate, customerID) VALUES
  (101, '2026-01-10', 1),
  (102, '2026-01-12', 1),
  (103, '2026-02-01', 1),
  (201, '2026-01-11', 2),
  (202, '2026-01-15', 2),
  (301, '2026-01-13', 3),
  (302, '2026-02-03', 3),
  (401, '2026-01-20', 4),
  (501, '2026-01-25', 5),
  (502, '2026-02-05', 5),
  (601, '2026-02-10', 6);

INSERT INTO LineItems(ID, shipDate, orderID, productID, amountOfProductUnits) VALUES
  (1001, '2026-01-10', 101, 25, 3),
  (1002, '2026-01-11', 101, 10, 2),
  (1003, '2026-01-12', 102, 25, 5),
  (1004, '2026-02-01', 103, 25, 3),
  (1005, '2026-02-01', 103, 15, 1),

  (2001, '2026-01-11', 201, 25, 4),
  (2002, '2026-01-15', 202, 25, 6),
  (2003, '2026-01-15', 202, 30, 7),

  (3001, '2026-01-14', 301, 25, 12),
  (3002, '2026-01-13', 301, 20, 2),
  (3003, '2026-02-03', 302, 15, 9),

  (4001, '2026-01-20', 401, 25, 5),
  (4002, '2026-01-20', 401, 35, 4),

  (5001, '2026-01-27', 501, 20, 6),
  (5002, '2026-01-25', 501, 25, 8),
  (5003, '2026-02-06', 502, 25, 3),
  (5004, '2026-02-05', 502, 30, 2),

  (6001, '2026-02-10', 601, 10, 5),
  (6002, '2026-02-10', 601, 15, 2);
