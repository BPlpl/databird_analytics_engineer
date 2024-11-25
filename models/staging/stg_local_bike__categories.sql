SELECT
    CAST(category_id AS string) as category_id
    ,TRIM(REPLACE(REPLACE(category_name,' Bikes',''), ' Bicycles','')) as category_name

FROM
    {{ source('local_bike','categories') }}