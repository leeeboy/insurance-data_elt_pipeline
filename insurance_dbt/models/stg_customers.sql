with raw as(
    select 
        customer_id,
        policy_type,
        state
    from {{source('snowflake', 'customers')}}
)
--selecting everything from CTE
select * from raw