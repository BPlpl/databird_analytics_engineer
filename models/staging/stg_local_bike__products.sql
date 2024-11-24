SELECT
    product_id
    ,product_name
    ,brand_id
    ,category_id
    ,model_year
    ,list_price as list_unit_price_usd

FROM
    {{ source('local_bike','products') }}