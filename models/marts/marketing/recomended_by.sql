WITH members AS (
    SELECT *
    FROM {{ ref('stg_exercises_cd__members') }}
),
recomenders AS (
    SELECT *
    FROM {{ ref('stg_exercises_cd__members') }}
),
final AS (
    SELECT 
        m.memid AS member_id,
        r.memid AS recomenders_id,
        CONCAT(m.firstname, ' ', m.surname) AS member_name,
        CONCAT(r.firstname, ' ', r.surname) AS recomender_name,
        r.telephone AS recomender_phone
    FROM members m
    LEFT JOIN recomenders r ON m.recommendedby = r.memid
)
SELECT *
FROM final