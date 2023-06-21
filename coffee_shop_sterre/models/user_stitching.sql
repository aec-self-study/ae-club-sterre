{{ config(
    materialized='table'
)}}

select 
  customer_id, 
  count(distinct visitor_id) as count
from {{ source('web_tracking', 'pageviews') }} as pageviews
where customer_id is not null
group by 1 
order by 2 desc 
limit 5