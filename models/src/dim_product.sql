with
    product_listing as (
        select productid, productname from  DBT_DEMO.DEMO.DIM_PRODUCT
        --{{ref('dim_product')}}
    )
select *
from  product_listing