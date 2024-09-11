with 
    agencias as (
        select *
        from {{ ref('stg_agencia') }}
    )

select *
from agencias

