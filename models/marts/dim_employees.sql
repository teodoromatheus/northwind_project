with
    selected as (
        select
        row_number() over (order by employee_id) as employee_sk /*Surrogate Key*/
        , employee_id
        , first_name
        , last_name
        , birth_date
        , notes
        , home_phone
        , title
        , title_of_courtesy
        , hire_date
        , reports_to
        , address
        , city
        , country								
        , postal_code
        , region
        from {{ ref("stg_employees") }}
    )

select * from selected
