SELECT
    order_id || '_' || item_id as order_item_id
    ,order_id
    ,item_id
    ,product_id
    ,quantity
    ,list_price as list_unit_price_usd
    ,discount as discount_pct

FROM
    {{ source('local_bike','order_items') }}