SELECT
    CAST(staff_id as string) as staff_id
    ,first_name
    ,last_name
    ,email
    ,phone
    ,active
    ,CAST(store_id as string) as store_id
    ,CAST(manager_id AS string) as manager_id

FROM
    {{ source('local_bike','staffs') }}