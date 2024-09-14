-- Insert into Customers
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234', '123 Elm St, Springfield'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak St, Springfield'),
('Robert', 'Johnson', 'robert.johnson@example.com', '555-9101', '789 Pine St, Springfield'),
('Emily', 'Davis', 'emily.davis@example.com', '555-1122', '101 Maple St, Springfield'),
('Michael', 'Wilson', 'michael.wilson@example.com', '555-3344', '202 Birch St, Springfield'),
('Sarah', 'Lee', 'sarah.lee@example.com', '555-5566', '303 Cedar St, Springfield'),
('David', 'Clark', 'david.clark@example.com', '555-7788', '404 Walnut St, Springfield'),
('Laura', 'Walker', 'laura.walker@example.com', '555-9900', '505 Spruce St, Springfield'),
('James', 'Harris', 'james.harris@example.com', '555-1212', '606 Redwood St, Springfield'),
('Linda', 'Lewis', 'linda.lewis@example.com', '555-3434', '707 Fir St, Springfield');

-- Insert into Products
INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Laptop', 'Electronics', 899.99, 50),
('Smartphone', 'Electronics', 499.99, 100),
('Desk Chair', 'Furniture', 129.99, 30),
('Office Desk', 'Furniture', 299.99, 20),
('Coffee Maker', 'Appliances', 59.99, 75),
('Blender', 'Appliances', 39.99, 60),
('Notebook', 'Stationery', 2.99, 200),
('Printer', 'Electronics', 149.99, 25),
('Headphones', 'Electronics', 89.99, 40),
('Lamp', 'Furniture', 19.99, 100);

-- Insert into Salespeople
INSERT INTO Salespeople (FirstName, LastName, Email, Phone, HireDate) VALUES
('Alice', 'Green', 'alice.green@example.com', '555-1212', '2023-01-15'),
('Bob', 'Brown', 'bob.brown@example.com', '555-3434', '2022-05-23'),
('Charlie', 'Miller', 'charlie.miller@example.com', '555-5656', '2023-07-10'),
('Diana', 'Wilson', 'diana.wilson@example.com', '555-7878', '2023-03-30'),
('Evan', 'Taylor', 'evan.taylor@example.com', '555-9090', '2023-06-05'),
('Fiona', 'Moore', 'fiona.moore@example.com', '555-2323', '2023-08-20'),
('George', 'Young', 'george.young@example.com', '555-4545', '2022-11-01'),
('Hannah', 'King', 'hannah.king@example.com', '555-6767', '2023-02-14'),
('Ian', 'Scott', 'ian.scott@example.com', '555-8989', '2023-04-25'),
('Jill', 'Adams', 'jill.adams@example.com', '555-1010', '2023-09-12');

-- Insert into Sales
INSERT INTO Sales (CustomerID, ProductID, SalespersonID, SaleDate, Quantity, TotalAmount) VALUES
(1, 1, 1, '2024-09-01', 1, 899.99),
(2, 2, 2, '2024-09-02', 2, 999.98),
(3, 3, 3, '2024-09-03', 1, 129.99),
(4, 4, 4, '2024-09-04', 1, 299.99),
(5, 5, 5, '2024-09-05', 1, 59.99),
(6, 6, 6, '2024-09-06', 2, 39.99),
(7, 7, 7, '2024-09-07', 2, 2.99),
(8, 8, 8, '2024-09-08', 3, 149.99),
(9, 9, 9, '2024-09-09', 3, 89.99),
(10, 10, 10, '2024-09-10', 4, 19.99);
