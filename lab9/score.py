#!/bin/python3

scores = []
with open('test_res.txt','r') as f:
    line = f.readline()
    while line:
        if  line[0] in '0123456':
            scores.append(int(line[:2]))
        line = f.readline()


print(sum(scores)/len(scores))
full = len([i for i in scores if i == 65])
possi = full/len(scores)*100
possi = int(possi*100)/100
print(full,"/",len(scores))
print(possi,'%') 
	
	
