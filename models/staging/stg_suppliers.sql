with 
    source as (
        select
        /*Chave primária*/
        supplier_id
        /*Informações dos fornecedores*/
        , company_name as supplier_company_name
        , address as supplier_address
        , country as supplier_country
        , city as supplier_city	
        , region as supplier_region	
        , postal_code as supplier_postal_code						
        , homepage as supplier_homepage			
        /*Informações de contato do fornecedor*/											
        , contact_name as supplier_contact_name
        , contact_title	as supplier_contact_title				
        , phone as supplier_phone
        , fax as supplier_fax		
        /*Colunas do Stitch*/
        , _sdc_received_at
        , _sdc_sequence
        , _sdc_table_version					
        , _sdc_batched_at			
        from {{ source('northwind_etl','suppliers') }}
    )
 
 select * from source