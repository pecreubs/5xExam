
{{ config(materialized='table') }}

with POPULATIONS as (
SELECT DISTINCT LOCATION, POPULATION, Latitude, Longitude
 FROM FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_REUBEN_TARIBO

 )

select *
from POPULATIONS