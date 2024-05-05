/* PL/SQL */

--PL/SQL variable declaration and print value using DBMS_OUTPUT.PUT_LINE and suppliers table

DECLARE 
  supplier_id Suppliers.Supplier_ID%TYPE;
  name Suppliers.Name%TYPE;
  contact_info Suppliers.Contact_Info%TYPE;
  address Suppliers.Address%TYPE;
BEGIN
  SELECT Supplier_ID, Name, Contact_Info, Address INTO supplier_id, name, contact_info, address 
  FROM Suppliers 
  WHERE Supplier_ID = 1;  

  DBMS_OUTPUT.PUT_LINE('Supplier_ID: ' || supplier_id || ' Name: ' || name || ' Contact_Info: ' || contact_info || ' Address: ' || address);
END;
/

--insert and set defalt value
/*Insert a new buyer into the Buyers table using PL/SQL  with the default ID 
5,name "Alice Wonderland", contact number "555-0500",and email "alice.wonderland@example.com".*/

SET SERVEROUTPUT ON;
DECLARE
    v_buyer_id Buyers.Buyer_ID%TYPE := 5;
    v_name Buyers.Name%TYPE := 'Alice Wonderland';
    v_contact_number Buyers.Contact_Number%TYPE := '555-0500';
    v_email Buyers.Email%TYPE := 'alice.wonderland@example.com';
BEGIN
    INSERT INTO Buyers (Buyer_ID, Name, Contact_Number, Email) VALUES (v_buyer_id, v_name, v_contact_number, v_email);
    DBMS_OUTPUT.PUT_LINE('New buyer inserted: ' || v_name);
END;
/

--Row Type

SET SERVEROUTPUT ON
DECLARE 
  supplier_row Suppliers%ROWTYPE;
BEGIN
  SELECT * INTO supplier_row
  FROM Suppliers 
  WHERE Supplier_ID = 2;

  DBMS_OUTPUT.PUT_LINE('Supplier_ID: ' || supplier_row.Supplier_ID || ', Name: ' || supplier_row.Name || ', Contact_Info: ' || supplier_row.Contact_Info || ', Address: ' || supplier_row.Address);
END;
/
--Cursor and Row Count

/*Use a PL/SQL block with a cursor to iterate through all 
records in the Suppliers table. For each supplier, output 
the supplier's ID, name, contact information, and address, 
along with the number of rows processed up to that point.*/

SET SERVEROUTPUT ON;
DECLARE
    cursor suppliers_cursor IS SELECT * FROM Suppliers;
    supplier_row Suppliers%ROWTYPE;
BEGIN
    OPEN suppliers_cursor;
    FETCH suppliers_cursor INTO supplier_row;
    WHILE suppliers_cursor%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE('Supplier_ID: ' || supplier_row.Supplier_ID || ' Name: ' || supplier_row.Name || ' Contact_Info: ' || supplier_row.Contact_Info || ' Address: ' || supplier_row.Address);
        DBMS_OUTPUT.PUT_LINE('Row count: ' || suppliers_cursor%ROWCOUNT);
        FETCH suppliers_cursor INTO supplier_row;
    END LOOP;
    CLOSE suppliers_cursor;
END;
/
--Array with extend function()
--printing supplies name with id 1 to 5 from supplies table
SET SERVEROUTPUT ON;
DECLARE 
  counter NUMBER;
  supply_name Supplies.Name%TYPE;
  TYPE NameArray IS VARRAY(5) OF Supplies.Name%TYPE;
  a_name NameArray := NameArray();
BEGIN
  counter := 1;
  FOR x IN 1..5 LOOP
    SELECT Name INTO supply_name FROM Supplies WHERE Supply_ID = x;
    a_name.EXTEND();
    a_name(counter) := supply_name;
    counter := counter + 1;
  END LOOP;
  
  counter := 1;
  WHILE counter <= a_name.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(a_name(counter));
    counter := counter + 1;
  END LOOP;
END;
/

--Array without extend function()
--printing supplies name with id 1 to 5 from supplies table
DECLARE 
  counter NUMBER := 1;
  supply_name Supplies.Name%TYPE;
  TYPE NameArray IS VARRAY(5) OF Supplies.Name%TYPE;
  a_name NameArray := NameArray('Syringe', 'Bandage', 'Mask', 'Gloves', 'Antiseptic'); 
  -- VARRAY with a fixed size of 5 elements and initialized with generic supply names
BEGIN
  counter := 1;
  FOR x IN 1..5 LOOP  
    SELECT Name INTO supply_name FROM Supplies WHERE Supply_ID = x;
    A_NAME(counter) := supply_name;  -- Updates the array element with the fetched name
    counter := counter + 1;
  END LOOP;
  counter := 1;
  WHILE counter <= A_NAME.COUNT LOOP
    DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
    counter := counter + 1;
  END LOOP;
END;


--IF/ELSEIF/ELSE

/*Write a PL/SQL block that checks a predefined list of supply IDs 
and categorizes the supplies into 'Protective Equipment', 'Disposable Gloves', 
or 'Other Supplies' based on their type.*/

