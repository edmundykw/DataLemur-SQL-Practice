/*
Question: 

A Microsoft Azure Supercloud customer is a company which buys at least 1 product from each product category.
Write a query to report the company ID which is a Supercloud customer.

Source: https://datalemur.com/questions/supercloud-customer
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
WITH product_customer AS
  (SELECT cc.customer_id, c.product_category
    FROM products AS c
    LEFT JOIN customer_contracts AS cc
    ON cc.product_id = c.product_id),
    
  count_cat AS
    (SELECT customer_id, COUNT(DISTINCT product_category) AS no_of_cat
      FROM product_customer
      GROUP BY customer_id)
      
SELECT customer_id
FROM count_cat
WHERE no_of_cat = 3