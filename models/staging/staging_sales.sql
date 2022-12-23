{{
   config(
      materialized='view'
   )
}}

WITH sales_listing
AS (
	SELECT *
		,CASE 
			WHEN product_name IS NULL
				OR product_name = ''
				THEN 'Produsct Name Not Found'
			ELSE product_name
			END AS product_name_desc
		,CASE 
			WHEN sales_personname IS NULL
				OR sales_personname = ''
				THEN 'Person Name Not Found'
			ELSE sales_personname
			END AS sales_person_name_desc
	FROM DBT_DEMO.DEMO.sales
	)
SELECT *
FROM sales_listing