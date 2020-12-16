/* Task 1
   Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека,
   который больше всех общался с выбранным пользователем (написал ему сообщений).
 */
SET @any_user_id := 101;
SELECT COUNT(*) AS 'max_messages' FROM messages WHERE to_user_id = 101 GROUP BY from_user_id;
/* Task 2
   Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
 */
SELECT
       user_id,
       COUNT(user_id) AS 'quantity'
FROM likes
WHERE
      (select DATEDIFF(CURDATE(), birthday)/365.25
      from profiles
      where profiles.user_id= likes.user_id) < 10
GROUP BY user_id;
/* Task 3
   Определить кто больше поставил лайков (всего): мужчины или женщины
 */
SELECT gender FROM (
           SELECT COUNT(*) as 'quantity', (select 'm') as 'gender'
           FROM likes
           WHERE (select gender from profiles where likes.user_id = profiles.user_id) = 'm'
           UNION
           SELECT COUNT(*) as 'quantity', (select 'f') as 'gender'
           FROM likes
           WHERE (select gender from profiles where likes.user_id = profiles.user_id) = 'f'
       ) AS T1
ORDER BY quantity DESC
LIMIT 1;
