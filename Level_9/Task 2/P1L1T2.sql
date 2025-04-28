CREATE DATABASE BankDB;
GO
USE BankDB;
GO
CREATE TABLE Branch (
    BranchID INT PRIMARY KEY IDENTITY(1,1),
    BranchName NVARCHAR(100) NOT NULL,
    Address NVARCHAR(255),
    PhoneNumber NVARCHAR(20)
);
GO
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(20),
    Position NVARCHAR(50),
    Salary DECIMAL(18,2),
    BranchID INT,  -- Foreign Key to Branch
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);
GO
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Address NVARCHAR(255),
    PhoneNumber NVARCHAR(20),
    Email NVARCHAR(100),
    DateOfBirth DATE,
    SSN NVARCHAR(20),
    Gender NVARCHAR(10)
);
GO
CREATE TABLE Account (
    AccountID INT PRIMARY KEY IDENTITY(1,1),
    AccountNumber NVARCHAR(20) UNIQUE NOT NULL,
    AccountType NVARCHAR(50),
    Balance DECIMAL(18,2),
    DateOpened DATE,
    CustomerID INT,  -- Foreign Key to Customer
    BranchID INT,    -- Foreign Key to Branch
    EmployeeID INT,  -- Foreign Key to Employee
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
GO
CREATE TABLE [Transaction] (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    TransactionDate DATE,
    Amount DECIMAL(18,2),
    TransactionType NVARCHAR(50),  -- Deposit, Withdrawal, Transfer
    AccountID INT,  -- Foreign Key to Account
    FromAccountID INT,  -- Foreign Key for transfer (if applicable)
    ToAccountID INT,    -- Foreign Key for transfer (if applicable)
    EmployeeID INT,     -- Foreign Key to Employee
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
    FOREIGN KEY (FromAccountID) REFERENCES Account(AccountID),
    FOREIGN KEY (ToAccountID) REFERENCES Account(AccountID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
GO
CREATE TABLE Loan (
    LoanID INT PRIMARY KEY IDENTITY(1,1),
    LoanAmount DECIMAL(18,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE,
    CustomerID INT,  -- Foreign Key to Customer
    EmployeeID INT,  -- Foreign Key to Employee (Loan Officer)
    BranchID INT,    -- Foreign Key to Branch
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);
GO
CREATE TABLE AccountHolder (
    CustomerID INT,  -- Foreign Key to Customer
    AccountID INT,   -- Foreign Key to Account
    PRIMARY KEY (CustomerID, AccountID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);
GO