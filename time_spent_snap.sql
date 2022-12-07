/*
Question: 

This is the same question as problem #25 in the SQL Chapter of Ace the Data Science Interview!
Assume you are given the tables below containing information on Snapchat users, their ages, and their time spent sending and opening snaps.
Write a query to obtain a breakdown of the time spent sending vs. opening snaps (as a percentage of total time spent on these activities) for each age group.
Output the age bucket and percentage of sending and opening snaps. Round the percentage to 2 decimal places.

Notes:
You should calculate these percentages:
time sending / (time sending + time opening)
time opening / (time sending + time opening)
To avoid integer division in percentages, multiply by 100.0 and not 100.

Source: https://datalemur.com/questions/time-spent-snaps
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
WITH open AS
  (SELECT age_breakdown.user_id,
        age_bucket, 
        activity_type,
        SUM(time_spent) AS total_open
  FROM age_breakdown
  INNER JOIN activities
  ON age_breakdown.user_id = activities.user_id
  WHERE activity_type = 'open'
  GROUP BY age_breakdown.user_id, age_bucket, activity_type),
  
  send AS
  (SELECT age_breakdown.user_id,
        age_bucket, 
        activity_type,
        SUM(time_spent) AS total_send
  FROM age_breakdown
  INNER JOIN activities
  ON age_breakdown.user_id = activities.user_id
  WHERE activity_type = 'send'
  GROUP BY age_breakdown.user_id, age_bucket, activity_type)

SELECT open.age_bucket,
       ROUND(total_send * 100.0 / (total_open + total_send), 2) AS pct_send,
       ROUND(total_open * 100.0 / (total_open + total_send), 2) AS pct_open
FROM open, send
WHERE open.user_id = send.user_id
GROUP BY open.age_bucket, pct_send, pct_open