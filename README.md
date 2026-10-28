# OBank Banking Database Analysis Using MySQL

## Project Overview

This project involved creating and analysing a banking database called **OBank** using MySQL. The goal was to practise database creation, data insertion, table relationships, data validation, and SQL queries to extract useful information from banking data.

Through this project, I gained practical experience working with relational databases and using SQL to explore customer information, account balances, banking transactions, branches, loans, and employees.

## Project Objectives

- Create and populate a relational banking database.
- Organise banking information into related tables.
- Establish and work with primary and foreign key relationships.
- Validate the data to check its consistency and reliability.
- Write SQL queries to retrieve, filter, aggregate, and analyse data.
- Extract useful information that could support banking operations and decision-making.

## Tools Used

- **MySQL:** Database creation, data management, validation, and analysis.
- **SQL:** Writing queries to retrieve and analyse banking data.
- **GitHub:** Version control and project documentation.

## Database Structure

The OBank database was organised into six tables:

| Table | Purpose |
|---|---|
| `customers` | Stores customer information, including names and dates of birth. |
| `branches` | Stores information about banking branches. |
| `accounts` | Contains customer account information and balances. |
| `transactions` | Records banking transactions, including dates, types, amounts, and channels. |
| `loans` | Stores loan-related information. |
| `employees` | Contains employee information associated with bank branches. |

These tables were designed to represent related parts of a banking system, with key relationships connecting records across the database.

## Work Completed

### 1. Database and Table Creation

I created the OBank database in MySQL and wrote SQL commands to create the tables and define their structures.

### 2. Data Insertion

I populated the tables using SQL `INSERT INTO` statements. This provided practical experience working with related records and handling foreign key constraints.

### 3. Data Validation

I ran validation queries to check record counts, relationships between tables, missing values, and potential data-quality issues.

### 4. SQL Analysis

I practised writing queries to retrieve information, calculate summary statistics, group records, sort results, and identify customers based on account balances.

## SQL Skills Practised

- `CREATE DATABASE` and `CREATE TABLE`
- `INSERT INTO`
- `SELECT` and `WHERE`
- `JOIN`
- `GROUP BY` and `ORDER BY`
- Aggregate functions such as `SUM()` and `AVG()`
- Date functions, including `TIMESTAMPDIFF()` and `CURDATE()`
- `COUNT()`
- `LIMIT`
- Primary and foreign keys
- Data validation and integrity checks

## Key Findings

The following findings are based on the database validation checks completed during the project.

| Validation check | Result |
|---|---|
| Customer records | 100 |
| Account records | 3,776 |
| Transaction records | 100,000 |
| Customer-account relationships | Passed the checks performed |
| Transaction-account relationships | Passed the checks performed |
| Missing transaction dates, types, amounts, or channels | None found in the checks performed |
| Non-positive transaction amounts | None found in the checks performed |
| Duplicate transaction combinations checked | None found in the checks performed |

These results showed that the checked customer, account, and transaction data satisfied the validation rules applied during the project.

The relationship checks also provided practical experience verifying referential integrity between related tables.

*Note: These findings describe the checks performed on the practice dataset. They do not establish that every possible data-quality issue has been ruled out.*

## Business Questions Explored

The SQL analysis work included questions such as:

1. What is the average age of customers?
2. Which ten customers have the highest total account balances?
3. How can customer records be connected to their accounts?
4. How can account and transaction records be joined for analysis?
5. How can SQL aggregation and sorting be used to summarise banking information?

These questions helped me practise translating business questions into SQL queries. The average-age and top-ten-balance queries were part of the analysis work; their numerical results should be added after checking the final query outputs.

## Example SQL Queries

### Calculate Average Customer Age

```sql
SELECT AVG(
    TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())
) AS avg_age
FROM customers;
```

This query calculates the average age of customers based on their dates of birth.

### Find the Top 10 Customers by Total Account Balance

```sql
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
```

This query joins customers to their accounts, calculates each customer's combined account balance, and returns the ten highest totals.

## Challenges and Learning Experience

During the project, I worked through SQL errors, corrected queries, and addressed foreign key constraints while inserting data.

The process taught me the importance of checking table structures, ensuring that referenced records exist, validating query results, and testing relationships between tables.

I also learned that writing a query is only one part of data analysis. It is equally important to check the results and ensure that conclusions are supported by the data.

## Conclusion

The OBank project strengthened my practical understanding of MySQL and relational database management. It gave me experience creating tables, inserting data, working with relationships, validating records, and writing SQL queries to answer banking-related questions.

As I continue developing my data analytics skills, I am using projects like this to build a portfolio that demonstrates my learning and practical experience.

## Repository Contents

- `README.md` — Project overview, methodology, skills, and findings.
- `create_tables.sql` — SQL commands for creating the database tables.
- `insert_data.sql` — SQL commands for inserting the practice data.
- `queries.sql` — SQL queries used for analysis and validation.

## Author

**Data Analytics Learner**

This project is part of my ongoing journey in data analytics, where I am developing practical skills in SQL, Excel, Power BI, and data visualisation.
