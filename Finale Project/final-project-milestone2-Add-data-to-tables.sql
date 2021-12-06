/*USE toYourTable
GO
INSERT INTO Zipcode VALUES ('14607', 'Rochester', 'NY')
INSERT INTO Zipcode VALUES ('49690', 'Williamsburg', 'MI')
INSERT INTO Zipcode VALUES ('49696', 'Traverse City', 'MI')
INSERT INTO Zipcode VALUES ('33612', 'Tampa', 'FL')
INSERT INTO Zipcode VALUES ('98201', 'Everett', 'WA')

INSERT INTO Inventory VALUES (1, 'Apples', '3', 7, 50)
INSERT INTO Inventory VALUES (2, 'Strawberries','1', 4, 20)
INSERT INTO Inventory VALUES (3, 'Blueberries','1', 5, 22)
INSERT INTO Inventory VALUES (4, 'Cucumbers','3', 2, 30)
INSERT INTO Inventory VALUES (5, 'Tomatoes','3', 3, 13)
INSERT INTO Inventory VALUES (6, 'Pumpkins', '1', 3, 40)
INSERT INTO Inventory VALUES (7, 'Honey', '1', 10, 40)
INSERT INTO Inventory VALUES (8, 'Eggs', '1', 3, 12)



INSERT INTO Locations VALUES (1, 'Farmers Market')
INSERT INTO Locations VALUES (2, 'School')
INSERT INTO Locations VALUES (3, 'Co-op')
INSERT INTO Locations VALUES (4, 'Farm')
INSERT INTO Locations VALUES (5, 'Online')



INSERT INTO Customers VALUES (1, 'Betty', 'Boo', '4141 Archer Ln', '14607', 'Online Store')
INSERT INTO Customers VALUES (2, 'Bartholomew', 'Elementary', '123 Development St.', '49696', 'Membership')
INSERT INTO Customers VALUES (3, 'MidWest Canned Apps', 'Co-op', '675 ABC Dr.', '49690', 'Store')
INSERT INTO Customers VALUES (4, 'Ginny', 'Geitz', '4882 Inception Pl. #14', '33612', 'Membership')
INSERT INTO Customers VALUES (5, 'Angelo', 'Levardson', '837 W. Gran Vandt Ave.', '98201', 'Online Store')

INSERT INTO Orders VALUES (1, '10/10/2021', 2, 2)
INSERT INTO Orders VALUES (2, '10/11/2021', 3, 3)
INSERT INTO Orders VALUES (3, '10/12/2021', 5, 4)
INSERT INTO Orders VALUES (4, '10/13/2021', 5, 1)
INSERT INTO Orders VALUES (5, '10/14/2021', 2, 2)


ALTER TABLE OrderDetails
ADD OrderQty varchar(3);

INSERT INTO OrderDetails VALUES (1, 3, 5, 3)
INSERT INTO OrderDetails VALUES (2, 2, 8, 4)
INSERT INTO OrderDetails VALUES (3, 1, 3, 5)
INSERT INTO OrderDetails VALUES (4, 4, 1, 6)
INSERT INTO OrderDetails VALUES (5, 5, 4, 15)
INSERT INTO OrderDetails VALUES (6, 2, 7, 7)
INSERT INTO OrderDetails VALUES (7, 4, 2, 9)
INSERT INTO OrderDetails VALUES (8, 1, 6, 13)

SELECT * FROM OrderDetails*/
