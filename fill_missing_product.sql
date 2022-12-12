/*
Question: 

When you log in to your retailer client's database, you notice that their product catalog data is full of gaps in the category column. 
Can you write a SQL query that returns the product catalog with the missing data filled in?

Assumptions:
Each category is mentioned only once in a category column.
All the products belonging to same category are grouped together.
The first product from a product group will always have a defined category.
Meaning that the first item from each category will not have a missing category value.

Source: https://datalemur.com/questions/fill-missing-product
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
WITH grouped AS
(SELECT 
    product_id,
    category,
    name,
    COUNT(category) OVER (ORDER BY product_id) AS category_group
    FROM products)
    
SELECT
  product_id,
  first_value(category) OVER(PARTITION BY category_group) AS category,
  name
FROM grouped