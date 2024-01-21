DROP TABLE IF EXISTS itresume8509304.mobile_phones;
CREATE TABLE itresume8509304.mobile_phones (
  id SERIAL NOT NULL PRIMARY KEY,
  product_name VARCHAR(45) NOT NULL,
  manufacturer VARCHAR(45) NOT NULL,
  product_count INT,
  price INT
);

INSERT INTO itresume8509304.mobile_phones (product_name, manufacturer, product_count, price)
VALUES
('iPhone X', 'Apple', 156, 76000),
('iPhone 8', 'Apple', 180, 51000),
('Galaxy S9', 'Samsung', 21, 56000),
('Galaxy S8', 'Samsung', 124, 41000),
('P20 Pro', 'Huawei', 341, 36000)
;

SELECT * FROM itresume8509304.mobile_phones;



/*
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
*/