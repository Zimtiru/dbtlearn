{% snapshot scd_sales_fact%}
{{
    config(
        target_database ='DBT_DEMO',
        target_schema   ='DBT_TEFERA',
        unique_key      ='id',
        strategy        ='timestamp',
        updated_at      ='updated_at',
        invalidate_hard_deletes=True,
    )
}} 

select * from {{source('dbtlearn', 'sales_source') }}

{% endsnapshot %}