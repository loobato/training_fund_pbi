with 
    colaboradores as (
        select *
        from {{ ref('stg_colaboradores') }}
    )
    , colab_agencia as (
        select *
        from {{ ref('stg_colab_agencia') }}
    )
    , join_all as (
        select 
            colaboradores.id_colab
            , colab_agencia.id_agencia
            , colaboradores.nome_colab
            , colaboradores.sobrenome_colab
            , colaboradores.email_colab
            , colaboradores.cpf_colab
            , colaboradores.data_nascimento
            , colaboradores.endereco_colab
            , colaboradores.cep_colab
        from colaboradores
        join colab_agencia
        on colaboradores.id_colab = colab_agencia.id_colab
    )

select *
from join_all
