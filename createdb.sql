-- Create the Database
CREATE DATABASE retail_service_db;

-- Connect to the Database
\c retail_service_db

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,  -- Changed INT to SERIAL for auto-increment
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Products Table
CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,  -- Changed INT to SERIAL for auto-increment
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Salespeople Table
CREATE TABLE Salespeople (
    SalespersonID SERIAL PRIMARY KEY,  -- Changed INT to SERIAL for auto-increment
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    HireDate DATE NOT NULL
);

-- Create Sales Table
CREATE TABLE Sales (
    SaleID SERIAL PRIMARY KEY,  -- Changed INT to SERIAL for auto-increment
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    SalespersonID INT NOT NULL,
    SaleDate DATE NOT NULL,
    Quantity INT NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SalespersonID) REFERENCES Salespeople(SalespersonID)
);
