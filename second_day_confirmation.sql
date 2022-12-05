/*
Question: 

New TikTok users sign up with their emails and each user receives a text confirmation to activate their account.
Assume you are given the below tables about emails and texts.
Write a query to display the ids of the users who did not confirm on the first day of sign-up, but confirmed on the second day.

Assumption:
action_date is the date when the user activated their account and confirmed their sign-up through the text.

Source: https://datalemur.com/questions/second-day-confirmation
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution using subquery:*/
SELECT user_id
FROM emails
INNER JOIN texts
ON emails.email_id = texts.email_id
WHERE EXTRACT(DAY FROM action_date) - EXTRACT(DAY FROM signup_date) = 1
AND signup_action = 'Confirmed';