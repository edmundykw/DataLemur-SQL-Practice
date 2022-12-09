/*
Question: 

Assume there are three Spotify tables containing information about the artists, songs, and music charts.
Write a query to determine the top 5 artists whose songs appear in the Top 10 of the global_song_rank table the highest number of times.
From now on, we'll refer to this ranking number as "song appearances".
Output the top 5 artist names in ascending order along with their song appearances ranking (not the number of song appearances,
but the rank of who has the most appearances).
The order of the rank should take precedence.
For example, Ed Sheeran's songs appeared 5 times in Top 10 list of the global song rank table;
this is the highest number of appearances, so he is ranked 1st. 
Bad Bunny's songs appeared in the list 4, so he comes in at a close 2nd.

Assumptions:

If two artists' songs have the same number of appearances, the artists should have the same rank.
The rank number should be continuous (1, 2, 2, 3, 4, 5) and not skipped (1, 2, 2, 4, 5).

Source: https://datalemur.com/questions/top-fans-rank
Credits: https://www.linkedin.com/in/nick-singh-tech
*/

/*My solution:*/
WITH appearances_count AS
  (SELECT artist_name, COUNT(s.song_id) AS appearances
    FROM artists AS a
    INNER JOIN songs AS s
    ON a.artist_id = s.artist_id
    INNER JOIN global_song_rank AS gsr
    ON gsr.song_id = s.song_id
    WHERE rank <= 10
    GROUP BY artist_name
    ORDER BY COUNT(s.song_id) DESC),
    
  artist_rank AS
    (SELECT artist_name,
       (SELECT COUNT(*) FROM appearances_count) - appearances AS ranking /*For this question, this method works. But it's better to use DENSE_RANK.*/
          FROM appearances_count
          GROUP BY artist_name, appearances
          ORDER BY appearances DESC)
      
SELECT artist_name, ranking
FROM artist_rank
WHERE ranking <= 5

/*Solution using DENSE_RANK()*/
WITH appearances_count AS
  (SELECT artist_name, COUNT(s.song_id) AS appearances
    FROM artists AS a
    INNER JOIN songs AS s
    ON a.artist_id = s.artist_id
    INNER JOIN global_song_rank AS gsr
    ON gsr.song_id = s.song_id
    WHERE rank <= 10
    GROUP BY artist_name
    ORDER BY COUNT(s.song_id) DESC),
    
  artist_rank AS
    (SELECT artist_name,
            DENSE_RANK() OVER(
              ORDER BY appearances DESC
            ) AS ranking
      FROM appearances_count)

SELECT *
FROM artist_rank
WHERE ranking <= 5