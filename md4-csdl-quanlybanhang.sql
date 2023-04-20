drop database QuanLySinhVien;
USE QuanLySinhVien;

CREATE TABLE Class
(
    Class_ID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME    NOT NULL,
    Status    BIT
);
CREATE TABLE Student
(
    Student_Id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Student_Name VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
    Class_Id     INT         NOT NULL,
    FOREIGN KEY (Class_Id) REFERENCES Class (Class_ID)
);
CREATE TABLE Subject
(
    Sub_Id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Sub_Name VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT                  DEFAULT 1
);

CREATE TABLE Mark
(
    MarkId    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubId     INT NOT NULL,
    Student_Id INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (Sub_Id, Student_Id),
    FOREIGN KEY (Sub_Id) REFERENCES Subject (Sub_Id),
    FOREIGN KEY (Student_Id) REFERENCES Student (Student_Id)
);
select * from student;
select * from mark;
select*from subject;
select*from class;

select * from student where status = true;
SELECT *FROM Subject WHERE Credit < 2;
SELECT S.student_id, S.Student_name, C.Class_name
FROM Student S join Class C on S.Class_Id = C.Class_ID ;
SELECT S.Student_Id, S.Student_Name, C.Class_Name
FROM Student S join Class C on S.Class_Id = C.Class_ID
WHERE S.Student_Name = "nguyen minh quan";

SELECT S.Student_Id, S.Student_Name, `Subject`.Subject_Name, M.Mark
FROM Student S join Mark M on S.Student_Id = M.Student_Id join `Subject` Sub on M.Subject_Id = Sub.Sub_Id;
use quanlysinhvien;
select * from class;
select * from mark;
select * from student;
select * from subject;
-- ss3 thuc hanh
SELECT Address, COUNT(Student_Id) AS 'Số lượng học viên' FROM Student GROUP BY Address;
SELECT S.Student_Id,S.Student_Name, AVG(Mark)
FROM Student S join Mark M on S.Student_Id = M.Student_Id
GROUP BY S.Student_Id, S.Student_Name;

SELECT S.Student_Id,S.Student_Name, AVG(Mark)
FROM Student S join Mark M on S.Student_Id = M.Student_Id
GROUP BY S.Student_Id, S.Student_Name;

SELECT S.Student_Id,S.Student_Name, AVG(Mark)
FROM Student S join Mark M on S.Student_Id = M.Student_Id
GROUP BY S.Student_Id, S.Student_Name
HAVING AVG(Mark) > 15;

SELECT S.Student_Id, S.Student_Name, AVG(Mark)
FROM Student S join Mark M on S.Student_Id = M.Student_Id
GROUP BY S.Student_Id, S.Student_Name;

SELECT S.Student_Id, S.Student_Name, AVG(Mark)
FROM Student S join Mark M on S.Student_Id = M.Student_Id
GROUP BY S.Student_Id, S.Student_Name
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.Student_Id);

-- ss3 bai tap

select * from subject;
select * from mark;
select *from `subject` where credit = (select max(credit) from `subject`);
select `subject`.subject_name from `subject` where credit = (select max(credit) from `subject`);
select s.student_name,m.mark from student s join mark m order by m.mark desc;
delete from mark where mark_id =(3,4,5);
















