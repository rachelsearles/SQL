/* Bubs wants you to track information on his customers (first name, last name, email),
his employees (first name, last name, start date, position help), his products, and the 
purchases customers make (which customer, when it was purchased, for how much money). 
Think about how many tables you should create. Which data goes in which tables? How should the tables
relate to one another? */

-- table: customers
-- cust id, first name, last name, email
-- table: employees
-- emp id first name, last name, start date, position 
-- table: products 
-- product id, product name
-- table: cust purchases
-- cust purchase id, cust id, product id, purchased at, amount_usd

/* Given the database design you came up with, use Workbench to create an EER diagram of the
database. Include things like primary keys and foreign keys, and anything else you think
you should have in the atbles. Make sure to use reasonable data types for each column. */

-- done!

/* Create a schema called bubsbooties. Within that schema, create tables that you have 
diagramed out. Make sure they relate to each other, and that they have the same reasonable
data types you selected previously. */

-- done!

/* Add any constraints you think your table columns should have. Think through which columns need
to be unique, which ones are allowed to have NULL values, etc. */

-- done! 

/* Insert at least 3 records of data into each table. The exact values do not matter, so make
them up. Make sure the data inserted makes sense and the tables tie together. */

USE bubsbooties;

SELECT * FROM customers; 

INSERT INTO customers VALUES
	('1', 'Marlene', 'Calsbeek', 'abc@xyz.com'),
    ('2', 'Arlene', 'Ogle', 'xyz@abc.com'),
    ('3', 'Eldrige', 'Ogle', 'email@gov.com');

SELECT * FROM employees;

INSERT INTO employees VALUES
	('1', 'Ted', 'Mosby', '2001-01-01', 'Architect'),
    ('2', 'Robin', 'Scherbatsky', '2002-02-02', 'Reporter'),
    ('3', 'Marshall', 'Erickson', '2003-03-03', 'Lawyer');
    
SELECT * FROM products;

INSERT INTO products VALUES
	('1', 'chocolatefrogs', '2001-03-24'),
    ('2', 'fizzingwhizzbees', '2001-5-15'),
    ('3', 'pumpkinpasty', '2002-02-24');

SELECT * FROM customer_purchases;
 
INSERT INTO customer_purchases VALUES
	('1', '1', '2', '1'),
    ('2', '3', '1', '3'),
    ('3', '2', '3', '2');

    

/* Create two users and give them access to the database. The first user, TuckerReilly, will 
be the DBA, and should get full database admin privileges. The second, EllaBrody, is an
analyst and only needs read access. */

-- done!
