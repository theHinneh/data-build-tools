WITH bookings AS (
    SELECT *
    FROM {{ ref('stg_exercises_cd__bookings') }}
),
facilities AS (
    SELECT *
    FROM {{ ref('stg_exercises_cd__facilities') }}
),
members AS (
    SELECT *
    FROM {{ ref('stg_exercises_cd__members') }}
),
final AS (
    SELECT b.*, f.name AS facility, concat(m.firstname, ' ', m.surname) AS member, f.membercost, f.guestcost
    FROM bookings b
    LEFT JOIN facilities f ON b.facid = f.facid
    LEFT JOIN members m ON b.memid = m.memid
    WHERE f.facid IS NOT NULL
      AND m.memid IS NOT NULL
)
SELECT *
FROM final
