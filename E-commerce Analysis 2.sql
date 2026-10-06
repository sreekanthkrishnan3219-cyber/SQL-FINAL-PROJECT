use college
desc products
alter table products modify column product_id varchar(20) primary key,modify column product_name varchar(100),modify column category varchar(20),modify column sub_category varchar(50),modify column price varchar(50)
desc orders
select * from orders
desc order_items
alter table orders add foreign key (customer_id) references customers(customer_id)
alter table orders modify column order_id varchar(20) primary key,modify column customer_id varchar(100),modify column order_date date,modify column ship_date date ,modify column payment_method varchar(10)
alter table order_items modify column order_item_id varchar(20) primary key,modify column order_id varchar(100),modify column product_id varchar(20),modify column quantity int,modify column sales_amount int,modify column profit int
select * from order_items
alter table order_items add foreign key (order_id) references orders(order_id)
alter table order_items add foreign key (product_id) references products(product_id)
