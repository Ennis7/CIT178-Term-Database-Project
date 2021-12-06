/* Final Project Views*/
USE toYourTable
GO

/*  View #1  

-- updatable view --
CREATE VIEW CurrentInventory 
AS
SELECT ItemID, Description, Weight, Price, InventoryQuantity
FROM Inventory;
GO

--original data--
SELECT * FROM CurrentInventory;

-- updating price --

GO
UPDATE CurrentInventory
SET Price = 20.00
WHERE ItemID = 7;
GO

-- displaying new data--

SELECT * FROM CurrentInventory;


  View #2  

--  creating view --
GO
CREATE VIEW CurrentOrders
AS
SELECT Customers.ID, FName, LName, CustomerType, OrderDate, LocationID
FROM Customers JOIN Orders ON Customers.ID = Orders.CustomerID;
GO

-- using the view to display the data --
SELECT * FROM CurrentOrders;


 View #3 

-- creating view --
GO
CREATE VIEW CustomerContact
AS
SELECT FName, LName, RoadAddress FROM Customers;
GO

-- using the view to display the data --
SELECT * FROM CustomerContact;


 View #4
-- creating view --
GO
CREATE VIEW InvAboveAVGPrice 
AS
SELECT Price, Description
FROM Inventory
WHERE Price > (SELECT AVG(Price) FROM Inventory);

-- using the view to display the data --
SELECT * FROM InvAboveAVGPrice;
*/