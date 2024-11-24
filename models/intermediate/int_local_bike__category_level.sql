WITH order_item_agg as(
    SELECT  
        p.product_category
        ,o.store_id
        ,FORMAT_DATE('%Y_%m', o.ordered_on) as order_month
        ,sum(oi.quantity) as products_sold
        ,avg(p.list_unit_price_usd) as list_total_price_usd_avg
        ,avg(oi.list_unit_price_usd * oi.discount_pct) as total_discount_usd_avg
        ,avg(oi.list_unit_price_usd * (1-oi.discount_pct)) as total_price_net_discount_usd_avg

    FROM 
        {{ ref('stg_local_bike__products') }} p
        LEFT JOIN {{ ref('stg_local_bike__order_items') }} oi on oi.product_id = p.product_id
        LEFT JOIN {{ ref('stg_local_bike__orders') }} o on o.order_id = oi.order_id

    GROUP BY p.product_category, o.store_id, order_month
)