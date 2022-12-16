/*
Question: 

A phone call is considered an international call when the person calling is in a different country than the person receiving the call.
What percentage of phone calls are international? Round the result to 1 decimal.

Assumption:
The caller_id in phone_info table refers to both the caller and receiver.

Source: https://datalemur.com/questions/international-call-percentage
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
WITH combined_calls AS
  (SELECT
    p_c.caller_id,
    c.country_id AS caller_country,
    p_c.receiver_id,
    r.country_id AS receiver_country
    FROM phone_calls AS p_c
    INNER JOIN phone_info AS c
      ON p_c.caller_id = c.caller_id
    LEFT JOIN phone_info AS r
      ON r.caller_id = p_c.receiver_id),
  
  int_calls_count AS  
  (SELECT 
    (CASE WHEN caller_country != receiver_country THEN 1 ELSE 0 END) int_calls
    FROM combined_calls)
    
SELECT ROUND(SUM(int_calls)::DECIMAL / COUNT(*) * 100, 1) AS pct_int_calls
FROM int_calls_count