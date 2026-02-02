with raw as(
    select 
        claim_id,
        customer_id,
        to_date(date) as claim_date, --converting claim data to date format
        amount::float as amount, --converting amount to float data type
        claim_type,
        is_fraud::boolean as is_fraud
    from {{source('snowflake', 'claims')}}
)
--selecting everything from CTE
select * from raw