#!/bin/bash

for((i=0;i<10000;i++))
do
    ./grade_1.py -t >> test_res.txt
done
