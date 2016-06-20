--Create table allowing for easy correlation queries grouping by provider_id and hospital_name
CREATE TABLE for_correlations as SELECT 
provider_id, hospital_name, AVG(score) as score_avg, STDDEV(score) as score_stddev, COUNT(score) as score_count, AVG(hcahps_base_score) as hcahps_base_score
FROM effective_care_filtered_joined2
GROUP BY provider_id, hospital_name
HAVING COUNT(score) >= 10
ORDER BY score_avg DESC
;

--Query correlations off of this created table
SELECT corr(score_avg, hcahps_base_score) FROM for_correlations;
SELECT corr(score_stddev, hcahps_base_score) FROM for_correlations;