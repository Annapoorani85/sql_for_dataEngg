# Introduction to SQL and the SELECT Statement

If you're starting SQL from scratch, the best Phase 1 topic is:

> **Understanding Databases, Tables, and the SELECT Statement**

Everything else in SQL (filtering, joins, aggregations, subqueries, optimization) builds on this foundation.

---

# 1. What is SQL?

**SQL** stands for **Structured Query Language**.

It is the language used to communicate with relational databases.

## Example Table: Employees

| EmployeeID | Name  | Department | Salary |
| ---------- | ----- | ---------- | ------ |
| 1          | Anu   | IT         | 60000  |
| 2          | Ravi  | HR         | 50000  |
| 3          | Priya | Finance    | 70000  |

This table is stored inside a database.

SQL helps us:

* Read data
* Insert data
* Update data
* Delete data
* Create tables

---

# Why SQL is Used

SQL is used in almost every software application that stores data.

| Application    | Data Stored            |
| -------------- | ---------------------- |
| Amazon         | Products, Orders       |
| Netflix        | Movies, Users          |
| Banking System | Accounts, Transactions |
| Hospital       | Patients, Doctors      |
| LinkedIn       | Profiles, Connections  |

SQL allows applications to retrieve and manipulate that data.

---

# Real-World Example

Imagine you work at a company.

### Manager asks: "Show me all employees."

```sql
SELECT * FROM Employees;
```

### Manager asks: "Show only employee names."

```sql
SELECT Name FROM Employees;
```

### Manager asks: "Show employee names and salaries."

```sql
SELECT Name, Salary
FROM Employees;
```

This is the primary purpose of `SELECT`.

---

# Understanding Database Structure

A database contains tables.

Example database:

```text
CompanyDB
```

Tables:

* Employees
* Departments
* Projects

## Employees Table

| EmployeeID | Name  | Department | Salary |
| ---------- | ----- | ---------- | ------ |
| 1          | Anu   | IT         | 60000  |
| 2          | Ravi  | HR         | 50000  |
| 3          | Priya | Finance    | 70000  |

## Important Terminology

| Term      | Meaning                        |
| --------- | ------------------------------ |
| Database  | Collection of tables           |
| Table     | Collection of rows and columns |
| Row       | One record                     |
| Column    | One attribute                  |
| SQL Query | Command sent to database       |

### Example Row

| EmployeeID | Name |
| ---------- | ---- |
| 1          | Anu  |

This entire record is one **row**.

`EmployeeID` and `Name` are two different **columns**.

---

# First SQL Query

```sql
SELECT * FROM Employees;
```

## Syntax Breakdown

### SELECT

Means:

> "I want to retrieve data."

### *

Means:

> "All columns."

### FROM Employees

Means:

> "Get the data from Employees table."

### Complete Meaning

```sql
SELECT * FROM Employees;
```

Retrieve all columns from the Employees table.

---

# Example 1: Retrieve Everything

```sql
SELECT *
FROM Employees;
```

### Output

| EmployeeID | Name  | Department | Salary |
| ---------- | ----- | ---------- | ------ |
| 1          | Anu   | IT         | 60000  |
| 2          | Ravi  | HR         | 50000  |
| 3          | Priya | Finance    | 70000  |

---

# Example 2: Retrieve Specific Columns

```sql
SELECT Name, Salary
FROM Employees;
```

### Output

| Name  | Salary |
| ----- | ------ |
| Anu   | 60000  |
| Ravi  | 50000  |
| Priya | 70000  |

---

# Why Avoid SELECT *

Many beginners use:

```sql
SELECT * FROM Employees;
```

This works fine.

However, in production:

```sql
SELECT * FROM HugeTable;
```

is generally considered a bad practice because it:

* Retrieves unnecessary columns
* Uses more memory
* Uses more network bandwidth
* Slows down queries

### Better Approach

```sql
SELECT Name, Salary
FROM Employees;
```

Fetch only the columns you need.

---

# Column Order

You control the order of columns in the output.

```sql
SELECT Salary, Name
FROM Employees;
```

### Output

| Salary | Name  |
| ------ | ----- |
| 60000  | Anu   |
| 50000  | Ravi  |
| 70000  | Priya |

Notice the columns appear in the requested order.

---

# Using Aliases

An **alias** is a temporary column name.

## Syntax

```sql
SELECT column_name AS alias_name
FROM table_name;
```

### Example

```sql
SELECT Name AS EmployeeName
FROM Employees;
```

### Output

| EmployeeName |
| ------------ |
| Anu          |
| Ravi         |
| Priya        |

---

# Multiple Aliases

```sql
SELECT
    Name AS EmployeeName,
    Salary AS MonthlySalary
FROM Employees;
```

### Output

| EmployeeName | MonthlySalary |
| ------------ | ------------- |
| Anu          | 60000         |
| Ravi         | 50000         |
| Priya        | 70000         |

---

# Calculated Columns

SQL can perform calculations.

