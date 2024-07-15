with
    casting as (
        select 
            cast(cod_colaborador as int) as id_colab
            , cast(primeiro_nome as string) as nome_colab
            , cast(ultimo_nome as string) as sobrenome_colab
            , cast(email as string) as email_colab
            , cast(cpf as string) as cpf_colab
            , cast(data_nascimento as date) as data_nascimento
            , cast(endereco as string) as endereco_colab
            , cast(cep as string) as cep_colab
        from {{ source('rawdata', 'colaboradores') }}
    )
    , raw_colaboradores as (
        select 
            id_colab
            , nome_colab
            , sobrenome_colab
            , email_colab
            , cpf_colab
            , data_nascimento
            , endereco_colab
            , replace(cep_colab, '-', '') as cep_colab
        from casting
    )

select *
from raw_colaboradores
