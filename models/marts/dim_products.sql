with
    products as (
        select
        row_number() over (order by product_id) as product_sk
        , *
        from {{ ref("stg_products") }}
    ),
    suppliers as (
        select
        *
        from {{ ref("stg_suppliers") }}
    ),
    categories as (
        select
        *
        from {{ ref("stg_categories") }}
    ),
    seed_division as (
        select 
        *
        from {{ ref("seed_divisions") }}
    ),
    selected as (
        select
        p.product_sk
        , p.product_id
        , p.product_name
        , p.unit_price
        , p.quantity_per_unit	
        , p.units_in_stock									
        , p.reorder_level							
        , p.units_on_order
        , p.discontinued
        , s.supplier_id
        , s.supplier_company_name
        , s.supplier_address
        , s.supplier_city
        , s.supplier_country
        , s.supplier_region	
        , s.supplier_postal_code
        , sd.division
        , c.category_id
        , c.category_name
        , c.description
        from products p
        left join suppliers s on p.supplier_id = s.supplier_id
        left join categories c on p.category_id = c.category_id
        left join seed_division sd on s.supplier_country = sd.country 
    )

select * from selected
    
