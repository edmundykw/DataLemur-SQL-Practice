/*
Question: 

This is the same question as problem #12 in the SQL Chapter of Ace the Data Science Interview!
Assume you are given the table containing information on Amazon customers and their spending on products in various categories.
Identify the top two highest-grossing products within each category in 2022.
Output the category, product, and total spend.

Source: https://datalemur.com/questions/sql-highest-grossing
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
WITH grouped_spend AS 
  (SELECT 
    category,
    product,
    SUM(spend) AS total_spend
    FROM product_spend
    WHERE DATE_PART('year', transaction_date::DATE) = 2022
    GROUP BY category, product),
    
  ranked_spend AS
    (SELECT
      *,
      RANK() OVER(PARTITION BY category ORDER BY total_spend DESC)
      FROM grouped_spend
    )

SELECT category, product, total_spend
FROM ranked_spend
WHERE rank < 3;