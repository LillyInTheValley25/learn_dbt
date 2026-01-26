{{ config(materialized='incremental', unique_key = 't_time') }}

select *,
to_time(concat(t_hour::varchar, ':', t_minute, ':', t_second)) as calc_time
from SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.TIME_DIM
where calc_time <= current_time

{% if is_incremental() %}
and t_time > (select max(t_time) from {{ this }})
{% endif %}