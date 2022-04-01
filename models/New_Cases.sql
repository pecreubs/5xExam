
{{ config(materialized='table') }}

with New_cases as (

SELECT New_cases, Case_Fatality_Rate, Total_cases,Total_cases_per_Million, Growth_Factor_of_new_cases,
cast(Date as date) Date,
Location_iso_code
 FROM FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_REUBEN_TARIBO
)

select *
from New_cases
 