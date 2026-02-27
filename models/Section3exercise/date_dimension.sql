with cte as (
    select 
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
        {{FN_SEASON_OF_YEAR('month')}} as relative_date,
        {{FN_RELATIVEDATE('started_at')}} as season_of_year
        
    from 
    {{ source('demo', 'bike') }}
) 

select 
* 
from cte
