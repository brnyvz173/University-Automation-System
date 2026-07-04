/*===========================================================
    University Automation System
    File: views.sql
    Description: SQL Views
===========================================================*/

USE UniAutomationDB;
GO

/*===========================================================
    1. Student Details View
===========================================================*/

CREATE VIEW vw_StudentDetails AS
SELECT
    s.StudentID,
    s.FullName,
    s.Email,
    s.City,
    s.EnrollmentYear,
    d.DepartmentName
FROM Students s
INNER JOIN Departments d
ON s.DepartmentID = d.DepartmentID;
GO


/*===========================================================
    2. Course Details View
===========================================================*/

CREATE VIEW vw_CourseDetails AS
SELECT
    c.CourseID,
    c.CourseName,
    c.Credit,
    i.FullName AS Instructor,
    d.DepartmentName
FROM Courses c
INNER JOIN Instructors i
ON c.InstructorID = i.InstructorID
INNER JOIN Departments d
ON c.DepartmentID = d.DepartmentID;
GO


/*===========================================================
    3. Student Course Information
===========================================================*/

CREATE VIEW vw_StudentCourseInfo AS
SELECT
    s.FullName AS StudentName,
    c.CourseName,
    e.Semester,
    e.Grade
FROM Enrollments e
INNER JOIN Students s
ON e.StudentID = s.StudentID
INNER JOIN Courses c
ON e.CourseID = c.CourseID;
GO


/*===========================================================
    4. Department Statistics
===========================================================*/

CREATE VIEW vw_DepartmentStatistics AS
SELECT
    d.DepartmentName,
    COUNT(s.StudentID) AS StudentCount
FROM Departments d
LEFT JOIN Students s
ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentName;
GO
