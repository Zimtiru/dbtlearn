with
    productlisting as (
        select productid, productname from  DBT_DEMO.DEMO.DIM_PRODUCT

    )
select *
from  productlisting