with source as (select *
                from {{ source('stripe', 'payments') }}),
     transformed as (select {{ adapter.quote("ID") }} as payment_id,
                        {{ adapter.quote("ORDERID") }} as order_id,
                        round({{ adapter.quote("AMOUNT") }} / 100.0, 2) as payment_amount,
                        {{ adapter.quote("CREATED") }} as payment_created_at,
                        {{ adapter.quote("STATUS") }} as payment_status
                 from source)
select *
from transformed