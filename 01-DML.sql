# SQL Practice Database Setup

```sql
-- =====================================================
-- DATABASE CREATION
-- =====================================================

CREATE DATABASE SQLPractice;

-- MySQL Only
USE SQLPractice;

-- =====================================================
-- TABLE: Departments
-- =====================================================

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

-- =====================================================
-- TABLE: Employees
-- =====================================================

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(10,2),
    ManagerID INT,

    CONSTRAINT FK_Employee_Department
        FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);

-- =====================================================
-- INSERT DEPARTMENTS
-- =====================================================

INSERT INTO Departments
(DepartmentID, DepartmentName)
VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Finance'),
(40, 'Marketing');

-- =====================================================
-- INSERT EMPLOYEES
-- =====================================================

INSERT INTO Employees
(EmployeeID, Name, DepartmentID, Salary, ManagerID)
VALUES
(1, 'Anu',    10, 60000, 3),
(2, 'Ravi',   20, 50000, 3),
(3, 'Priya',  10, 70000, NULL),
(4, 'Kiran',  30, 80000, 3),
(5, 'Meena',  20, 55000, 2),
(6, 'Arjun',  10, 65000, 3);

-- =====================================================
-- SELF REFERENCING FOREIGN KEY
-- =====================================================

ALTER TABLE Employees
ADD CONSTRAINT FK_Employee_Manager
FOREIGN KEY (ManagerID)
REFERENCES Employees(EmployeeID);

-- =====================================================
-- ADDITIONAL SAMPLE DATA
-- =====================================================

INSERT INTO Employees
(EmployeeID, Name, DepartmentID, Salary, ManagerID)
VALUES
(7, 'Sneha', 10, 72000, 3),
(8, 'Rahul', 20, 58000, 2),
(9, 'Vijay', 30, 85000, 4),
(10, 'Pooja', 10, 61000, 3);

-- =====================================================
-- VERIFICATION QUERIES
-- =====================================================

SELECT *
FROM Departments;

SELECT *
FROM Employees;
```

## Final Data Snapshot

### Departments

| DepartmentID | DepartmentName |
| ------------ | -------------- |
| 10           | IT             |
| 20           | HR             |
| 30           | Finance        |
| 40           | Marketing      |

### Employees

| EmployeeID | Name  | DepartmentID | Salary | ManagerID |
| ---------- | ----- | ------------ | ------ | --------- |
| 1          | Anu   | 10           | 60000  | 3         |
| 2          | Ravi  | 20           | 50000  | 3         |
| 3          | Priya | 10           | 70000  | NULL      |
| 4          | Kiran | 30           | 80000  | 3         |
| 5          | Meena | 20           | 55000  | 2         |
| 6          | Arjun | 10           | 65000  | 3         |
| 7          | Sneha | 10           | 72000  | 3         |
| 8          | Rahul | 20           | 58000  | 2         |
| 9          | Vijay | 30           | 85000  | 4         |
| 10         | Pooja | 10           | 61000  | 3         |

```
```
