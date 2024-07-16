with
    raw_clientes as (
        select 
            cast(cod_cliente as int) as id_cliente
            , cast(primeiro_nome as string) as nome_cliente
            , cast(ultimo_nome as string) as sobrenome_cliente
            , cast(email as string) as email_cliente
            , cast(tipo_cliente as string) as tipo_cliente
            , cast(data_inclusao as string) as data_inclusao
            , cast(cpfcnpj as string) as cpfcnpj_cliente
            , cast(data_nascimento as date) as data_nascimento_cliente
            , cast(endereco as string) as endereco_cliente
            , cast(replace(cep, '-', '') as string) as cep_cliente
            
        from {{ source('rawdata', 'clientes') }}
    )

select *
from raw_clientes
