

{{ config(materialized='table') }}

with covid19_final as (



select Total_Recovered Total_Recovery,
Total_cases_per_million Total_cases_per_million,
New_Deaths New_Deaths, 
Case_Fatality_Rate Case_Fatality_Rate,
New_Cases New_Cases,
Total_Deaths Total_Deaths,
Growth_Factor_of_New_Deaths Growth_Factor_of_New_Deaths,
New_Deaths_per_Million New_Deaths_per_Million,
New_Recovered New_Recovery,
case_recovered_rate Cases_recovered_rate,
New_Active_Cases New_Active_Cases,
Total_Active_Cases Total_Active_Cases,
Total_Cases Total_Cases,
Total_deaths_per_Million Total_deaths_per_Million,
Growth_Factor_of_New_Cases Growth_Factor_of_New_Cases,
a.CONTINENT, 
a.COUNTRY, 
a.LOCATION,
f.DATE
from INTERVIEW_DB.PLAYGROUND_REUBEN_TARIBO.LOCATIONS a
left join INTERVIEW_DB.PLAYGROUND_REUBEN_TARIBO.DEATH_CASES b on a.location_iso_code = b.location_iso_code
left join INTERVIEW_DB.PLAYGROUND_REUBEN_TARIBO.ACTIVE_CASES c on a.location_iso_code = c.location_iso_code
left join INTERVIEW_DB.PLAYGROUND_REUBEN_TARIBO.NEW_CASES d on a.location_iso_code = d.location_iso_code
left join INTERVIEW_DB.PLAYGROUND_REUBEN_TARIBO.RECOVERIES e on a.location_iso_code = e.location_iso_code
left join INTERVIEW_DB.PLAYGROUND_REUBEN_TARIBO.DATE f on e.DATE = f.DATE
where f.date = d.DATE
and f.DATE = c.DATE
and f.DATE = b.DATE

)

select * from covid19_final