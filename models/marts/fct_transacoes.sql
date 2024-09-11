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
        select
            transacoes.id_transacao
            , transacoes.id_conta
            , clientes.id_cliente
            , agencias.id_agencia
            , transacoes.data_transacao
            , transacoes.nome_transacao
            , clientes.nome_cliente
            , clientes.sobrenome_cliente
            , clientes.email_cliente
            , clientes.tipo_cliente
            , clientes.cpfcnpj_cliente
            , clientes.endereco_cliente
            , clientes.cep_cliente
            , clientes.tipo_conta
            , agencias.nome_agencia
            , agencias.endereco_agencia
            , agencias.cidade_agencia
            , agencias.uf_agencia
            , agencias.tipo_agencia
            , datas.data
            , datas.ano
            , datas.mes
            , datas.dia
            , datas.numero_semana
            , datas.trimestre
            , datas.dia_semana
            , datas.fim_de_semana
            , transacoes.valor_transacao

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