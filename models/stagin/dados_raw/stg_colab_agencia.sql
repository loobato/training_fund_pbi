with
    raw_colab_agencia as (
        select 
            cast(cod_colaborador as int) as id_colab
            , cast(cod_agencia as int) as id_agencia
        from {{ source('rawdata', 'colaborador_agencia') }}
    )

select *
from raw_colab_agencia
