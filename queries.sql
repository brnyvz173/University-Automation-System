/*===========================================================
    University Automation System
    File: queries.sql
    Description: SQL Query Examples
===========================================================*/

USE UniAutomationDB;
GO

/*===========================================================
    1. BASIC SELECT QUERIES
===========================================================*/

-- Tüm bölümleri listele
SELECT * FROM Departments;

-- Tüm öğrencileri listele
SELECT * FROM Students;

-- Tüm öğretim üyelerini listele
SELECT * FROM Instructors;

-- Tüm dersleri listele
SELECT * FROM Courses;

-- Tüm ders kayıtlarını listele
SELECT * FROM Enrollments;


/*===========================================================
    2. FILTERING WITH WHERE
===========================================================*/

-- İzmir'de yaşayan öğrenciler
SELECT *
FROM Students
WHERE City = 'İzmir';

-- 2022 yılında kayıt olan öğrenciler
SELECT *
FROM Students
WHERE EnrollmentYear = 2022;

-- 3 kredilik dersler
SELECT *
FROM Courses
WHERE Credit = 3;


/*===========================================================
    3. ORDER BY
===========================================================*/

-- Öğrencileri alfabetik sırala
SELECT *
FROM Students
ORDER BY FullName;

-- Dersleri krediye göre büyükten küçüğe sırala
SELECT *
FROM Courses
ORDER BY Credit DESC;


/*===========================================================
    4. INNER JOIN
===========================================================*/

-- Öğrenci ve bölümü
SELECT
    s.FullName,
    d.DepartmentName
FROM Students s
INNER JOIN Departments d
ON s.DepartmentID = d.DepartmentID;

-- Ders ve öğretim üyesi
SELECT
    c.CourseName,
    i.FullName AS Instructor
FROM Courses c
INNER JOIN Instructors i
ON c.InstructorID = i.InstructorID;

-- Öğrencilerin aldığı dersler ve notları
SELECT
    s.FullName,
    c.CourseName,
    e.Semester,
    e.Grade
FROM Enrollments e
INNER JOIN Students s
ON e.StudentID = s.StudentID
INNER JOIN Courses c
ON e.CourseID = c.CourseID;


/*===========================================================
    5. AGGREGATE FUNCTIONS
===========================================================*/

-- Toplam öğrenci sayısı
SELECT COUNT(*) AS TotalStudents
FROM Students;

-- Ortalama not
SELECT AVG(Grade) AS AverageGrade
FROM Enrollments;

-- En yüksek not
SELECT MAX(Grade) AS HighestGrade
FROM Enrollments;

-- En düşük not
SELECT MIN(Grade) AS LowestGrade
FROM Enrollments;


/*===========================================================
    6. GROUP BY
===========================================================*/

-- Her bölümde kaç öğrenci var
SELECT
    d.DepartmentName,
    COUNT(s.StudentID) AS StudentCount
FROM Departments d
LEFT JOIN Students s
ON d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentName;

-- Her öğretim üyesinin verdiği ders sayısı
SELECT
    i.FullName,
    COUNT(c.CourseID) AS CourseCount
FROM Instructors i
LEFT JOIN Courses c
ON i.InstructorID = c.InstructorID
GROUP BY i.FullName;


/*===========================================================
    7. HAVING
===========================================================*/

-- Birden fazla ders veren öğretim üyeleri
SELECT
    i.FullName,
    COUNT(c.CourseID) AS CourseCount
FROM Instructors i
INNER JOIN Courses c
ON i.InstructorID = c.InstructorID
GROUP BY i.FullName
HAVING COUNT(c.CourseID) > 1;


/*===========================================================
    8. DISTINCT
===========================================================*/

-- Öğrencilerin yaşadığı şehirler
SELECT DISTINCT City
FROM Students;

-- Dönemleri listele
SELECT DISTINCT Semester
FROM Enrollments;


/*===========================================================
    9. LIKE
===========================================================*/

-- Adında "Yılmaz" geçen öğrenciler
SELECT *
FROM Students
WHERE FullName LIKE '%Yılmaz%';

-- Adında "Veri" geçen dersler
SELECT *
FROM Courses
WHERE CourseName LIKE '%Veri%';


/*===========================================================
    10. TOP
===========================================================*/

-- İlk 3 öğrenci
SELECT TOP 3 *
FROM Students;

-- En yüksek not alan ilk 5 kayıt
SELECT TOP 5 *
FROM Enrollments
ORDER BY Grade DESC;


/*===========================================================
    11. NULL VALUES
===========================================================*/

-- Notu henüz girilmemiş öğrenciler
SELECT *
FROM Enrollments
WHERE Grade IS NULL;


/*===========================================================
    END OF FILE
===========================================================*/
