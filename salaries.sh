#!/bin/bash
# cool beans, let's roll
#f=$1
f="salaries.csv"

echo "(1) TOP SALARIES IN THE CITY!!"
# those making the big bucks
cat salaries.csv | sed 's/\$//g' | sort -t , -k 8 -n -r | head -10 | column -s "," -t
echo

echo "(2) CITY EMPLOYEES"
# total folks workin' for the city
cat salaries.csv | wc -l | awk '{print $1-1}'
echo

echo "(3 and 4) :: FULL AND PART-TIME WORKERS"
# 30859 full time & 1953 PART-TIME
cut -d, -f5 salaries.csv | sort | uniq -c
echo

echo "(5 and 6) HIGHEST HOURLY WAGES"
# Dr. JONES is doing well
cat salaries.csv | sed 's/\$//g' | sort -t , -k 9 -n -r | head -10 | column -s "," -t
echo

  echo "(7) TOTAL NUMBER OF POLICE OFFICERS"
# total should add up to 10708.
 grep -i "police officer" salaries.csv | wc -l
echo

echo "(8) TOTAL NUMBER OF DETECTIVES"
# should add up to 1016
grep "POLICE.*DETECTIVE" salaries.csv | wc -l
echo

echo "(9) THE MODAL FIREMAN"
# for most common value, not sure if desired manner of getting there but this seemed to have worked
cat salaries.csv | grep -i "Fire" | cut -d, -f8 salaries.csv | sort | uniq -c | sort -r | sed 's/7861//g'


echo "(10) NAMES FOR POLICE OFFICERS"
# I tried getting rid of everyone's middle initial, but this didn't turn out well and ultimately led to all instances of certain letters vanishing whether or not they were within a name or an initial
grep -i "police officer" salaries.csv | cut -d, -f2 salaries.csv | uniq -c | sed 's/\"//g' | column -s "," -t | sort -t , -k 2 -n -r | head -10
