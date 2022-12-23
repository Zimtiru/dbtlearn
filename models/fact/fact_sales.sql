
with stg_sales as(
  select *
  from  {{ref('staging_sales')}} 
),
--select * from test

 dim_sales as(
  select *
 
 from  {{ref('dim_sales')}} 
),

sales_fact as (
select * from stg_sales a
left outer join  dim_sales b on a.sales_personname=b.sales_person_name
--left outer join test2 b on a.sales_personname=b.sales_person_name
)
select * from sales_fact


