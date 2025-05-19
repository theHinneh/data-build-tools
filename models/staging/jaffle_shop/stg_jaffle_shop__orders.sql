with source as (select *
                from {{ source('jaffle_shop', 'orders') }}),
     renamed as (select {{ adapter.quote("ID") }} as id,
                        {{ adapter.quote("USER_ID") }} as user_id,
                        {{ adapter.quote("ORDER_DATE") }} as order_date,
                        {{ adapter.quote("STATUS") }} as status
                 from source)
select *
from renamed