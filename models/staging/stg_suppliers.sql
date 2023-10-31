with 
    source as (
        select
        /*Chave primária*/
        supplier_id
        /*Informações dos fornecedores*/
        , company_name
        , address
        , country						
        , city				
        , region					
        , postal_code						
        , homepage				
        /*Informações de contato do fornecedor*/											
        , contact_name
        , contact_title					
        , phone
        , fax							
        /*Colunas do Stitch*/
        , _sdc_received_at
        , _sdc_sequence
        , _sdc_table_version					
        , _sdc_batched_at			
        from {{ source('northwind_etl','suppliers') }}
    )
 
 select * from source