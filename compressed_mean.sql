/*
Question: 

You are trying to find the mean number of items bought per order on Alibaba, rounded to 1 decimal place.
However, instead of doing analytics on all Alibaba orders, you have access to a summary table,
which describes how many items were in an order (item_count),
and the number of orders that had that many items (order_occurrences).

Source: https://datalemur.com/questions/alibaba-compressed-mean
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
SELECT 
    ROUND(SUM(CAST(item_count AS decimal) * order_occurrences) / 
    SUM(order_occurrences), 1) AS avg_item
FROM items_per_order;