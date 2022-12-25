
with
    product_listing as (
        select productid, productname from {{source('dbt_demo','dim_product')}}
    )
select *
from  product_listing
