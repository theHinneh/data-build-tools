with source as (
        select * from {{ source('booking_data', 'facilities') }}
  ),
  renamed as (
      select
          {{ adapter.quote("facid") }},
        {{ adapter.quote("name") }},
        {{ adapter.quote("membercost") }},
        {{ adapter.quote("guestcost") }},
        {{ adapter.quote("initialoutlay") }},
        {{ adapter.quote("monthlymaintenance") }}

      from source
  )
  select * from renamed
    