with 
CTE as (
    select 
        trips.*,
        weather.*
    from {{ ref('trip_fact') }} trips
    left join {{ ref('daily_weather') }} weather 
        on trips.TRIP_DATE = weather.DATE

    limit 1000
)


select 
* 
from CTE