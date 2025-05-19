with source as (select *
                from {{ source('jaffle_shop', 'customers') }}),
     renamed as (select {{ adapter.quote("ID") }} as id,
                        {{ adapter.quote("FIRST_NAME") }} as first_name,
                        {{ adapter.quote("LAST_NAME") }} as last_name
                 from source)
select *
from renamed