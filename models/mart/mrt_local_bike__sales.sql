SELECT
    store_name
    ,order_month

    ,count(order_id) as orders_created
    ,sum(total_products_in_order) as bikes_sold
    ,avg(total_products_in_order) as bikes_per_order

    ,avg(list_total_price_usd) as avg_order_amount_gross_discount
    ,avg(total_discount_usd) as avg_discount
    ,avg(total_price_net_discount_usd) as avg_order_amount_net_discount
    ,avg(total_price_net_discount_usd / total_products_in_order) as avg_bike_sell_price_net_discount

    ,count(order_id) / count(distinct staff_id) as orders_per_employee
    ,sum(total_price_net_discount_usd) / count(distinct staff_id) as total_revenue_net_discount_per_employee
    ,sum(total_products_in_order) / count(distinct staff_id) as bikes_sold_per_employee

FROM 
    {{ ref('int_local_bike__order_level') }}

GROUP BY store_name, order_month