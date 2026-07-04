--BÖLÜMLER
INSERT INTO Departments (DepartmentName) VALUES 
('Bilgisayar Mühendisliği'),
('Elektrik-Elektronik Mühendisliği'),
('Makine Mühendisliği'),
('Matematik'),
('İstatistik');
GO

--ÖĞRENCİLER
INSERT INTO Students (FullName, Email, City, EnrollmentYear, DepartmentID) VALUES
('Burak Yılmaz', 'burak.yilmaz@example.com', 'İstanbul', 2020, 1),
('Ayşe Demir', 'ayse.demir@example.com', 'Ankara', 2021, 2),
('Yiğit Öz', 'yigit.oz@example.com', 'Bursa', 2020, 3),
('Beren Yavuz', 'beren.yavuz@example.com', 'İzmir', 2022, 4),
('Defne Yıldız', 'defne.yildiz@example.com', 'Antalya', 2021, 5);
GO

--ÖĞRETİM ÜYELERİ
INSERT INTO Instructors (FullName, Title, Email, DepartmentID) VALUES
('Ali Vefa','Prof. Dr.','ali.vefa@example.com',1),
('Selin Kaya','Doç. Dr.','selin.kaya@example.com',2),
('Emre Yıldırım','Dr. Öğr. Üyesi','emre.yildirim@example.com',3),
('Arda Yılmaz','Prof. Dr.','arda.yilmaz@example.com',4),
('Ceren Demir','Doç. Dr.','ceren.demir@example.com',5);
GO

--DERSLER
INSERT INTO Courses (CourseName, Credit, InstructorID, DepartmentID) VALUES
('Veri Yapıları', 4, 1, 1),
('Algoritmalar', 3, 1, 1),
('Elektrik Devreleri', 3, 2, 2),
('Lineer Cebir', 3, 4, 4),
('Olasılık ve İstatistik', 3, 5, 5);
GO

--DERS KAYITLARI/NOTLAR
INSERT INTO Enrollments (StudentID, CourseID, Semester, Grade) VALUES
(1, 1, '2025-Güz', 85),
(1, 2, '2025-Güz', 90),
(2, 3, '2025-Güz', NULL),
(3, 4, '2024-Bahar', 92),
(4, 5, '2025-Güz', 80),
(5, 1, '2024-Bahar', 88),
(2, 4, '2025-Güz', 75),
(3, 5, '2025-Güz', NULL),
(4, 2, '2024-Bahar', 95),
(5, 3, '2025-Güz', 80);
GO


