with source as (
        select * from {{ source('booking_data', 'members') }}
  ),
  renamed as (
      select
          {{ adapter.quote("memid") }},
        {{ adapter.quote("surname") }},
        {{ adapter.quote("firstname") }},
        {{ adapter.quote("address") }},
        {{ adapter.quote("zipcode") }},
        {{ adapter.quote("telephone") }},
        {{ adapter.quote("recommendedby") }},
        {{ adapter.quote("joindate") }}

      from source
  )
  select * from renamed
    