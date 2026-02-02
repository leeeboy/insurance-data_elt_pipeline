--business ready view
select 
    count(customer_id) as customer_count,
    state
from {{ ref('stg_customers') }}
group by state