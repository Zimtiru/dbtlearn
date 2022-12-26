with
    dim_sales_listing as (
        select salespersonid, salespersonname from  DBT_DEMO.DEMO.DIM_SALES_PRODUCT
        
    )
select *
from dim_sales_listing