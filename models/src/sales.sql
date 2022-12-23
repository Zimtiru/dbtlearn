with sales_listing as (
    select *,
      case 
         when product_name is null or product_name =''  then 'Produsct Name Not Found'
     else product_name
    end as  product_name_desc,
      case 
         when sales_personname  is null or sales_personname  =''  then 'Person Name Not Found'
     else sales_personname  
    end as sales_person_name_desc   
    from DBT_DEMO.DEMO.sales
)
  select * from  sales_listing 