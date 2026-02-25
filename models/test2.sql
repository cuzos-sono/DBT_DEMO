select *
from {{ ref('test') }}
limit 5