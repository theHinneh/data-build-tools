with source as (
       select *
       from {{ source('jaffle_shop', 'customers') }}
),
transformed as (
       select {{ adapter.quote("ID") }} as customer_id,
              {{ adapter.quote("FIRST_NAME") }} as customer_first_name,
              {{ adapter.quote("LAST_NAME") }} as customer_last_name,
              concat(
                     {{ adapter.quote("FIRST_NAME") }},
                     ' ',
                     {{ adapter.quote("LAST_NAME") }}
              ) as full_name
       from source
)
select *
from transformed