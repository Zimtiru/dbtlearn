with
    stg1_saleslisting as (
        select
            salesid,
            salesdate,
            soldqty,
            case when productname = '' then null else productname end as productname,
            case when salespersonname = '' then null else salespersonname end as salespersonname
        from {{ ref("salessource") }}
    ),
    -- select * from stg1_saleslisting
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
            end as validationdesc
        from stg1_saleslisting
    ),
 /*    select * from stg_saleslisting
    final1 as (
        select distinct
            salesid,
            listagg(validationdesc, ', ') within group (
                order by salesid desc
            ) validationdesc
        from stg_saleslisting
        group by salesid
    ),

  */
    final2 as (
        select
            b.salesdate,
            b.productname,
            b.salespersonname,
            b.soldqty,
            b.validationdesc
            --case when a.validationdesc = '' then null else a.validationdesc
            --end as validationdesc
            from stg_saleslisting b
        --from final1 a
        --left outer join stg_saleslisting b on a.salesid = b.salesid

    ),

    final3 as (
        select
            salesdate,
            productname,
            salespersonname,
            soldqty,
            validationdesc
         --   case when validationdesc is null then 1 else 2 end as proceessstatusid
        from final2
    ),

    fact_sales as (
        select
            salesdate,
            productname,
            salespersonname,
            soldqty,
            validationdesc
         --   proceessstatusid
        from final3
    -- where proceessstatusid = 1
    )
select *
from fact_sales
