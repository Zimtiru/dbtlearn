with
    product_listing as (
        select productid, productname from  {{ref('dim_product')}}

    )
select *
from  product_listing