

WITH product_listing
AS (
	SELECT *
		,CASE 
			WHEN product_name IS NULL
				OR product_name = ''
				THEN 'Produsct Name Not Found'
			ELSE product_name
			END AS product_name_desc
	FROM {{ ref('dim_product') }}
	)
SELECT *
FROM product_listing

