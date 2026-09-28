create  database assignmentdb;

use assignmentdb;

create table customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    city VARCHAR(50)
);

create table accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

insert into customers (name, city) value
('Janani','Chennai'),
('Arun','Coimbatore'),
('Priya','Madurai'),
('Karthik','Salem');

insert into accounts (customer_id, account_type, balance) value
(1,'Savings',50000),
(1,'Current',20000),
(2,'Savings',30000),
(3,'Savings',15000),
(4,'Current',40000);


select * from accounts;

select * from customers;

create table trains (
    train_id INT PRIMARY KEY AUTO_INCREMENT,
    train_name VARCHAR(50),
    source VARCHAR(50),
    destination VARCHAR(50)
);

create table bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    train_id INT,
    passenger_name VARCHAR(50),
    fare DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (train_id) REFERENCES trains(train_id)
);

insert into trains (train_name, source, destination) value
('Express1','Chennai','Madurai'),
('Express2','Coimbatore','Salem'),
('Express3','Madurai','Chennai');

insert into bookings (train_id, passenger_name, fare, status) value
(1,'Janani',500,'Confirmed'),
(1,'Arun',500,'Waiting'),
(2,'Priya',300,'Confirmed'),
(3,'Karthik',450,'Cancelled'),
(2,'Meena',300,'Confirmed');

-- Banking Scenrio 
 
-- 1
select * from accounts where balance > 20000;

-- 2
select * from customers where city = 'Chennai';

-- 3
select * from accounts where balance BETWEEN 20000 AND 50000;

-- 4
select * from customers where name LIKE 'J%';

-- 5
select * from accounts where account_type IN ('Savings','Current');

-- 6
select * from accounts where account_type <> 'Savings';

-- 7
select * from customers where name LIKE '%a%';

-- 8
select * from accounts where balance <= 30000;

-- 9
select * from customers where city <> 'Madurai';

-- 10
select * from accounts where balance NOT BETWEEN 10000 AND 40000;

-- 11
select * from customers where name LIKE '%i';

-- 12
select * from accounts where balance = 50000;

-- 13
select * from customers where city IN ('Chennai','Salem');

-- 14
select * from accounts where balance > 10000 AND balance < 40000;

-- 15
select * from accounts where account_type NOT IN ('Current');

-- 16
select * from accounts order by balance DESC;

-- 17
select * from customers order by name ASC;

-- 18
select * from accounts order by account_type ASC, balance DESC;

-- 19
select SUM(balance) AS total_balance from accounts;

-- 20
select AVG(balance) AS average_balance from accounts;

-- 21
select MAX(balance) AS max_balance from accounts;

-- 22
select MIN(balance) AS min_balance from accounts;

-- 23
select COUNT(*) AS total_customers from customers;
 
-- 24
select account_type, SUM(balance) AS total_balance
from accounts group by account_type;

-- 25
select account_type, AVG(balance) AS avg_balance
from accounts group by account_type;

-- 26
select account_type, AVG(balance) AS avg_balance
from accounts group by account_type
having AVG(balance) > 20000;

-- 27
select customer_id, COUNT(*) AS num_accounts
from accounts group by customer_id;

-- 28
select customer_id, COUNT(*) AS num_accounts
from accounts group by customer_id
having COUNT(*) > 1;
 
-- 29
select c.name, a.balance
from customers c JOIN accounts a ON c.customer_id = a.customer_id;

-- 30  (customers without accounts also appear)
select c.customer_id, c.name, c.city, a.account_id, a.account_type, a.balance
from customers c LEFT JOIN accounts a ON c.customer_id = a.customer_id;

-- 31
select a.account_id, a.account_type, a.balance, c.customer_id, c.name, c.city
from accounts a JOIN customers c ON a.customer_id = c.customer_id;

-- 32
select c.name, a.account_type
from customers c JOIN accounts a ON c.customer_id = a.customer_id
where a.balance > 20000;

-- 33
select c.customer_id, c.name, SUM(a.balance) AS total_balance
from customers c JOIN accounts a ON c.customer_id = a.customer_id
group by c.customer_id, c.name;

-- 34
select c.name, a.balance
from customers c JOIN accounts a ON c.customer_id = a.customer_id
order by a.balance DESC;

-- 35
select c.city, COUNT(a.account_id) AS num_accounts
from customers c JOIN accounts a ON c.customer_id = a.customer_id
group by c.city;
 
-- 36
select * from accounts
where balance > (select AVG(balance) from accounts);

-- 37
select * from customers
where customer_id IN (select customer_id from accounts);

-- 38
select * from customers
where customer_id NOT IN (select customer_id from accounts where customer_id IS NOT NULL);

-- 39
select * from accounts
where balance = (select MAX(balance) from accounts);

-- 40
select * from customers
where customer_id IN (select customer_id from accounts
group by customer_id having SUM(balance) > 40000);

-- 41
select * from bookings where fare > 400;

-- 42
select * from bookings where status <> 'Confirmed';

-- 43
select * from trains where source = 'Chennai';

-- 44
select * from bookings where fare BETWEEN 300 AND 500;

