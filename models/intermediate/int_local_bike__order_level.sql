WITH order_item_agg as(
    SELECT  
        o.order_id
        ,sum(oi.quantity) as total_products_in_order
        ,count(distinct oi.product_id) as distinct_products_in_order
        ,sum(oi.list_unit_price_usd) as list_total_price_usd
        ,sum(oi.list_unit_price_usd * oi.discount_pct) as total_discount_usd
        ,sum(oi.list_unit_price_usd * (1-oi.discount_pct)) as total_price_net_discount_usd

    FROM 
        {{ ref('stg_local_bike__orders') }} o
        LEFT JOIN {{ ref('stg_local_bike__order_items') }} oi on o.order_id = oi.order_id

    GROUP BY o.order_id
)

SELECT 
    o.order_id
    ,o.customer_id
    ,o.order_status
    mFORMAT_DATE('%Y_%m', o.ordered_on) as order_month
    ,o.ordered_on
    ,o.shipped_on
    ,DATE_DIFF(o.shipped_on, o.ordered_on, DAY) AS delivery_speed
    ,o.store_id
    ,o.staff_id

    ,oia.total_products_in_order
    ,oia.distinct_products_in_order
    ,oia.list_total_price_usd
    ,oia.total_discount_usd
    ,oia.total_price_net_discount_usd

FROM 
    {{ ref('stg_local_bike__orders') }} o
    LEFT JOIN order_item_agg oia on oia.order_id = o.order_id