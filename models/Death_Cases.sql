
{{ config(materialized='table') }}

with DEATH_CASES as (

  SELECT New_Deaths_per_Million, New_Deaths, Total_Deaths,Total_Deaths_Per_Milion, Growth_Factor_of_new_Deaths
 cast(Date as date) Date,
Location_iso_code
 FROM FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_REUBEN_TARIBO

)

SELECT * FROM DEATH_CASES