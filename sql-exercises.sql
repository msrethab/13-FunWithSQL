--Exercise 01 Return all category names with their descriptions from the Categories table.

SELECT CategoryName, Description 
FROM Categories

--Exercise 02 Return the contact name, customer id, and company name of all Customers in London

SELECT ContactName, CustomerID, CompanyName 
FROM Customers 
WHERE City = 'London'

--Exercise 03 Return all available columns in the Suppliers tables for the marketing managers and sales representatives that have a FAX number

SELECT * 
FROM Suppliers 
WHERE Fax != 'NULL'

--Exercise 04 Return a list of customer id's from the Orders table with required dates between Jan 1, 1997 and Jan 1, 1998 and with freight under 100 units.

SELECT CustomerID 
FROM Orders 
WHERE RequiredDate between '1/1/1997' and '1/1/1998' AND Freight < 100

--Exercise 05 Return a list of company names and contact names of all the Owners from the Customers table from Mexico, Sweden and Germany.

SELECT CompanyName, ContactName 
FROM Customers 
WHERE Country IN ('Mexico', 'Sweden', 'Germany')

--Exercise 06 Return a count of the number of discontinued products in the Products table.

SELECT COUNT(Discontinued) 
FROM Products 
WHERE Discontinued = 1

--Exercise 07 Return a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.

SELECT CategoryName, Description 
FROM Categories 
WHERE CategoryName LIKE 'Co%'

--Exercise 08 Return all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address. The list should ordered alphabetically by company name.

SELECT CompanyName, City, Country, PostalCode  
FROM Suppliers 
WHERE Address LIKE ('%rue%') ORDER BY CompanyName

--Exercise 09 Return the product id and the total quantities ordered for each product id in the Order Details table.

SELECT ProductID, SUM(Quantity)  
FROM [Order Details] 
GROUP BY ProductID 
ORDER BY ProductID

--Exercise 10 Return the customer name and customer address of all customers with orders that shipped using Speedy Express.

SELECT DISTINCT Customers.ContactName, Customers.Address 
FROM Customers join Orders on Orders.Shipvia = '1'

--Exercise 11 Return a list of Suppliers containing company name, contact name, contact title and region description.

SELECT CompanyName, ContactName, ContactTitle, Region 
FROM Suppliers

--Exercise 12 Return all product names from the Products table that are condiments.

SELECT ProductName 
FROM Products 
WHERE CategoryID = 2

--Exercise 13 Return a list of customer names who have no orders in the Orders table.

SELECT Customers.ContactName 
FROM Customers 
WHERE NOT EXISTS(SELECT NULL FROM Orders WHERE Orders.CustomerID = Customers.CustomerID)

--Exercise 14 Add a shipper named 'Amazon' to the Shippers table using SQL.

INSERT INTO Shippers (CompanyName, Phone)
VALUES ('Amazon', '(503) 555-5555')

--Exercise 15 Change the company name from 'Amazon' to 'Amazon Prime Shipping' in the Shippers table using SQL.

UPDATE Shippers 
SET CompanyName='Amazon Prime Shipping'
WHERE CompanyName = 'Amazon'

--Exercise 16 Return a complete list of company names from the Shippers table. Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.

SELECT CompanyName, CAST(ROUND(SUM(Orders.Freight), 0) AS DECIMAL(10,0))
FROM Shippers  
INNER JOIN Orders ON Shippers.ShipperID = Orders.ShipVia 
GROUP BY CompanyName

--Exercise 17 Return all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'. The combined format should be 'LastName, FirstName'.

SELECT CONCAT(LastName, ', ', FirstName) AS DisplayName
FROM Employees 

--Exercise 18 Add yourself to the Customers table with an order for 'Grandma's Boysenberry Spread'.

INSERT INTO Customers (CustomerID, CompanyName, ContactName, ContactTitle)
VALUES ('MSRET', 'Origin Code Academy', 'Mark Srethabhakti', 'Purchasing Manager')

INSERT INTO Orders (CustomerID)
VALUES ('MSRET')

INSERT INTO [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES (@@IDENTITY, 6, 20.00, 1, 0)

--Exercise 19 Remove yourself and your order from the database.

DELETE FROM [Order Details]
WHERE OrderID = 11078

DELETE FROM Orders
WHERE OrderID = 11078

DELETE FROM Customers
WHERE CustomerID = 'MSRET'

--Exercise 20 Return a list of products from the Products table along with the total units in stock for each product. Give the computed column a name using the alias, 'TotalUnits'. Include only products with TotalUnits greater than 100.

SELECT CONCAT(ProductName, ' - ', UnitsInStock) AS TotalUnits 
FROM Products 
WHERE UnitsInStock >= 100