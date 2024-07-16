with
    int_clientes as (
        select 
            id_cliente
            , nome_cliente
            , sobrenome_cliente
            , email_cliente
            , tipo_cliente
            , date(timestamp(data_inclusao)) as data_inclusao
            , cpfcnpj_cliente
            , data_nascimento_cliente
            , endereco_cliente
            , cep_cliente
            
        from {{ ref('stg_clientes') }}
    )

select *
from int_clientes