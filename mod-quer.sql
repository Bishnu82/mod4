-- select all columns, all rows
select * from customer;
select * from orders;

-- select all columns for customers in OH
select * from customer
 where state = 'OH';
 
-- select all columns for customers in OH, ordered by name
select * from customer
 where state = 'OH'
 order by name desc; -- 'desc' returns in descending order
 
 select 1;
 
-- select name and credit limit columns, all rows
select name 'Name', creditLimit as 'Credit Limit'
  from customer;

-- select name and credit limit columns, all rows, using table alias
select cust.name 'Name', cust.creditLimit as 'Credit Limit'
  from customer cust;
  
-- join view - all columns
select * 
  from customer
  join orders
    on customer.id = orders.customerID;

-- join view - report format - customer name,
--                          order date, total
select c.name as 'Customer Name', 
		DATE_FORMAT(o.date, "%M %d %Y") as 'Order Date', 
        concat('$', o.total) as 'Order Total'
  from orders o
  join customer c
    on c.id = customerID
    order by c.name;
    
    -- join view - report format, subselect
select c.name as 'Customer Name', 
		DATE_FORMAT(o.date, "%M %d %Y") as 'Order Date', 
        concat('$', o.total) as 'Order Total'
  from orders o
  join customer c
    on c.id = customerID
	where o.total > (
		select avg(total) from orders
)
	order by c.name;
    
-- get the average order total
select avg(total)
	from orders;
        
-- get the sum of all orders
select sum(total)
	from orders;
        
-- get the sum of all orders by customer
select customerID, sum(total)
	from orders
    group by customerID;

-- combine join with group by
select o.customerID 'Cust. ID',
	c.name 'Cust. Name',
    sum(o.total) 'Order Total'
from orders o
join customer c
	on o.customerID = c.id
group by customerID
order by c.name;
-- count function
select count(*)
	from orders;
    
-- max/min
select max(total) from orders;

-- select a row by id
select * from customer
	where id = 5;
    
-- insert a new customer
Insert into customer (name, city, state, isCorpAcct, creditLimit)
values ( 'Dummy', 'Dummy', 'DY', 0, 5000);

select * from customer;
-- another way to insert a customer
insert into customer
	values (10, 'Dummy2', 'Dummy', 'DY', 0, 5555,1);
-- a third way to insert customer
insert into customer (name, city, state, isCorpAcct, creditLimit)
values 
('Dummy3', 'Dummy', 'DY', 0, 5555.55),
('Dummy4', 'Dummy', 'DY', 0, 5555.55),
('Dummy5', 'Dummy', 'DY', 0, 5555.55);


-- update statement
update customer
	set name = 'Dummy1'
    where id = 8;
    
delete
	from customer
		where id in(9,11,12);
        
        
        delete from customer
        where id > 7;
