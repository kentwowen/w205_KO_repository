#!/bin/bash
clear

tail -n +2 ../'Hospital_Revised_Flatfiles'/'Hospital General Information.csv' > hospitals.csv
tail -n +2 ../'Hospital_Revised_Flatfiles'/'Timely and Effective Care - Hospital.csv' > effective_care.csv
tail -n +2 ../'Hospital_Revised_Flatfiles'/'Readmissions and Deaths - Hospital.csv' > readmissions.csv
tail -n +2 ../'Hospital_Revised_Flatfiles'/'Measure Dates.csv' > Measures.csv
tail -n +2 ../'Hospital_Revised_Flatfiles'/'hvbp_hcahps_05_28_2015.csv' > surveys_responses.csv