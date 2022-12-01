/*
Question: 

This is the same question as problem #8 in the SQL Chapter of Ace the Data Science Interview!
Assume you are given the table below that shows job postings for all companies on the LinkedIn platform. 
Write a query to get the number of companies that have posted duplicate job listings.

Clarification:

Duplicate job listings refer to two jobs at the same company with the same title and description.

Source: https://datalemur.com/questions/duplicate-job-listings
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
SELECT COUNT(DISTINCT(jl1.company_id))
FROM job_listings AS jl1
LEFT JOIN job_listings AS jl2
ON jl1.company_id = jl2.company_id
WHERE jl1.title = jl2.title
AND jl1.description = jl2.description
AND jl1.job_id != jl2.job_id