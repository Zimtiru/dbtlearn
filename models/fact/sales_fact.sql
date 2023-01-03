with
    staging_sales as (
        select salesdate, soldqty, productname, salespersonname, validationdesc
        from {{ ref("stg_sales_listing") }}
    ),
    -- select * from  staging_sales
    dim_sales as (select * from {{ ref("dim_sales") }}),

    -- select * from  dim_sales
    dim_product as (select * from {{ ref("dim_product") }}),

    final_stg as (
        select
            a.salesdate,
            c.productid,
            b.salespersonid,
            a.validationdesc,
            sum(a.soldqty) as totalsoldqty
        from staging_sales a
        left outer join
            dim_sales b on upper(a.salespersonname) = upper(b.salespersonname)
        left outer join dim_product c on upper(a.productname) = upper(c.productname)
        group by 1, 2, 3, 4
    ),


    final as (
        select
            salesdate,
            productid,
            salespersonid,
            totalsoldqty,
            validationdesc,
            case when validationdesc is null then 1 else 2 end as processstatusid
        from final_stg
    )
select *
from final
where processstatusid = 1
