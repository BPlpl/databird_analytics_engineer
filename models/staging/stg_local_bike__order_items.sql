SELECT
    CAST(order_id || '_' || item_id AS string) as order_item_id
    ,CAST(order_id AS string) as order_id
    ,CAST(item_id AS string) asitem_id
    ,CAST(product_id AS string) as product_id
    ,quantity
    ,list_price as list_unit_price_usd
    ,discount as discount_pct

FROM
    {{ source('local_bike','order_items') }}