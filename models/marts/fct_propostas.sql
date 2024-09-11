with
    propostas as (
        select *
        from {{ ref('int_propostas') }}
    )
    , agencias as (
        select *
        from {{ ref('dim_agencias') }}
    )
    , clientes as (
        select *
        from {{ ref('dim_clientes') }}
    )
    , colaboradores as (
        select *
        from {{ ref('dim_colaboradores') }}
    )
    , datas as (
        select *
        from {{ ref('dim_dates') }}
    )
    , jointables as (
        select *
        from propostas
        join clientes
            on propostas.id_cliente = clientes.id_cliente
        join colaboradores
            on propostas.id_colab = colaboradores.id_colab
        join agencias
            on clientes.id_agencia = agencias.id_agencia
        join datas
            on propostas.data_proposta = datas.data
    )


select *
from jointables