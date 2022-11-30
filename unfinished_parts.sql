/* 
Question: 

Tesla is investigating bottlenecks in their production, and they need your help to extract the relevant data. 
Write a SQL query that determines which parts have begun the assembly process but are not yet finished.

Source: https://datalemur.com/questions/tesla-unfinished-parts
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
SELECT part
FROM parts_assembly
WHERE finish_date IS NULL
GROUP BY part;