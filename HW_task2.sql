-- Задача 2
-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10

USE hw;
DROP PROCEDURE IF EXISTS evens;
DELIMITER //
CREATE PROCEDURE evens()
BEGIN
	DECLARE n INT default 0;
    DROP TABLE IF EXISTS numbers;
    CREATE TABLE numbers (n INT);
    
    WHILE n < 10 DO
    SET n = n + 2;
    INSERT INTO numbers VALUES (n);
    END WHILE;

SELECT * FROM numbers;
END //
DELIMITER ;

CALL evens();