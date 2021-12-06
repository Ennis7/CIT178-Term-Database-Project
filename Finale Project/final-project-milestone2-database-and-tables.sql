CREATE DATABASE toYourTable;

GO 
USE toYourTable;
CREATE TABLE Inventory(
	ItemID int NOT NULL,
	Description varchar(200) NOT NULL,
	Weight varchar(2) NOT NULL,
	Price money,
	InventoryQuantity int NOT NULL,
	PRIMARY KEY (ItemID)
);
GO
CREATE TABLE Customers(
	ID int NOT NULL,
	FName varchar(20) NOT NULL,
	LName varchar(30) NOT NULL,
	RoadAddress varchar(30) NOT NULL,
	Zipcode varchar(10) NOT NULL,
	CustomerType varchar(20) NOT NULL,
	PRIMARY KEY (ID)
);
GO 
CREATE TABLE Locations(
	ID int NOT NULL,
	Name varchar(20) NOT NULL,
	PRIMARY KEY (ID)
);
GO
CREATE TABLE Orders(
	ID int NOT NULL,
	OrderDate datetime,
	LocationID int NOT NULL,
	CustomerID int NOT NULL,
	PRIMARY KEY (ID)
);
GO
CREATE TABLE Zipcode(
	Zipcode varchar(10) NOT NULL,
	City varchar(30) NOT NULL,
	State varchar(2) NOT NULL,
	PRIMARY KEY (Zipcode)
);
CREATE TABLE OrderDetails(
	ID int NOT NULL,
	OrderID int NOT NULL,
	ItemID int NOT NULL,
	PRIMARY KEY (ID)
);