SET SERVEROUTPUT ON;
DECLARE
   counter NUMBER := 1;
   supply_name Supplies.Name%TYPE;
   TYPE IDARRAY IS VARRAY(5) OF Supplies.Supply_ID%TYPE;
   
   A_ID IDARRAY := IDARRAY(1, 2, 3, 4, 5);
   
BEGIN
   counter := 1;
   FOR i IN 1..A_ID.COUNT LOOP
      SELECT Name INTO supply_name FROM Supplies WHERE Supply_ID = A_ID(i);
      IF supply_name LIKE '%Mask%' THEN
         DBMS_OUTPUT.PUT_LINE(supply_name || ' is Protective Equipment');
      ELSIF supply_name LIKE '%Gloves%' THEN
         DBMS_OUTPUT.PUT_LINE(supply_name || ' is Disposable Gloves');
      ELSE
         DBMS_OUTPUT.PUT_LINE(supply_name || ' is Other Supplies');
      END IF;
   END LOOP;
END;
/

--PROCEDURE

/* Write a PL/SQL procedure that accepts a supply ID 
as input and returns the name of the supply and the 
total quantity ordered for that supply. The procedure 
should also increment the input supply ID by 1 and 
output this new value along with the supply name and 
total quantity ordered. */

CREATE OR REPLACE PROCEDURE GetSupplyOrderDetails(
  var1 IN NUMBER,
  var2 OUT VARCHAR2,
  var3 IN OUT NUMBER
)
AS
  t_show CHAR(30);
  total_quantity_ordered NUMBER;
BEGIN
  t_show := 'From procedure: ';
  SELECT Name INTO var2 FROM Supplies WHERE Supply_ID = var1;
  SELECT SUM(Quantity_Ordered) INTO total_quantity_ordered FROM Orders WHERE Supply_ID = var1;
  var3 := var1 + 1; 
  DBMS_OUTPUT.PUT_LINE(t_show || 'Supply name: ' || var2 || ', Total quantity ordered: ' || total_quantity_ordered || ', Next supply ID: ' || var3);
END;
/ 
 
--Calling the Procedure

SET SERVEROUTPUT ON;
DECLARE 
  supply_id Supplies.Supply_ID%TYPE := 1;  
  supply_name Supplies.Name%TYPE;
  next_id NUMBER;
BEGIN
  GetSupplyOrderDetails(supply_id, supply_name, next_id);
END;
/

--FUNCTION

/*Create a PL/SQL function that takes a supplier ID as 
an input and returns the name of the supplier 
associated with that ID.*/

CREATE OR REPLACE FUNCTION GetSupplierName(var1 IN INT) RETURN VARCHAR2 AS
  supplier_name Suppliers.Name%TYPE;
BEGIN
  SELECT Name INTO supplier_name FROM Suppliers WHERE Supplier_ID = var1;
  RETURN supplier_name;
END;
/

--Calling the Function

SET SERVEROUTPUT ON;
DECLARE 
  value VARCHAR2(255);
BEGIN
  value := GetSupplierName(1); 
  DBMS_OUTPUT.PUT_LINE('Supplier Name: ' || value);
END;
/

--Drop Procedure and Function

DROP PROCEDURE GetSupplyOrderDetails;

DROP FUNCTION GetSupplierName;


--Trigger

/*Create a PL/SQL trigger that, before deleting an order
 from the Orders table, also deletes any usage records
 from the Usage table that are linked to the supply being
 ordered.*/

SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER BeforeOrderDelete
BEFORE DELETE ON Orders
REFERENCING OLD AS old
FOR EACH ROW
BEGIN
    DELETE FROM Usage
    WHERE Supply_ID = :old.Supply_ID;
    
    DBMS_OUTPUT.PUT_LINE('Deleted usage records for supply ID: ' || :old.Supply_ID);
END;
/
-- Assume we want to delete an order with Order_ID 101

DELETE FROM Orders WHERE Order_ID = 101;

/*will automatically update the stock quantity in the Supplies table whenever a new
 order is placed. It will reduce the Quantity_In_Stock of the ordered supply by the amount ordered.*/

SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER AfterOrderInsert
AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    UPDATE Supplies
    SET Quantity_In_Stock = Quantity_In_Stock - :new.Quantity_Ordered
    WHERE Supply_ID = :new.Supply_ID;

    DBMS_OUTPUT.PUT_LINE('Updated stock for supply ID: ' || :new.Supply_ID || '. Reduced stock by ' || :new.Quantity_Ordered);
END;
/
-- Insert a new order
INSERT INTO Orders (Order_ID, Supply_ID, Buyer_ID, Quantity_Ordered, Order_Date, Expected_Delivery_Date, Status)
VALUES (999, 1, 1, 100, SYSDATE, SYSDATE + 7, 'active');


--Drop Trigger
DROP TRIGGER BeforeOrderDelete;
DROP TRIGGER AfterOrderInsert;