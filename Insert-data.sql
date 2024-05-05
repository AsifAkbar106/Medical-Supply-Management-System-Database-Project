--Inserting Data
--Inserting into Suppliers table
INSERT INTO Suppliers (Supplier_ID, Name, Contact_Info, Address) VALUES
(1, 'MedEquip Inc.', '987-654-3210', '1234 Medical Blvd, MedCity, MA');
INSERT INTO Suppliers (Supplier_ID, Name, Contact_Info, Address) VALUES
(2, 'PharmaSource Ltd.', '123-456-7890', '5678 Pharma St, HealthTown, TX');
INSERT INTO Suppliers (Supplier_ID, Name, Contact_Info, Address) VALUES
(3, 'Surgical Supplies Co.', '234-567-8901', '9012 Surgery Ave, CareCity, FL');
INSERT INTO Suppliers (Supplier_ID, Name, Contact_Info, Address) VALUES
(4, 'Hospital Essentials Inc.', '345-678-9012', '3456 Hospital Way, WellTown, CA');

--Inserting into Supplies table
INSERT INTO Supplies (Supply_ID, Name, Type, Manufacturer, Supplier_ID, Cost, Quantity_In_Stock) VALUES
(1, 'N95 Respirator Mask', 'Protective Equipment', 'HealthGear', 1, 1.50, 10000);
INSERT INTO Supplies (Supply_ID, Name, Type, Manufacturer, Supplier_ID, Cost, Quantity_In_Stock) VALUES
(2, 'Surgical Gloves', 'Disposable Gloves', 'SafeHands', 2, 0.10, 20000);
INSERT INTO Supplies (Supply_ID, Name, Type, Manufacturer, Supplier_ID, Cost, Quantity_In_Stock) VALUES
(3, 'Antiseptic Solution', 'Cleaner', 'CleanSafe', 3, 3.00, 5000);
INSERT INTO Supplies (Supply_ID, Name, Type, Manufacturer, Supplier_ID, Cost, Quantity_In_Stock) VALUES
(4, 'Syringes 5ml', 'Injection Tool', 'InjectSafe', 4, 0.20, 15000);
INSERT INTO Supplies (Supply_ID, Name, Type, Manufacturer, Supplier_ID, Cost, Quantity_In_Stock) VALUES
(5, 'Sterile Gauze', 'Dressing', 'HealthGear', 1, 0.50, 8000);
INSERT INTO Supplies (Supply_ID, Name, Type, Manufacturer, Supplier_ID, Cost, Quantity_In_Stock) VALUES
(6, 'IV Fluids 500ml', 'Fluids', 'SafeHands', 2, 2.50, 6000);

--Inserting into Buyers table
INSERT INTO Buyers (Buyer_ID, Name, Contact_Number, Email) VALUES
(1, 'John Doe', '555-0100', 'john.doe@example.com');
INSERT INTO Buyers (Buyer_ID, Name, Contact_Number, Email) VALUES
(2, 'Jane Smith', '555-0200', 'jane.smith@example.com');
INSERT INTO Buyers (Buyer_ID, Name, Contact_Number, Email) VALUES
(3, 'Jim Beam', '555-0300', 'jim.beam@example.com');
INSERT INTO Buyers (Buyer_ID, Name, Contact_Number, Email) VALUES
(4, 'Julia Roberts', '555-0400', 'julia.roberts@example.com');

--Inserting into Orders table
INSERT INTO Orders (Order_ID, Supply_ID, Buyer_ID, Quantity_Ordered, Order_Date, Expected_Delivery_Date, Status) VALUES
(101, 1, 1, 100, TO_DATE('01/11/2023', 'DD/MM/YYYY'), TO_DATE('06/11/2023', 'DD/MM/YYYY'), 'active');
INSERT INTO Orders (Order_ID, Supply_ID, Buyer_ID, Quantity_Ordered, Order_Date, Expected_Delivery_Date, Status) VALUES
(102, 2, 2, 150, TO_DATE('02/11/2023', 'DD/MM/YYYY'), TO_DATE('07/11/2023', 'DD/MM/YYYY'), 'pending');
INSERT INTO Orders (Order_ID, Supply_ID, Buyer_ID, Quantity_Ordered, Order_Date, Expected_Delivery_Date, Status) VALUES
(103, 3, 3, 200, TO_DATE('03/11/2023', 'DD/MM/YYYY'), TO_DATE('08/11/2023', 'DD/MM/YYYY'), 'active');
INSERT INTO Orders (Order_ID, Supply_ID, Buyer_ID, Quantity_Ordered, Order_Date, Expected_Delivery_Date, Status) VALUES
(104, 4, 4, 250, TO_DATE('04/11/2023', 'DD/MM/YYYY'), TO_DATE('09/11/2023', 'DD/MM/YYYY'), 'inactive');
INSERT INTO Orders (Order_ID, Supply_ID, Buyer_ID, Quantity_Ordered, Order_Date, Expected_Delivery_Date, Status) VALUES
(105, 5, 1, 300, TO_DATE('05/11/2023', 'DD/MM/YYYY'), TO_DATE('10/11/2023', 'DD/MM/YYYY'), 'active');
INSERT INTO Orders (Order_ID, Supply_ID, Buyer_ID, Quantity_Ordered, Order_Date, Expected_Delivery_Date, Status) VALUES
(106, 6, 2, 350, TO_DATE('06/11/2023', 'DD/MM/YYYY'), TO_DATE('11/11/2023', 'DD/MM/YYYY'), 'pending');
INSERT INTO Orders (Order_ID, Supply_ID, Buyer_ID, Quantity_Ordered, Order_Date, Expected_Delivery_Date, Status) VALUES
(107, 1, 3, 400, TO_DATE('07/11/2023', 'DD/MM/YYYY'), TO_DATE('12/11/2023', 'DD/MM/YYYY'), 'active');


--Inserting into Usage table
INSERT INTO Usage (Usage_ID, Supply_ID, Quantity_Used, Usage_Date, Used_By) VALUES
(1, 1, 50, TO_DATE('15/10/2023', 'DD/MM/YYYY'), 1);
INSERT INTO Usage (Usage_ID, Supply_ID, Quantity_Used, Usage_Date, Used_By) VALUES
(2, 2, 60, TO_DATE('16/10/2023', 'DD/MM/YYYY'), 2);
INSERT INTO Usage (Usage_ID, Supply_ID, Quantity_Used, Usage_Date, Used_By) VALUES
(3, 3, 70, TO_DATE('17/10/2023', 'DD/MM/YYYY'), 3);
INSERT INTO Usage (Usage_ID, Supply_ID, Quantity_Used, Usage_Date, Used_By) VALUES
(4, 4, 80, TO_DATE('18/10/2023', 'DD/MM/YYYY'), 4);

