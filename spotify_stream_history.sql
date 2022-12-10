/*
Question: 

You're given two tables on Spotify users' streaming data.
songs_history table contains the historical streaming data
and songs_weekly table contains the current week's streaming data.
Write a query to output the user id, song id, 
and cumulative count of song plays as of 4 August 2022 sorted in descending order.

Definitions:
song_weekly table currently holds data from 1 August 2022 to 7 August 2022.
songs_history table currently holds data up to to 31 July 2022. 
The output should include the historical data in this table.

Assumption:
There may be a new user or song in the songs_weekly table not present in the songs_history table.

Source: https://datalemur.com/questions/spotify-streaming-history
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
WITH weekly_counts AS
  (SELECT user_id, song_id, COUNT(song_id) AS play_for_week
    FROM songs_weekly
    WHERE listen_time < '2022-08-05'
    GROUP BY user_id, song_id),

  combined_history AS
    (SELECT sh.user_id AS user_id,
          sh.song_id AS song_id,
          sh.song_plays AS past_plays,
          wc.user_id AS current_id, 
          wc.song_id AS wsong_id,
          wc.play_for_week
      FROM songs_history AS sh
      FULL JOIN weekly_counts AS wc
      ON sh.user_id = wc.user_id
      AND sh.song_id = wc.song_id),
  
  sum_of_plays AS
    (SELECT
       CASE WHEN ch.current_id IS NOT NULL THEN ch.current_id ELSE ch.user_id END AS user_id,
       CASE WHEN ch.song_id IS NOT NULL THEN ch.song_id ELSE ch.wsong_id END AS song_id,
       CASE WHEN past_plays IS NULL THEN 0 ELSE past_plays END AS past_plays,
       CASE WHEN play_for_week IS NOT NULL THEN play_for_week ELSE 0 END AS weekly_count
      FROM combined_history AS ch)

SELECT user_id, song_id, past_plays + weekly_count AS song_plays
FROM sum_of_plays
ORDER BY song_plays DESC;