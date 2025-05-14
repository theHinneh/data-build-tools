with source as (
        select * from {{ source('booking_data', 'bookings') }}
  ),
  renamed as (
      select
          {{ adapter.quote("bookid") }},
        {{ adapter.quote("facid") }},
        {{ adapter.quote("memid") }},
        {{ adapter.quote("starttime") }},
        {{ adapter.quote("slots") }}

      from source
  )
  select * from renamed
    