WITH order_data_staff_level as(
    SELECT
    staff_id
    ,FORMAT_DATE('%Y_%m', ordered_on) as order_month
    ,count(order_id) as orders_count
    ,sum(total_products_in_order) as products_count
    ,sum(total_discount_usd) as discount_usd_sum
    ,sum(total_price_net_discount_usd) as revenue_net_sum

    FROM
        {{ ref('int_local_bike__order_level')}}
    
    GROUP BY staff_id, order_month

)

SELECT
    s.staff_id
    ,s.first_name || ' ' || s.last_name as full_name
    ,s.active
    ,s.store_id

    ,os.order_month
    ,os.orders_count
    ,os.products_count
    ,os.discount_usd_sum
    ,os.revenue_net_sum

FROM
    {{ ref('stg_local_bike__staffs') }} s
    LEFT JOIN order_data_staff_level os on os.staff_id = s.staff_id