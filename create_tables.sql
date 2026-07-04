CREATE DATABASE UniAutomationDB;
GO
USE UniAutomationDB;
GO
-- 1) Bölümler Tablosu
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100) NOT NULL
);
GO

-- 2) Öğrenciler Tablosu
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    City VARCHAR(50),
    Enrollmentyear INT,
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID)
);
GO

-- 3) ÖĞRETİM ÜYELERİ TABLOSU
CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100) NOT NULL,
    Title VARCHAR(30),
    Email VARCHAR(100) UNIQUE,
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID)
);
GO

-- 4) Dersler Tablosu
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName VARCHAR(100) NOT NULL,
    Credit INT NOT NULL,
    InstructorID INT FOREIGN KEY REFERENCES Instructors(InstructorID),
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID)
);
GO

--5) DERS KAYITLARI TABLOSU
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
    CourseID INT FOREIGN KEY REFERENCES Courses(CourseID),
    Semester VARCHAR(20),
    Grade DECIMAL(4,2) NULL,
    EnrollDate DATE DEFAULT GETDATE()
);
GO
