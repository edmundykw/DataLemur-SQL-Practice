/*
Question: 

UnitedHealth Group has a program called Advocate4Me, which allows members to call an advocate and receive support for their health care needs – 
whether that's behavioural, clinical, well-being, health care financing, benefits, claims or pharmacy help.
Calls to the Advocate4Me call centre are categorised, but sometimes they can't fit neatly into a category.
These uncategorised calls are labelled “n/a”, or are just empty (when a support agent enters nothing into the category field).
Write a query to find the percentage of calls that cannot be categorised. 
Round your answer to 1 decimal place.

Source:https://datalemur.com/questions/uncategorized-calls-percentage
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution using subquery:*/
WITH uncategorised_calls AS
  (SELECT COUNT(*) AS uncategorised_calls
  FROM callers
  WHERE call_category IS NULL
  OR call_category = 'n/a')
  
SELECT ROUND((SELECT * FROM uncategorised_calls) * 100.0 / COUNT(*), 1) AS pct_uncat  
FROM callers