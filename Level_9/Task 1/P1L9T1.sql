CREATE DATABASE University;
GO
USE University;
GO
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) UNIQUE NOT NULL,
    HeadOfDepartment NVARCHAR(100)
);
GO
CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    DepartmentID INT,  
    Rank NVARCHAR(50),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON DELETE SET NULL
);
GO
CREATE TABLE Student (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    DOB DATE,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    Address NVARCHAR(255),
    Major NVARCHAR(50)
);
GO
CREATE TABLE Course (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    Credits INT CHECK (Credits > 0),
    DepartmentID INT,  
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID) ON DELETE CASCADE
);
GO
CREATE TABLE Classroom (
    ClassroomID INT PRIMARY KEY IDENTITY(1,1),
    Building NVARCHAR(50) NOT NULL,
    RoomNumber NVARCHAR(20) NOT NULL UNIQUE,
    Capacity INT CHECK (Capacity > 0)
);
GO
CREATE TABLE Section (
    SectionID INT PRIMARY KEY IDENTITY(1,1),
    CourseID INT, 
    Semester NVARCHAR(20),
    Year INT CHECK (Year >= 2000),
    InstructorID INT,  
    ClassroomID INT,  
    Schedule NVARCHAR(50),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE,
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID) ON DELETE SET NULL,
    FOREIGN KEY (ClassroomID) REFERENCES Classroom(ClassroomID) ON DELETE SET NULL
);
GO
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,  
    SectionID INT,  
    Grade NVARCHAR(2) CHECK (Grade IN ('A', 'B', 'C', 'D', 'F', 'W', 'I')),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (SectionID) REFERENCES Section(SectionID) ON DELETE CASCADE
);
GO
USE University;
GO