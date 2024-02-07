DROP DATABASE IF EXISTS seminar3;
CREATE DATABASE seminar3;
USE seminar3;
-- DROP TABLE IF EXISTS example3;
CREATE TABLE example3
(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(45) NOT NULL,
	surname VARCHAR(45) NOT NULL,
	speciality VARCHAR(45),
	seniority INT,
	salary INT,
	age INT
);

INSERT INTO example3 
(name, surname, speciality, seniority, salary, age)
VALUES 
('Мария', 'Андрианова', 'начальник', 40, 100000, 60),
('Кирилл', 'Константинов', 'инженер', 2, 70000, 29),
('Максим', 'Горячев', 'инженер', 40, 30000, 59),
('Варвара', 'Уварова', 'рабочий', 20, 25000, 40),
('Арсений', 'Шилов', 'рабочий', 40, 30000, 59),
('Регина', 'Аксенова', 'уборщик', 8, 19000, 28),
('Мария', 'Лапина', 'рабочий', 5, 15000, 25),
('Мария', 'Алешина', 'рабочий', 2, 11000, 19),
('Игорь', 'Румянцев', 'уборщик', 3, 12000, 24),
('Ева', 'Гришина', 'начальник', 8, 70000, 49);

-- Сортировка по возрасту:
SELECT * 
	FROM example3 
	ORDER BY age DESC;  

-- Все записи + сортировка по полю "name":
SELECT * 
	FROM example3 
	ORDER BY name;  

-- Вывести записи полей "name", "surname" и "age" + сортировка по полю "name":
SELECT name, surname, age 
	FROM example3 
	ORDER BY name; 

-- Cортировка по полям "name" и "age" по убыванию:
SELECT * 
	FROM example3 
	ORDER BY name, age DESC;  

-- Вывести уникальные значения полей "name":
SELECT DISTINCT id, name 
	FROM example3
	ORDER BY name; 

-- 2. Сортировка записей по возрастанию поля "id",
-- Вывести первые две записи данной выборки:
SELECT * 
	FROM example3	
	ORDER BY id LIMIT 2; 
/*
-- 3. Сортировка записей по возрастанию поля "id",
-- Пропустить первые 4 строки данной выборки и извлечь следующие 3 строки:
SELECT * 
	FROM example3	
	ORDER BY id LIMIT 4, 3; 
  */  
-- 4. Сортировка записей по убыванию поля "id",
-- Пропустить 2 строки данной выборки и извлечь следующие 3 строки:
SELECT * 
	FROM example3	
	ORDER BY id DESC LIMIT 2, 3; 
    
-- Найдите количество сотрудников с должностью "рабочий":
SELECT COUNT(*) AS "количество сотрудников"
	FROM example3
	WHERE speciality = 'рабочий'; 
    
-- Посчитайте ежемесячную зарплату начальников:
SELECT SUM(salary) AS "зарплата начальников"
	FROM example3
	WHERE speciality = 'начальник'; 
    
-- Вывести средний возраст сотрудников, у которых зп больше 30 000:
SELECT AVG(age) AS "средний возраст сотрудников, у которых зп больше 30 000"
	FROM example3
	WHERE salary > 30000; 

-- Вывести максимальную и минимальную зп:
SELECT MAX(salary) AS "максимальная зп", MIN(salary) AS "минимальная зп"
	FROM example3;
    
CREATE TABLE whriters_work
(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    work_date DATE,
    pages INT	
);
INSERT INTO whriters_work 
(name, work_date, pages)
VALUES 
('John', "2007-01-24", 250),
('Ram', "2007-05-27", 220),
('Jack', "2007-05-06", 170),
('Jack', "2007-04-06", 100),
('Jill', "2007-04-06", 220),
('Zara', "2007-06-06", 300),
('Zara', "2007-02-06", 350);

-- Вывести общее кол-во напечатанных страниц каждым сотрудником:
SELECT name, SUM(pages) AS Page_sum  
	FROM whriters_work
	GROUP BY name
	ORDER BY Page_sum DESC;

-- Посчитать страницы за каждый день:
SELECT work_date, SUM(pages) AS Page_sum_day
	FROM whriters_work
    GROUP BY work_date
	ORDER BY Page_sum_day DESC;

-- Найти среднее арифметическое по кол-ву страниц, напечатанных сотрудниками за каждый день:
SELECT work_date, AVG(pages) AS Page_AVG_day
	FROM whriters_work
    GROUP BY work_date
	ORDER BY Page_AVG_day DESC;
    
/* 
Сгруппируйте данные о сотрудниках по возрасту:
1 группа - младше 20 лет;
2 группа - от 20 до 40 лет;
3 группа - старше 40 лет;
Для каждой группы найдите суммарную зарплату
*/
SELECT name_age, SUM(salary)
	FROM 
		(SELECT salary,
			CASE
				WHEN age < 25 THEN 'Младше 20 лет'
                WHEN age BETWEEN 25 AND 40 THEN 'от 20 до 40 лет'
                WHEN age > 40 THEN 'Cтарше 40 лет'
                ELSE 'Не определено'
			END AS name_age
		FROM example3 ) AS List
    GROUP BY name_age;
    
-- Выведите id сотрудников, которыен напечатали более 500 страниц за все дни:
SELECT name
	FROM whriters_work
    GROUP BY name 
    HAVING SUM(pages) > 500;
    
/*
Выведите дни, когда работало более 3 сотрудников.
Также укажите кол-во сотрудниковЮ которые работали в выбраные дни. 
*/
SELECT work_date, COUNT(pages) AS count_pages
	FROM whriters_work
    GROUP BY work_date 
    HAVING count_pages > 1;
    
-- Выведите должности, у которых средняя зп более 30 000:
SELECT speciality AS salary_
	FROM example3
    GROUP BY speciality 
    HAVING AVG(salary) > 30000;
    
    
SELECT * FROM example3;

SELECT COUNT(*)
	FROM example3
    WHERE speciality = 'рабочий' AND age BETWEEN 24 AND 49;
    
SELECT COUNT(*)
	FROM 
		(SELECT DISTINCT speciality FROM example3) AS List;

SELECT DISTINCT speciality
	FROM 
		(SELECT age, speciality
			FROM example3
            GROUP BY age, speciality 
            HAVING AVG(age) < 30) AS List;  
            
SELECT age, speciality
	FROM example3
    GROUP BY age, speciality 
    HAVING AVG(age) < 30;
    
    
SELECT DISTINCT speciality
	FROM example3;
	-- WHERE age < 30;
    
SELECT age, speciality
    FROM 
		(SELECT DISTINCT speciality FROM example3) AS List
	GROUP BY speciality, age 
    HAVING AVG(age) < 30;
	-- WHERE age < 30;
    

SELECT age, speciality
	FROM example3
    GROUP BY age, speciality 
    HAVING AVG(age) < 30;

/* 
Сгруппируйте данные о сотрудниках по возрасту:
1 группа - младше 20 лет;
2 группа - от 20 до 40 лет;
3 группа - старше 40 лет;
Для каждой группы найдите суммарную зарплату
*/

SELECT name_age, AVG(salary)
	FROM 
		(SELECT salary,
			CASE
				WHEN age < 25 THEN 'Младше 20 лет'
                WHEN age BETWEEN 25 AND 40 THEN 'от 20 до 40 лет'
                WHEN age > 40 THEN 'Cтарше 40 лет'
                ELSE 'Не определено'
			END AS name_age
		FROM example3 ) AS List
    GROUP BY name_age;

SELECT AVG(age) 
	FROM example3
	IF (age < 30);
	

    
  