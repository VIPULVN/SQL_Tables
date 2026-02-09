-- Solving Assignment for Day 3, Day 4, Day 5
--1- write a sql to get all the orders where customers name has "a" as second character and "d" as fourth character (58 rows)
Select * FROM Orders
Where Customer_Name LIKE '_a_d%'

--2- write a sql to get all the orders placed in the month of dec 2020 (352 rows) 
