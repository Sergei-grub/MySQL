-- Active: 1706461871923@@127.0.0.1@3306@seminar4
DROP DATABASE IF EXISTS seminar4;

-- Удаляем базу, если такая есть
CREATE DATABASE seminar4;

-- Создание базы
USE seminar4;

-- Активация базы
DROP TABLE IF EXISTS example4;

-- Удаляем таблицу, если такая есть
CREATE TABLE
	teacher -- Создание таблицы
	(
		id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
		surname VARCHAR(45),
		salary INT
	);

INSERT INTO
	teacher (surname, salary)
VALUES
	('Андрианова', 100000),
	('Константинов', 70000),
	('Горячев', 30000),
	('Уварова', 25000),
	('Шилов', 30000),
	('Аксенова', 19000),
	('Лапина', 15000),
	('Гришина', 70000);

SELECT
	*
FROM
	teacher
ORDER BY
	id;

-- Сортировка по id:
DROP TABLE IF EXISTS lesson;

-- Удаляем таблицу, если такая есть
CREATE TABLE
	lesson -- Создание таблицы
	(
		id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
		course VARCHAR(45),
		teacher_id INT,
		FOREIGN KEY (teacher_id) REFERENCES teacher (id)
	);

INSERT INTO
	lesson (course, teacher_id)
VALUES
	('Знакомство с веб-технологиями', 1),
	('Знакомство с веб-технологиями', 2),
	('Знакомство c Java', 3),
	('Знакомствова c Python', 4),
	('Знакомство c C++', NULL);

-- Учитель отсутствует
SELECT
	*
FROM
	teacher;

SELECT
	*
FROM
	lesson;

SELECT
	*
FROM
	teacher t
	INNER JOIN lesson l on t.id = l.teacher_id
order by
	t.id;

SELECT
	*
FROM
	teacher t
	LEFT JOIN lesson l on t.id = l.teacher_id
order by
	t.id;

SELECT
	*
FROM
	teacher t
	RIGHT JOIN lesson l on t.id = l.teacher_id
order by
	l.id;

SELECT
	*
FROM
	teacher t
	CROSS JOIN lesson l on t.id = l.teacher_id
order by
	t.id;

---------------------------------------------------------
DROP TABLE IF EXISTS products;

CREATE TABLE
	products -- Создание таблицы
	(
		product_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
		category INT NULL,
		product_name VARCHAR(100) NOT NULL
	);

DROP TABLE IF EXISTS categories;

CREATE TABLE
	categories -- Создание таблицы
	(
		category_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
		category_name VARCHAR(100) NOT NULL
	);

INSERT INTO
	products (category, product_name)
VALUES
	(1, 'Системный блок'),
	(1, 'Монитор'),
	(2, 'Холодильник'),
	(2, 'Телевизор'),
	(NULL, 'Операционная система');

INSERT INTO
	categories (category_name)
VALUES
	('Комплектующие компьютера'),
	('Бытовая техника'),
	('Мобильные утройства');

SELECT
	*
FROM
	products;

SELECT
	*
FROM
	categories;

SELECT
	*
FROM
	products p
	LEFT JOIN categories c ON p.category = c.category_id
UNION
SELECT
	*
FROM
	products p
	RIGHT JOIN categories c ON p.category = c.category_id;