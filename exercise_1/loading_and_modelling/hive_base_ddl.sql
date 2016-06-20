--HOSPITALS TABLE
DROP TABLE hospitals;
CREATE EXTERNAL TABLE hospitals (
provider_id string,
hospital_name string,
address string,
city string,
state string,
zip_code string,
county_name string,
phone_number string,
hospital_type string,
hospital_ownership string,
emergency_services string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';

--EFFECTIVE_CARE
DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care (
provider_id string,
hospital_name string,
address string,
city string,
state string,
zip_code string,
county_name string,
phone_number string,
condition string,
measure_id string,
measure_name string,
score string,
sample string,
footnote string,
measure_start_date string,
measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care';


--READMISSIONS
DROP TABLE readmissions;
CREATE EXTERNAL TABLE readmissions  (
provider_id string,
hospital_name string,
address string,
city string,
state string,
zip_code string,
county_name string,
phone_number string,
measure_name string,
measure_id string,
compared_to_national string,
denominator string,
score string,
lower_estimate string,
higher_estimate string,
footnote string,
measure_start_date string,
measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';


--MEASURES
CREATE EXTERNAL TABLE MEASURES (
measure_name string,
measure_id string,
measure_start_quarter string,
measure_start_date string,
measure_end_quarter string,
measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/Measures';


--SURVEY_RESPONSES
DROP TABLE survey_responses;
CREATE EXTERNAL TABLE survey_responses  (
provider_id string,
hospital_name string,
address string,
city string,
state string,
zip_code string,
county_name string,
comm_nurses_acheivement string,
comm_nurses_improvement string,
comm_nurses_dim string,
comm_doctors_acheivement string,
comm_doctors_improvement string,
comm_doctors_dim string,
responsiveness_hospstaff_acheivement string,
responsiveness_hospstaff_improvement string,
responsiveness_hospstaff_dim string,
painmgmt_acheivement string,
painmgmt_improvement string,
painmgmt_dim string,
comm_medicines_acheivement string,
comm_medicines_improvement string,
comm_medicines_dim string,
clean_quiet_acheivement string,
clean_quiet_improvement string,
clean_quiet_dim string,
discharge_info_acheivement string,
discharge_info_improvement string,
discharge_info_dim string,
overall_rating_acheivement string,
overall_rating_improvement string,
overall_rating_dim string,
HCAHPS_base_score string,
HCAHPS_consistency_score string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/survey_responses';