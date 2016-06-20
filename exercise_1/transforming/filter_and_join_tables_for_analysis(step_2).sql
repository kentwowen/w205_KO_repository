--filter out bad data based on time measurements and # of patients etc. rather than a score out of 100
--also filter for sufficient sample size
CREATE TABLE effective_care_filtered as
SELECT *
FROM effective_care2
WHERE score NOT LIKE 'Not Available' AND
sample > 30 AND
measure_name NOT LIKE 'ED1' AND
measure_name NOT LIKE 'ED2' AND
measure_name NOT LIKE 'OP 18' AND
measure_name NOT LIKE '%Median%' AND
measure_name NOT LIKE 'Left before being seen' AND
measure_name NOT LIKE 'Door to diagnostic eval' AND
measure_name NOT LIKE 'Incidence of potentially preventable VTE'
;


-- joins state name, hospital name
CREATE TABLE effective_care_filtered_joined as
SELECT effective_care_filtered.*, hospitals2.state, hospitals2.hospital_name
FROM effective_care_filtered
JOIN hospitals2
ON effective_care_filtered.provider_id=hospitals2.provider_id
;

-- joins with survey data.
-- reduces 10% but matches to those that have survey responses for better analysis and will keep analysis consistent throughout
CREATE TABLE effective_care_filtered_joined2 as
SELECT effective_care_filtered_joined.*, survey_responses.HCAHPS_base_score
FROM effective_care_filtered_joined
JOIN survey_responses
ON effective_care_filtered_joined.provider_id=survey_responses.provider_id
;