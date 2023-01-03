

with
    stg1_saleslisting as (
        select
            salesdate,
            soldqty,
            case when productname = '' then null else productname end as productname,
            case
                when salespersonname = '' then null else salespersonname
            end as salespersonname
        from {{ ref("salessource") }}
    ),
    -- select * from  stg_sales_listing_first
    stg_saleslisting as (
        select
            *,
            case
                when productname is null and salespersonname is not null
                then 'Product Name Not Found'
                when productname is not null and salespersonname is null
                then 'Person Name Not Found'
                when (productname is null) and (salespersonname is null)
                then 'Person Name Not Found, Product Name Not Found'
            -- else    productname or productname
            end as validationdesc
        from stg1_saleslisting
    )
select *
from stg_saleslisting
