/*
Question: 

This is the same question as problem #10 in the SQL Chapter of Ace the Data Science Interview!

Given a table of tweet data over a specified time period, calculate the 3-day rolling average of tweets for each user.
Output the user ID, tweet date, and rolling averages rounded to 2 decimal places.

Notes:

A rolling average, also known as a moving average or running mean is a time-series technique that examines trends in data over a specified period of time.
In this case, we want to determine how the tweet count for each user changes over a 3-day period.

Source: https://datalemur.com/questions/rolling-average-tweets
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
SELECT user_id,
       tweet_date,
        ROUND(AVG(tweet_count) OVER(
        PARTITION BY user_id
        ORDER BY tweet_date DESC
        ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING), 2) AS avg_3day_tweet_count
FROM tweets
ORDER BY user_id, tweet_date;

