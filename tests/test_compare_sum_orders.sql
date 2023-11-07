/*Esse teste compara a volumetria de orders da tabela order_details (staging data) e a volumetria
de orders da tabela fato*/

with
    sum_raw_data as (
        select count(order_id) as qtd_raw
        from {{ ref("stg_order_details") }}
    )
    ,
    sum_fact_data as (
        select count(order_id) as qtd_fact
        from {{ ref("fact_order_details") }}
    )

select * from sum_fact_data
where qtd_fact != (select qtd_raw from sum_raw_data)