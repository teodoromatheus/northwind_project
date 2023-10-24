with
    source as (
        select *
        from {{ source('northwind_etl','products') }}
    )

select * from source