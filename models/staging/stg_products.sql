with
    source as (
        select 
        /*Chave primária*/
        product_id
        /*Chave estrangeira*/				
        , category_id
        , supplier_id
        /*Descrição*/
        , product_name
        , unit_price
        , quantity_per_unit	
        , units_in_stock									
        , reorder_level							
        , units_on_order						
        , case
            when discontinued = 0 then False
            else True
          end as discontinued
        /*Colunas do Stitch*/
        , _sdc_table_version	
        , _sdc_sequence
        , _sdc_batched_at
        , _sdc_received_at	
        from {{ source('northwind_etl','products') }}
    )

select * from source