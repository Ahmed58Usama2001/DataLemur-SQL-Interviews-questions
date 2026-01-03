SELECT sender_id,
       COUNT(message_id) AS count_messages
FROM messages
WHERE sent_date >= '2022-08-01'
  AND sent_date <  '2022-09-01'
GROUP BY sender_id
ORDER BY COUNT(message_id) DESC
LIMIT 2;
