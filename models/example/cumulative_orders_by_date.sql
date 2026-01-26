{{ config(materialized='view') }}

select
o.o_orderdate as orderdate,
sum(o.o_totalprice) as daily_sales,
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS o
group by o.o_orderdate
order by o.o_orderdate