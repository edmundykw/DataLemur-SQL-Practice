/*
Question: 

CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. 
Each drug can only be produced by one manufacturer.
Write a query to find out which manufacturer is associated with the drugs that were not profitable and how much money CVS lost on these drugs. 
Output the manufacturer, number of drugs and total losses. Total losses should be in absolute value.
Display the results with the highest losses on top.
If you like this question, try out Pharmacy Analytics (Part 3)!

Source: https://datalemur.com/questions/non-profitable-drugs
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
SELECT manufacturer, COUNT(product_id), ABS(SUM(total_sales - cogs)) AS total_loss
FROM pharmacy_sales
WHERE total_sales - cogs < 0
GROUP BY manufacturer
ORDER BY total_loss DESC