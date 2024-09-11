-- made by gpt

WITH dates AS (
    SELECT 
        date AS data
    FROM 
        UNNEST(GENERATE_DATE_ARRAY('2010-01-01', '2023-12-31', INTERVAL 1 DAY)) AS date
),
dimensao AS (
    SELECT 
        data, 
        EXTRACT(YEAR FROM data) AS ano,
        EXTRACT(MONTH FROM data) AS mes,
        EXTRACT(DAY FROM data) AS dia,
        EXTRACT(WEEK FROM data) AS numero_semana,
        EXTRACT(QUARTER FROM data) AS trimestre,
        FORMAT_DATE('%A', data) AS dia_semana,
        CASE 
            WHEN EXTRACT(DAYOFWEEK FROM data) IN (1, 7) THEN TRUE -- 1 = domingo, 7 = sábado no BigQuery
            ELSE FALSE 
        END AS fim_de_semana
    FROM dates
)

SELECT * 
FROM dimensao
