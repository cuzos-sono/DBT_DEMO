{% macro FN_RELATIVEDATE(date) %}
    case 
    when to_timestamp({{date}}) < current_date then 'PAST'
    when to_timestamp({{date}}) = current_date then 'TODDAY'
    when to_timestamp({{date}}) > current_date then 'FUTURE'
    else ''
    end
{% endmacro %}



{% macro FN_SEASON_OF_YEAR(month) %}
    case
    when {{month}} in (12,1,2) then 'WINTER'
    when {{month}} in (3,4,5) then 'SPRING'
    when {{month}} in (6,7,8) then 'SUMMER'
    when {{month}} in (9,10,11) then 'AUTUMN'
    else ''
    end
{% endmacro %}            