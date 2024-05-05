-- Creating the Suppliers table
CREATE TABLE Suppliers (
    Supplier_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Contact_Info VARCHAR(255),
    Address VARCHAR(255)
);

-- Creating the Supplies table
CREATE TABLE Supplies (
    Supply_ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Type VARCHAR(100),
    Manufacturer VARCHAR(255),
    Supplier_ID INT,
    Cost DECIMAL(10,2),
    Quantity_In_Stock INT,
    FOREIGN KEY (Supplier_ID) REFERENCES Suppliers(Supplier_ID)
);

-- Creating the Buyers table
CREATE TABLE Buyers (
    Buyer_ID INT PRIMARY KEY,
    Name VARCHAR(255), 
    Contact_Number VARCHAR(15),
    Email VARCHAR(100)
    
);

-- Creating the Orders table
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Supply_ID INT,
    Buyer_ID INT,
    Quantity_Ordered INT,
    Order_Date DATE,
    Expected_Delivery_Date DATE,
    Status VARCHAR(20) CHECK (Status IN ('active', 'inactive', 'pending')),
    FOREIGN KEY (Supply_ID) REFERENCES Supplies(Supply_ID),
    FOREIGN KEY (Buyer_ID) REFERENCES Buyers(Buyer_ID)
);

-- Creating the Usage table
CREATE TABLE Usage (
    Usage_ID INT PRIMARY KEY,
    Supply_ID INT,
    Quantity_Used INT,
    Usage_Date DATE,
    Used_By INT,
    FOREIGN KEY (Supply_ID) REFERENCES Supplies(Supply_ID),
    FOREIGN KEY (Used_By) REFERENCES Buyers(Buyer_ID)
);


