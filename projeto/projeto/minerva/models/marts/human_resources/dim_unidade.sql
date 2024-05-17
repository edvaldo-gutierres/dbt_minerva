{{
    config(
        materialized='table'
    )
}}

WITH CTE AS (
SELECT DISTINCT
    COALESCE(cod_unidade, '-1') AS cod_unidade,
    COALESCE(nome_unidade, 'Não encontrado') AS nome_unidade
 FROM {{ref('stg_unidade')}}
)
SELECT 
    ROW_NUMBER() OVER( ORDER BY "cod_unidade") as sk_dim_unidade, 
    cod_unidade, 
    nome_unidade
FROM CTE
