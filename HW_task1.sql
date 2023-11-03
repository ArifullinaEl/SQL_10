-- Задача 1
-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds ' 

USE hw;
DROP FUNCTION IF EXISTS transformer;
DELIMITER //
CREATE FUNCTION transformer (seconds INT)
RETURNS CHAR(25) DETERMINISTIC
BEGIN
    DECLARE d char(3);
    DECLARE h char(2);
    DECLARE m char(2);
    DECLARE s char(2);
    DECLARE res char(40);
    SET d = CAST(FLOOR(seconds/60/60/24) AS char(3));
    SET h = CAST(FLOOR(MOD(seconds/60/60/24,1) * 24) AS char(2)); 
    SET m = CAST(FLOOR(MOD(MOD(seconds/60/60/24,1) * 24,1) * 60) AS char(2));
    SET s = CAST(ROUND(MOD(MOD(MOD(seconds/60/60/24,1) * 24,1) * 60,1) * 60) AS char(2));
    SET res = CONCAT(d, 'd ', h, 'hrs ', m, 'min ', s, 'sec ');
    RETURN res;
END//
DELIMITER ;

SELECT transformer(123456);