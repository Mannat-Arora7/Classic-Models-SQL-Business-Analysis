-- Intermediate SQL Queries

use classicmodels;

-- 1) WAQ to show the total number of customers in each country
select count(customerName) as "Total_Customers" from customers;

-- 2) WAQ to list the top 10 customers by total payments
select customerName, sum(amount) as Total_Payment from customers inner join payments on customers.customerNumber = payments.customerNumber 
group by customers.customerName 
order by Total_Payment desc limit 10;

-- 3) WAQ to find the total payment receive from each country
select country, sum(amount) as "Total_Payment" from customers inner join payments on customers.customerNumber = payments.customerNumber 
group by customers.country; 

-- 4) WAQ to calculate the monthly revenue
select year(orderDate) as Year, month(orderDate) as Month, sum(quantityOrdered * priceEach) as Monthly_Revenue from orders inner join orderdetails
on orders.orderNumber = orderdetails.orderNumber group by year(orderDate), month(orderDate)
order by year(orderDate), month(orderDate);

-- 5) WAQ to calculate the Yearly Revenue
select year(orderDate) as Year, sum(quantityOrdered * priceEach) as Yearly_Revenue from orders inner join orderdetails
on orders.orderNumber = orderdetails.orderNumber 
group by year(orderDate) 
order by year(orderDate);

-- 6) WAQ to Find the top 10 best-selling products
select productName, sum(quantityOrdered) as Best_Selling_Products from products inner join orderdetails
on products.productCode = orderdetails.productCode group by products.productName
order by Best_Selling_Products desc limit 10;

-- 7) WAQ to find the least-selling products
select productName, sum(quantityOrdered) as Least_Selling_Products from products inner join orderdetails
on products.productCode = orderdetails.productCode group by products.productName
order by Least_Selling_Products asc limit 10;

-- 8) WAQ to calculate total revenue for each product line
select productlines.productLine, sum(quantityOrdered * priceEach) as Total_Revenue from productlines inner join products
on productlines.productLine = products.productLine inner join orderdetails 
on products.productCode = orderdetails.productCode group by productlines.productLine
order by Total_Revenue desc;

-- 9) WAQ to find the average order value
select avg(order_value) as Average_Order_Value from 
(select orderNumber, sum(quantityOrdered * priceEach) as order_value 
from orderdetails group by orderNumber) as orders;

-- 10) WAQ to show the number of orders handled by each sales representative
select employees.firstname, employees.lastname, count(orders.orderNumber) as Total_Orders from employees inner join customers
on employees.employeeNumber = customers.salesRepEmployeeNumber inner join orders
on customers.customerNumber = orders.customerNumber
group by employees.firstName, employees.lastName
order by Total_Orders desc;

-- 11) WAQ to find customers who have never placed an order
select customers.customerName, orders.orderNumber from customers left join orders 
on customers.customerNumber = orders.customerNumber
where orders.orderNumber is null;

-- 12) WAQ to find products that have never been ordered
select products.productName, orderdetails.orderNumber from products left join orderdetails
on products.productCode = orderdetails.productCode
where orderdetails.orderNumber is null;

-- 13) WAQ to find customers whose payments are above the average payment
select customers.customerName, payments.amount from customers inner join payments
on customers.customerNumber = payments.customerNumber where payments.amount > (select avg(amount) from payments)
order by payments.amount desc;

-- 14) WAQ to display the top 5 offices based on total sales
select offices.city, sum(orderdetails.quantityOrdered * orderdetails.priceEach) as Total_Revenue from offices inner join employees 
on offices.officeCode = employees.officeCode inner join customers
on employees.employeeNumber = customers.salesRepEmployeeNumber inner join orders
on customers.customerNumber = orders.customerNumber inner join orderdetails
on orders.orderNumber = orderdetails.orderNumber
group by offices.city
order by Total_Revenue desc limit 5;

-- 15) WAQ to find the total quantity sold for each product
select products.productName, sum(orderdetails.quantityOrdered) as Quantity_Sold from products inner join orderdetails
on products.productCode = orderdetails.productCode
group by products.productName
order by Quantity_Sold desc;





























