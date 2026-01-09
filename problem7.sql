-- Microsoft SQL Interview Question
/* Write a query to identify the top 2 Power Users who sent the highest number of
messages on Microsoft Teams in August 2022. Display the IDs of these 2 users along 
with the total number of messages they sent. Output the results in descending 
order based on the count of the messages.
Assumption:
No two users have sent the same number of messages in August 2022.
*/


--GIVEN
CREATE TABLE messages (
message_id INT,
sender_id INT,
receiver_id INT,
content VARCHAR,
sent_date TIMESTAMP);

-- SOLUTION
SELECT sender_id, count(message_id) AS total_messages
FROM messages
WHERE TO_CHAR(sent_date, 'YYYY-MM')='2022-08'
GROUP BY sender_id
ORDER BY total_messages DESC
LIMIT 2;