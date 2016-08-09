#NAVIGATE TO Tweetwordcount project folder
cd Tweetwordcount

#FOR INITIAL RUN OF TWITTER STREAM, MUST FIRST CREASE tcount IN POSTGRES before sparse run: 


psql -U postgres

CREATE DATABASE tcount;

\q

sparse run




#RE-RUNNING TWITTER STREAM:
## must delete out table tweetwordcount first then re-run sparse run

psql -U postgres

\c tcount

DROP TABLE tweetwordcount;

\q

sparse run

#### RUNNING PYTHON PROGRAMS ####

#RUNNING finalresults.py
## TO GET ALL WORDCOUNTS:
python finalresults.py

## TO GET CUSTOM WORDCOUNT OF 'day'
python finalresults.py day

#RUNNING HISTOGRAM
python histogram.py 4,8
