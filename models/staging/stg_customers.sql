with
    source as (
        select 
        /*Chave primária*/
        customer_id
        /*Informações para contato*/
        , contact_name as customer_name
        , phone	
        , fax
        /*Informações de endereço*/
        , address
        , city
        , country
        , region									
        , postal_code			
        /*Informações do trabalho do cliente*/														
        , company_name						
        , contact_title
        /*Colunas do Stitch*/
        , _sdc_table_version
        , _sdc_sequence	
        , _sdc_received_at	
        , _sdc_batched_at			
        from {{ source('northwind_etl','customers') }}
    )

select * from source