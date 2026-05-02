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
    (1, 'Alice Chen'),
    (2, 'Ben Ortiz'),
    (3, 'Carla Singh'),
    (4, 'Diego Kim'),
    (5, 'Evelyn Ross');

INSERT INTO Products(ID, name) VALUES
    (10, 'Notebook'),
    (15, 'Pen Pack'),
    (20, 'USB Cable'),
    (25, 'Graphing Calculator'),
    (30, 'Backpack'),
    (35, 'Highlighter Set');

INSERT INTO Orders(ID, orderDate, customerID) VALUES
    (100, '2026-04-01', 1),
    (101, '2026-04-03', 1),
    (102, '2026-04-05', 2),
    (103, '2026-04-07', 2),
    (104, '2026-04-09', 3),
    (105, '2026-04-11', 3),
    (106, '2026-04-13', 4),
    (107, '2026-04-15', 4),
    (108, '2026-04-17', 5);

INSERT INTO LineItems(ID, shipDate, orderID, productID, amountOfProductUnits) VALUES
    (1000, '2026-04-01', 100, 25, 3),
    (1001, '2026-04-01', 100, 10, 2),
    (1002, '2026-04-04', 101, 25, 5),
    (1003, '2026-04-03', 101, 30, 1),
    (1004, '2026-04-05', 102, 25, 11),
    (1005, '2026-04-05', 102, 15, 4),
    (1006, '2026-04-08', 103, 20, 2),
    (1007, '2026-04-07', 103, 35, 6),
    (1008, '2026-04-09', 104, 25, 4),
    (1009, '2026-04-12', 105, 25, 6),
    (1010, '2026-04-11', 105, 10, 3),
    (1011, '2026-04-13', 106, 25, 2),
    (1012, '2026-04-14', 106, 30, 1),
    (1013, '2026-04-15', 107, 25, 9),
    (1014, '2026-04-17', 108, 15, 5),
    (1015, '2026-04-18', 108, 20, 7);
