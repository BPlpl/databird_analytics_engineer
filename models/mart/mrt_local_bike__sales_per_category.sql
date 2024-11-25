SELECT  
    s.store_name
    ,FORMAT_DATE('%Y', o.ordered_on) as order_year
    ,FORMAT_DATE('%Y_%m', o.ordered_on) as order_month
    ,c.category_name

    ,sum(oi.quantity) as bikes_sold
    ,avg(oi.quantity * p.list_unit_price_usd) as avg_order_amount_gross_discount
    ,avg(oi.quantity * oi.list_unit_price_usd * oi.discount_pct) as avg_discount
    ,avg(oi.quantity * oi.list_unit_price_usd * (1-oi.discount_pct)) as avg_order_amount_net_discount

FROM 
    {{ ref('stg_local_bike__orders') }} o
    LEFT JOIN {{ ref('stg_local_bike__order_items') }} oi on oi.order_id = o.order_id
    LEFT JOIN {{ ref('stg_local_bike__products') }} p on p.product_id = oi.product_id
    LEFT JOIN {{ ref('stg_local_bike__categories') }} c on c.category_id = p.category_id
    LEFT JOIN {{ ref('stg_local_bike__stores') }} s on s.store_id = o.store_id

GROUP BY c.category_name, s.store_name, order_year, order_month