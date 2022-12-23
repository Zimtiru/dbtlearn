
with fact_sales as (
select *
from  {{ref(staging_product)}}
)

select  * from  fact_sales


