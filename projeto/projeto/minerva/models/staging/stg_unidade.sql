WITH temp_unidade AS (
    SELECT  DISTINCT 
        cod_unidade,
        nome_unidade
    FROM {{source('dw_hml', 'tab_rh_10a_hora')}}
)

SELECT * FROM temp_unidade