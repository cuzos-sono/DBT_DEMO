with 

daily_weather as (
    select 
    date(time) as date,
    weather,
    temp,
    pressure,
    humidity,
    clouds
    from {{ source('demo', 'weather') }}
    --limit 10
),

daily_weather_agg as (
    select 
    date,
    weather,
    count(weather)
    from daily_weather
    group by date, weather
),

daily_weather_agg2 as (
    select 
    date,
    weather,
    round(avg(temp),2) as avg_temp,
    round(avg(pressure),2) as avg_pressure,
    round(avg(humidity),2) as avg_humidity,
    round(avg(clouds),2) as avg_clouds,
    count(weather),
    row_number() over (partition by date order by count(weather) desc) as rownumber
    from daily_weather
    group by date, weather
),

daily_weather_agg3 as (
    select 
    date,
    weather,
    avg_temp,
    avg_pressure,
    avg_humidity,
    avg_clouds
    from daily_weather_agg2 
    where rownumber = 1
)

select 
* 
from daily_weather_agg3
