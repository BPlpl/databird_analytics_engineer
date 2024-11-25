SELECT
    CAST(product_id as string) as product_id
    ,product_name
    ,brand_id
    ,CAST(category_id AS string) as category_id
    ,model_year
    ,list_price as list_unit_price_usd

FROM
    {{ source('local_bike','products') }}