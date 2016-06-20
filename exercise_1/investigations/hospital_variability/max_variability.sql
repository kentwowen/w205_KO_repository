--Query for max variability by procedure with # of scores at least equal to 10
SELECT measure_id, measure_name, AVG(score) as score_avg, STDDEV(score) as score_stddev, COUNT(score) as score_count 
FROM effective_care_filtered_joined2
GROUP BY measure_id, measure_name
HAVING COUNT(score) >= 5
ORDER BY score_stddev DESC
LIMIT 10
;