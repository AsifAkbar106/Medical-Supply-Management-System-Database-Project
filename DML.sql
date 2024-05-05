--Update Data in the Suppliers Table

UPDATE Suppliers SET Contact_Number = '123-456-7891' WHERE Supplier_ID = 1;

--Delete a Row from the Suppliers Table

DELETE FROM Suppliers WHERE Supplier_ID = 4;

--Displaying table data using SELECT command

select * from orders where status='pending';

--Select the names of buyers who have purchased supplies from a supplier named "MedEquip Inc." 

SELECT Name FROM Buyers WHERE Buyer_ID IN (SELECT Buyer_ID FROM       Orders WHERE Supply_ID IN ( SELECT Supply_ID FROM Supplies WHERE Supplier_ID = (SELECT Supplier_ID FROM Suppliers WHERE Name = 'MedEquip Inc.') ) );

--supplies that either start with 'S' or include the substring "mask" anywhere in their names with union

SELECT Name FROM Supplies WHERE Name LIKE 'S%' UNION SELECT Name FROM Supplies WHERE Name LIKE '%mask%';

--supplies that either start with 'S' and whose manufacturer includes the substring 'Safe' using intersect

SELECT Name FROM Supplies WHERE Name LIKE 'S%' INTERSECT SELECT Name FROM Supplies WHERE Manufacturer LIKE '%Safe%';

--Calculate the maximum quantity In Stock in the supplies table using WITH clause

WITH Max_Quantity(qty) AS (
    SELECT MAX(Quantity_In_Stock) FROM Supplies
)
SELECT *
FROM Supplies, Max_Quantity
WHERE Supplies.Quantity_In_Stock = Max_Quantity.qty;

