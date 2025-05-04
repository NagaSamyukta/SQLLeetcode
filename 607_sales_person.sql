CREATE TABLE salesperson (
    sales_id INT,
    name VARCHAR(255),
    salary INT,
    commission_rate INT,
    hire_date DATE
);

INSERT INTO salesperson (sales_id, name, salary, commission_rate, hire_date) VALUES
(1, 'John', 100000, 6, '2006-04-01'),
(2, 'Amy', 120000, 5, '2010-05-01'),
(3, 'Mark', 65000, 12, '2008-12-25'),
(4, 'Pam', 25000, 25, '2005-01-01'),
(5, 'Alex', 50000, 10, '2007-02-03');

CREATE TABLE company (
    com_id INT,
    name VARCHAR(255),
    city VARCHAR(255)
);

INSERT INTO company (com_id, name, city) VALUES
(1, 'RED', 'Boston'),
(2, 'ORANGE', 'New York'),
(3, 'YELLOW', 'Boston'),
(4, 'GREEN', 'Austin');


select name from salesperson 
where sales_id not in 
(
select sales_id from orders o 
inner join company c 
on c.com_id = o.com_id
where c.name='RED')