
{{ config(materialized='table') }}

with Month_on_Month as (

select sum(Total_Recovered) Total_Recovery,
sum(Total_cases_per_million) Total_cases_per_million,
sum(New_Deaths) New_Deaths, 
sum(Case_Fatality_Rate) Case_Fatality_Rate,
sum(New_Cases) New_Cases,
sum(Total_Deaths) Total_Deaths,
sum(Growth_Factor_of_New_Deaths) Growth_Factor_of_New_Deaths,
sum(New_Deaths_per_Million) New_Deaths_per_Million,
sum(New_Recovered) New_Recovery,
sum(case_recovered_rate) Cases_recovered_rate,
sum(New_Active_Cases) New_Active_Cases,
sum(Total_Active_Cases) Total_Active_Cases,
sum(Total_Cases) Total_Cases,
sum(Total_deaths_per_Million) Total_deaths_per_Million,
sum(Growth_Factor_of_New_Cases) Growth_Factor_of_New_Cases,
LAST_DAY(f.DATE) Months
from INTERVIEW_DB.PLAYGROUND_REUBEN_TARIBO.LOCATIONS a
left join INTERVIEW_DB.PLAYGROUND_REUBEN_TARIBO.DEATH_CASES b on a.location_iso_code = b.location_iso_code
left join INTERVIEW_DB.PLAYGROUND_REUBEN_TARIBO.ACTIVE_CASES c on a.location_iso_code = c.location_iso_code
left join INTERVIEW_DB.PLAYGROUND_REUBEN_TARIBO.NEW_CASES d on a.location_iso_code = d.location_iso_code
left join INTERVIEW_DB.PLAYGROUND_REUBEN_TARIBO.RECOVERIES e on a.location_iso_code = e.location_iso_code
left join INTERVIEW_DB.PLAYGROUND_REUBEN_TARIBO.DATE f on e.DATE = f.DATE
where f.date = d.DATE
and f.DATE = c.DATE
and f.DATE = b.DATE
group by LAST_DAY(f.DATE)
)

select * from Month_on_Month