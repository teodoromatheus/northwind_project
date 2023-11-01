with
    selected as (
        select 
        row_number() over (order by shipper_id) as shipper_sk
        , shipper_id
        , company_name		
        , phone	
        from {{ ref("stg_shippers") }}
    )

select * from selected