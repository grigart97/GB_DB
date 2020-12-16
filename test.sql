SELECT
       COUNT(*),
       user_id,
       (select lastname, firstname from users where users.id = media.user_id) as 'name'
FROM media
GROUP BY user_id