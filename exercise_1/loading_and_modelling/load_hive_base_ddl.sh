#!/bin/bash
clear

scp -i ucb1.pem hive_base_ddl.sql root@ec2-54-165-90-175.compute-1.amazonaws.com:~/../home/w205/hospital_compare
