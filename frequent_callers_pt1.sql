/*
Question: 

UnitedHealth has a program called Advocate4Me, which allows members to call an advocate and receive support for their health care needs – 
whether that's behavioural, clinical, well-being, health care financing, benefits, claims or pharmacy help.
Write a query to find how many UHG members made 3 or more calls. case_id column uniquely identifies each call made.
If you like this question, try out Patient Support Analysis (Part 2)!

Source: https://datalemur.com/questions/frequent-callers
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution using CTE:*/
WITH unique_calls AS 
  (SELECT COUNT(DISTINCT(policy_holder_id)) AS members
  FROM callers
  GROUP BY policy_holder_id
  HAVING COUNT(case_id) >= 3)
  
SELECT SUM(members)
FROM unique_calls;