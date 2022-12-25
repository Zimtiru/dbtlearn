

with
    sales_product_listing as (
        select salespersonid, salespersonname from  {{ref('dim_sales_product')}}
        
    )
select *
from sales_product_listing
