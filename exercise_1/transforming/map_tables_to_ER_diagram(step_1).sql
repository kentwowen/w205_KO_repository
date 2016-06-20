--HOSPITALS TABLE
CREATE TABLE hospitals2 as 
SELECT 
provider_id,
hospital_name,
address,
city,
state,
zip_code,
county_name,
phone_number,
hospital_type,
hospital_ownership,
emergency_services
FROM hospitals
;



--EFFECTIVE_CARE
CREATE TABLE effective_care2 as
SELECT 
provider_id,
measure_id,
measure_name,
score,
sample,
footnote
FROM effective_care
;

--TRIED BUT DOESN'T ADD CREATE INDEX procedure_id ON TABLE effective_care2 (provider_id, measure_id) AS 'COMPACT' WITH DEFERRED REBUILD;



--READMISSIONS
CREATE TABLE readmissions2 as
SELECT
provider_id,
measure_id,
compared_to_national,
denominator,
score,
lower_estimate,
higher_estimate,
footnote
FROM readmissions;


--MEASURES
CREATE TABLE measures2 as
SELECT
measure_name,
measure_id,
measure_start_quarter,
measure_start_date,
measure_end_quarter,
measure_end_date
from measures;


--SURVEY_RESPONSES
CREATE TABLE survey_responses2 as SELECT
provider_id,
comm_nurses_acheivement,
comm_nurses_improvement,
comm_nurses_dim,
comm_doctors_acheivement,
comm_doctors_improvement,
comm_doctors_dim,
responsiveness_hospstaff_acheivement,
responsiveness_hospstaff_improvement,
responsiveness_hospstaff_dim,
painmgmt_acheivement,
painmgmt_improvement,
painmgmt_dim,
comm_medicines_acheivement,
comm_medicines_improvement,
comm_medicines_dim,
clean_quiet_acheivement,
clean_quiet_improvement,
clean_quiet_dim,
discharge_info_acheivement,
discharge_info_improvement,
discharge_info_dim,
overall_rating_acheivement,
overall_rating_improvement,
overall_rating_dim,
HCAHPS_base_score,
HCAHPS_consistency_score
FROM survey_responses;