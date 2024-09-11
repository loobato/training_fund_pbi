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
        select 
            propostas.id_propostas
            , propostas.id_cliente
            , propostas.id_colab
            , propostas.data_proposta
            , propostas.taxa_juros_mensal
            , propostas.valor_proposta
            , propostas.valor_financiamento
            , propostas.valor_entrada
            , propostas.valor_prestacao
            , propostas.quantidade_parcelas
            , propostas.carencia
            , propostas.status_proposta
            , clientes.id_conta
            , clientes.data_nascimento_cliente
            , clientes.nome_cliente
            , clientes.sobrenome_cliente
            , clientes.email_cliente
            , clientes.tipo_cliente
            , clientes.cpfcnpj_cliente
            , clientes.endereco_cliente
            , clientes.cep_cliente
            , clientes.tipo_conta
            , colaboradores.nome_colab
            , colaboradores.sobrenome_colab
            , colaboradores.email_colab
            , colaboradores.cpf_colab
            , colaboradores.data_nascimento
            , colaboradores.endereco_colab
            , colaboradores.cep_colab
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