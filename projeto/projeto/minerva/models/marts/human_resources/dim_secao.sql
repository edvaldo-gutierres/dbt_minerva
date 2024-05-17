{{
    config(
        materialized='table'
    )
}}

WITH CTE AS (
SELECT DISTINCT
    COALESCE(cod_secao, -1) AS cod_secao,
    COALESCE(desc_secao, 'Não encontrado') AS desc_secao
 FROM {{ref('stg_secao')}}
)
SELECT 
    ROW_NUMBER() OVER( ORDER BY "cod_secao") as sk_dim_secao, 
    cod_secao, 
    desc_secao
FROM CTE
