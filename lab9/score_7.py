#!/bin/python3

scores = []
pos_log = []
with open('test_res.txt','r') as f:
    line = f.readline()
    while line:
        if line[:5] == 'Score':
            scores.append(int(line[7:9]))
        if line[:4] == 'part':
            pos_log.append(line[4:])
        line = f.readline()

if len(scores) != 0:
    full = len([i for i in scores if i == 10])
    possi = full/len(scores)*100
    print(full,"/",len(scores))
    print(possi,'%') 

#for x in pos_log:
#    print(x)
	
