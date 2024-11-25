SELECT
    CAST(brand_id AS string) as brand_id
    ,brand_name

FROM
    {{ source('local_bike','brands') }}