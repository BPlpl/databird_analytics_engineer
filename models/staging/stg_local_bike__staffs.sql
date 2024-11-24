SELECT
    staff_id
    ,first_name
    ,last_name
    ,email
    ,phone
    ,active
    ,store_id
    ,CAST(manager_id AS INTEGER) as manager_id

FROM
    {{ source('local_bike','staffs') }}