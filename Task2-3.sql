/*
Имеется таблица (сущность) с мобильными телефонами mobile_phones.
У сущности имеются следующие поля(атрибуты):
id – идентификатор;
product_name – название;
manufacturer – производитель;
product_count – количество;
price – цена.

Сущность mobile_phones имеет следующие записи:

id	product_name	manufacturer	product_count	price
1	iPhone X	Apple	156	76000
2	iPhone 8	Apple	180	51000
3	Galaxy S9	Samsung	21	56000
4	Galaxy S8	Samsung	124	41000
5	P20 Pro	Huawei	341	36000

Имеется таблица-справочник (сущность) производителей manufacturer.
У сущности имеются следующие поля(атрибуты):
id – идентификатор;
name – название.

Сущность manufacturer имеет следующие записи:

id	name
1	Apple
2	Samsung
3	Huawei
Создайте для сущности mobile_phones внешний ключ manufacturer_id (идентификатор производителя), направленный на атрибут id сущности manufacturer. 
Установите каскадное обновление - CASCADE, а при удалении записи из сущности manufacturer – SET NULL.

Используя CRUD-операцию UPDATE обновите данные в атрибуте manufacturer_id сущности mobile_phones согласно значений, имеющихся в атрибуте manufacturer.

Удалите атрибут manufacturer из сущности mobile_phones.

Выведите идентификатор, название и идентификатор производителя сущности mobile_phones.
*/
DROP DATABASE IF EXISTS task2;
CREATE DATABASE task2;
USE task2;
DROP TABLE IF EXISTS mobile_phones2_3;
CREATE TABLE mobile_phones2_3
(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	product_name VARCHAR(45) NOT NULL,
	manufacturer VARCHAR(45) NOT NULL,
	product_count INT UNSIGNED,
	price INT UNSIGNED
);

INSERT INTO mobile_phones2_3 (product_name, manufacturer, product_count, price)
VALUES
('iPhone X', 'Apple', 156, 76000),
('iPhone 8', 'Apple', 180, 51000),
('Galaxy S9', 'Samsung', 21, 56000),
('Galaxy S8', 'Samsung', 124, 41000),
('P20 Pro', 'Huawei', 341, 36000)
;

-- SELECT * FROM mobile_phones2_3;



USE task2;
DROP TABLE IF EXISTS manufacturer;
CREATE TABLE manufacturer
(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	manufacturer_name VARCHAR(45) NOT NULL
);
INSERT INTO manufacturer (manufacturer_name)
VALUES
('Apple'),
('Samsung'),
('Huawei')
;


ALTER TABLE mobile_phones2_3 
	ADD manufacturer_id INTEGER;
    
ALTER TABLE mobile_phones2_3 
	ADD FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(id) ON DELETE SET NULL;
    
UPDATE mobile_phones2_3 
    SET manufacturer_id = (SELECT id FROM manufacturer WHERE manufacturer_name = manufacturer);  
    
ALTER TABLE mobile_phones2_3
    DROP COLUMN manufacturer;
    
SELECT id, product_name, manufacturer_id  FROM mobile_phones2_3;


-- Решение, которое принял автотест:
/*
ALTER TABLE itresume850----.mobile_phones 
  ADD manufacturer_id INT;
    
ALTER TABLE itresume850----.mobile_phones 
	ADD FOREIGN KEY (manufacturer_id) REFERENCES itresume850----.manufacturer(id) ON DELETE SET NULL;
    
UPDATE itresume850----.mobile_phones 
    SET manufacturer_id = (SELECT id FROM itresume850----.manufacturer WHERE manufacturer_name = mobile_phones.manufacturer);  
    
ALTER TABLE itresume850----.mobile_phones
    DROP COLUMN manufacturer;
    
SELECT id, product_name, manufacturer_id FROM itresume850----.mobile_phones;
*/