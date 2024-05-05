/* Aggregate Functions */

--output the total count of rows in the Orders table and label the output column as "Number_of_Orders"

SELECT COUNT(*) AS Number_of_Orders FROM Orders;

--output the avg,min,max,sum quantity used from usage table

SELECT AVG(Quantity_Used) from Usage;
SELECT MAX(Quantity_Used) from Usage;
SELECT SUM(Quantity_Used) from Usage;
SELECT MIN(Quantity_Used) from Usage;

/* Group by and Having */

--Select Manufacturer and average quantity in stock group by Manufacturer from Supplies table

SELECT Manufacturer,AVG(quantity_in_stock) from Supplies group by Manufacturer;

--Select Manufacturer and average cost group by Manufacturer having average cost greater than 1

SELECT Manufacturer,AVG(cost) from Supplies group by Manufacturer having AVG(Cost)>1;

/*Nested SubQuery*/

--Select all columns from Supplies table where Manufacturer is 'HealthGear' and Supply_ID is present in Orders table with status 'active'

SELECT * FROM Supplies WHERE Manufacturer = 'HealthGear' AND Supply_ID IN (SELECT Supply_ID FROM Orders WHERE Status = 'active');

--Select the names of buyers who have purchased supplies from a supplier named "MedEquip Inc." 

SELECT Name FROM Buyers WHERE Buyer_ID IN (SELECT Buyer_ID FROM Orders WHERE Supply_ID IN ( SELECT Supply_ID FROM Supplies WHERE Supplier_ID = (SELECT Supplier_ID FROM Suppliers WHERE Name = 'MedEquip Inc.') ) );

--select the names of supplies that have been purchased by 'John Doe'

SELECT Name FROM Supplies WHERE Supply_ID IN (SELECT Supply_ID FROM Orders WHERE Buyer_ID = (SELECT Buyer_ID FROM Buyers WHERE Name = 'John Doe'));

--select specific details of all orders related to a supply named "N95 Respirator Mask".

SELECT Orders.Quantity_Ordered, Orders.Order_Date, Orders.Expected_Delivery_Date, Orders.Status FROM Orders WHERE Supply_ID IN (SELECT Supply_ID FROM Supplies WHERE Name = 'N95 Respirator Mask');

--retrieve the quantities of the "N95 Respirator Mask" that have been used, as recorded in the Usage table of my database

SELECT Usage.Quantity_Used FROM Usage WHERE Supply_ID IN (SELECT Supply_ID FROM Supplies WHERE Name = 'N95 Respirator Mask');

/* Some/All/Exists */

-- Select all suppliers who offer supplies at a cost that is greater than some costs of supplies manufactured by 'HealthGear'.

SELECT * FROM Suppliers
WHERE Supplier_ID IN (
    SELECT Supplier_ID FROM Supplies
    WHERE Cost > SOME (SELECT Cost FROM Supplies WHERE Manufacturer = 'HealthGear')
);

--Select all orders that have a quantity ordered greater than all quantities ordered for supplies from 'SafeHands'.

SELECT * FROM Orders
WHERE Quantity_Ordered > ALL (
    SELECT Quantity_Ordered FROM Orders
    WHERE Supply_ID IN (SELECT Supply_ID FROM Supplies WHERE Manufacturer = 'SafeHands')
);

--Select all supplies where the supplier is based in 'MedCity, MA' and there exists an order with the status 'active' for those supplies.

SELECT * FROM Supplies
WHERE Supplier_ID IN (
    SELECT Supplier_ID FROM Suppliers WHERE Address LIKE '%MedCity, MA%'
) AND EXISTS (
    SELECT * FROM Orders WHERE Supply_ID = Supplies.Supply_ID AND Status = 'active'
);


