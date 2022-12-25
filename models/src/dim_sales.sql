

with
    sales_product_listing as (
        select salespersonid, salespersonname from  DBT_DEMO.DEMO.DIM_PRODUCT
        
    )
select *
from sales_product_listing
