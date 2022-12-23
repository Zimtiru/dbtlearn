WITH stg_sales
AS (
	SELECT *
	FROM {{ref('staging_sales') }}
	),
	--select * from stg_sales
dim_sales
AS (
	SELECT *
	FROM {{ref('dim_sales') }}
	),
	--select * from dim_sales
sales_fact
AS (
	SELECT *
	FROM stg_sales a
	LEFT OUTER JOIN dim_sales b ON a.sales_personname = b.salespersonname
		--left outer join test2 b on a.sales_personname=b.sales_person_name
	)
SELECT *
FROM sales_fact