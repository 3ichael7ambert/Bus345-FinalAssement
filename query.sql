-- Display all records and fields from the Customers table
SELECT * 
FROM Customers;

-- Display selected fields from Customers and Sales tables
SELECT c.CustomerID, c.FirstName, c.LastName, s.SaleID, s.SaleDate, s.TotalAmount
FROM Customers c
JOIN Sales s ON c.CustomerID = s.CustomerID;

