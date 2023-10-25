with 
    source as (
        select
        /*Chave primária*/
        order_id
        /*Chave estrangeira*/
        , customer_id
        , employee_id
        , ship_via as shipper_id
        /*Datas de pedido e estimativa de entrega*/
        , cast(order_date as date) as order_date
        , cast(required_date as date) as required_date
        /*Informação da expedição (entrega)*/
        , cast(shipped_date as date) as shipped_date
        , ship_address
        , ship_city	
        , ship_country
        , ship_postal_code
        , ship_region																
        , ship_name									
        , freight as freight_price						
        /*Coluna do Stitch*/					
        , _sdc_received_at
        , _sdc_table_version
        , _sdc_batched_at	
        , _sdc_sequence
        from {{ source('northwind_etl','orders') }}
    )

select * from source