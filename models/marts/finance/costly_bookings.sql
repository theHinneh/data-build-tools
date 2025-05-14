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
    SELECT concat(m.firstname, ' ', m.surname) member, f.name facility,
            CASE m.memid
                WHEN 0 THEN f.guestcost * b.slots
                ELSE f.membercost * b.slots
            END cost,
            f.facid facid,
            m.memid memid,
            b.starttime booking_time,
            b.bookid bookid
    FROM members m
        JOIN bookings b ON m.memid = b.memid
               JOIN facilities f ON b.facid = f.facid
      ORDER BY cost DESC)
SELECT *
FROM final
WHERE cost > 30.0
ORDER BY cost DESC