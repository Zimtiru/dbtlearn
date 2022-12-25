{{
   config(
      materialized='view'
   )
}}

WITH sales_listing
AS (
	SELECT *
		,CASE 
			WHEN productname IS NULL
				OR productname = ''
				THEN 'Produsct Name Not Found'
			ELSE productname
			END AS productnamedesc
		,CASE 
			WHEN salespersonname IS NULL
				OR salespersonname = ''
				THEN 'Person Name Not Found'
			ELSE salespersonname
			END AS salespersonnamedesc
	FROM  {{ref('sales')}}
	)
SELECT *
FROM sales_listing