/*
Question: 

You are given a list of numbers representing how many emails each Microsoft Outlook user has in their inbox.
Before the Product Management team can work on features related to inbox zero or bulk-deleting email,
they simply want to know what the mean, median, and mode are for the number of emails.
Output the median, median and mode (in this order). 
Round the mean to the the closest integer and assume that there are no ties for mode.

Source: https://datalemur.com/questions/mean-median-mode
Credits: https://www.linkedin.com/in/nick-singh-tech
*/


/* Solution using Ordered-Set Aggregate Functions*/
SELECT 
  ROUND(AVG(email_count),0) AS mean,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY email_count) AS median,
  mode() WITHIN GROUP (ORDER BY email_count) AS mode
FROM inbox_stats

/* References: https://www.postgresql.org/docs/9.4/functions-aggregate.html
*/