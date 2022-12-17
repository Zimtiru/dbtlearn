
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/
/*
{{ config(materialized='table') }}

with source_data as (

    select 1 as id
    union all
    select null as id

)

select *
from source_data
*/


WITH raw_reviews AS (
 SELECT
 *
 FROM
 AIRBNB.RAW.RAW_REVIEWS
)
SELECT
 listing_id,
 date AS review_date,
 reviewer_name,
 comments  AS review_text,
 sentiment AS review_sentiment
FROM raw_reviews
/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
