CREATE DATABASE seminar1;
USE seminar1;
-- DROP TABLE IF EXISTS student;

CREATE TABLE student
(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name_student VARCHAR(45) NOT NULL,
course_name VARCHAR(45) NOT NULL,
dae_of_birth DATE NOT NULL,
email VARCHAR(45),
phone_number BIGINT UNSIGNED
);

CREATE TABLE teacher
(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name_teacher VARCHAR(45) NOT NULL,
post VARCHAR(45) NOT NULL,
course_name VARCHAR(45) NOT NULL
);

CREATE TABLE course
(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name_student VARCHAR(45) NOT NULL,
name_teacher VARCHAR(45) NOT NULL,
course_name VARCHAR(45) NOT NULL
);

INSERT INTO student 
(name_student, course_name, dae_of_birth, email, phone_number)
VALUES 
('Мария', 'Математика', '1999-05-15', 'mariya@gmail.com', '89265554433'),
('Лариса', 'Английский', '1979-04-13', 'larisa@gmail.com', '89263214513'),
('Сергей', 'Английский', '1985-10-02', 'sergey@gmail.com', '89264876453'),
('Антон', 'История', '2002-04-22', 'anton@gmail.com', '89266754234');

INSERT INTO teacher
(name_teacher, post, course_name)
VALUES 
('Вася', 'Профессор', 'История'),
('Петя', 'Преподаватель', 'Английский'),
('Иван', 'Доцент', 'Математика');

INSERT INTO course
(name_student, name_teacher, course_name)
VALUES 
('Мария', 'Вася', 'История'),
('Лариса', 'Петя', 'Английский'),
('Сергей', 'Иван', 'Математика');

SELECT * FROM student 
WHERE name_student = 'Антон';

SELECT * FROM student 
WHERE name_student LIKE '%а%';

CREATE TABLE workers
(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name_worker VARCHAR(45) NOT NULL,
dept VARCHAR(45) NOT NULL,
salary INT NOT NULL
);

INSERT INTO workers
(name_worker, dept, salary)
VALUES 
('Семен', 'Логистика', 97000),
('Арсений', 'Оплата труда', 120000),
('Пётр', 'IT', 88000);

SELECT * FROM workers 
WHERE salary > 90000;

SELECT name_worker FROM workers 
WHERE dept = 'IT';

SELECT name_worker FROM workers 
WHERE dept != 'Оплата труда';
-- WHERE dept <> 'Оплата труда';

