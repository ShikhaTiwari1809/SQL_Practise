WITH cte1 AS (
    SELECT 
        u.name AS results,
        COUNT(*) AS cnt
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.user_id, u.name
    ORDER BY cnt DESC, u.name ASC
    LIMIT 1
),
cte2 AS (
    SELECT 
        m.title AS results,
        AVG(mr.rating) AS avg_rating
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.movie_id, m.title
    ORDER BY avg_rating DESC, m.title ASC
    LIMIT 1
)
SELECT results FROM cte1
UNION ALL
SELECT results FROM cte2;
