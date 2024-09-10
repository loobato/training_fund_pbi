with 
    clientes as (
        select *
        from {{ ref('stg_clientes') }}
    )
    , contas as (
        select *
        from {{ ref('stg_contas') }}
    )
    , jointables as (
        select 
            clientes.id_cliente
            , contas.id_conta
            , contas.id_agencia
            , contas.data_abertura
            , clientes.data_nascimento_cliente
            , clientes.nome_cliente 
            , clientes.sobrenome_cliente
            , clientes.email_cliente
            , clientes.tipo_cliente
            , clientes.cpfcnpj_cliente
            , clientes.endereco_cliente
            , clientes.cep_cliente
            , contas.tipo_conta

        from clientes
        join contas
        on clientes.id_cliente = contas.id_cliente
    )

select *
from jointables

