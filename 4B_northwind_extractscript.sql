 What is the name of the table that holds the items Northwind sells?
 Products 
 What is the name of the table that holds the types (categories) of the items Northwind sells?
 Categories
 What are the first and last names of all the Northwind employees?
Davolio	Nancy
Fuller	Andrew
Leverling	Janet
Peacock	Margaret
Buchanan	Steven
Suyama	Michael
King	Robert
Callahan	Laura
Dodsworth	Anne
use northwind;
SELECT * FROM northwind.products; 
How many records does your query return? How can you change this? 
The qurery retuned 77 records, to change this I would need to specfiy which records I want to see within the select statement
SELECT * FROM northwind.categories
What is the category id of seafood?
8 is the category id of seafood
USE northwind;
SELECT OrderID, OrderDate, ShipName, ShipCountry
FROM Orders
LIMIT 50;

