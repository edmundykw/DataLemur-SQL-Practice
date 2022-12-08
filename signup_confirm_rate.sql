/*
Question: 

New TikTok users sign up with their emails. They confirmed their signup by replying to the text confirmation to activate their accounts.
Users may receive multiple text messages for account confirmation until they have confirmed their new account.
Write a query to find the activation rate of the users.
Round the percentage to 2 decimal places.

Definitions:
emails table contain the information of user signup details.
texts table contains the users' activation information.
As of 29 Nov 2022, the term confirmation rate is changed to activation rate to reflect the nature of the new user activation process.

Source: https://datalemur.com/questions/signup-confirmation-rate
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
WITH status AS
  (SELECT
    CASE WHEN signup_action = 'Confirmed' THEN 1 ELSE 0 END AS confirm_stat
    FROM emails AS e
    LEFT JOIN texts AS t
    ON e.email_id = t.email_id
    AND t.signup_action = 'Confirmed')
    
SELECT ROUND(SUM(confirm_stat)::Decimal / COUNT(*), 2) AS pct_activation
FROM status;