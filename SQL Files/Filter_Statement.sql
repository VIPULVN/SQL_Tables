--This implements the problem statements for the Filter and Group by clause
--09-feb-2026
--1- write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909
Update Orders set city = Null 
where order_id in ('CA-2020-161389' , 'US-2021-156909')

--2- write a query to find orders where city is null (2 rows)
Select * From Orders where city is null

--3- write a query to get total profit, first order date and latest order date for each category
Select sum(profit) as Total_Profit, min(order_date) as First_Order_date, max(Order_Date) as Latest_Order_date from Orders
group by Category

--4- write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category
--This is not working, no output received.
select sub_category
from orders
group by sub_category
having avg(profit) > max(profit)/2


--5- create the exams table with below script;
--create table exams (student_id int, subject varchar(20), marks int);

--insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
--,(2,'Chemistry',80),(2,'Physics',90)
--,(3,'Chemistry',80),(3,'Maths',80)
--,(4,'Chemistry',71),(4,'Physics',54)
--,(5,'Chemistry',79);

--write a query to find students who have got same marks in Physics and Chemistry.
Select student_id,marks from exams
where subject in ('Physics', 'Chemistry')
group by student_id,marks
having count(*) =2
--In the above statemt COUNT(1) is just a way of counting rows in SQL. We can write anything instead of 1 such as 5 or * also.


--6- write a query to find total number of products in each category.
Select category, count(Product_ID) as total_product From Orders
group by Category

--7- write a query to find top 5 sub categories in west region by total quantity sold
Select top(5) Sub_Category, sum(quantity) as total_quantity from Orders
where Region = 'West'
group by Sub_Category
order by total_quantity desc

--8- write a query to find total sales for each region and ship mode combination for orders in year 2020
Select region, ship_mode, sum(sales) as total_sales from Orders
where Order_Date between '2020-01-01' and '2020-12-31'
group by region, Ship_Mode