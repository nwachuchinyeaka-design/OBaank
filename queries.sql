SELECT
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT transaction_id) AS unique_ids,
    MIN(transaction_id) AS first_id,
    MAX(transaction_id) AS last_id
FROM transactions;

SELECT 'customers' AS table_name, COUNT(*) AS total_records FROM customers
UNION ALL
SELECT 'accounts', COUNT(*) FROM accounts
UNION ALL
SELECT 'transactions', COUNT(*) FROM transactions;
SELECT COUNT(*) AS accounts_without_customers
FROM accounts a
LEFT JOIN customers c
    ON a.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
SELECT COUNT(*) AS transactions_without_accounts
FROM transactions t
LEFT JOIN accounts a
    ON t.account_id = a.account_id
WHERE a.account_id IS NULL;
SELECT
    SUM(transaction_date IS NULL) AS missing_dates,
    SUM(transaction_type IS NULL) AS missing_types,
    SUM(amount IS NULL) AS missing_amounts,
    SUM(channel IS NULL) AS missing_channels
FROM transactions;
SELECT transaction_type, COUNT(*) AS total
FROM transactions
GROUP BY transaction_type
ORDER BY total DESC;
SELECT channel, COUNT(*) AS total
FROM transactions
GROUP BY channel
ORDER BY total DESC;


SELECT
    channel,
    COUNT(*) AS total
FROM transactions
GROUP BY channel
ORDER BY channel;
SELECT
    SUM(amount < 0) AS negative_amounts,
    SUM(amount = 0) AS zero_amounts,
    MIN(amount) AS smallest_amount,
    MAX(amount) AS largest_amount
FROM transactions;


SELECT
    account_id,
    transaction_date,
    transaction_type,
    amount,
    COUNT(*) AS occurrences
FROM transactions
GROUP BY
    account_id,
    transaction_date,
    transaction_type,
    amount
HAVING COUNT(*) > 1
LIMIT 10;


SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(t.transaction_id) AS total_transactions
FROM customers AS c
JOIN accounts AS a
    ON c.customer_id = a.customer_id
JOIN transactions AS t
    ON a.account_id = t.account_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_transactions DESC
LIMIT 10;


select count(*) AS total_customers
from customers;

select city, count(*) as customers
from customers
group by city
order by customers desc;

select avg(timestampdiff(year,date_of_birth,curdate())) as avg_age
from customers;

select*from accounts limit 10;

select sum(balance) as total_bank_balance
from accounts;

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_balance DESC
LIMIT 10;


select
account_type,
avg(balance) avg_balance
from accounts
group by account_type;

select count(*) as total_transactions
from transactions;


select
year(transaction_date)year,
month(transaction_date) month,
count(*) total_transactions
from transactions
group by year, month;


select 
channel,
count(*) transactions
from transactions
group by channel
order by transactions desc;