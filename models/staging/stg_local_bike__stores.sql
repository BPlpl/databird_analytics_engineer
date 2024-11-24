SELECT
    store_id
    ,store_name
    ,phone
    ,email
    ,street
    ,city
    ,state
    ,CAST(zip_code as string) as zip_code

FROM
    {{ source('local_bike','stores') }}


