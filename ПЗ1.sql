/* Task 1
Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf,
задав в нем логин и пароль, который указывался при установке.
*/
-- не очень понятно, как с помощью одного файла показать, что я это сделал,
-- но я создал файл C:/my.cnf с следующим содержимым:
[mysql]
user=root
password=1234
/* Task 2
Создайте базу данных example, разместите в ней таблицу users,
состоящую из двух столбцов, числового id и строкового name.
*/
CREATE DATABASE IF NOT EXISTS example;
USE example;
CREATE TABLE IF NOT EXISTS users (id INT, name LINESTRING);
SELECT * FROM users;
/* Task 3
Создайте дамп базы данных example из предыдущего задания,
разверните содержимое дампа в новую базу данных sample.
*/
mysqldump example > sample.sql
mysql sample < sample.sql
/* Task 4
(по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump.
Создайте дамп единственной таблицы help_keyword базы данных mysql.
Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.
*/
mysqldump --where="true limit 100" mysql help_keyword > smth.sql