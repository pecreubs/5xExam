
{{ config(materialized='table') }}

with Dates as (
SELECT Distinct cast(date as date) Date FROM FIVETRAN_INTERVIEW_DB.GOOGLE_SHEETS.COVID_19_INDONESIA_REUBEN_TARIBO
)

select *
from Dates