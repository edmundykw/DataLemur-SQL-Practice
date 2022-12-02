/*
Question: 

CVS Health is trying to better understand its pharmacy sales, and how well different products are selling.
Each drug can only be produced by one manufacturer.
Write a query to find the total sales of drugs for each manufacturer.
Round your answer to the closest million, and report your results in descending order of total sales.
Because this data is being directly fed into a dashboard which is being seen by business stakeholders, format your result like this: "$36 million".
If you like this question, try out Pharmacy Analytics (Part 4)!

Source: https://datalemur.com/questions/total-drugs-sales
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
SELECT manufacturer, CONCAT('$', ROUND(SUM(total_sales) / 1000000, 0), ' ', 'million') AS sales
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM(total_sales) DESC;