with
    source as (
        select
        /*Chave primária*/
        employee_id
        /*Informações do funcionário*/
        , first_name
        , last_name
        , cast(birth_date as date) as birth_date
        , notes
        , home_phone
        /*Informações do cargo*/
        , title
        , title_of_courtesy
        , cast(hire_date as date) as hire_date
        , reports_to
        /*Informações de endereço*/
        , address
        , city
        , country								
        , postal_code
        , region					
        /*Outras informações*/					
        , extension							
        , photo_path		
        /*Colunas do Stitch*/
        , _sdc_received_at						
        , _sdc_sequence
        , _sdc_batched_at
        , _sdc_table_version
        from {{ source('northwind_etl','employees') }}
    )

select * from source