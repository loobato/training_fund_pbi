with
    propostas as (
        select
            id_propostas
            , id_cliente
            , id_colab
            , date(timestamp(data_proposta)) as data_proposta
            , taxa_juros_mensal
            , valor_proposta
            , valor_financiamento
            , valor_entrada
            , valor_prestacao
            , quantidade_parcelas
            , carencia
            , status_proposta
        from {{ ref('stg_propostas') }}
    )

select *
from propostas