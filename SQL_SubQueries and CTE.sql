--21-January
-- SubQuery Execution
Select avg(ORDER_SALES) as avg_sales from
(SELECT order_id, SUM(SALES) AS ORDER_SALES
FROM Orders
GROUP BY Order_ID) as intermediate_table


-- Find all the orders where the total sales is greater than avergae order value
Select order_id from Orders group by Order_ID having sum(sales) > (Select avg(ORDER_SALES) as avg_sales from
(SELECT order_id, SUM(SALES) AS ORDER_SALES
FROM Orders
GROUP BY Order_ID) as intermediate_table)

SELECT * From Employee
where dept_id not in (Select dep_id from dept)


-- Merge 2 tables
select e.*,d.* from employee e
inner join 
(Select dept_id, avg(Salary) as avg_dep_sal from employee
group by dept_id) d
on e.dept_id=d.dept_id
