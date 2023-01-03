

/*
COPY INTO DBT_DEMO.DEMO.SALES (salesdate,salespersonname,productname,soldqty )
                   from 's3://dbtlearn/sales.csv'
                    FILE_FORMAT = (type = 'CSV' skip_header = 1
                    FIELD_OPTIONALLY_ENCLOSED_BY = '"');
 */

with
    salessource as (
        select
            *          
        from  DBT_DEMO.DEMO.SALES
    )
select *
from salessource