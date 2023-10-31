with
    source as (
        select 
        /*Chave primária*/
        shipper_id
        /*Informações dos expedidores (entregadores)*/	
        , company_name				
        , phone					
        /*Colunas do Stitch*/
        , _sdc_sequence						
        , _sdc_table_version						
        , _sdc_received_at						
        , _sdc_batched_at			
        from {{ source('northwind_etl','shippers') }}
    )

select * from source