SELECT
    content_id,
    content_text AS original_text,
    (
        SELECT GROUP_CONCAT(
            CASE
                WHEN word LIKE '%-%' THEN (
                    SELECT GROUP_CONCAT(
                        CONCAT(
                            UPPER(LEFT(p,1)),
                            LOWER(SUBSTRING(p,2))
                        ) SEPARATOR '-'
                    )
                    FROM JSON_TABLE(
                        CONCAT('["', REPLACE(word, '-', '","'), '"]'),
                        '$[*]' COLUMNS (p VARCHAR(50) PATH '$')
                    ) jt2
                )
                ELSE CONCAT(UPPER(LEFT(word,1)), LOWER(SUBSTRING(word,2)))
            END
            SEPARATOR ' '
        )
        FROM JSON_TABLE(
            CONCAT('["', REPLACE(content_text, ' ', '","'), '"]'),
            '$[*]' COLUMNS (word VARCHAR(50) PATH '$')
        ) jt
    ) AS converted_text
FROM user_content;
