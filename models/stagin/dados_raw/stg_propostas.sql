with
    raw_propostas as (
        select 
            cast(cod_proposta as int) as id_propostas
            , cast(cod_cliente as int) as id_cliente
            , cast(cod_colaborador as int) as id_colab
            , cast(data_entrada_proposta as string) as data_proposta
            , cast(taxa_juros_mensal as numeric) as taxa_juros_mensal
            , cast(valor_proposta as numeric) as valor_proposta
            , cast(valor_financiamento as numeric) as valor_financiamento
            , cast(valor_entrada as numeric) as valor_entrada
            , cast(valor_prestacao as numeric) as valor_prestacao
            , cast(quantidade_parcelas as int) as quantidade_parcelas
            , cast(carencia as int) as carencia
            , cast(status_proposta as string) as status_proposta

        from {{ source('rawdata', 'propostas_credito') }}
    )

select *
from raw_propostas
