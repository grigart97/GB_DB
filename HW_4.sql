USE vk;
/* Задание 1
   Заполнить все таблицы БД vk данными (по 10-100 записей в каждой таблице)
*/
-- Внизу файла. Генерировал через http://filldb.info/

/* Задание 2
   Написать скрипт, возвращающий список имен (только firstname) пользователей
   без повторений в алфавитном порядке
 */
SELECT DISTINCT firstname FROM users ORDER BY firstname;
/* Задание 3
   Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных
   (поле is_active = false). Предварительно добавить такое поле в таблицу profiles
   со значением по умолчанию = true (или 1)
 */
ALTER TABLE profiles ADD COLUMN is_active BOOLEAN DEFAULT 'true';
UPDATE profiles SET is_active = FALSE WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) - (DATE_FORMAT(NOW(), '%m%d') < DATE_FORMAT(birthday, '%m%d')) < 18;
-- Нет варианта попроще?...
/* Задание 4
   Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)
 */
SELECT * FROM messages WHERE created_at > NOW();
