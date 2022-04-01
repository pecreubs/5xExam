
{{ config(materialized='table') }}

with Active_Cases as (

 select Total_active_cases, New_Active_Cases, 
  cast(Date as date) Date,
Location_iso_code
 FROM FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_REUBEN_TARIBO
 )

select *
from Active_Cases