--Add a Column to the Suppliers Table

ALTER TABLE Suppliers ADD Country VARCHAR(100);

-- Rename a Column in the Suppliers Table

ALTER TABLE Suppliers RENAME COLUMN Contact_Info TO Contact_Number;

--Modify a Column Definition in the Suppliers Table

ALTER TABLE Suppliers MODIFY Name VARCHAR(300);

-- Drop a Column from the Suppliers Table

ALTER TABLE Suppliers DROP COLUMN Country;


