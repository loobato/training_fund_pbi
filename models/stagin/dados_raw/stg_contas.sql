with
    raw_contas as (
        select 
            cast(num_conta as int) as id_conta
            , cast(cod_cliente as int) as id_cliente
            , cast(cod_agencia as int) as id_agencia
            , cast(cod_colaborador as int) as id_colab 
            , cast(tipo_conta as string) as tipo_conta
            , cast(data_abertura as string) as data_abertura
            , round(cast(saldo_total as numeric), 2) as saldo_total
            , round(cast(saldo_disponivel as numeric), 2) as saldo_disponivel
            , cast(data_ultimo_lancamento as string) as data_ultimo_lancamento
        from {{ source('rawdata', 'contas') }}
    )

select *
from raw_contas
