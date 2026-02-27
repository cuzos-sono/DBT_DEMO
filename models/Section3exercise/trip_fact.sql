with 
SOURCE as (
    select 
        *
    from 
    {{ source('demo', 'bike') }}
    -- limit 10
),

TRIPS as (
    select 
    RIDE_ID,
    -- RIDEABLE_TYPE,
    DATE(STARTED_AT) AS TRIP_DATE,
    START_STATIO_ID AS START_STATION_ID,
    END_STATION_ID,
    MEMBER_CSUAL AS MEMBER_CASUAL,
    TIMESTAMPDIFF(SECOND, STARTED_AT, ENDED_AT) AS TRIP_DURATION_SEC
    from SOURCE
)


select 
* 
from TRIPS