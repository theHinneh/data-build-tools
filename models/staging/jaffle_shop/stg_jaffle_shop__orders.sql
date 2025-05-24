with source as (
    select *
    from {{ source('jaffle_shop', 'orders') }}
),
transformed as (
    select {{ adapter.quote("ID") }} as order_id,
        {{ adapter.quote("USER_ID") }} as customer_id,
        {{ adapter.quote("ORDER_DATE") }} as order_placed_at,
        {{ adapter.quote("STATUS") }} as order_status,
        case
            when {{ adapter.quote("STATUS") }} not in ('returned', 'return_pending')
            then {{ adapter.quote("ORDER_DATE") }}
        end as valid_order_date
    from source
)
select *
from transformed