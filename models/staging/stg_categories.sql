with  
    source as (
        select
        /*Chave primária*/
        category_id
        /*Informações das categorias*/					
        , category_name						
        , description
        /*Colunas do Stitch*/						
        , _sdc_sequence						
        , _sdc_table_version						
        , _sdc_received_at						
        , _sdc_batched_at			
        from {{ source('northwind_etl','categories') }}
    )

select * from source