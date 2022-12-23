

with product_listing as (
    select *,
      case 
         when product_name is null or product_name =''  then 'Produsct Name Not Found'
     else product_name 
    end as product_name_desc
    
     FROM
 {{ ref('dim_product') }}
)
  select * from  product_listing

