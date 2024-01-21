/*
Имеется таблица (сущность) с мобильными телефонами mobile_phones.
У сущности имеются следующие поля(атрибуты):
id – идентификатор;
product_name – название;
manufacturer – производитель;
product_count – количество;
price – цена.

Сущность mobile_phones имеет следующие записи:
| id | product_name | manufacturer | product_count | price | 
| 1  | iPhone X 	| Apple 	   | 156 		   | 76000 | 
| 2  | iPhone 8     | Apple        | 180 		   | 51000 | 
| 3  | Galaxy S9    | Samsung      | 21 		   | 56000 | 
| 4  | Galaxy S8    | Samsung      | 124 		   | 41000 | 
| 5  | P20 Pro      | Huawei       | 341 		   | 36000 |

Создайте таблицу (сущность) с заказами manufacturer. При создании необходимо использовать DDL-команды.
Перечень полей (атрибутов):
id – числовой тип, автоинкремент, первичный ключ;
name – строковый тип;

Используя CRUD-операцию INSERT, наполните сущность manufacturer в соответствии с данными, имеющимися в атрибуте manufacturer сущности mobile_phones.
*/
-- Рабочее решение для автотеста:
/*
-- Вы работаете с PostgreSQL
-- Введите свой код ниже
DROP TABLE IF EXISTS itresume8509304.manufacturer;
CREATE TABLE itresume8509304.manufacturer
(
	id SERIAL NOT NULL PRIMARY KEY,
	manufacturer_name VARCHAR(45)
);
INSERT INTO itresume8509304.manufacturer (manufacturer_name)
SELECT manufacturer FROM itresume8509304.mobile_phones;
SELECT * FROM itresume8509304.manufacturer;
*/


DROP DATABASE IF EXISTS task2;
CREATE DATABASE task2;
USE task2;
DROP TABLE IF EXISTS mobile_phones;
CREATE TABLE mobile_phones
(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	product_name VARCHAR(45) NOT NULL,
	manufacturer VARCHAR(45) NOT NULL,
	product_count INT UNSIGNED,
	price INT UNSIGNED
);

INSERT INTO mobile_phones (product_name, manufacturer, product_count, price)
VALUES
('iPhone X', 'Apple', 156, 76000),
('iPhone 8', 'Apple', 180, 51000),
('Galaxy S9', 'Samsung', 21, 56000),
('Galaxy S8', 'Samsung', 124, 41000),
('P20 Pro', 'Huawei', 341, 36000)
;

SELECT * FROM mobile_phones;

DROP TABLE IF EXISTS manufacturer;
CREATE TABLE manufacturer
(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	manufacturer_name VARCHAR(45) NOT NULL
);

INSERT INTO manufacturer (manufacturer_name)
SELECT manufacturer FROM mobile_phones;

SELECT * FROM manufacturer;


/*
Статусы количества мобильных телефонов (в зависимости от количества): меньше 100 – «little»; от 100 до 300 – «many»; больше 300 – «lots».
Необходимо вывести название, производителя и статус количества для мобильных телефонов.
*/

SELECT product_name, manufacturer,
CASE
	WHEN product_count < 100
		THEN 'little'
	WHEN product_count BETWEEN 100 AND 300
		THEN 'many'		
	WHEN product_count > 300
		THEN 'lots'
END AS product_status
FROM mobile_phones
ORDER BY product_count DESC;