DELIMITER $$

CREATE FUNCTION Task6_1_sec_to_day(seconds int) 
  RETURNS varchar(250)
  DETERMINISTIC
BEGIN
  DECLARE result varchar(250);
  DECLARE days_value int DEFAULT 0;
  DECLARE hours_value int DEFAULT 0;
  DECLARE minutes_value int DEFAULT 0;

  -- считаем дни
  IF seconds >= 86400 THEN
    SET days_value = seconds DIV 86400;
    SET seconds = seconds % 86400;
  END IF;

  -- считаем часы
  IF seconds >= 3600 THEN
    SET hours_value = seconds DIV 3600;
    SET seconds = seconds % 3600; 
  END IF;

  -- считаем минуты / секунды
  IF seconds >=60 THEN
    SET minutes_value = seconds DIV 60;
    SET seconds = seconds % 60;
  END IF;
  
  SET result = CONCAT(
                    CAST(days_value AS CHAR), ' дней ',
                    CAST(hours_value AS CHAR), ' час ',
                    CAST(minutes_value AS CHAR), ' мин.');

  SET result = CONCAT(result, CAST(seconds AS CHAR), ' сек.');
  
  RETURN result;
END$$

DELIMITER ;

SELECT Task6_1_sec_to_day(123456)



DELIMITER $$ 

CREATE PROCEDURE Task_6_2_numbers (IN count_number int, OUT result varchar(255))
BEGIN
  DECLARE i int DEFAULT 2;

  SET result = '';

  WHILE i < count_number DO
    SET result = CONCAT(result, CAST(i AS char), ' '); 
    SET i = i + 2;
  END WHILE;

END
$$

DELIMITER ;

SET @num = '';
CALL Task_6_2_numbers(30, @num);

SELECT @num