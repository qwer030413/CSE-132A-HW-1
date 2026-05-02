# CSE132A Worksheet 1

## Schema

Consider the tables created by the following DDL commands:

```sql
CREATE TABLE Customers(
    ID INTEGER PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE Orders(
    ID INTEGER PRIMARY KEY,
    orderDate DATE,
    customerID INTEGER REFERENCES Customers(ID)
);

CREATE TABLE LineItems(
    ID INTEGER PRIMARY KEY,
    shipDate DATE,
    orderID INTEGER REFERENCES Orders(ID),
    productID INTEGER REFERENCES Products(ID),
    amountOfProductUnits INTEGER
);

CREATE TABLE Products(
    ID INTEGER PRIMARY KEY,
    name VARCHAR(30)
);
```

#### Question 1

Write a single SQL query that finds the names of the customers who have bought more than
10 units of the product identified by Product_ID = 25.

These customers need not have bought the full 10 units with a single order or a single line item.
For example, it is OK if they have bought 3 units of Product 25 in one order,
5 in a second order and 6 in a third order (3 + 5 + 6 > 10).



#### Question 2

The orderDate stands for the date that the order was taken. The company ships each
line item of the order on shipDate. Different items of the same order may ship at different
dates.

Usually the ship date and the order date are the same date but sometimes the ship date
is one or more days after the order date.

Write a single query that finds the IDs of orders made by customers who at least once
had an order with a line item that was not shipped on the date it was ordered.





#### Question 3

Write a single query that does the following:
For each product, find the total number of units that were not shipped on the date they were ordered.