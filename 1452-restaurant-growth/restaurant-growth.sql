WITH daily AS (
    SELECT 
        visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
),
rolling AS (
    SELECT
        visited_on,
        amount,
        SUM(amount) OVER (
            ORDER BY visited_on 
            RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
        ) AS amount_7_days,
        COUNT(*) OVER (
            ORDER BY visited_on 
            RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
        ) AS days_count
    FROM daily
)
SELECT
    visited_on,
    amount_7_days AS amount,
    ROUND(amount_7_days / 7, 2) AS average_amount
FROM rolling
WHERE days_count = 7
ORDER BY visited_on;
