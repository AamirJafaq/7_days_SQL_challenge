-- Facebook SQL Interview Question
/* Given a table of Facebook posts, for each user who posted at least twice in 2021, write
a query to find the number of days between each user’s first post of the year and last post 
of the year in the year 2021. Output the user and number of the days between each user's 
first and last post.
*/


--GIVEN
CREATE TABLE posts (
user_id INT,
post_id INT,
post_content TEXT,
post_date TIMESTAMP);

-- SOLUTION
SELECT * FROM posts;
SELECT user_id, EXTRACT(DAY FROM max(post_date)-min(post_date)) AS num_days  
FROM posts
WHERE EXTRACT(YEAR FROM post_date)=2021
GROUP BY user_id
HAVING count(post_date)>=2;