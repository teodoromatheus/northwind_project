with
    selected as (
        select
        row_number() over (order by customer_id) as customer_sk
        , customer_id
        , customer_name
        , phone
        , fax
        , address
        , city
        , country
        , region							
        , postal_code														
        , company_name					
        , contact_title
        from {{ ref("stg_customers") }}
    )

select * from selected

