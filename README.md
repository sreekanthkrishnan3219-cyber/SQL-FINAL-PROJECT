# 📊 Sales Data Analysis Using SQL

## 📌 Project Overview

This project focuses on **sales data analysis using MySQL**. A relational database was created to manage customers, products, orders, and order items. SQL queries were then used to analyze sales performance, profitability, customer behavior, product performance, and regional order trends.

The project demonstrates practical SQL concepts including:

* Database and table creation
* Primary and foreign keys
* Data modification using `ALTER TABLE`
* Multiple table joins
* Aggregation using `SUM()` and `COUNT()`
* `GROUP BY` and `HAVING`
* Subqueries
* `CASE` statements
* Window functions
* Ranking and running totals
* Business-oriented data analysis

---

## 🗂️ Database Structure

The project uses a database named **`company`**.

### Tables

#### 1. Customers

Stores customer information.

| Column          | Description                |
| --------------- | -------------------------- |
| `customer_id`   | Unique customer identifier |
| `customer_name` | Customer name              |
| `gender`        | Customer gender            |
| `city`          | Customer city              |
| `state`         | Customer state             |

#### 2. Products

Stores product information.

| Column         | Description               |
| -------------- | ------------------------- |
| `product_id`   | Unique product identifier |
| `product_name` | Product name              |
| `category`     | Product category          |
| `sub_category` | Product sub-category      |
| `price`        | Product price             |

#### 3. Orders

Stores order-level information.

| Column           | Description                   |
| ---------------- | ----------------------------- |
| `order_id`       | Unique order identifier       |
| `customer_id`    | Customer who placed the order |
| `order_date`     | Date the order was placed     |
| `ship_date`      | Shipping date                 |
| `payment_method` | Payment method                |

#### 4. Order Items

Stores individual products included in each order.

| Column          | Description                  |
| --------------- | ---------------------------- |
| `order_item_id` | Unique order-item identifier |
| `order_id`      | Related order                |
| `product_id`    | Related product              |
| `quantity`      | Quantity purchased           |
| `sales_amount`  | Sales/revenue generated      |
| `profit`        | Profit generated             |

The relationships between customers, orders, products, and order items are established using foreign keys.

---

## 🔍 SQL Analysis Performed

### 1. Sales by Product Category

The project calculates total sales for each product category and ranks categories according to revenue.

```sql
SELECT products.category,
       SUM(order_items.sales_amount) AS total_sales
FROM order_items
JOIN products
ON order_items.product_id = products.product_id
GROUP BY products.category
ORDER BY total_sales DESC;
```

### 2. Profit by State

Profitability is analyzed across different states.

```sql
SELECT customer.state,
       SUM(order_items.profit) AS total_profit
FROM order_items
JOIN orders
ON order_items.order_id = orders.order_id
JOIN customer
ON orders.customer_id = customer.customer_id
GROUP BY customer.state
ORDER BY total_profit DESC;
```

### 3. Order Volume by State

The number of orders from each state is calculated to compare order volume across regions.

---

## 👥 Customer Analysis

The project identifies the highest-spending customers using total sales.

A customer ranking was also created using the SQL `RANK()` window function.

```sql
SELECT customer.customer_id,
       customer.customer_name,
       SUM(order_items.sales_amount) AS total_sales,
       RANK() OVER (
           ORDER BY SUM(order_items.sales_amount) DESC
       ) AS customer_rank
FROM customer
JOIN orders
ON customer.customer_id = orders.customer_id
JOIN order_items
ON orders.order_id = order_items.order_id
GROUP BY customer.customer_id,
         customer.customer_name;
```

### Customer Classification

Customers are classified into three groups based on their total purchases:

* **High Value** — purchases of $5,000 or more
* **Medium Value** — purchases between $1,500 and $4,999
* **Low Value** — purchases below $1,500

This classification was implemented using a SQL `CASE` statement.

---

## 📦 Product Analysis

The project analyzes product-level sales and profitability.

Products are also classified based on total profit:

* **High Profit** — profit greater than $1,000
* **Low Profit** — profit from $0 to $1,000
* **Loss** — negative profit

```sql
CASE
    WHEN SUM(order_items.profit) > 1000 THEN 'High Profit'
    WHEN SUM(order_items.profit) BETWEEN 0 AND 1000 THEN 'Low Profit'
    ELSE 'Loss'
END AS product_class
```

The project also identifies:

* Products with sales above the average product sales
* The second-highest-selling product
* Top 3 products within each category

---

## 🏆 Ranking & Advanced SQL

Several advanced SQL techniques were used.

### Customer Ranking

`RANK()` is used to rank customers according to total sales.

### Top 3 Products per Category

`DENSE_RANK()` with `PARTITION BY` is used to identify the top three products within each category.

### Running Total

A window function calculates cumulative sales over time:

```sql
SUM(order_items.sales_amount)
OVER (
    ORDER BY orders.order_date,
             order_items.order_id
) AS running_total_sales
```

These queries demonstrate the use of SQL window functions for business analytics.

---

## 📈 Key Business Insights

### 💰 Revenue

The sales report generated total revenue of:

**$7,183.24**

across **22 orders**.

### 🛋️ Highest-Selling Category

**Furniture** generated the highest sales:

**$3,706.52**

However, Furniture also generated a net loss of:

**-$22.06**

This indicates that high revenue does not necessarily translate into high profitability.

### 💻 Most Profitable Category

**Technology** was the most profitable category, generating:

**$175.09**

in profit.

### 🌎 State-Level Performance

* **California** had the highest order volume with **5 orders**.
* **Wisconsin** generated the highest profit at **$90.72**, despite having fewer orders.

### 👤 Top Customer

**Ken Black** was the top-performing customer, contributing:

**$1,706.18** in total sales.

These findings are reported in the project's final conclusions.

---

## 🛠️ Technologies Used

* **MySQL**
* **SQL**
* Relational Database Management
* SQL Joins
* Aggregate Functions
* Subqueries
* CASE Statements
* Window Functions

---

## 📚 SQL Concepts Demonstrated

```text
CREATE DATABASE
CREATE TABLE
PRIMARY KEY
FOREIGN KEY
ALTER TABLE
SELECT
JOIN
GROUP BY
ORDER BY
HAVING
LIMIT
SUBQUERY
CASE
RANK()
DENSE_RANK()
SUM() OVER()
```

---

## 🎯 Project Objectives

The main objectives of this project were to:

1. Build a relational sales database.
2. Establish relationships between customers, products, orders, and order items.
3. Analyze sales and profit performance.
4. Identify high-value customers.
5. Compare regional sales and profitability.
6. Classify customers and products based on performance.
7. Apply advanced SQL techniques such as window functions.
8. Generate meaningful business insights from sales data.

---

## 📁 Project Structure

```text
Sales-Data-Analysis/
│
├── README.md
├── PROJECT.sql
└── PROJECT.docx
```

---

## 👨‍💻 Conclusion

This project demonstrates how **SQL can be used to transform raw sales data into actionable business insights**. Through database design, joins, aggregations, subqueries, conditional logic, and window functions, the analysis evaluates revenue, profitability, customer performance, product performance, and regional trends.

The analysis highlights an important business insight: **the category with the highest sales is not necessarily the most profitable**. Furniture generated the highest revenue but operated at a loss, while Technology achieved the highest profitability.
