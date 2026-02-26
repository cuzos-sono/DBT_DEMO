with cte as (
    select 
        --started_at,
        to_timestamp(started_at) as started_at,
        date(to_timestamp(started_at)) as date,
        month(to_timestamp(started_at)) as month,
        hour(to_timestamp(started_at)) as hour,
        dayname(to_timestamp(started_at)) as dayofweek,
        case
            when dayofweek in ('Sat', 'Sun')
            then 'WEEKEND'
            ELSE 'BUSINESSDAY'
            END
            AS day_type,
       {#  case
            when month in (12,1,2) then 'WINTER'
            when month in (3,4,5) then 'SPRING'
            when month in (6,7,8) then 'SUMMER'
            when month in (9,10,11) then 'AUTUMN'
            ELSE '' END
            AS season_of_year1 ,#}
        {{FN_SEASON_OF_YEAR('month')}} as relative_date,
        {{FN_RELATIVEDATE('started_at')}} as season_of_year
        
    from 
    {{ source('demo', 'bike') }}
    --where
    --started_at <> 'started_at'
) 

select 
* 
from cte
