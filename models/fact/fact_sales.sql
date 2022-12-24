WITH stg_sales
AS (
	SELECT *
	FROM {{ref('staging_sales') }}
	),
--select * from stg_sales
 dim_sales
AS (
	SELECT salespersonid,salespersonname
	FROM {{ref('dim_sales') }}
	),

 dim_product
AS (
	SELECT productid,productname
	FROM {{ref('dim_product') }}
	),
--	select * from dim_product

sales_fact
AS (
	SELECT *
	FROM stg_sales a
	LEFT OUTER JOIN dim_sales b ON a.sales_personname = b.salespersonname
	LEFT OUTER JOIN dim_product p ON a.product_name = p.productname
	)
SELECT  SALESDATE, salespersonid,productid,soldqty,
PRODUCT_NAME_DESC as PRODUCTNAMEDESC,
SALES_PERSON_NAME_DESC as SALESPERSONNAMEDESC
FROM sales_fact