-- 45
select * from bookings where passenger_name LIKE 'A%';
 
-- 46
select t.train_name, b.passenger_name
from trains t JOIN bookings b ON t.train_id = b.train_id
order by t.train_name;

-- 47
select t.train_name, COUNT(b.booking_id) AS total_bookings
from trains t LEFT JOIN bookings b ON t.train_id = b.train_id
group by t.train_id, t.train_name
order by total_bookings DESC;

-- 48
select t.train_name, SUM(b.fare) AS total_fare
from trains t JOIN bookings b ON t.train_id = b.train_id
group by t.train_id, t.train_name
order by total_fare DESC;

-- 49
select * from bookings
where fare = (select MAX(fare) from bookings);

-- 50
select * from trains
where train_id IN (select train_id from bookings
group by train_id having COUNT(*) > 1);
 
 
 create table Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30),
    joining_date DATE
);

insert into Employee value
(101,'John','IT',60000,'Chennai','2022-01-15'),
(102,'David','HR',45000,'Bangalore','2021-03-10'),
(103,'Smith','IT',70000,'Chennai','2020-07-12'),
(104,'Mary','Finance',55000,'Mumbai','2023-01-20'),
(105,'James','HR',48000,'Delhi','2022-05-05'),
(106,'Linda','Finance',65000,'Mumbai','2021-08-18');

create table Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

create table Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

create table Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(30),
    marks INT
);

INSERT INTO Customer (customer_id, customer_name, city) VALUES
(1,  'Arun',    'Chennai'),
(2,  'Priya',   'Bangalore'),
(3,  'Karthik', 'Mumbai'),
(4,  'Sneha',   'Coimbatore'),
(5,  'Rahul',   'Chennai'),
(6,  'Meena',   'Madurai'),
(7,  'Vikram',  'Hyderabad'),
(8,  'Divya',   'Salem'),
(9,  'Ganesh',  'Delhi'),
(10, 'Lakshmi', 'Pune');

INSERT INTO Orders (order_id, customer_id, amount, order_date) VALUES
(1,  1, 3000.00, '2026-01-10'),
(2,  1, 2500.00, '2026-02-14'),
(3,  1, 4000.00, '2026-03-05'),
(4,  1, 1500.00, '2026-04-20'),
(5,  1, 2000.00, '2026-05-18'),
(6,  2, 5000.00, '2026-01-22'),
(7,  2, 3500.00, '2026-03-11'),
(8,  2, 2000.00, '2026-05-02'),
(9,  2, 1000.00, '2026-06-15'),
(10, 3, 2500.00, '2026-02-01'),
(11, 3, 3000.00, '2026-04-09'),
(12, 3, 3200.00, '2026-06-25'),
(13, 4, 6000.00, '2026-03-17'),
(14, 4, 1200.00, '2026-07-04'),
(15, 5,  800.00, '2026-02-19'),
(16, 5, 1200.00, '2026-05-27'),
(17, 5,  900.00, '2026-07-21'),
(18, 6, 4500.00, '2026-04-30'),
(19, 7, 1500.00, '2026-03-28'),
(20, 7, 1800.00, '2026-06-08'),
(21, 8, 1000.00, '2026-01-30'),
(22, 8, 1500.00, '2026-03-22'),
(23, 8, 2200.00, '2026-05-14'),
(24, 8, 1800.00, '2026-07-16'),
(25, 9,  900.00, '2026-08-03');

INSERT INTO Students (student_id, student_name, department, marks) VALUES
(1,  'Aarav',    'CSE',   95),
(2,  'Bhavana',  'CSE',   88),
(3,  'Chitra',   'CSE',   82),
(4,  'Dinesh',   'CSE',   78),
(5,  'Eswari',   'CSE',   76),
(6,  'Farook',   'CSE',   70),
(7,  'Gayathri', 'CSE',   65),
(8,  'Harish',   'IT',    90),
(9,  'Indhu',    'IT',    85),
(10, 'Jagan',    'IT',    80),
(11, 'Kavya',    'IT',    77),
(12, 'Lokesh',   'IT',    72),
(13, 'Madhavi',  'IT',    68),
(14, 'Naveen',   'ECE',   89),
(15, 'Oviya',    'ECE',   84),
(16, 'Pranav',   'ECE',   79),
(17, 'Qadir',    'ECE',   74),
(18, 'Reshma',   'ECE',   70),
(19, 'Suresh',   'EEE',   91),
(20, 'Tamilarasi','EEE',  76),
(21, 'Uday',     'EEE',   72),
(22, 'Vimala',   'EEE',   60),
(23, 'Waseem',   'MECH',  78),
(24, 'Xavier',   'MECH',  70),
(25, 'Yamini',   'MECH',  65),
(26, 'Zaheer',   'MECH',  60),
(27, 'Anitha',   'MECH',  55),
(28, 'Balaji',   'CIVIL', 85),
(29, 'Charan',   'CIVIL', 68),
(30, 'Deepa',    'CIVIL', 62);

select * from Students;


-- EMPLOYEE TABLE

-- 1
select department, COUNT(*) AS total_employees from Employee group by department;