```sql
SELECT
    Name,
    Salary,
    Salary + 5000 AS RevisedSalary
FROM Employees;
```

### Output

| Name  | Salary | RevisedSalary |
| ----- | ------ | ------------- |
| Anu   | 60000  | 65000         |
| Ravi  | 50000  | 55000         |
| Priya | 70000  | 75000         |

---

# How SQL Executes Internally

Consider:

```sql
SELECT Name
FROM Employees;
```

## Step 1: Parsing

The database parser checks the syntax.

```sql
SELECT Name
FROM Employees;
```

If valid, execution continues.

---

## Step 2: Optimization

The optimizer creates an execution plan.

Example:

```text
Read Employees table
        ↓
Find Name column
        ↓
Return result
```

---

## Step 3: Data Access

The storage engine reads data pages.

Database tables are stored on disk in pages or blocks.

The database fetches the required pages.

---

## Step 4: Return Results

```text
Anu
Ravi
Priya
```

---

# Common Beginner Mistakes

## Mistake 1: Misspelled Column

### Wrong

```sql
SELECT Nam
FROM Employees;
```

### Error

```text
Column 'Nam' does not exist
```

---

## Mistake 2: Wrong Table Name

### Wrong

```sql
SELECT *
FROM Employee;
```

If the actual table is `Employees`, an error occurs.

---

## Mistake 3: Forgetting a Comma

### Wrong

```sql
SELECT Name Salary
FROM Employees;
```

### Correct

```sql
SELECT Name, Salary
FROM Employees;
```

---

## Mistake 4: Using Quotes Around Column Names

### Wrong

```sql
SELECT 'Name'
FROM Employees;
```

### Output

```text
Name
Name
Name
```

SQL treats `'Name'` as a string literal.

### Correct

```sql
SELECT Name
FROM Employees;
```

---

# Edge Cases

## Selecting the Same Column Twice

```sql
SELECT Name, Name
FROM Employees;
```

### Output

| Name  | Name  |
| ----- | ----- |
| Anu   | Anu   |
| Ravi  | Ravi  |
| Priya | Priya |

Valid, but usually unnecessary.

---

## Selecting Constant Values

```sql
SELECT Name,
       'India' AS Country
FROM Employees;
```

### Output

| Name  | Country |
| ----- | ------- |
| Anu   | India   |
| Ravi  | India   |
| Priya | India   |

Useful in reporting.

---

# SELECT vs Other SQL Commands

| Command | Purpose      |
| ------- | ------------ |
| SELECT  | Read data    |
| INSERT  | Add data     |
| UPDATE  | Modify data  |
| DELETE  | Remove data  |
| CREATE  | Create table |
| DROP    | Delete table |

## SELECT

```sql
SELECT * FROM Employees;
```

## INSERT

```sql
INSERT INTO Employees
VALUES (4, 'John', 'IT', 65000);
```

## UPDATE

```sql
UPDATE Employees
SET Salary = 70000
WHERE EmployeeID = 1;
```

## DELETE

```sql
DELETE FROM Employees
WHERE EmployeeID = 1;
```

---

# Interview Questions

## 1. What is SQL?

A language used to manage and query relational databases.

---

## 2. Difference Between Database and Table?

**Database:** Container of tables.

**Table:** Collection of rows and columns.

---

## 3. What Does SELECT * Do?

Returns all columns from a table.

---

## 4. Why Avoid SELECT * in Production?

* More I/O
* More memory consumption
* More network traffic
* Harder maintenance

---

## 5. What is an Alias?

A temporary name assigned to a column or table.

Example:

```sql
SELECT Salary AS MonthlySalary
FROM Employees;
```

---

## 6. Can SELECT Return Values Not Stored in the Table?

Yes.

```sql
SELECT Name,
       Salary + 1000
FROM Employees;
```

---

## 7. What Happens Internally When SELECT Runs?

1. Parsing
2. Validation
3. Optimization
4. Execution
5. Return Results

---

# Best Practices

## 1. Avoid SELECT *

### Preferred

```sql
SELECT Name, Salary
FROM Employees;
```

---

## 2. Use Meaningful Aliases

### Good

```sql
SELECT Salary AS MonthlySalary;
```

### Bad

```sql
SELECT Salary AS S;
```

---

## 3. Format Queries Clearly

### Good

```sql
SELECT
    Name,
    Salary
FROM Employees;
```

### Bad

```sql
SELECT Name,Salary FROM Employees;
```

---

## 4. Retrieve Only Needed Data

### Good

```sql
SELECT Name
FROM Employees;
```

### Bad

```sql
SELECT *
FROM Employees;
```

when only `Name` is needed.

---

# Summary

The `SELECT` statement is the foundation of SQL. Before learning filtering, joins, aggregations, and optimization, you should be comfortable with:

* Retrieving all columns
* Retrieving specific columns
* Using aliases
* Creating calculated columns
* Understanding how SQL executes queries
* Following SQL best practices

Mastering `SELECT` makes every advanced SQL topic easier to learn.
