with
    staging_sales as (
            select * from {{ ref("stg_sales_listing") }}
            ),
--    select * from  staging_sales
    dim_sales as (
        select * from {{ ref("dim_sales") }}
        ),

-- select * from  dim_sales
    dim_product as (
        select * from {{ ref("dim_product") }}
    ),

final as (
        select 
            a.salesdate,
            c.productid,
            b.salespersonid,
            a.SALESPERSONNAMEDESC,
            a.PRODUCTNAMEDESC
        from staging_sales a
        inner join  dim_sales    b on  upper(a.salespersonname)= upper(b.salespersonname)
        inner join  dim_product  c on  upper(a.productname)= upper(c.productname)
    )
        select * from final



