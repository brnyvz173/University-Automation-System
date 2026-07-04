/*===========================================================
    University Automation System
    File: triggers.sql
    Description: SQL Triggers
===========================================================*/

USE UniAutomationDB;
GO

/*===========================================================
    1. Trigger: New Student Added
===========================================================*/

CREATE TRIGGER trg_NewStudentAdded
ON Students
AFTER INSERT
AS
BEGIN
    PRINT 'A new student has been successfully added.';
END;
GO


/*===========================================================
    2. Trigger: Grade Updated
===========================================================*/

CREATE TRIGGER trg_GradeUpdated
ON Enrollments
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Grade)
    BEGIN
        PRINT 'Student grade has been updated.';
    END
END;
GO


/*===========================================================
    3. Trigger: Prevent Department Deletion
===========================================================*/

CREATE TRIGGER trg_PreventDepartmentDelete
ON Departments
INSTEAD OF DELETE
AS
BEGIN
    PRINT 'Departments cannot be deleted.';
END;
GO
