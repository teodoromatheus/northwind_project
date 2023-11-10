with
    seed_division as (
        select
        *
        from {{ ref("seed_divisions") }}
    ),
    selected as (
        select
        row_number() over (order by s.customer_id) as customer_sk
        , s.customer_id
        , s.customer_name
        , s.phone
        , s.fax
        , s.address
        , s.city
        , s.country
        , s.region							
        , s.postal_code
        , sd.division													
        , s.company_name					
        , s.contact_title 
        from {{ ref("stg_customers") }} as s
        left join seed_division sd on s.country = sd.country
    )

select * from selected

