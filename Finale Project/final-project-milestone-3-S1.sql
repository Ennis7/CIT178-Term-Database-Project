/* 
#1 

USE toYourTable;
SELECT Zipcode.State, COUNT(DISTINCT Customers.CustomerType) AS [Customers per State]
FROM Customers JOIN Zipcode ON Customers.Zipcode = Zipcode.zipcode
GROUP BY Zipcode.State
ORDER BY Zipcode.State ASC;

#2 
USE toYourTable;
SELECT COUNT(OrderDetails.ItemID) AS [Total Items Ordered], Inventory.Description,
SUM(OrderDetails.OrderQty)* Inventory.Price AS [Total Price]
FROM OrderDetails JOIN Inventory ON OrderDetails.ItemID = Inventory.ItemID
GROUP BY Inventory.Description, Inventory.Price, OrderDetails.ItemID
ORDER BY OrderDetails.ItemID;

#3 

SELECT COUNT(OrderDetails.ItemID) AS [Total Items Ordered],
AVG(Inventory.Price) AS [Average per Item]
FROM OrderDetails JOIN Inventory ON OrderDetails.ItemID = Inventory.ItemID

#4 

USE toYourTable;
SELECT MIN(Inventory.Price) AS [Minimum Product Amount],
MAX(Inventory.Price) AS [Maximum Product Amount],
AVG(Inventory.Price) AS [Average Product Amount]
FROM Inventory;


#5 

SELECT Zipcode.City, COUNT(Orders.ID) AS [Number of Orders]
FROM Customers JOIN Zipcode ON Zipcode.Zipcode=Customers.Zipcode
JOIN Orders ON Customers.ID = Orders.CustomerID
GROUP BY Zipcode.City
ORDER BY Zipcode.City;*/


