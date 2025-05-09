Question 1: Achieving 1NF (First Normal Form)
Given table:
MarkDown
| OrderID | CustomerName | Products          |
|---------|--------------|-------------------|
| 101     | John Doe     | Laptop, Mouse     |
| 102     | Jane Smith   | Tablet, Keyboard, Mouse |
| 103     | Emily Clark  | Phone             |
To transform this table into 1NF, we need to create a separate row for each product. We can achieve this by creating a new table ProductDetail with the following structure:
SQL
CREATE TABLE ProductDetail (
  OrderID INT,
  CustomerName VARCHAR(255),
  Product VARCHAR(255)
);

INSERT INTO ProductDetail (OrderID, CustomerName, Product)
VALUES
  (101, 'John Doe', 'Laptop'),
  (101, 'John Doe', 'Mouse'),
  (102, 'Jane Smith', 'Tablet'),
  (102, 'Jane Smith', 'Keyboard'),
  (102, 'Jane Smith', 'Mouse'),
  (103, 'Emily Clark', 'Phone');
Resulting table:
MarkDown
| OrderID | CustomerName | Product  |
|---------|--------------|----------|
| 101     | John Doe     | Laptop   |
| 101     | John Doe     | Mouse    |
| 102     | Jane Smith   | Tablet   |
| 102     | Jane Smith   | Keyboard |
| 102     | Jane Smith   | Mouse    |
| 103     | Emily Clark  | Phone    |
Question 2: Achieving 2NF (Second Normal Form)
Given table:
MarkDown
| OrderID | CustomerName | Product  | Quantity |
|---------|--------------|----------|----------|
| 101     | John Doe     | Laptop   | 2        |
| 101     | John Doe     | Mouse    | 1        |
| 102     | Jane Smith   | Tablet   | 3        |
| 102     | Jane Smith   | Keyboard | 1        |
| 102     | Jane Smith   | Mouse    | 2        |
| 103     | Emily Clark  | Phone    | 1        |
To transform this table into 2NF, we need to remove the partial dependency of CustomerName on OrderID. We can achieve this by creating two separate tables: Orders and OrderDetails.
SQL
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(255)
);

CREATE TABLE OrderDetails (
  OrderID INT,
  Product VARCHAR(255),
  Quantity INT,
  PRIMARY KEY (OrderID, Product),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Orders (OrderID, CustomerName)
VALUES
  (101, 'John Doe'),
  (102, 'Jane Smith'),
  (103, 'Emily Clark');

INSERT INTO OrderDetails (OrderID, Product, Quantity)
VALUES
  (101, 'Laptop', 2),
  (101, 'Mouse', 1),
  (102, 'Tablet', 3),
  (102, 'Keyboard', 1),
  (102, 'Mouse', 2),
  (103, 'Phone', 1);
Resulting tables:
MarkDown
Orders table:
| OrderID | CustomerName |
|---------|--------------|
| 101     | John Doe     |
| 102     | Jane Smith   |
| 103     | Emily Clark  |

OrderDetails table:
| OrderID | Product  | Quantity |
|---------|----------|----------|
| 101     | Laptop   | 2        |
| 101     | Mouse    | 1        |
| 102     | Tablet   | 3        |
| 102     | Keyboard | 1        |
| 102     | Mouse    | 2        |
| 103     | Phone    | 1        |
