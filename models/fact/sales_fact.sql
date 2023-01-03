with
    staging_sales as (
        select salesdate, soldqty, productname, salespersonname, validationdesc
        from {{ ref("stg_sales_listing") }}
    ),
    -- select * from  staging_sales
    dim_sales as (select * from {{ ref("dim_sales") }}),

    -- select * from  dim_sales
    dim_product as (select * from {{ ref("dim_product") }}),

    staging_fact as (
        select a.salesdate, c.productid, b.salespersonid, a.validationdesc, a.soldqty
        from staging_sales a
        inner join dim_sales b on upper(rtrim(ltrim(a.salespersonname))) = upper(rtrim(ltrim(b.salespersonname)))
        inner join dim_product c on upper(rtrim(ltrim(a.productname))) = upper(rtrim(ltrim(c.productname)))
    -- group by 1, 2, 3, 4
    ),

--select * from staging_fact

    final as (
        select
            salesdate,
            productid,
            salespersonid,
            soldqty,
            validationdesc,
            case when validationdesc is null then 1 else 2 end as processstatusid
        from staging_fact
    )
select      
    date(salesdate) as salesdate, productid, salespersonid, sum(soldqty) as totalsoldqty
from final
-- where processstatusid = 1
group by 1, 2, 3
