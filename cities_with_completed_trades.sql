/*

This is the same question as problem #2 in the SQL Chapter of Ace the Data Science Interview!

Assume you're given the tables containing completed trade orders and user details in a Robinhood trading system.
Write a query to retrieve the top three cities that have the highest number of completed trade orders listed in descending order.
Output the city name and the corresponding number of completed trade orders.

Source: https://datalemur.com/questions/completed-trades
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
SELECT city, COUNT(status) as completed_trades
FROM trades
INNER JOIN users
ON users.user_id = trades.user_id
WHERE status = 'Completed'
GROUP BY city
ORDER BY COUNT(status) DESC
LIMIT 3;