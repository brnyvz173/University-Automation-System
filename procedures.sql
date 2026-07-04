/*===========================================================
    University Automation System
    File: procedures.sql
    Description: Stored Procedures
===========================================================*/

USE UniAutomationDB;
GO

/*===========================================================
    1. Get Student By ID
===========================================================*/

CREATE PROCEDURE sp_GetStudentByID
    @StudentID INT
AS
BEGIN
    SELECT *
    FROM Students
    WHERE StudentID = @StudentID;
END;
GO

/*===========================================================
    2. Get Courses of a Student
===========================================================*/

CREATE PROCEDURE sp_GetStudentCourses
    @StudentID INT
AS
BEGIN
    SELECT
        s.FullName AS StudentName,
        c.CourseName,
        e.Semester,
        e.Grade
    FROM Enrollments e
    INNER JOIN Students s
        ON e.StudentID = s.StudentID
    INNER JOIN Courses c
        ON e.CourseID = c.CourseID
    WHERE s.StudentID = @StudentID;
END;
GO

/*===========================================================
    3. Get Students By Department
===========================================================*/

CREATE PROCEDURE sp_GetStudentsByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT
        s.StudentID,
        s.FullName,
        s.City,
        d.DepartmentName
    FROM Students s
    INNER JOIN Departments d
        ON s.DepartmentID = d.DepartmentID
    WHERE s.DepartmentID = @DepartmentID;
END;
GO

/*===========================================================
    4. Get Average Grade of a Course
===========================================================*/

CREATE PROCEDURE sp_GetCourseAverageGrade
    @CourseID INT
AS
BEGIN
    SELECT
        c.CourseName,
        AVG(e.Grade) AS AverageGrade
    FROM Courses c
    INNER JOIN Enrollments e
        ON c.CourseID = e.CourseID
    WHERE c.CourseID = @CourseID
    GROUP BY c.CourseName;
END;
GO
