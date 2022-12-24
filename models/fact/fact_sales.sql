with
    stg_sales as (select * from {{ ref("staging_sales") }}),
    -- select * from stg_sales
    dim_sales as (select salespersonid, salespersonname from {{ ref("dim_sales") }}),

    dim_product as (select productid, productname from {{ ref("dim_product") }}),
    -- select * from dim_product
    sales_fact as (
        select *
        from stg_sales a
        inner join dim_sales b on a.sales_personname = b.salespersonname
        inner join dim_product p on a.product_name = p.productname
    )
select
    salesdate,
    salespersonid,
    productid,
    sum(soldqty) as totalsoldqty,
    productnamedesc,
    salespersonnamedesc
from sales_fact
group by salesdate, salespersonid, productid, productnamedesc, salespersonnamedesc
