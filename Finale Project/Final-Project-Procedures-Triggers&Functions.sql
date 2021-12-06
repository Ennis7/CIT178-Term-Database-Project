/*Final Project Procedures

USE toYourTable
GO --Begins a new batch

CREATE PROC spInventoryPrice
AS
BEGIN
SELECT Description, Price, InventoryQuantity
FROM Inventory
ORDER BY Price ASC 
END

EXECUTE spInventoryPrice;


--1 Parameter
USE toYourTable
GO 

CREATE PROC spInventoryQuantity(@MinQuantity AS INT)
AS
BEGIN
SELECT Description, Price, InventoryQuantity
FROM Inventory
WHERE InventoryQuantity>@MinQuantity
ORDER BY InventoryQuantity DESC
END

EXEC spInventoryQuantity 5



USE toYourTable
GO 

CREATE PROC spPriceInventory
	(
		@MinPrice AS INT
		,@MaxPrice AS INT
	)
AS
BEGIN
SELECT Description, Price, InventoryQuantity
FROM Inventory
WHERE Price >= @MinPrice AND
	Price <= @MaxPrice
ORDER BY Price DESC
END

EXEC spPriceInventory 2,40

--Output Parameter

USE toYourTable
GO
CREATE PROC spProductCount
	(
		@ProductItemID INT
		,@ProductCount INT OUTPUT
	)
AS
SELECT ItemID = COUNT(ItemID) 
FROM Inventory
WHERE ItemID = @ProductItemID
ORDER BY ItemID ASC

SET @ProductCount = @@ROWCOUNT
GO

DECLARE @NumProducts INT
EXEC spProductCount 8, @NumProducts OUTPUT
PRINT 'Total Number of Products';
PRINT @NumProducts;

SELECT * FROM Inventory


--Parameter with return value

USE toYourTable
GO 

CREATE PROC spInventoryQuantityWithReturn
	(
		@MinQuantity INT
	)
AS
BEGIN
	SELECT Description, Price, InventoryQuantity
	FROM Inventory
	WHERE InventoryQuantity>@MinQuantity
	ORDER BY InventoryQuantity DESC
	RETURN @@ROWCOUNT
END

DECLARE @Count INT
EXEC @Count = spInventoryQuantityWithReturn @MinQuantity = 30
SELECT @Count AS [Number of Quantity]


--FINAL PROJECT TRIGGERS
--Scalar Function
CREATE FUNCTION fnLongDate
	(
		@FullDate AS DATETIME
	)
RETURNS VARCHAR(MAX)
AS
BEGIN
	RETURN DATENAME (DW,@FullDate) + ' ' +
	DATENAME (D,@FullDate) + ' ' +
	DATENAME (M,@FullDate) + ' ' +
	DATENAME (YY,@FullDate)

END

SELECT 
	ID
	,OrderDate
	,[dbo].[fnLongDate](OrderDate)
FROM 
	Orders


--Table Function
USE toYourTable
GO

CREATE FUNCTION OrdersToDate
	(
	@FullDate INT
	)
RETURNS TABLE 
AS
RETURN
	SELECT 
		ID
		,OrderDate
	FROM 
		Orders
	WHERE 
		YEAR(OrderDate) = @FullDate

SELECT 
	ID
	,OrderDate
FROM 
	dbo.OrdersToDate(2021) 

--FINAL PROJECT TRIGGERS 

USE toyourtable
SELECT ID, FName, LName, Zipcode INTO TestCustomers
FROM Customers;

USE toYourTable
CREATE TABLE CustomerTC(
	CustomerId nchar(5),
	status varchar(30)
);

CREATE TRIGGER TestCustomers_INSERT ON TestCustomers
	AFTER INSERT
AS
BEGIN 
	SET NOCOUNT ON;
	DECLARE @CustomerID nchar(5)
	SELECT @CustomerID=INSERTED.ID
	FROM INSERTED

	INSERT INTO CustomerTC
	VALUES(@CustomerId, 'Inserted')
END

INSERT INTO TestCustomers(ID,FName,LName,Zipcode)
	VALUES('11','Sandy','Hope','49686');
INSERT INTO TestCustomers(ID,FName,LName,Zipcode)
	VALUES('10','Andy','Opal','49685');

SELECT * FROM TestCustomers;

CREATE TRIGGER TESTCUSTOMER_DELETE ON TestCustomers
	AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @CustomerID nchar(5)
	SELECT @CustomerID=DELETED.ID
	FROM DELETED

	INSERT INTO CustomerTC
	VALUES(@CustomerId, 'DELETED')
END

DELETE FROM TestCustomers WHERE ID='4';
DELETE FROM TestCustomers WHERE ID='5';

SELECT * FROM CustomerTC;

CREATE TRIGGER TestCustomers_UPDATE ON TestCustomers
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @CustomerID nchar(5)
	    DECLARE @Action varchar(50)
    SELECT @CustomerId = INSERTED.ID
    FROM INSERTED 

    IF UPDATE(ID)
        SET @Action = 'Updated ID'   

    IF UPDATE(FName)
        SET @Action = 'Updated FName'

    IF UPDATE(LName)
        SET @Action = 'Updated LName'   

	IF UPDATE(Zipcode)
        SET @Action = 'Updated Zipcode'   

    INSERT INTO CustomerTC
    VALUES(@CustomerId, @Action)
END



UPDATE TestCustomers SET ID='24' WHERE ID = '2';
UPDATE TestCustomers SET FName='Judy' WHERE FName = 'Sandy';
UPDATE TestCustomers SET LName='Robinson' WHERE LName = 'Hope';

SELECT * FROM TestCustomers
SELECT * FROM CustomerTC
*/
