with
    customers as (
        select *
        from {{ ref("dim_customers") }}
    ),
    employees as (
        select *
        from {{ ref("dim_employees") }}
    ),
    products as (
        select *
        from {{ ref("dim_products") }}
    ),
    shippers as (
        select *
        from {{ ref("dim_shippers") }}
    ),
    orders_sk as (
        select 
        o.order_id
        , c.customer_sk as customer_fk
        , e.employee_sk as employee_fk
        , s.shipper_sk as shipper_fk
        , o.order_date
        , o.required_date
        , o.shipped_date
        , o.ship_address
        , o.ship_city	
        , o.ship_country
        , o.ship_postal_code
        , o.ship_region																
        , o.ship_name									
        , o.freight_price
        from {{ ref("stg_orders") }} as o
        left join customers c on o.customer_id = c.customer_id
        left join employees e on o.employee_id = e.employee_id
        left join shippers s on o.shipper_id = s.shipper_id
    ),
    final as (
        select
        od.order_id
        , p.product_sk as product_fk
        , o.customer_fk
        , o.employee_fk
        , o.shipper_fk
        , od.quantity
        , od.unit_price_sale
        , od.discount
        , ROUND((od.quantity*od.unit_price_sale*(1-od.discount)),2) as total_price
        , o.order_date
        , o.required_date
        , o.shipped_date
        , o.ship_address
        , o.ship_city	
        , o.ship_country
        , o.ship_postal_code
        , o.ship_region																
        , o.ship_name									
        , o.freight_price
        from {{ ref("stg_order_details") }} as od
        left join products p on od.product_id = p.product_id
        left join orders_sk o on od.order_id = o.order_id
        order by order_date, order_id
    )

select * from final

