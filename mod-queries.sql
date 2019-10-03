drop database if exists sqlbootcamp_mod4;
create database sqlbootcamp_mod4;
use sqlbootcamp_mod4;

create table customer (
	id	        int         not null primary key auto_increment,
    name        varchar(50) not null,
    city        varchar(50) not null,
    state       varchar(2)  not null,
    isCorpAcct  bit         not null default 0,
    creditLimit int         not null default 0,
    active      bit         not null default 1
    );
    
    Insert into customer (name, city, state, isCorpAcct, creditLimit)
    values ('Mercury LTD'.  'Newport'.  'KY'.  0.  100000):
    
    
    
    
    
    
    
    
    
    
    
    
    
    
create table orders (
	id         int           not null primary key auto_increment,
    customerID int           not null,
    date       datetime      not null,
    total      decimal(14,2) not null default 0
    );
    
ALTER TABLE orders
ADD FOREIGN KEY (customerID) REFERENCES customer(id);

Insert into orders (date, total, customerID)
values ('2017-12-31', 778, 6);
Insert into orders (date, total, customerID)
    