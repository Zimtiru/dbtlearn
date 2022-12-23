WITH sales_listing
AS (
	SELECT *
		,CASE 
			WHEN sales_person_name IS NULL
				OR sales_person_name = ''
				THEN 'Person Name Not Found'
			ELSE sales_person_name
			END AS sales_person_name_desc
	FROM {{ ref('dim_sales') }}
	)
SELECT *
FROM sales_listing