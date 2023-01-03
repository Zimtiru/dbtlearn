

with
    stg_sales_listing_first as (
        select
            *,
            case
                when productname = '' then null else productname
            end as productname_new,
            case
                when salespersonname = '' then null else salespersonname
            end as salespersonname_new
        from {{ ref("sales_source") }}
    ),
    -- select * from  stg_sales_listing_first
    stg_sales_listing as (
        select
            *,
            case
                when productname_new is null and salespersonname_new is not null
                then 'Product Name Not Found'
                when productname_new is not null and salespersonname_new is null
                then 'Person Name Not Found'
                when (productname_new is null) and (salespersonname_new is null)
                then 'Person Name Not Found, Product Name Not Found'
            -- else    productname or productname
            end as validationdesc
        from stg_sales_listing_first
    )
select *
from stg_sales_listing
