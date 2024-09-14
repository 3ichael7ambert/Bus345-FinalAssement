Michael Lambert Jr\
BUS 345\
Database Management\
Final Draft

The Final Assessment Guide recommended using Microsoft Access, but since
I am using Mac OS, I am unable to use it. Therefore, I am building my
DBMS with PostgreSQL instead.

**Diagrams**

**Schema**

![](media/image4.png){width="5.213542213473316in"
height="5.855208880139982in"}

The database is set up to help manage a retail or service business by
keeping tabs on customers, salespeople, products, and transactions. It
features four main tables: \`customers\`, \`products\`, \`salespeople\`,
and \`sales\`. Each table has a unique primary key to identify its
records. The \`sales\` table acts as the main link, connecting
\`customers\`, \`salespeople\`, and \`products\` through foreign keys.
For instance, \`sales.customer_id\` ties back to \`customers.id\`,
\`sales.salesperson_id\` connects to \`salespeople.id\`, and
\`sales.product_id\` points to \`products.id\`. This creates a
one-to-many relationship where each customer, salesperson, and product
can be linked to several sales, but each sale is tied to just one
customer, one salesperson, and one product. This setup makes it easy to
track sales transactions, customer interactions, and manage inventory,
keeping everything organized for smooth business operations.

***Schema.dbml (outside file):***

+-----------------------------------------------------------------------+
| // Database: Retail Business Database                                 |
|                                                                       |
| Table customers {                                                     |
|                                                                       |
| id integer \[primary key\]                                            |
|                                                                       |
| first_name varchar                                                    |
|                                                                       |
| last_name varchar                                                     |
|                                                                       |
| email varchar \[unique\]                                              |
|                                                                       |
| phone varchar                                                         |
|                                                                       |
| created_at timestamp                                                  |
|                                                                       |
| updated_at timestamp                                                  |
|                                                                       |
| }                                                                     |
|                                                                       |
| Table products {                                                      |
|                                                                       |
| id integer \[primary key\]                                            |
|                                                                       |
| name varchar                                                          |
|                                                                       |
| description text                                                      |
|                                                                       |
| price decimal                                                         |
|                                                                       |
| stock_quantity integer                                                |
|                                                                       |
| created_at timestamp                                                  |
|                                                                       |
| updated_at timestamp                                                  |
|                                                                       |
| }                                                                     |
|                                                                       |
| Table salespeople {                                                   |
|                                                                       |
| id integer \[primary key\]                                            |
|                                                                       |
| first_name varchar                                                    |
|                                                                       |
| last_name varchar                                                     |
|                                                                       |
| email varchar \[unique\]                                              |
|                                                                       |
| phone varchar                                                         |
|                                                                       |
| hire_date timestamp                                                   |
|                                                                       |
| created_at timestamp                                                  |
|                                                                       |
| updated_at timestamp                                                  |
|                                                                       |
| }                                                                     |
|                                                                       |
| Table sales {                                                         |
|                                                                       |
| id integer \[primary key\]                                            |
|                                                                       |
| sale_date timestamp                                                   |
|                                                                       |
| customer_id integer                                                   |
|                                                                       |
| salesperson_id integer                                                |
|                                                                       |
| product_id integer                                                    |
|                                                                       |
| quantity integer                                                      |
|                                                                       |
| total_price decimal                                                   |
|                                                                       |
| created_at timestamp                                                  |
|                                                                       |
| updated_at timestamp                                                  |
|                                                                       |
| }                                                                     |
|                                                                       |
| Ref: sales.customer_id \> customers.id // A sale is linked to a       |
| customer                                                              |
|                                                                       |
| Ref: sales.salesperson_id \> salespeople.id // A sale is linked to a  |
| salesperson                                                           |
|                                                                       |
| Ref: sales.product_id \> products.id // A sale is linked to a product |
+=======================================================================+
+-----------------------------------------------------------------------+

**ER Diagram**\
![](media/image1.png){width="6.354166666666667in"
height="4.263888888888889in"}\
This ER Diagram simplifies the Schema digram above while showcasing the
one to many.

1.  One Customer to Many Sales

2.  One Product to Many Sales

3.  One Salesperson to Many Sales

**Crow Notation\
**

+-----------------------------------------------------------------------+
| Customers                                                             |
|                                                                       |
| Products                                                              |
|                                                                       |
| Salespeople                                                           |
|                                                                       |
| Sales**:diamond**                                                     |
|                                                                       |
| Customers**-m-\>**Sales                                               |
|                                                                       |
| Products**-m-\>**Sales                                                |
|                                                                       |
| Salespeople**-m-\>**Sales                                             |
+=======================================================================+
+-----------------------------------------------------------------------+

**Create Database**

  -----------------------------------------------------------------------
  CREATE DATABASE retail_service_db;
  -----------------------------------------------------------------------

  -----------------------------------------------------------------------

**Connect to Database**

  -----------------------------------------------------------------------
  \\c retail_service_db;
  -----------------------------------------------------------------------

  -----------------------------------------------------------------------

**Create Tables**

+-----------------------------------------------------------------------+
| \-- Create Customers Table                                            |
|                                                                       |
| CREATE TABLE Customers (                                              |
|                                                                       |
| CustomerID INT PRIMARY KEY,                                           |
|                                                                       |
| FirstName VARCHAR(50),                                                |
|                                                                       |
| LastName VARCHAR(50),                                                 |
|                                                                       |
| Email VARCHAR(100),                                                   |
|                                                                       |
| Phone VARCHAR(20),                                                    |
|                                                                       |
| Address VARCHAR(255),                                                 |
|                                                                       |
| CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP                         |
|                                                                       |
| );                                                                    |
|                                                                       |
| \-- Create Products Table                                             |
|                                                                       |
| CREATE TABLE Products (                                               |
|                                                                       |
| ProductID INT PRIMARY KEY,                                            |
|                                                                       |
| ProductName VARCHAR(100),                                             |
|                                                                       |
| Category VARCHAR(50),                                                 |
|                                                                       |
| Price DECIMAL(10, 2),                                                 |
|                                                                       |
| StockQuantity INT,                                                    |
|                                                                       |
| CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP                         |
|                                                                       |
| );                                                                    |
|                                                                       |
| \-- Create Salespeople Table                                          |
|                                                                       |
| CREATE TABLE Salespeople (                                            |
|                                                                       |
| SalespersonID INT PRIMARY KEY,                                        |
|                                                                       |
| FirstName VARCHAR(50),                                                |
|                                                                       |
| LastName VARCHAR(50),                                                 |
|                                                                       |
| Email VARCHAR(100),                                                   |
|                                                                       |
| Phone VARCHAR(20),                                                    |
|                                                                       |
| HireDate DATE                                                         |
|                                                                       |
| );                                                                    |
|                                                                       |
| \-- Create Sales Table                                                |
|                                                                       |
| CREATE TABLE Sales (                                                  |
|                                                                       |
| SaleID INT PRIMARY KEY,                                               |
|                                                                       |
| CustomerID INT,                                                       |
|                                                                       |
| ProductID INT,                                                        |
|                                                                       |
| SalespersonID INT,                                                    |
|                                                                       |
| SaleDate DATE,                                                        |
|                                                                       |
| Quantity INT,                                                         |
|                                                                       |
| TotalAmount DECIMAL(10, 2),                                           |
|                                                                       |
| FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),            |
|                                                                       |
| FOREIGN KEY (ProductID) REFERENCES Products(ProductID),               |
|                                                                       |
| FOREIGN KEY (SalespersonID) REFERENCES Salespeople(SalespersonID)     |
|                                                                       |
| );                                                                    |
+=======================================================================+
+-----------------------------------------------------------------------+

Next we will want to populate our database using queries\
\
**Seed the Database**

+-----------------------------------------------------------------------+
| \-- Insert into Customers                                             |
|                                                                       |
| INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)    |
| VALUES                                                                |
|                                                                       |
| (\'John\', \'Doe\', \'john.doe@example.com\', \'555-1234\', \'123 Elm |
| St, Springfield\'),                                                   |
|                                                                       |
| (\'Jane\', \'Smith\', \'jane.smith@example.com\', \'555-5678\', \'456 |
| Oak St, Springfield\'),                                               |
|                                                                       |
| (\'Robert\', \'Johnson\', \'robert.johnson@example.com\',             |
| \'555-9101\', \'789 Pine St, Springfield\'),                          |
|                                                                       |
| (\'Emily\', \'Davis\', \'emily.davis@example.com\', \'555-1122\',     |
| \'101 Maple St, Springfield\'),                                       |
|                                                                       |
| (\'Michael\', \'Wilson\', \'michael.wilson@example.com\',             |
| \'555-3344\', \'202 Birch St, Springfield\'),                         |
|                                                                       |
| (\'Sarah\', \'Lee\', \'sarah.lee@example.com\', \'555-5566\', \'303   |
| Cedar St, Springfield\'),                                             |
|                                                                       |
| (\'David\', \'Clark\', \'david.clark@example.com\', \'555-7788\',     |
| \'404 Walnut St, Springfield\'),                                      |
|                                                                       |
| (\'Laura\', \'Walker\', \'laura.walker@example.com\', \'555-9900\',   |
| \'505 Spruce St, Springfield\'),                                      |
|                                                                       |
| (\'James\', \'Harris\', \'james.harris@example.com\', \'555-1212\',   |
| \'606 Redwood St, Springfield\'),                                     |
|                                                                       |
| (\'Linda\', \'Lewis\', \'linda.lewis@example.com\', \'555-3434\',     |
| \'707 Fir St, Springfield\');                                         |
|                                                                       |
| \-- Insert into Products                                              |
|                                                                       |
| INSERT INTO Products (ProductName, Category, Price, StockQuantity)    |
| VALUES                                                                |
|                                                                       |
| (\'Laptop\', \'Electronics\', 899.99, 50),                            |
|                                                                       |
| (\'Smartphone\', \'Electronics\', 499.99, 100),                       |
|                                                                       |
| (\'Desk Chair\', \'Furniture\', 129.99, 30),                          |
|                                                                       |
| (\'Office Desk\', \'Furniture\', 299.99, 20),                         |
|                                                                       |
| (\'Coffee Maker\', \'Appliances\', 59.99, 75),                        |
|                                                                       |
| (\'Blender\', \'Appliances\', 39.99, 60),                             |
|                                                                       |
| (\'Notebook\', \'Stationery\', 2.99, 200),                            |
|                                                                       |
| (\'Printer\', \'Electronics\', 149.99, 25),                           |
|                                                                       |
| (\'Headphones\', \'Electronics\', 89.99, 40),                         |
|                                                                       |
| (\'Lamp\', \'Furniture\', 19.99, 100);                                |
|                                                                       |
| \-- Insert into Salespeople                                           |
|                                                                       |
| INSERT INTO Salespeople (FirstName, LastName, Email, Phone, HireDate) |
| VALUES                                                                |
|                                                                       |
| (\'Alice\', \'Green\', \'alice.green@example.com\', \'555-1212\',     |
| \'2023-01-15\'),                                                      |
|                                                                       |
| (\'Bob\', \'Brown\', \'bob.brown@example.com\', \'555-3434\',         |
| \'2022-05-23\'),                                                      |
|                                                                       |
| (\'Charlie\', \'Miller\', \'charlie.miller@example.com\',             |
| \'555-5656\', \'2023-07-10\'),                                        |
|                                                                       |
| (\'Diana\', \'Wilson\', \'diana.wilson@example.com\', \'555-7878\',   |
| \'2023-03-30\'),                                                      |
|                                                                       |
| (\'Evan\', \'Taylor\', \'evan.taylor@example.com\', \'555-9090\',     |
| \'2023-06-05\'),                                                      |
|                                                                       |
| (\'Fiona\', \'Moore\', \'fiona.moore@example.com\', \'555-2323\',     |
| \'2023-08-20\'),                                                      |
|                                                                       |
| (\'George\', \'Young\', \'george.young@example.com\', \'555-4545\',   |
| \'2022-11-01\'),                                                      |
|                                                                       |
| (\'Hannah\', \'King\', \'hannah.king@example.com\', \'555-6767\',     |
| \'2023-02-14\'),                                                      |
|                                                                       |
| (\'Ian\', \'Scott\', \'ian.scott@example.com\', \'555-8989\',         |
| \'2023-04-25\'),                                                      |
|                                                                       |
| (\'Jill\', \'Adams\', \'jill.adams@example.com\', \'555-1010\',       |
| \'2023-09-12\');                                                      |
|                                                                       |
| \-- Insert into Sales                                                 |
|                                                                       |
| INSERT INTO Sales (CustomerID, ProductID, SalespersonID, SaleDate,    |
| Quantity, TotalAmount) VALUES                                         |
|                                                                       |
| (1, 1, 1, \'2024-09-01\', 1, 899.99),                                 |
|                                                                       |
| (2, 2, 2, \'2024-09-02\', 2, 999.98),                                 |
|                                                                       |
| (3, 3, 3, \'2024-09-03\', 1, 129.99),                                 |
|                                                                       |
| (4, 4, 4, \'2024-09-04\', 1, 299.99),                                 |
|                                                                       |
| (5, 5, 5, \'2024-09-05\', 1, 59.99),                                  |
|                                                                       |
| (6, 6, 6, \'2024-09-06\', 2, 39.99),                                  |
|                                                                       |
| (7, 7, 7, \'2024-09-07\', 2, 2.99),                                   |
|                                                                       |
| (8, 8, 8, \'2024-09-08\', 3, 149.99),                                 |
|                                                                       |
| (9, 9, 9, \'2024-09-09\', 3, 89.99),                                  |
|                                                                       |
| (10, 10, 10, \'2024-09-10\', 4, 19.99);                               |
+=======================================================================+
+-----------------------------------------------------------------------+

**Query the Database**

**1.Display all entries from the Customers table**

+-----------------------------------------------------------------------+
| \-- Display all records and fields from the Customers table           |
|                                                                       |
| SELECT \*                                                             |
|                                                                       |
| FROM Customers;                                                       |
+=======================================================================+
+-----------------------------------------------------------------------+

**2. Displays some entries from at least two tables**

+-----------------------------------------------------------------------+
| \-- Display selected fields from Customers and Sales tables           |
|                                                                       |
| SELECT c.CustomerID, c.FirstName, c.LastName, s.SaleID, s.SaleDate,   |
| s.TotalAmount                                                         |
|                                                                       |
| FROM Customers c                                                      |
|                                                                       |
| JOIN Sales s ON c.CustomerID = s.CustomerID;                          |
+=======================================================================+
+-----------------------------------------------------------------------+

**3. Query that limits the entries by additional criteria**

+-----------------------------------------------------------------------+
| \-- Display records of Sales where the TotalAmount is greater than    |
| \$100                                                                 |
|                                                                       |
| SELECT \*                                                             |
|                                                                       |
| FROM Sales                                                            |
|                                                                       |
| WHERE TotalAmount \> 100;                                             |
+=======================================================================+
+-----------------------------------------------------------------------+

**4. A Query that is sorted by a Specific Field**

+-----------------------------------------------------------------------+
| \-- Display all records from the Products table sorted by Price in    |
| ascending order                                                       |
|                                                                       |
| SELECT \*                                                             |
|                                                                       |
| FROM Products                                                         |
|                                                                       |
| ORDER BY Price ASC;                                                   |
+=======================================================================+
+-----------------------------------------------------------------------+

**5. Parameter Query**

+-----------------------------------------------------------------------+
| \-- Display records of Sales for a specific CustomerID, where         |
| CustomerID is provided as a parameter                                 |
|                                                                       |
| \-- Replace \`?\` with the actual CustomerID value when executing the |
| query                                                                 |
|                                                                       |
| SELECT \*                                                             |
|                                                                       |
| FROM Sales                                                            |
|                                                                       |
| WHERE CustomerID = ?;                                                 |
+=======================================================================+
+-----------------------------------------------------------------------+

**Reports**

**1. Customer Records Report**

  -----------------------------------------------------------------------
  \\copy (SELECT \* FROM Customers) TO \'customers_all_records.csv\' CSV
  HEADER;
  -----------------------------------------------------------------------

  -----------------------------------------------------------------------

![](media/image5.png){width="6.5in" height="2.611111111111111in"}

**2. Sales by Product Category**

  -----------------------------------------------------------------------
  \\copy (SELECT p.Category, SUM(s.TotalAmount) AS TotalSales FROM Sales
  s JOIN Products p ON s.ProductID = p.ProductID GROUP BY p.Category) TO
  \'sales_by_category.csv\' CSV HEADER;
  -----------------------------------------------------------------------

  -----------------------------------------------------------------------

![](media/image3.png){width="3.9791666666666665in" height="3.75in"}

**3. Average Price of Products**

  -----------------------------------------------------------------------
  \\copy (SELECT AVG(Price) AS AveragePrice FROM Products) TO
  \'average_product_price.csv\' CSV HEADER;
  -----------------------------------------------------------------------

  -----------------------------------------------------------------------

![](media/image2.png){width="3.9583333333333335in"
height="2.2291666666666665in"}

**Analysis**

**Database Structure**

The database designed for the retail/service business includes four
primary tables: **Customers**, **Products**, **Salespeople**, and
**Sales**. Each table is structured to manage specific aspects of the
business operations:

1.  **Customers**: This table stores customer information, including
    their unique identifier (CustomerID), name, email, phone, and
    address. The CustomerID serves as the primary key to uniquely
    identify each customer.

2.  **Products**: This table records details about products, such as the
    product\'s unique identifier (ProductID), name, category, price, and
    stock quantity. The ProductID is the primary key for this table.

3.  **Salespeople**: This table contains information about sales
    representatives, including their unique identifier (SalespersonID),
    name, email, phone, and hire date. The SalespersonID acts as the
    primary key.

4.  **Sales**: This table tracks individual sales transactions. It
    includes a unique identifier (SaleID), links to the CustomerID,
    ProductID, and SalespersonID, and records the sale date, quantity
    sold, and total amount. Foreign keys link to the Customers,
    Products, and Salespeople tables.

**ER Diagram Notation**

The ER diagram for this database uses Chen Notation, which is suitable
for representing entities and their relationships in a clear and
detailed manner. Chen Notation was chosen due to its ability to
effectively depict entities, relationships, and attributes, making it
easier to understand the data structure and the relationships between
tables (Harrington, 2016).

**Normalization**

The database is normalized to the **Third Normal Form (3NF)**:

1.  **First Normal Form (1NF)**: Each table contains only atomic
    (indivisible) values and has a unique primary key.

2.  **Second Normal Form (2NF)**: All non-key attributes are fully
    functionally dependent on the primary key. For instance, in the
    Sales table, all attributes are dependent on SaleID, not on partial
    keys.

3.  **Third Normal Form (3NF)**: There are no transitive dependencies.
    For example, Salespeople contains only information about sales
    representatives and does not include attributes dependent on other
    non-key attributes (Elmasri & Navathe, 2015).

**Security Concerns and Models**

1.  **Data Integrity and Access Control**: Ensuring that only authorized
    users can access or modify data is critical. Unauthorized access or
    data corruption could lead to financial loss or data breaches.
    Implement role-based access control (RBAC) to limit access based on
    user roles and responsibilities (Date, 2019).

2.  **Data Encryption**: Data should be encrypted both at rest and in
    transit. This protects sensitive information such as customer
    details and transaction records from unauthorized access or
    interception during transmission (O\'Neil & O\'Neil, 2014).

3.  **Backup and Recovery**: Regular backups are essential to protect
    data from loss due to system failures or disasters. Implement a
    robust backup strategy and ensure that recovery procedures are
    tested regularly (Ponniah, 2010).

**Security Models and Procedures**

1.  **Role-Based Access Control (RBAC)**: Define user roles and grant
    permissions based on the minimum required access. This minimizes the
    risk of unauthorized data access or modifications.

2.  **Data Encryption**: Use encryption protocols like AES-256 for
    encrypting data at rest and TLS for data in transit. This ensures
    that data is protected from unauthorized access and breaches.

3.  **Regular Backups**: Implement automated backup procedures and
    maintain backup copies in secure locations. Test the recovery
    process periodically to ensure data can be restored quickly in case
    of an incident.

**Conclusion**

The database for the retail/service business is designed with a focus on
efficiency, normalization, and security. By using Crow's Foot Notation,
the relationships between tables are clearly defined, and the database
structure supports robust data management and reporting. Security models
and procedures are essential to protect the integrity and
confidentiality of the data, ensuring that the database remains a
reliable asset for the organization.

**References**

> Bohrer, M. (2021, February 16). *Crow's Foot notation: Relationship
> symbols and how to read diagrams*. FreeCodeCamp. Retrieved September
> 12, 2024, from
> [[https://www.freecodecamp.org/news/crows-foot-notation-relationship-symbols-and-how-to-read-diagrams/]{.underline}](https://www.freecodecamp.org/news/crows-foot-notation-relationship-symbols-and-how-to-read-diagrams/)
>
> Date, C. J. (2019). *Database systems: An application-oriented
> approach*. Pearson.
>
> dbdiagram.io. (n.d.). *Database diagram* \[Diagram\]. Retrieved
> September 12, 2024, from
> [[https://dbdiagram.io/d]{.underline}](https://dbdiagram.io/d)
>
> Elmasri, R., & Navathe, S. B. (2015). *Fundamentals of database
> systems* (7th ed.). Pearson.
>
> Gleek.io. (n.d.). *Crow's Foot vs Chen notation: Which is best for
> your ER diagrams?* Retrieved September 12, 2024, from
> [[https://www.gleek.io/blog/crows-foot-chen]{.underline}](https://www.gleek.io/blog/crows-foot-chen)
>
> Gleek.io. (n.d.). *ER diagram* \[Diagram\]. Retrieved September 12,
> 2024, from
> [[https://app.gleek.io/diagrams/dAtKtEpLu_ItYjb8uFFGqg]{.underline}](https://app.gleek.io/diagrams/dAtKtEpLu_ItYjb8uFFGqg)
>
> Harrington, J. L. (2016). *Relational database design and
> implementation* (4th ed.). Morgan Kaufmann.
>
> O\'Neil, P., & O\'Neil, E. (2014). *Database: Principles, programming,
> and performance*. Morgan Kaufmann.
>
> Ponniah, P. (2010). *Database design and implementation*. Wiley.
