{{ 
    config(
        materialized='table',
        ) 
}}

SELECT
    du.sk_dim_unidade,
    ds.sk_dim_secao,
    matricula_funcionario,
    data,
    h_base,
    h_extra
FROM {{source('dw_hml', 'tab_rh_10a_hora')}} AS fato

LEFT JOIN {{ref("dim_unidade")}} AS du
ON COALESCE(fato.cod_unidade, -1) = du.cod_unidade

LEFT JOIN {{ref("dim_secao")}} AS ds
ON COALESCE(fato.cod_secao, -1) = ds.cod_secao
