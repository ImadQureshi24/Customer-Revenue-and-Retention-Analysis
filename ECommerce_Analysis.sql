CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    signup_date DATE
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    category VARCHAR(50)
);

INSERT INTO customers (customer_id, name, signup_date) VALUES
(101, 'Fatima', '2023-10-01'),
(102, 'Bilal', '2023-11-15'),
(103, 'Amina', '2024-01-05'),
(104, 'Zara', '2024-02-01'),
(105, 'Tariq', '2024-02-20');

INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(1, 101, '2024-01-15', 200),
(2, 102, '2024-01-20', 150),
(3, 101, '2024-02-10', 300),
(4, 103, '2024-03-05', 400),
(5, 102, '2024-04-01', 250),
(6, 104, '2024-03-15', 350),
(7, 104, '2024-03-28', 100),
(8, 105, '2024-04-10', 150),
(9, 101, '2024-04-20', 180);

INSERT INTO products (product_id, name, price, category) VALUES
(1, 'Hoodie', 50, 'Apparel'),
(2, 'Water Bottle', 30, 'Accessories'),
(3, 'Running Shoes', 120, 'Footwear');

-- STEP 1: Monthly Revenue Trend
-- Total revenue per month
SELECT 
  TO_CHAR(order_date, 'YYYY-MM') AS month,
  SUM(total_amount) AS total_revenue
FROM orders
GROUP BY month
ORDER BY month;

-- STEP 2: Average Order Value by Month
SELECT 
  TO_CHAR(order_date, 'YYYY-MM') AS month,
  ROUND(AVG(total_amount), 2) AS avg_order_value
FROM orders
GROUP BY month
ORDER BY month;

-- STEP 3: Top 5 Customers by Spend
SELECT 
  c.name,
  SUM(o.total_amount) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;

-- STEP 4: Orders Per Customer
SELECT 
  c.name,
  COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_orders DESC;

-- STEP 5: % of Customers Who Are Repeat Buyers
WITH order_counts AS (
  SELECT customer_id, COUNT(*) AS num_orders
  FROM orders
  GROUP BY customer_id
)
SELECT 
  ROUND(
    100.0 * COUNT(CASE WHEN num_orders > 1 THEN 1 END) / COUNT(*), 
    2
  ) AS repeat_customer_percentage
FROM order_counts;

-- STEP 6: Customers Who Ordered Within 30 Days of Signup
SELECT 
  c.name,
  MIN(o.order_date) AS first_order,
  c.signup_date,
  (MIN(o.order_date) - c.signup_date) AS days_to_first_order
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name, c.signup_date
HAVING (MIN(o.order_date) - c.signup_date) <= 30;

-- STEP 7: Average Time Between 1st and 2nd Order
WITH ranked_orders AS (
  SELECT 
    customer_id,
    order_date,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn
  FROM orders
)
SELECT 
  ROUND(AVG(second_order - first_order), 1) AS avg_days_between_orders
FROM (
  SELECT 
    a.customer_id,
    a.order_date AS first_order,
    b.order_date AS second_order
  FROM ranked_orders a
  JOIN ranked_orders b 
    ON a.customer_id = b.customer_id AND a.rn = 1 AND b.rn = 2
) diff;
SELECT * fro


USE ecommerce_analytics;
SELECT * FROM customers;
SELECT customer_id, total_amount from orders where total_amount > 200;
SELECT * from customers;
SELECT customer_Id, order_id from orders;
SELECT * FROM customers;
SELECT name from products;
SELECT name, product_id from products;
SELECT order_id from orders;
SELECT customer_id, order_id from orders;
SELECT customer_id from customers;
SELECT * from orders;
SELECT distinct c.name from customers c join orders o where c.customer_id = o.customer_id;
SELECT * FROM orders;
SELECT SUM(price), name FROM products GROUP BY name;
SELECT total_amount, customer_id from orders;
select SUM(total_amount) from orders;
SELECt AVG(total_amount), customer_id FROM orders group by customer_id;
SELECT c.name, c.customer_ID, o.order_id, o.order_date from customers c JOIN orders o ON c.customer_id = o.customer_id;
SELECt c.name, SUM(oTM.total_amount) FROM customers c JOIN orders o ON c.customer_id = o.customer_id group by c.name;
SELECT c.name, o.order_date from customers c JOIN orders o ON c.customer_id = o.customer_id;
SELECT c.name, o.order_date, c.signup_date FROM customers c JOIN orders o on c.customer_ID = o.customer_ID;
SELECT c.name, DATEDIFF(o.order_date, c.signup_date) AS days_joined_and_ordered FROM customers c JOIN orders o ON c.customer_id = o.customer_id;
SELECT c.name, c.signup_date from customers c ORDER BY c.signup_date ASC;
SELECT o.order_date, o.customer_id, o.order_id FROM orders o ORDER BY o.order_date ASC;
SELECT c.name, c.customer_id FROM customers c;
SELECT o.customer_id, p.name FROM orders o JOIN products p ON o.order_id = p.product_id;
USE ecommerce_analytics;







