SELECT
s.store_name
,c.category_name
,sum(quantity) as bikes_in_inventory

FROM
    {{ ref('stg_local_bike__stocks') }} inv
    LEFT JOIN {{ ref('stg_local_bike__stores') }} s on s.store_id = inv.store_id
    LEFT JOIN {{ ref('stg_local_bike__products') }} p on p.product_id = inv.product_id
    LEFT JOIN {{ ref('stg_local_bike__categories') }} c on c.category_id = p.category_id

GROUP BY s.store_name, c.category_name