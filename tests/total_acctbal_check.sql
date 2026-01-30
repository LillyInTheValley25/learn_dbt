select 
    sum(c_acctbal) as total
from {{ ref('playing_with_tests') }}
having total > 100000000