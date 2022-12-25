with sales_listing as (
    select * 
    from   {{ref('sales')}}
    ) 
    select * from sales_listing
