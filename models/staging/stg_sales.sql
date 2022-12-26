    with
    stg_sales_listing as (
        select
            *,
            case
                when productname is null or productname = ''
                then 'Produsct Name Not Found'
                else productname
            end as productnamedesc,
            case
                when salespersonname is null or salespersonname = ''
                then 'Person Name Not Found'
                else salespersonname
            end as salespersonnamedesc
        from  {{ref('sales_listing')}}
    )
select *
from stg_sales_listing