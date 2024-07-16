with
    raw_transacoes as (
        select 
            cast(cod_transacao as int) as id_transacao
            , cast(num_conta as int) as id_conta 
            , cast(data_transacao as string) as data_transacao 
            , cast(nome_transacao as string) as nome_transacao
            , cast(valor_transacao as numeric) as valor_transacao

        from {{ source('rawdata', 'transacoes') }}
    )

select *
from raw_transacoes
