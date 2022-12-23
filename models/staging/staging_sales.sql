with sales_listing as (
    select *,
      case 
         when sales_person_name  is null or sales_person_name  =''  then 'Person Name Not Found'
     else sales_person_name  
    end as sales_person_name_desc
    
     FROM
 {{ ref('dim_sales') }}
)
  select * from  sales_listing