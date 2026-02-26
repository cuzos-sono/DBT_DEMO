with 
SOURCE as (
    select 
        *
    from 
    {{ source('demo', 'bike') }}
    -- limit 10
),


bike as (
    select 
    DISTINCT
    START_STATIO_ID AS START_STATION_ID,
    START_STATION_NAME,
    START_LAT AS START_STATION_LAT,
    START_LNG AS START_STATION_LNG
    from SOURCE
)

select 
* 
from bike