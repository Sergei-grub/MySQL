/*
Задание после 3-го семинара:

Имеется таблица (сущность) с персоналом staff.
У сущности имеются следующие поля(атрибуты):
id – идентификатор;
firstname – имя;
lastname - фамилия
post - должность,
seniority – стаж;
salary – заработная плата;
age - возраст.

id firstname lastname post seniority salary age
1 Вася Петров Начальник 40 100000 60
2 Петр Власов Начальник 8 70000 30
3 Катя Катина Инженер 2 70000 19
4 Саша Сасин Инженер 12 50000 35
5 Иван Иванов Рабочий 40 30000 59
6 Петр Петров Рабочий 20 25000 40
7 Сидр Сидоров Рабочий 10 20000 35
8 Антон Антонов Рабочий 8 19000 28
9 Юрий Юрков Рабочий 5 15000 25
10 Максим Максимов Рабочий 2 11000 22
11 Юрий Галкин Рабочий 3 12000 24
12 Людмила Маркина Уборщик 10 10000 49

*/

/*
Задание 1:
Необходимо вывести идентификатор, имя, фамилию, заработную плату 
из сущности staff при этом данные должны быть отсортированы в порядке убывания заработной платы.
*/
-- Решение:
/*
SELECT id, firstname, lastname, salary     
	FROM staff 
	ORDER BY salary DESC;  
*/


/*
Задание 2:
Необходимо вывести идентификатор, имя, фамилию, заработную плату из сущности staff 
при этом данные должны быть отсортированы в порядке возрастания заработной платы.
*/
-- Решение:
/*
SELECT id, firstname, lastname, salary     
	FROM staff 
	ORDER BY salary; 
*/


/*
Задание 3:
Необходимо вывести идентификатор, имя, фамилию, заработную плату 
пяти самых высокооплачиваемых сотрудников из сущности staff.
*/
-- Решение:
/*
SELECT id, firstname, lastname, salary     
	FROM staff 
	ORDER BY salary DESC LIMIT 5; 
*/


/*
Задание 4:
Посчитайте и выведите суммарную зарплату (salary) по каждой специальности (роst) из сущности staff.
Порядок вывода атрибутов: должность, суммарная зарплата.
*/
-- Решение:
/*
SELECT post, SUM(salary)
	FROM staff
    GROUP BY post;
*/


/*
Задание 5:
Посчитайте и выведите количество сотрудников с должностью 'Рабочий' 
и возрастом не моложе 24 лет и не старше 49 лет.
*/
-- Решение:
/*
SELECT COUNT(*)
	FROM staff
    WHERE post  = 'рабочий' AND age BETWEEN 24 AND 49;
*/


/*
Задание 6:
Посчитайте и выведите количество уникальных должностей, имеющихся у сотрудников в сущности 'staff'.
*/
-- Решение:
/*
SELECT COUNT(*)
	FROM 
		(SELECT DISTINCT post FROM staff) AS List;
*/


/*
Задание 7:
Найдите средний возраст сотрудников по каждой должности из сущности staff.
Выведите только те должности, у которых средний возраст меньше 30 лет (в автотесте проверка - 20 лет).
*/
-- Решение:
/*
SELECT DISTINCT post 
	FROM 
		(SELECT age, post 
			FROM staff
            GROUP BY age, post  
            HAVING AVG(age) < 20) AS List;
*/