#!/bin/bash
clear

#Remove headers before upload
tail -n +2 ../'Hospital_Revised_Flatfiles'/'Hospital General Information.csv' > hospitals.csv
tail -n +2 ../'Hospital_Revised_Flatfiles'/'Timely and Effective Care - Hospital.csv' > effective_care.csv
tail -n +2 ../'Hospital_Revised_Flatfiles'/'Readmissions and Deaths - Hospital.csv' > readmissions.csv
tail -n +2 ../'Hospital_Revised_Flatfiles'/'Measure Dates.csv' > Measures.csv
tail -n +2 ../'Hospital_Revised_Flatfiles'/'hvbp_hcahps_05_28_2015.csv' > surveys_responses.csv

#Moving files into HDFS

scp -i ucb1.pem hospitals.csv root@ec2-54-165-90-175.compute-1.amazonaws.com:~/../home/w205/hospital_compare
scp -i ucb1.pem effective_care.csv root@ec2-54-165-90-175.compute-1.amazonaws.com:~/../home/w205/hospital_compare
scp -i ucb1.pem readmissions.csv root@ec2-54-165-90-175.compute-1.amazonaws.com:~/../home/w205/hospital_compare
scp -i ucb1.pem Measures.csv root@ec2-54-165-90-175.compute-1.amazonaws.com:~/../home/w205/hospital_compare
scp -i ucb1.pem surveys_responses.csv root@ec2-54-165-90-175.compute-1.amazonaws.com:~/../home/w205/hospital_compare
