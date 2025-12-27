-- NY Times SQL Interview Question
-- Assume you're given the table on user viewership categorised by device type where the three 
-- types are laptop, tablet, and phone.
-- Write a query that calculates the total viewership for laptops and mobile 
-- devices where mobile is defined as the sum of tablet and phone viewership. Output the total 
-- viewership for laptops as laptop_reviews and the total viewership for mobile devices as mobile_views.


--GIVEN
CREATE TABLE viewership (
user_id INT,
device_type TEXT,
view_time TIMESTAMP);

-- SOLUTION
SELECT
    count(CASE WHEN device_type IN ('phone', 'tablet') THEN 1 END) AS mobile_views,
    count(CASE WHEN device_type = 'laptop' THEN 1 END) AS laptop_reviews
FROM viewership;
--or

SELECT 
  COUNT(*) FILTER (WHERE device_type = 'laptop') AS laptop_views,
  COUNT(*) FILTER (WHERE device_type IN ('tablet', 'phone'))  AS mobile_views 
FROM viewership;