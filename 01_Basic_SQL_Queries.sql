use classicmodels;

-- Basic SQL Queries

-- 1) WAQ to Display all Customers
select customerName from customers; 

-- 2) WAQ to display all products
select productName from products;

-- 3) WAQ to find all customers from the USA
select customerName, country from customers where country ="USA";

-- 4) WAQ to find all customers from USA, Germany, France
Select customerName, country from customers where country in ("USA", "Germany", "France");

-- 5) WAQ to list all employees with their job title
select firstName, jobTitle from employees;

-- 6) WAQ to Count the total number of customers
select count(customerName) as "Total_Customers" from customers;

-- 7) WAQ to count the total number of orders
select count(orderNumber) as "Total_Order" from orders;

-- 8) WAQ to find the average product price
select avg(buyPrice) as "Avg_Price" from products;

-- 9) WAQ to find the highest price product
select max(buyPrice) as "Highest_Price" from products;

-- 10) WAQ to find the lowest price product
select min(buyPrice) as "Lowest_Price" from products;



































