INSERT INTO customers
SELECT
id,
ELT(FLOOR(1+RAND()*6),
    'Ojoko','Chinedu','Abdulazak','Musa','Terna',
    'Okon','Ali','Adewale','Jonathan','Oche'),
...

INSERT INTO branches
SELECT
id,
CONCAT('Branch_',id),
ELT(FLOOR(1+RAND()*10),
    'Lagos','Abuja','Kano','Enugu','Calabar',
    'Makurdi','Ibadan','Kaduna','Port Harcourt','Owerri'),
CONCAT('Manager_',id)
FROM
(
    SELECT @row:=@row+1 id
    FROM information_schema.columns,
         (SELECT @row:=0)x
    LIMIT 30
)t;


NSERT INTO transactions
    (transaction_id, account_id, transaction_date,
     transaction_type, amount, channel)
SELECT
    n.id,

INSERT INTO transactions
    (transaction_id, account_id, transaction_date,
     transaction_type, amount, channel)
SELECT
    n,
    a.account_id,
    DATE_ADD('2020-01-01',
        INTERVAL FLOOR(RAND() * 1500) DAY),
    ELT(FLOOR(1 + RAND() * 4),
        'Deposit', 'Withdrawal', 'Transfer', 'Payment'),
    ROUND(10 + RAND() * 5000, 2),
    ELT(FLOOR(1 + RAND() * 4),
        'ATM', 'Mobile App', 'Internet Banking', 'Branch')
FROM (
    SELECT ones.n + tens.n * 10
         + hundreds.n * 100
         + thousands.n * 1000 + 1 AS n
    FROM
        (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2
         UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL
         SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7
         UNION ALL SELECT 8 UNION ALL SELECT 9) ones
    CROSS JOIN
        (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2
         UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL
         SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7
         UNION ALL SELECT 8 UNION ALL SELECT 9) tens
    CROSS JOIN
        (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2
         UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL
         SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7
         UNION ALL SELECT 8 UNION ALL SELECT 9) hundreds
    CROSS JOIN
        (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2
         UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL
         SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7
         UNION ALL SELECT 8 UNION ALL SELECT 9) thousands
) nums
JOIN (
    SELECT account_id,
           ROW_NUMBER() OVER (ORDER BY account_id) AS rn
    FROM accounts
) a
    ON a.rn = MOD(nums.n - 1, 3776) + 1
WHERE nums.n <= 1000;


INSERT INTO loans (
    loan_id,
    customer_id,
    loan_type,
    loan_amount,
    interest_rate,
    loan_start_date,
    loan_status
)
SELECT
    t.id,
    (SELECT customer_id
     FROM customers
     ORDER BY RAND()
     LIMIT 1),
    ELT(
        FLOOR(1 + RAND() * 4),
        'Personal Loan',
        'Mortgage',
        'Car Loan',
        'Business Loan'
    ),
    ROUND(1000 + RAND() * 200000, 2),
    ROUND(3 + RAND() * 12, 2),
    DATE_ADD(
        '2018-01-01',
        INTERVAL FLOOR(RAND() * 2000) DAY
    ),
    ELT(
        FLOOR(1 + RAND() * 3),
        'Active',
        'Completed',
        'Defaulted'
    )
FROM (
    SELECT @loan_id := @loan_id + 1 AS id
    FROM information_schema.columns,
         (SELECT @loan_id := 0) AS init
    LIMIT 3000
) AS t;


INSERT INTO employees (
    employee_id,
    branch_id,
    employee_name,
    position,
    salary
)
SELECT
    t.id,
    (SELECT branch_id
     FROM branches
     ORDER BY RAND()
     LIMIT 1),
    CONCAT('Employee_', t.id),
    ELT(
        FLOOR(1 + RAND() * 4),
        'Manager',
        'Teller',
        'Analyst',
        'Support'
    ),
    ROUND(30000 + RAND() * 70000, 2)
FROM (
    SELECT @employee_id := @employee_id + 1 AS id
    FROM information_schema.columns,
         (SELECT @employee_id := 0) AS init
    LIMIT 200
) AS t;

