USE graduation_db;
DELIMITER //
CREATE FUNCTION format_seconds(secs INT)
RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE seconds INT;

    SET days = FLOOR(secs / (60 * 60 * 24));
    SET secs = secs % (60 * 60 * 24);

    SET hours = FLOOR(secs / (60 * 60));
    SET secs = secs % (60 * 60);

    SET minutes = FLOOR(secs / 60);
    SET seconds = secs % 60;

    RETURN CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
END;
DELIMITER //
CREATE FUNCTION get_even_numbers()
RETURNS VARCHAR(100)
DETERMINISTIC
NO SQL
BEGIN
    DECLARE even_numbers VARCHAR(100);
    SET even_numbers = '';

    SET @num := 1;
    WHILE @num <= 10 DO
        IF @num % 2 = 0 THEN
            SET even_numbers = CONCAT(even_numbers, @num, ', ');
        END IF;
        SET @num := @num + 1;
    END WHILE;

    RETURN SUBSTRING(even_numbers, 1, LENGTH(even_numbers) - 2);
END;
//
DELIMITER ;
SELECT get_even_numbers();