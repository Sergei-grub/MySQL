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
Статусы количества мобильных телефонов (в зависимости от количества): меньше 100 – «little»; от 100 до 300 – «many»; больше 300 – «lots».

Необходимо вывести название, производителя и статус количества для мобильных телефонов.
*/
-- Вы работаете с MySQL
-- Введите свой код ниже
SELECT product_name, manufacturer,
CASE
	WHEN product_count < 100
		THEN 'little'
	WHEN product_count BETWEEN 100 AND 300
		THEN 'many'		
	WHEN product_count < 300
		THEN 'lots'
END AS product_status
FROM mobile_phones
ORDER BY product_count DESC;