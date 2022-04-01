

{{ config(materialized='table') }}

with Recoveries as (

 SELECT Total_Recovered, New_Recovered, Case_recovered_Rate,
 cast(Date as date) Date,
Location_iso_code
 FROM FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_REUBEN_TARIBO

  )

select *
from Recoveries