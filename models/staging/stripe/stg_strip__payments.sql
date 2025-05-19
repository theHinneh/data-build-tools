with source as (select *
                from {{ source('stripe', 'payments') }}),
     renamed as (select {{ adapter.quote("ID") }} as id,
                        {{ adapter.quote("ORDERID") }} as orderid,
                        {{ adapter.quote("PAYMENTMETHOD") }} as paymentmethod,
                        {{ adapter.quote("STATUS") }} as status,
                        {{ adapter.quote("AMOUNT") }} as amount,
                        {{ adapter.quote("CREATED") }} as created
                 from source)
select *
from renamed