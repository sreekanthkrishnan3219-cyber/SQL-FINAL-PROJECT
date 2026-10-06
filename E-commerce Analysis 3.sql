use college
select * from customers
select * from products
select * from orders
select * from order_items
select sum(sales_amount) as toatal_sales from order_items
select count(customer_id) as total_customers from customers
select count(order_id) as total_orders from orders
select avg(sales_amount) as avg_sales_amount from order_items
select min(sales_amount) as min_sales_amount from order_items
select max(sales_amount) as max_sales_amount from order_items
select products.category,sum(order_items.sales_amount) as total_sales from order_items join products on order_items.product_id=products.product_id group by products.category order by total_sales desc
select customers.state,sum(order_items.profit) as total_profit from order_items join orders on order_items.order_id=orders.order_id join customers on orders.customer_id=customers.customer_id group by customers.state order by total_profit desc
select customers.state,count(orders.order_id) as total_orders from orders join customers on orders.customer_id=customers.customer_id group by customers.state order by total_orders desc
select customers.customer_id,customers.customer_name,sum(order_items.sales_amount) as total_spent from order_items join orders on order_items.order_id=orders.order_id join customers on orders.customer_id=customers.customer_id group by customers.customer_id,customers.customer_name order by total_spent desc limit 5
select products.category,sum(order_items.profit) as total_profit from order_items join products on order_items.product_id=products.product_id  group by products.category order by total_profit asc
select customers.customer_id,customers.customer_name,orders.order_id,orders.order_date,products.product_id,products.product_name,products.category,order_items.quantity,order_items.sales_amount,order_items.profit from order_items join orders on order_items.order_id=orders.order_id join customers on orders.customer_id=customers.customer_id join products on order_items.product_id=products.product_id
select customers.state as region,products.product_id,products.product_name,sum(order_items.quantity) as total_quantity_sold from order_items inner join products on order_items.product_id=products.product_id inner join orders on order_items.order_id=orders.order_id inner join customers on orders.customer_id=customers.customer_id group by customers.state,products.product_id,products.product_name order by region asc,total_quantity_sold desc
select customers.customer_id,customers.customer_name,sum(order_items.sales_amount) as total_purchase, case when sum(order_items.sales_amount)>=5000 then 'high value'when sum(order_items.sales_amount)>=1500 and sum(order_items.sales_amount)<5000 then 'medium value' else 'low value' end as customer_class from customers join orders on customers.customer_id = orders.customer_id join order_items on orders.order_id=order_items.order_id group by customers.customer_id,customers.customer_name
select products.product_id,products.product_name,sum(order_items.profit)as total_profit, case when sum(order_items.profit)>1000 then 'high profit' when sum(order_items.profit) between 0 and 1000 then 'low profit' else 'loss' end as product_class from products join order_items on products.product_id = order_items.product_id group by products.product_id,products.product_name
select products.product_name,sum(order_items.sales_amount) as total_avg_sales from products join order_items on products.product_id=order_items.product_id group by products.product_name having sum(order_items.sales_amount)>(select avg(sales_amount) from order_items)
select product_name,total_avg_sales from (select products.product_name,sum(order_items.sales_amount) as total_avg_sales,dense_rank()over (order by sum(order_items.sales_amount)desc) rnk from products join order_items on products.product_id=order_items.product_id group by products.product_name)x where rnk=2
select customers.customer_name,sum(order_items.sales_amount) as total_avg_sales,rank() over(order by sum(order_items.sales_amount) desc) as customer_rank from customers join orders on orders.customer_id = customers.customer_id join order_items on order_items.order_id=orders.order_id group by customers.customer_name
select * from (select products.product_name,products.category,sum(order_items.sales_amount) as total_avg_sales,dense_rank() over(partition by products.category order by sum(order_items.sales_amount) desc) as rnk from products join order_items on products.product_id=order_items.product_id group by products.category,products.product_name)x where rnk <=3
select sales_amount,sum(sales_amount) over(order by order_id) as running_total from order_items
select * from customers where customer_id is null or customer_name is null or gender is null or city is null or state is null