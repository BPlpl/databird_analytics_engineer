SELECT
    order_id
    ,customer_id
    ,CASE 
        WHEN order_status = 4 THEN 'SHIPPED'
        ELSE 'OTHER' 
    END AS order_status
    ,CAST(order_date AS DATE) as ordered_on
    ,CAST(required_date AS DATE) as required_on
    ,CAST(shipped_date AS DATE) as shipped_on
    ,store_id
    ,staff_id

FROM
    {{ source('local_bike','orders') }}