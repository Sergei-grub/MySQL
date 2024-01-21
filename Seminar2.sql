DROP DATABASE IF EXISTS seminar2;
CREATE DATABASE seminar2;
USE seminar2;
DROP TABLE IF EXISTS Cinema;
CREATE TABLE Cinema 
(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	title_ru VARCHAR (50),
	title_en VARCHAR (50),
    relise_year YEAR NOT NULL,
    runing_time_min INT,
    storyline TEXT,
    age_category VARCHAR(10),
    count_min INT
);

INSERT INTO Cinema (title_ru, title_en, relise_year, runing_time_min, storyline, age_category, count_min)
VALUES
('Игры разума', 'A Beautiful Mind', 2001, 135, "От всемирной известности до греховных глубин — все это 
познал на своей шкуре Джон Форбс Нэш-младший. Математический гений, он на заре своей карьеры сделал 
титаническую работу в области теории игр, которая перевернула этот раздел математики и практически принесла 
ему международную известность. Однако буквально в то же время заносчивый и пользующийся успехом у женщин 
Нэш получает удар судьбы, который переворачивает уже его собственную жизнь.", 'В', 100),
('Форест Гамп', 'Forrest Gump', 1994, 142, "Сидя на автобусной остановке, Форрест Гамп — не очень умный, 
но добрый и открытый парень — рассказывает случайным встречным историю своей необыкновенной жизни. 
С самого малолетства парень страдал от заболевания ног, соседские мальчишки дразнили его, но 
в один прекрасный день Форрест открыл в себе невероятные способности к бегу. Подруга детства Дженни 
всегда его поддерживала и защищала, но вскоре дороги их разошлись.", 'В', 130),
('Иван Васильевич меняет профессию', 'Ivan Vasilyevich is changing his profession', 1973, 128, "Инженер-изобретатель 
Тимофеев сконструировал машину времени, которая соединила его квартиру с далеким шестнадцатым веком - точнее, 
с палатами государя Ивана Грозного. Туда-то и попадают тезка царя пенсионер-общественник Иван Васильевич Бунша 
и квартирный вор Жорж Милославский. На их место в двадцатом веке «переселяется» великий государь. 
Поломка машины приводит ко множеству неожиданных и забавных событий...", 'Д', 90),
('Назад в будущее', 'Forrest Gump', 1985, 116, "Подросток Марти с помощью машины времени, сооружённой 
его другом-профессором доком Брауном, попадает из 80-х в далекие 50-е. Там он встречается со своими 
будущими родителями, ещё подростками, и другом-профессором, совсем молодым.", 'П', 140),
('Крименальное чтиво', 'Pulp fiction', 1994, 154, "Двое бандитов Винсент Вега и Джулс Винфилд ведут 
философские беседы в перерывах между разборками и решением проблем с должниками криминального босса 
Марселласа Уоллеса. В первой истории Винсент проводит незабываемый вечер с женой Марселласа Мией. 
Во второй рассказывается о боксёре Бутче Кулидже, купленном Уоллесом, чтобы сдать бой. В третьей истории 
Винсент и Джулс по нелепой случайности попадают в неприятности.", 'В', 100);

SELECT * FROM Cinema;

RENAME TABLE Cinema TO Movies;

ALTER TABLE Movies
	ADD movie_language VARCHAR(10);

ALTER TABLE Movies
	DROP COLUMN movie_language;

CREATE TABLE marks 
(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	total_marks INT,
	grade CHAR(3)
);

INSERT INTO marks (total_marks, grade)
VALUES
(450, 'A'),
(480, 'A+'),
(490, 'A++'),
(440, 'B+'),
(400, 'C+'),
(380, 'C'),
(250, 'D'),
(200, 'E');

SELECT *,
CASE
	WHEN total_marks < 300
		THEN 'loooosers'
	WHEN total_marks < 300
		THEN 'third grade'		
	WHEN total_marks < 400
		THEN 'second grade'    
    WHEN total_marks < 450
		THEN 'first grade'
	ELSE 'best of the best'
END AS characteristic
FROM marks
ORDER BY total_marks DESC;

SELECT *,
IF (total_marks > 450, 'Красаучег', 'Неделю без компуктера!')
AS result
FROM marks;

SELECT id, title_ru,
CASE age_category
	WHEN 'Д' THEN 'Детская'
	WHEN 'П' THEN 'Подростковая'
	WHEN 'В' THEN 'Взрослая'
	ELSE 'Не указана'
END AS 'Категория'
FROM Movies;

SELECT 
	id AS 'Номер фильма',
    title_ru AS 'Название фильма',
    count_min AS 'Продолжительность',
CASE
	WHEN count_min < 50 
		THEN 'Короткометражный фильм'
    WHEN count_min BETWEEN 50 AND 100
		THEN 'Среднеметражный фильм'
    WHEN count_min > 100 
		THEN 'Полнометражный фильм'
END AS 'Тип'
FROM Movies;

SELECT 
	id AS 'Номер фильма',
    title_ru AS 'Название фильма',
    count_min AS 'Продолжительность',
IF (count_min < 50, 'Короткометражный фильм',
	IF (count_min BETWEEN 50 AND 100, 'Среднеметражный фильм',
		IF (count_min > 100, 'Полнометражный фильм', 'Не определено')
	)
)
AS 'Тип'
FROM Movies;  
    