/*
Question: 

This is the same question as problem #10 in the SQL Chapter of Ace the Data Science Interview!
The table below contains information about tweets over a given period of time.
Calculate the 3-day rolling average of tweets published by each user for each date that a tweet was posted.
Output the user id, tweet date, and rolling averages rounded to 2 decimal places.

Important Assumptions:
- Rows in this table are consecutive and ordered by date.
- Each row represents a different day
- A day that does not correspond to a row in this table is not counted. The most recent day is the next row above the current row.

Note: Rolling average is a metric that helps us analyze data points by creating a series of averages based on different subsets of a dataset.
It is also known as a moving average, running average, moving mean, or rolling mean.

Source: https://datalemur.com/questions/rolling-average-tweets
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
WITH rolling_tweets AS 
  (SELECT 
    user_id,
    tweet_date,
    AVG(COUNT(tweet_id)) OVER(
		PARTITION BY user_id
		ORDER BY tweet_date,
		tweet_date rows between 2 preceding and current row) AS rolling_avg
    FROM tweets
    GROUP BY user_id, tweet_date)

SELECT user_id, tweet_date, ROUND(rolling_avg,2) AS rolling_avg
FROM rolling_tweets;
