with
    staging_sales as (
            select * from {{ ref("stg_sales") }}
            ),
    -- select * from  staging_sales
    dim_sales as (
        select * from {{ ref("dim_sales") }}
        ),

-- select * from  dim_sales
    dim_product as (
        select * from {{ ref("dim_product") }}
    ),

final as (
        select a.salesdate,
            c.productid,
            b.salespersonid,
            a.productnamedesc,
            a.salespersondesc
        from staging_sales a
        inner join  dim_sales    b on  a.salespersonid= b.salespersonid
        inner join  dim_product  c on  a.productname= c.productname
    )
        select * from final

