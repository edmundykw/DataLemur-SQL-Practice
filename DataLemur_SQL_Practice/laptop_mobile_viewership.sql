/*
Question: 

This is the same question as problem #3 in the SQL Chapter of Ace the Data Science Interview!
Assume that you are given the table below containing information on viewership by device type (where the three types are laptop, tablet, and phone). 
Define “mobile” as the sum of tablet and phone viewership numbers. 
Write a query to compare the viewership on laptops versus mobile devices.
Output the total viewership for laptop and mobile devices in the format of "laptop_views" and "mobile_views".

Source: https://datalemur.com/questions/laptop-mobile-viewership
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
SELECT COUNT(device_type) AS laptop_views,
(SELECT COUNT(device_type)
FROM viewership
WHERE device_type IN ('tablet', 'phone')) AS mobile_views
FROM viewership
WHERE device_type = 'laptop';