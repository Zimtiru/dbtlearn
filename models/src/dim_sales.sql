with
    dim_saleslisting as (
        select salespersonid, salespersonname from  DBT_DEMO.DEMO.DIM_SALES_PRODUCT
        
    )
select *
from dim_saleslisting