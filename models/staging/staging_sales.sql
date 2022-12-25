

with
    saleslisting_vw as (
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
        from {{ ref("sales") }}
    )
select *
from saleslisting_vw
