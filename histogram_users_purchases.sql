/*
Question: 

This is the same question as problem #13 in the SQL Chapter of Ace the Data Science Interview!
Assume you are given the table on Walmart user transactions.
Based on a user's most recent transaction date, write a query to obtain the users and the number of products bought.
Output the user's most recent transaction date, user ID and the number of products sorted by the transaction date in chronological order.
P.S. As of 10 Nov 2022, the official solution was changed from output of the transaction date, number of users and number of products to the current output.

Source: https://datalemur.com/questions/histogram-users-purchases
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
WITH transaction_count AS
  (SELECT 
    transaction_date,
    user_id,
    COUNT(user_id) AS purchase_count
    FROM user_transactions
    GROUP BY transaction_date, user_id),
  
  ranked_transaction AS
    (SELECT
      *,
      RANK() OVER(PARTITION BY user_id ORDER BY transaction_date DESC)
      FROM transaction_count
    )
    
SELECT transaction_date, user_id, purchase_count
FROM ranked_transaction
WHERE rank = 1
ORDER BY transaction_date;