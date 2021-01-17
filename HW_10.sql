/* Task 1
   Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users,
   catalogs и products в таблицу logs помещается время и дата создания записи, название таблицы,
   идентификатор первичного ключа и содержимое поля name.
 */
USE shop;
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
    `datetime` DATETIME NOT NULL ,
    tbl_name VARCHAR(21) NOT NULL ,
    id BIGINT UNSIGNED NOT NULL,
    inserted_name VARCHAR(255)
) COMMENT='логи добавления строк в таблицы catalogs, products, users' ENGINE=Archive;

DROP TRIGGER IF EXISTS insert_users_log;
DELIMITER //
CREATE TRIGGER insert_users_log AFTER INSERT ON users
    FOR EACH ROW
    begin
        INSERT `logs` VALUES (NEW.created_at, 'users', last_insert_id(), NEW.name);
    end;

DROP TRIGGER IF EXISTS insert_catalogs_log;
CREATE TRIGGER insert_catalogs_log AFTER INSERT ON catalogs
    FOR EACH ROW
    begin
        INSERT `logs` VALUES (NOW(), 'catalogs', last_insert_id(), NEW.name);
    end;

DROP TRIGGER IF EXISTS insert_products_log;
CREATE TRIGGER insert_products_log AFTER INSERT ON products
    FOR EACH ROW
    begin
        INSERT `logs` VALUES (NEW.created_at, 'products', last_insert_id(), NEW.name);
    end;
DELIMITER ;