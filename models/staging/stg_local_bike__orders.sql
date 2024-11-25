SELECT
    CAST(order_id as string) as order_id
    ,CAST(customer_id as string) as customer_id
    ,CASE 
        WHEN order_status = 4 THEN 'SHIPPED'
        ELSE 'OTHER' 
    END AS order_status
    ,CAST(order_date AS DATE) as ordered_on
    ,CAST(required_date AS DATE) as required_on
    ,SAFE_CAST(shipped_date AS DATE) as shipped_on
    ,CAST(store_id AS string) as store_id
    ,CAST(staff_id AS string) as staff_id

FROM
    {{ source('local_bike','orders') }}