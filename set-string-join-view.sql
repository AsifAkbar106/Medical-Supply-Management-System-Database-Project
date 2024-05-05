/* Join Operations */

--Retrieve all details of supplies along with their supplier information.using inner join

SELECT Suppliers.Name AS Supplier_Name, Supplies.Name AS Supply_Name FROM Supplies
JOIN Suppliers ON Supplies.Supplier_ID = Suppliers.Supplier_ID;

--List all buyers and any orders they may have placed, including those who have not placed any orders.using left outer join

SELECT Buyers.Name AS Buyer_Name, Orders.Order_ID FROM Buyers
LEFT OUTER JOIN Orders ON Buyers.Buyer_ID = Orders.Buyer_ID;

--Natural Join

SELECT * FROM Orders JOIN Buyers USING (Buyer_ID);

--Right outer join to retrieve all buyers and their orders, including those who have not placed any orders.

SELECT Buyers.Name, Buyers.Contact_Number, Buyers.Email, Orders.Supply_ID, Orders.Quantity_Ordered, Orders.Order_Date
FROM Orders RIGHT OUTER JOIN Buyers ON Orders.Buyer_ID = Buyers.Buyer_ID;

/* Views */

--create a view that will summarize key information about suppliers, including their ID, name, and contact

CREATE VIEW Supplier_Details AS 
SELECT Supplier_ID, Name, Contact_Info, Address FROM Suppliers;

Select * from Supplier_Details;

--create a view that will summarize key information about buyers, including their ID, name, and contact

CREATE VIEW Buyer_Details AS SELECT Buyer_ID, Name, Contact_Number, Email FROM Buyers;

SELECT * FROM Buyer_Details;

--Create a view using another view

CREATE VIEW Supply_Details AS SELECT * FROM Supplies;

CREATE VIEW Filtered_Supply_Details AS SELECT Name, Type, Manufacturer, Cost, Quantity_In_Stock
FROM Supply_Details WHERE Quantity_In_Stock > 5000;



/* String Operations */

SELECT * FROM Buyers WHERE Name LIKE 'J%';

SELECT * FROM Supplies WHERE Name LIKE 'S%G%';

/*Set Membership(AND/OR/NOT)*/

--AND

SELECT * FROM Supplies WHERE Type = 'Protective Equipment'
AND Supplier_ID IN ( SELECT Supplier_ID FROM Suppliers WHERE Address LIKE '%MedCity%');

--OR

SELECT * FROM Supplies WHERE Type = 'Protective Equipment'
OR Supplier_ID IN ( SELECT Supplier_ID FROM Suppliers WHERE Address LIKE '%MedCity%');

--NOT

SELECT * FROM Supplies WHERE NOT ( Manufacturer = 'HealthGear' OR Quantity_In_Stock > 10000 );


