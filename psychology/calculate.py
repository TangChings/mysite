import json

def calculate_anxiety(result):
    #将json数据转化为python对象
    pydata = json.loads(result)
    #将字符串转化为整型
    intdata = list(map(int, pydata))
    aList = intdata
    bList = []
    #根据评测规则将题目分数进行整理
    bList.append(aList[4])
    bList.append(aList[8])
    bList.append(aList[12])
    bList.append(aList[16])
    bList.append(aList[18])
    aList.pop(18)
    aList.pop(16)
    aList.pop(12)
    aList.pop(8)
    aList.pop(4)
    for i in range(0, 5):
        if bList[i] == 1:
            bList[i] = 4
        elif bList[i] == 2:
            bList[i] = 3
        elif bList[i] == 3:
            bList[i] = 2
        elif bList[i] == 4:
            bList[i] = 1
    #计算得分
    intscore = int(sum(aList) * 1.25 + sum(bList) * 1.25)
    return intscore

def calculate_depression(result):
    pydata = json.loads(result)
    intdata = list(map(int,pydata))
    aList = intdata
    bList = []
    bList.append(aList[1])
    bList.append(aList[4])
    bList.append(aList[5])
    bList.append(aList[10])
    bList.append(aList[11])
    bList.append(aList[13])
    bList.append(aList[15])
    bList.append(aList[16])
    bList.append(aList[17])
    bList.append(aList[19])
    aList.pop(19)
    aList.pop(17)
    aList.pop(16)
    aList.pop(15)
    aList.pop(13)
    aList.pop(11)
    aList.pop(10)
    aList.pop(5)
    aList.pop(4)
    aList.pop(1)
    for i in range(0,10):
        if bList[i] == 1:
            bList[i] = 4
        elif bList[i] == 2:
            bList[i] = 3
        elif bList[i] == 3:
            bList[i] = 2
        elif bList[i] == 4:
            bList[i] = 1

    intscore = int(sum(aList) * 1.25 + sum(bList) * 1.25)
    return intscore