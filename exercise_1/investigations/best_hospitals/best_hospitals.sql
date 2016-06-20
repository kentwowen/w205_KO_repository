--Query for max scores by hospital with # of scores at least equal to 10
SELECT provider_id, hospital_name, AVG(score) as score_avg, STDDEV(score) as score_stddev, COUNT(score) as score_count 
FROM effective_care_filtered_joined2
GROUP BY provider_id, hospital_name
HAVING COUNT(score) >= 10
ORDER BY score_avg DESC
LIMIT 20
;