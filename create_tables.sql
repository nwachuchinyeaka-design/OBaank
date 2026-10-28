CREATE TABLE customers (
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
gender VARCHAR(10),
date_of_birth DATE,
city VARCHAR(50),
occupation VARCHAR(50),
signup_date DATE
);

CREATE TABLE branches (
branch_id INT PRIMARY KEY,
branch_name VARCHAR(100),
city VARCHAR(50),
manager_name VARCHAR(100)
);

CREATE TABLE accounts (
account_id INT PRIMARY KEY,
customer_id INT,
account_type VARCHAR(50),
balance DECIMAL(15,2),
open_date DATE,
status VARCHAR(20),

FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
);

CREATE TABLE transactions (
transaction_id INT PRIMARY KEY,
account_id INT,
transaction_date DATE,
transaction_type VARCHAR(50),
amount DECIMAL(12,2),
channel VARCHAR(50),

FOREIGN KEY (account_id)
REFERENCES accounts(account_id)
);


CREATE TABLE loans (
loan_id INT PRIMARY KEY,
customer_id INT,
loan_type VARCHAR(50),
loan_amount DECIMAL(15,2),
interest_rate DECIMAL(5,2),
loan_start_date DATE,
loan_status VARCHAR(20),

FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
);

CREATE TABLE employees (
employee_id INT PRIMARY KEY,
branch_id INT,
employee_name VARCHAR(100),
position VARCHAR(50),
salary DECIMAL(12,2),

FOREIGN KEY (branch_id)
REFERENCES branches(branch_id)
);

