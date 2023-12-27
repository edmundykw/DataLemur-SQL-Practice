/*

This is the same question as problem #6 in the SQL Chapter of Ace the Data Science Interview!

Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022.
Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.
In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group

Source: https://datalemur.com/questions/sql-histogram-tweets
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
WITH tweet_posted AS
  (SELECT user_id, COUNT(msg) as tweets_posted_2022
    FROM tweets
    WHERE tweet_date >= '2022-01-01'
    AND tweet_date <= '2022-12-31'
    GROUP BY user_id)
    
SELECT tweet_posted.tweets_posted_2022, COUNT(user_id) AS num_of_users
FROM tweet_posted
GROUP BY tweet_posted.tweets_posted_2022
ORDER BY tweet_posted.tweets_posted_2022;