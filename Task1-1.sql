/* 
Создайте таблицу (сущность) с мобильными телефонами mobile_phones. При создании необходимо использовать DDL-команды.
Перечень полей (атрибутов):
id – числовой тип, автоинкремент, первичный ключ;
product_name – строковый тип, обязательный к заполнению;
manufacturer – строковый тип, обязательный к заполнению;
product_count – числовой тип, беззнаковый;
price – числовой тип, беззнаковый.
Используя CRUD-операцию INSERT, наполните сущность mobile_phones данными:

-- При написании запросов указывайте не только имя таблицы, но и схему.
-- Название вашей схемы - itresume8509304
-- Например, itresume8509304.tablename
*/



CREATE DATABASE GB_task1;
USE GB_task1;

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