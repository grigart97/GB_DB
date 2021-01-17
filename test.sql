SET @for_user_id = 101;

SELECT p2.user_id
FROM profiles p1 JOIN profiles p2 ON p1.hometown = p2.hometown