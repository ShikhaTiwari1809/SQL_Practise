# Write your MySQL query statement below


DELETE FROM Person
WHERE id IN (
    SELECT id FROM (
        SELECT 
            id,
            RANK() OVER (PARTITION BY email ORDER BY id) AS rn
        FROM Person
    ) t
    WHERE rn > 1
);
