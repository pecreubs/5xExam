
{{ config(materialized='table') }}

with COVID_STATS as (
SELECT Total_Recovered,
Total_cases_per_million,
New_Deaths, 
Case_Fatality_Rate,
New_Cases,
Total_Deaths,
Total_Rural_Villages,
Total_Regencies,
Growth_Factor_of_New_Deaths,
New_Deaths_per_Million,
New_Recovered,
New_Deaths,
New_Active_Cases,
Total_Cases,
Total_deaths_per_Million,
Growth_Factor_of_New_Cases,
cast(Date as date) Date,
Location_iso_code
FROM FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_REUBEN_TARIBO
)

select *
from COVID_STATS
