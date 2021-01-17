-- Транзакции, переменные, представления
/* Task 1
   В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
   Переместите запись id = 1 из таблицы shop.users в таблицу sample.users.
   Используйте транзакции.
 */
DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;

DROP TABLE IF EXISTS sample.users;
CREATE TABLE sample.users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

START TRANSACTION;
INSERT INTO sample.users (select id, name, birthday_at, created_at, updated_at from shop.users where shop.users.id = 1);
SELECT * FROM sample.users;
COMMIT;
/* Task 2
   Создайте представление, которое выводит название name товарной позиции из таблицы
   products и соответствующее название каталога name из таблицы catalogs.
 */
USE shop;
CREATE VIEW v_name AS
    (SELECT p.name AS `item`, c.name AS `catalog`
    FROM products p JOIN catalogs c on c.id = p.catalog_id);
SELECT * FROM v_name;

/* Task 3
   Пусть имеется таблица с календарным полем created_at. В ней размещены разряженые
   календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и
   2018-08-17. Составьте запрос, который выводит полный список дат за август,
   выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0,
   если она отсутствует.
 */
DROP DATABASE IF EXISTS smth;
CREATE DATABASE smth;
USE smth;

DROP TABLE IF EXISTS example;
CREATE TABLE example (
    created_at DATE
);

INSERT example VALUES
                      ('2018-08-01'),
                      ('2016-08-04'),
                      ('2018-08-16'),
                      ('2018-08-17');

DROP TABLE IF EXISTS august_tbl;
CREATE TABLE august_tbl (
    aug_day VARCHAR(40)
);
SET @month_start := '2020-08-01';
SET @month_end := '2020-09-01';

DELIMITER //
DROP PROCEDURE IF EXISTS august_proc//
CREATE PROCEDURE august_proc()
BEGIN
    DECLARE i DATE DEFAULT '2020-08-01';
    WHILE i < '2020-09-01' DO
        INSERT INTO august_tbl (aug_day) VALUE (DATE_FORMAT(i, '%M %D'));
        SET i := i + INTERVAL 1 DAY;
    END WHILE;
END//

DELIMITER ;

CALL august_proc();
SELECT * FROM august_tbl;

SELECT
       august_tbl.aug_day,
       (select aug_day IN (select DATE_FORMAT(created_at, '%M %D') from example) LIMIT 1) AS 'if_day'
FROM august_tbl;

/* Task 4
   (по желанию) Пусть имеется любая таблица с календарным полем created_at.
   Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя
   только 5 самых свежих записей.
 */
USE smth;
DELETE FROM example WHERE created_at NOT IN (select * from (SELECT * FROM example ORDER BY created_at DESC LIMIT 5) AS T1);

-- Администрирование MySQL
/* Task 1
   Создайте двух пользователей которые имеют доступ к базе данных shop.
   Первому пользователю shop_read должны быть доступны только запросы на чтение данных,
   второму пользователю shop — любые операции в пределах базы данных shop.
 */
USE shop;
-- shop_read должны быть доступны только запросы на чтение данных
DROP USER IF EXISTS 'shop_reader'@'localhost';
CREATE USER 'shop_reader'@'localhost' IDENTIFIED WITH sha256_password BY '123';
GRANT SELECT ON shop.* TO 'shop_reader'@'localhost';
-- shop — любые операции в пределах базы данных shop
DROP USER IF EXISTS 'shop'@'localhost';
CREATE USER 'shop'@'localhost' IDENTIFIED WITH sha256_password BY '123';
GRANT ALL ON shop_online.* TO 'shop'@'localhost';
GRANT GRANT OPTION ON shop_online.* TO 'shop'@'localhost';

-- Хранимые процедуры и функции, триггеры
/* Task 1
   Создайте хранимую функцию hello(), которая будет возвращать приветствие,
   в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна
   возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу
   "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи"
 */
DELIMITER //
DROP PROCEDURE IF EXISTS hello//
CREATE PROCEDURE hello()
BEGIN
    DECLARE hello_time TIME DEFAULT CURTIME();
    CASE
        WHEN TIME_FORMAT(hello_time, '%k') > 6 AND TIME_FORMAT(hello_time, '%k') < 12
            THEN SELECT 'Доброе утро';
        WHEN TIME_FORMAT(hello_time, '%k') > 12 AND TIME_FORMAT(hello_time, '%k') < 18
            THEN SELECT 'Добрый день';
        WHEN TIME_FORMAT(hello_time, '%k') > 18
            THEN SELECT 'Добрый вечер';
        WHEN TIME_FORMAT(hello_time, '%k') < 6
            THEN SELECT 'Доброй ночи';
    END CASE;
END//
DELIMITER ;
CALL hello();

/* Task 2
   В таблице products есть два текстовых поля: name с названием товара и description
   с его описанием. Допустимо присутствие обоих полей или одно из них. Ситуация,
   когда оба поля принимают неопределенное значение NULL неприемлема. Используя
   триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
   При попытке присвоить полям NULL-значение необходимо отменить операцию.
 */

USE smth;
DROP TABLE IF EXISTS products;
CREATE TABLE products (
    name VARCHAR(30) DEFAULT NULL,
    description VARCHAR(255) DEFAULT NULL
);
DROP TRIGGER IF EXISTS products_before_ins;
CREATE TRIGGER products_before_ins BEFORE INSERT ON products
FOR EACH ROW BEGIN
    IF NEW.description IS NULL AND NEW.name IS NOT NULL THEN
        SET NEW.description = NEW.name;
    END IF;
END;

DROP TRIGGER IF EXISTS products_before_upd;
CREATE TRIGGER products_before_upd BEFORE UPDATE ON products
FOR EACH ROW BEGIN
    IF NEW.name IS NULL AND NEW.description IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'one of columns should be NOT NULL';
    ELSEIF NEW.description IS NULL AND NEW.name IS NOT NULL THEN
        SET NEW.description = NEW.name;
    END IF;
END;

INSERT INTO products VALUES ('мягкие игрушки', NULL), (NULL, 'деревянные');
UPDATE products SET name = NULL, description = NULL WHERE description = 'деревянные'

/* Task 3
   (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи.
   Числами Фибоначчи называется последовательность в которой число равно сумме двух
   предыдущих чисел. Вызов функции FIBONACCI(10) должен возвращать число 55.
 */
DROP FUNCTION IF EXISTS FIBONACCI;
CREATE FUNCTION FIBONACCI(num INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE sum, old_sum INT DEFAULT 0;
    DECLARE i, new_sum INT DEFAULT 1;
    WHILE i < num DO
        SET i = i + 1;
        SET old_sum = sum;
        SET sum = new_sum;
        SET new_sum = sum + old_sum;
    end while;
    RETURN new_sum;
END;

SELECT FIBONACCI(10);