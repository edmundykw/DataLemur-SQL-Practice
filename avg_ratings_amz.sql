/*
Question: 

Given the reviews table, write a query to get the average stars for each product every month.
The output should include the month in numerical value, product id, and average star rating rounded to two decimal places. 
Sort the output based on month followed by the product id.

Source: https://datalemur.com/questions/sql-avg-review-ratings
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/

SELECT EXTRACT(MONTH FROM submit_date) AS month, product_id, ROUND(AVG(stars), 2) AS avg_rating
FROM reviews
GROUP BY month, product_id
ORDER BY month, product_id;