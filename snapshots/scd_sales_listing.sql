{% snapshot scd_sales_fact%}
{{
    config(
        target_database ='DBT_DEMO',
        target_schema   ='DBT_ATEFERA',
        strategy        ='timestamp',
        updated_at      ='updated_at',
        invalidate_hard_deletes=True,
    )
}} 
    select * from {{ ref("sales_fact") }},

{% endsnapshot %}
