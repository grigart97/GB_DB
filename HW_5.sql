USE shop;
-- Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение”
/* Task 1
   Пусть в таблице users поля created_at и updated_at оказались незаполненными.
   Заполните их текущими датой и временем.
 */
UPDATE users
SET
    created_at = NOW(),
    updated_at = NOW()
WHERE updated_at IS NULL OR created_at IS NULL;
/* Task 2
   Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы
   типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10".
   Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
 */
ALTER TABLE users ADD created_at_varchar VARCHAR(255), ADD updated_at_varchar VARCHAR(255); -- допустим это те самые неправильные поля
UPDATE users
SET
    created_at_varchar = DATE_FORMAT(created_at, '%d.%m.%Y %H:%i'),
    updated_at_varchar = DATE_FORMAT(updated_at, '%d.%m.%Y %H:%i')
WHERE created_at_varchar IS NULL OR updated_at_varchar IS NULL; -- Кототрые заполнили вот так (можно ещё секунды, но по заданию только минуты)
-- Так как дополнительные столбцы формата DATETIME уже есть, создавать нет необходимости
UPDATE users
SET
    created_at = STR_TO_DATE(created_at_varchar, '%d.%m.%Y %H:%i'),
    updated_at = STR_TO_DATE(updated_at_varchar, '%d.%m.%Y %H:%i');
ALTER TABLE users DROP COLUMN created_at_varchar, DROP COLUMN updated_at_varchar; -- удаляем лишнее
/* Task 3
   В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры:
   0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи
   таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы
   должны выводиться в конце, после всех записей.
 */
INSERT INTO storehouses (name) VALUES -- Данные для проверки корректности работы
  ('Тушино'),
  ('Мытищи'),
  ('Люберцы'),
  ('Подольск');
INSERT INTO storehouses_products (storehouse_id, product_id, value) VALUE
    (2, 3, 45),
    (1, 2, 125),
    (4, 1, 1250),
    (3, 5, 0),
    (1, 5, 0),
    (3, 1, 0);
SELECT value FROM storehouses_products ORDER BY IF(value = 0, 2147483647, value);
/* Task 4
   (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае.
   Месяцы заданы в виде списка английских названий ('may', 'august')
 */
SELECT id, name, birthday_at FROM users WHERE DATE_FORMAT(birthday_at, '%M') = 'may' OR DATE_FORMAT(birthday_at, '%M') = 'august';
/* Task 5
   (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса.
   SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.
 */
SELECT * FROM catalogs WHERE id IN (5,1,2) ORDER BY FIELD(id, 5,1,2);

-- Практическое задание теме “Агрегация данных”
/* Task 1
   Подсчитайте средний возраст пользователей в таблице users
 */
SELECT AVG(DATEDIFF(birthday_at, CURDATE()) - DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(birthday_at, '%m%d')) AS avg_age FROM users; -- почему не работает?
SELECT ROUND(AVG(DATEDIFF(CURDATE(), birthday_at)/365.25), 3) AS avg_age FROM users;
/* Task 2
   Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
   Следует учесть, что необходимы дни недели текущего года, а не года рождения.
 */
SELECT DATE_FORMAT(birthday_at, '%a'), COUNT(*) FROM users GROUP BY DAYOFWEEK(birthday_at) ORDER BY DAYOFWEEK(birthday_at);
/* Task 3
   (по желанию) Подсчитайте произведение чисел в столбце таблицы
 */
SELECT EXP(SUM(LN(id))) FROM users; -- логарифм произведения равен сумме логарифмов