/*
Question: 

This is the same question as problem #11 in the SQL Chapter of Ace the Data Science Interview!
Assume you are given the table below on Uber transactions made by users. Write a query to obtain the third transaction of every user.
Output the user id, spend and transaction date.

Source: https://datalemur.com/questions/sql-third-transaction
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
WITH trans_rank AS 
  (SELECT user_id,
    spend,
    transaction_date,
    rank() OVER (
      PARTITION BY user_id 
      ORDER BY transaction_date)
    FROM transactions)
    
SELECT user_id, spend, transaction_date
FROM trans_rank
WHERE rank = 3;
