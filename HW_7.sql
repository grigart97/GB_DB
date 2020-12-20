/* Task 1
   Составьте список пользователей users, которые осуществили хотя бы
   один заказ orders в интернет магазине.
 */
INSERT INTO orders (user_id) VALUES (2), (2), (4), (5), (1), (2), (1), (4);
SELECT
       id,
       name,
       (select COUNT(*) FROM orders WHERE users.id = orders.user_id GROUP BY user_id) AS 'quantity'
FROM shop.users
WHERE (select COUNT(*) FROM orders WHERE users.id = orders.user_id GROUP BY user_id) > 0;
/* Task 2
   Выведите список товаров products и разделов catalogs, который соответствует товару.
 */
SELECT
       products.id AS 'id',
       products.name AS 'name',
       products.description AS 'desc',
       products.price AS 'price',
       catalogs.id AS 'cat_id',
       catalogs.name AS 'cat_name'
FROM products LEFT JOIN catalogs
ON catalog_id = catalogs.id;
/* Task 3
   (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и
   таблица городов cities (label, name). Поля from, to и label содержат английские
   названия городов, поле name — русское. Выведите список рейсов flights с русскими
   названиями городов.
 */
DROP DATABASE plane_plan;
CREATE DATABASE plane_plan;
USE plane_plan;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
    label VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(50) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    from_city VARCHAR(50) NOT NULL,
    to_city VARCHAR(50) NOT NULL,
    CONSTRAINT fk_from_label FOREIGN KEY (from_city) REFERENCES cities(label),
    CONSTRAINT fk_to_label FOREIGN KEY (to_city) REFERENCES cities(label)
);

INSERT INTO cities VALUES ('moscow', 'Москва'),
                          ('irkutsk', 'Иркутск'),
                          ('novgorod', 'Новгород'),
                          ('kazan', 'Казань'),
                          ('omsk', 'Омск');

INSERT INTO flights (from_city, to_city) VALUES ('moscow', 'omsk'),
                                      ('novgorod', 'kazan'),
                                      ('irkutsk', 'moscow'),
                                      ('omsk', 'irkutsk'),
                                      ('moscow', 'kazan');
SELECT
       flights.id,
       (SELECT name FROM cities WHERE flights.from_city = cities.label) as 'from',
       (SELECT name FROM cities WHERE flights.to_city = cities.label) as 'to'
FROM flights;
