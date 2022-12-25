
with product_listing as (
            select productid, productname from dbt_demo.demo.dim_product
    )
select * from product_listing 
