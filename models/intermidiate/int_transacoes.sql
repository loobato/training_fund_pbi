with
    int_transacoes as (
        select 
            id_transacao
            ,  id_conta
            ,  date(timestamp(data_transacao)) as data_transacao
            ,  nome_transacao
            ,  valor_transacao

        from {{ ref('stg_transacoes') }}
    )

select *
from int_transacoes