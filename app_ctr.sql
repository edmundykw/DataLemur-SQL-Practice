/*
Question: 

This is the same question as problem #1 in the SQL Chapter of Ace the Data Science Interview!
Assume you have an events table on app analytics. 
Write a query to get the app’s click-through rate (CTR %) in 2022. 
Output the results in percentages rounded to 2 decimal places.

Notes: 
Percentage of click-through rate = 100.0 * Number of clicks / Number of impressions
To avoid integer division, you should multiply the click-through rate by 100.0, not 100.

Source: https://datalemur.com/questions/click-through-rate
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/

SELECT t.app_id, ROUND(100.0 * t.clk / t.imp,2) AS ctr
	FROM (SELECT app_id,
    	SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END) AS imp,
    	SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) AS clk
    	FROM events
     	WHERE timestamp >= '2022-01-01'
    	AND timestamp <= '2022-12-31'
    	GROUP BY app_id) AS t
	GROUP BY t.app_id, t.clk, t.imp
	ORDER BY t.app_id;

/* Key takeaway 
For questions that require mathematical manipulation, it's important to transform text fields to 
numerical. This makes it easier to apply math operations on the data in the column.
*/
