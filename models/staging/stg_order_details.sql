with
    source as (
        select
        /*Chaves estrangeiras*/
        order_id
        , product_id
        /*Informações da compra*/
        , quantity
        , unit_price
        , discount					
        /*Colunas do Stitch*/
        , _sdc_table_version			
        , _sdc_received_at		
        , _sdc_sequence						
        , _sdc_batched_at
        from {{ source('northwind_etl','order_details') }}
    )

select * from source