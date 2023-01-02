{% snapshot scd_raw_listings %}
{{
 config(
 target_database='DBT_DEMO',
 target_schema='DEMO',
 unique_key='id',
 strategy='timestamp',
 updated_at='updated_at',
 invalidate_hard_deletes=True
 )
}}
select * FROM {{ ref("sales_fact") }},
{% endsnapshot %}