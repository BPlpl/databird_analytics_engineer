SELECT
    CAST(store_id as string) as store_id
    ,CAST(product_id AS string) as product_id
    ,quantity

FROM
    {{ source('local_bike','stocks') }}