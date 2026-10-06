use college
select * from customers
select * from order_items
select * from orders
select * from products
update orders set Payment_method='cash' where Payment_method='Second class'
set sql_safe_updates=0
drop table customers
create table customers (customer_id int primary key,customer_name varchar(100),gender varchar(20),city varchar(50),state varchar(50))
drop table customer
alter table customers add primary key(customer_id)
alter table customers modify column customer_id varchar(20),modify column customer_name varchar(100),modify column gender varchar(20),modify column city varchar(50),modify column state varchar(50)
desc customers
create table customer as select distinct * from customers
desc customer
delete from customer where customer_id='JE-15745'
delete from customer where customer_id='PO-18865'
