{% snapshot scd_sales_fact_snapshot %}
    {{
 config(
    target_database='DBT_DEMO',
    target_schema='DBT_ATEFERA',
    unique_key='id',
    strategy='timestamp',
    updated_at='updated_at',
    invalidate_hard_deletes=True
 )
    }}
    select * from {{ ref('sales_fact') }}  ,

{% endsnapshot %}


