create database sunshine_bar_and_grill21;
USE sunshine_bar_and_grill21;
CREATE TABLE Vendor (
  Vendor_ID INT PRIMARY KEY,
  Company_Name VARCHAR(100) NOT NULL,
  Contact_Person VARCHAR(50),
  Phone_Number VARCHAR(20),
  Email_Address VARCHAR(50) UNIQUE
);
CREATE TABLE Customers (
  Customer_ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Address VARCHAR(100),
  Phone_Number VARCHAR(20),
  Email_Address VARCHAR(50) UNIQUE 
);
CREATE TABLE Sale_Transactions (
  Transaction_ID INT PRIMARY KEY,
  Customer_ID INT,
  Vendor_ID INT,
  Date_Time DATETIME NOT NULL,
  Total_Amount DECIMAL(10, 2) NOT NULL CHECK (Total_Amount >= 0),
  FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
  FOREIGN KEY (Vendor_ID) REFERENCES Vendor(Vendor_ID)
);
CREATE TABLE Payments (
  Payment_ID INT PRIMARY KEY,
  Transaction_ID INT,
  Payment_Method VARCHAR(50) NOT NULL, 
  Status VARCHAR(20),
  FOREIGN KEY (Transaction_ID) REFERENCES Sale_Transactions(Transaction_ID)
);
CREATE TABLE Refunds_Returns (
  Refund_ID INT PRIMARY KEY,
  Transaction_ID INT,
  Items_Returned TEXT,
  Reason TEXT,
  Refund_Amount DECIMAL(10, 2) NOT NULL CHECK (Refund_Amount >= 0), 
  FOREIGN KEY (Transaction_ID) REFERENCES Sale_Transactions(Transaction_ID)
);
INSERT INTO Vendor (Vendor_ID, Company_Name, Contact_Person, Phone_Number, Email_Address)
VALUES
  (1, 'Acme Corporation', 'Alice Adams', '555-7890', 'aliceadams@acmecorp.com'),
  (2, 'Beta Company', 'Bob Baker', '555-2345', 'bobbaker@betacompany.com'),
  (3, 'Gamma Industries', 'Charlie Charles', '555-6789', 'charliecha@gammaind.com'),
  (4, 'Delta Enterprises', 'David Davis', '555-1234', 'daviddavis@deltaent.com');
INSERT INTO Customers (Customer_ID, Name, Address, Phone_Number, Email_Address)
VALUES
  (1, 'John Doe', '123 Main St', '555-1234', 'johndoe@example.com'),
  (2, 'Jane Smith', '456 Oak St', '555-5678', 'janesmith@example.com'),
  (3, 'Alice Johnson', '789 Elm St', '555-9012', 'alicejohnson@example.com'),
  (4, 'Bob Williams', '101 Pine St', '555-3456', 'bobwilliams@example.com');
INSERT INTO Sale_Transactions (Transaction_ID, Customer_ID, Vendor_ID, Date_Time, Total_Amount)
VALUES
  (1, 1, 1, '2024-10-01 12:00:00', 29.99),
  (2, 2, 2, '2024-10-02 13:00:00', 39.99),
  (3, 3, 3, '2024-10-03 14:00:00', 49.99),
  (4, 4, 4, '2024-10-04 15:00:00', 19.99);
  INSERT INTO Refunds_Returns (Refund_ID, Transaction_ID, Items_Returned, Reason, Refund_Amount)
VALUES
    (1, 1, 'Filet Mignon', 'Overcooked', 49.99),
    (2, 2, 'Lobster Bisque', 'Cold', 24.99),
    (3, 3, 'Truffle Mac and Cheese', 'Wrong cheese', 19.99),
    (4, 4, 'Chocolate Lava Cake', 'Undercooked', 14.99);
    INSERT INTO Payments (Payment_ID, Transaction_ID, Payment_Method, Status)
VALUES
    (1, 1, 'Credit Card', 'Completed'),
    (2, 2, 'Cash', 'Completed'),
    (3, 3, 'Debit Card', 'Completed'),
    (4, 4, 'Mobile Payment', 'Completed');