-- 2
select department, AVG(salary) AS avg_salary from Employee group by department;

-- 3
select department, COUNT(*) AS total_employees from Employee
group by department having COUNT(*) > 1;

-- 4
select department, MAX(salary) AS highest_salary from Employee group by department;

-- 5
select department, MIN(salary) AS lowest_salary from Employee group by department;

-- 6
select department, AVG(salary) AS avg_salary from Employee
group by department having AVG(salary) > 50000;

-- 7
select department, SUM(salary) AS total_salary from Employee group by department;

-- 8
select * from Employee order by salary DESC;

-- 9
select * from Employee order by department ASC, salary DESC;

-- 10
select city, COUNT(*) AS total_employees from Employee
group by city having COUNT(*) > 1;

-- 11
select city, SUM(salary) AS total_salary from Employee group by city;

-- 12
select department, SUM(salary) AS total_salary from Employee
group by department order by total_salary DESC;

-- 13
select department, COUNT(*) AS total_employees from Employee
where salary > 50000 group by department;

-- 14
select department, MAX(salary) - MIN(salary) AS salary_difference
from Employee group by department;

-- 15
select * from Employee order by salary DESC LIMIT 3;
 
-- CUSTOMERS & ORDERS 

-- 16
select c.customer_id, c.customer_name, SUM(o.amount) AS total_amount
from Customer c JOIN Orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

-- 17
select c.customer_id, c.customer_name, COUNT(o.order_id) AS total_orders
from Customer c JOIN Orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having COUNT(o.order_id) > 3;

-- 18
select c.customer_id, c.customer_name, AVG(o.amount) AS avg_amount
from Customer c JOIN Orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

-- 19
select c.customer_id, c.customer_name, MAX(o.amount) AS highest_order
from Customer c JOIN Orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

-- 20
select c.customer_id, c.customer_name, SUM(o.amount) AS total_purchase
from Customer c JOIN Orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
order by total_purchase DESC;

-- 21
select c.customer_id, c.customer_name, SUM(o.amount) AS total_purchase
from Customer c JOIN Orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having SUM(o.amount) > 10000;

-- 22
select c.customer_name, COUNT(o.order_id) AS total_orders
from Customer c LEFT JOIN Orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

-- 23
select c.customer_name, SUM(o.amount) AS total_spent
from Customer c JOIN Orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
order by total_spent DESC LIMIT 1;

-- 24
select c.customer_name, COUNT(o.order_id) AS total_orders
from Customer c JOIN Orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
order by total_orders DESC LIMIT 1;

-- 25
select c.customer_id, c.customer_name, AVG(o.amount) AS avg_amount
from Customer c JOIN Orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having AVG(o.amount) > 2000;

-- 26
select c.customer_id, c.customer_name, SUM(o.amount) AS total_purchase
from Customer c JOIN Orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
order by total_purchase DESC LIMIT 5;

-- 27
select c.customer_id, c.customer_name, MIN(o.amount) AS min_order
from Customer c JOIN Orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

-- 28
select c.customer_id, c.customer_name, SUM(o.amount) AS total_purchase
from Customer c JOIN Orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having SUM(o.amount) > 5000;

-- 29
select c.customer_id, c.customer_name,
COUNT(o.order_id) AS total_orders, SUM(o.amount) AS total_purchase
from Customer c JOIN Orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

-- 30
select c.customer_id, c.customer_name,
COUNT(o.order_id) AS total_orders, SUM(o.amount) AS total_purchase
from Customer c JOIN Orders o ON c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having COUNT(o.order_id) > 2 AND SUM(o.amount) > 8000;
 
-- STUDENTS TABLE

-- 31
select department, AVG(marks) AS avg_marks from Students group by department;

-- 32
select department, AVG(marks) AS avg_marks from Students
group by department having AVG(marks) > 75;

-- 33
select department, MAX(marks) AS highest_mark from Students group by department;

-- 34
select department, COUNT(*) AS total_students from Students group by department;

-- 35
select department, COUNT(*) AS total_students from Students
group by department having COUNT(*) > 5;

-- 36
select department, AVG(marks) AS avg_marks from Students
group by department order by avg_marks DESC;

-- 37
select department, AVG(marks) AS avg_marks from Students
group by department order by avg_marks DESC LIMIT 3;

-- 38
select department, AVG(marks) AS avg_marks from Students
group by department having AVG(marks) BETWEEN 70 AND 90;

-- 39
select department, SUM(marks) AS total_marks from Students group by department;

-- 40
select department, COUNT(*) AS total_students from Students
group by department order by total_students DESC;

-- 41
select department, MIN(marks) AS lowest_mark from Students group by department;

-- 42
select department, MAX(marks) AS highest_mark from Students
group by department having MAX(marks) > 90;

-- 43
select department, COUNT(*) AS students_above_80 from Students
where marks > 80 group by department;

-- 44
select department, COUNT(*) AS students_above_75 from Students
where marks > 75 group by department having COUNT(*) > 3;

-- 45
select department, MAX(marks) AS highest_mark from Students
group by department order by highest_mark DESC;
 