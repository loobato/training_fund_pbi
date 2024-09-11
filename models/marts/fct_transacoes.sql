with 
    transacoes as (
        select *
        from {{ ref('int_transacoes') }}
    )
    , agencias as (
        select *
        from {{ ref('dim_agencias') }}
    )
    , clientes as (
        select *
        from {{ ref('dim_clientes') }}
    )
    , datas as (
        select *
        from {{ ref('dim_dates') }}
    )
    , jointables as (
        select *
        from transacoes
        join clientes
            on transacoes.id_conta = clientes.id_conta
        join agencias
            on clientes.id_agencia = agencias.id_agencia
        join datas
            on transacoes.data_transacao = datas.data

    )

select *
from jointables