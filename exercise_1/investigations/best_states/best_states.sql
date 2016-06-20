--Query for max scores by state
SELECT state, AVG(score) as score_avg, STDDEV(score) as score_stddev, COUNT(score) as score_count 
FROM effective_care_filtered_joined2
GROUP BY state
HAVING COUNT(score) >= 10
ORDER BY score_avg DESC
LIMIT 20
;