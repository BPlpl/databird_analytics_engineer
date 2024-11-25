SELECT
    CAST(customer_id as string) as customer_id
    ,first_name
    ,last_name
    ,phone
    ,email
    ,street
    ,city
    ,state
    ,CAST(zip_code as string) as zip_code

FROM
    {{ source('local_bike','customers') }}