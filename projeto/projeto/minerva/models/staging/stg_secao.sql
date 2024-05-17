WITH temp_secao AS (
    SELECT  DISTINCT 
        cod_secao,
        desc_secao
    FROM {{source('dw_hml', 'tab_rh_10a_hora')}}
)

SELECT * FROM temp_secao