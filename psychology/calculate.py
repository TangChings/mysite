import json
import numpy as np


def calculate_depression(result):
    # 将json数据转化为python对象
    pydata = json.loads(result)
    # 将字符串转化为整型
    intdata = list(map(int, pydata))
    aList = intdata
    intscore = str(int(sum(aList)))
    return intscore


def calculate_upi(result):
    pydata = json.loads(result)
    intdata = list(map(int, pydata))
    li_1 = intdata
    # 辅助题答案列表:1/0
    li_2 = []
    li_2.append(li_1[63])
    li_2.append(li_1[62])
    li_2.append(li_1[61])
    li_2.append(li_1[60])
    # 常规题答案列表:1/0
    li_1.pop(63)
    li_1.pop(62)
    li_1.pop(61)
    li_1.pop(60)
    # 求和
    # UPI 总分的计算规则是：除测伪题(第5、20、35、50题)以外的其它56 个题，肯定选择的题记1分，否定选择的题记0分，并求总和。所以，UPI总分最高为56分，最低为0分。
    score_1 = np.sum(li_1) - li_1[4] - li_1[19] - li_1[34] - li_1[49]
    score_2 = np.sum(li_2)
    if score_1 >= 25 or li_1[24] == 1 or score_2 >= 2:
        type = "第一类"
    elif 25 > score_1 >= 20 or li_1[8] + li_1[16] + li_1[26] > 0 or score_2 == 1:
        type = "第二类"
    else:
        type = "第三类"
    upi_score = {}
    upi_score['score'] = int(score_1)
    upi_score['type'] = str(type)
    return upi_score


def calculate_scl90(result):
    pydata = json.loads(result)
    intdata = list(map(int, pydata))
    li = intdata
    # 总分
    score = sum(li)
    var_score = score / 90
    # F因子-累计得分
    s = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    s[0] = li[0] + li[3] + li[11] + li[26] + li[39] + li[41] + li[47] + li[48] + li[51] + li[52] + li[55] + li[57]
    s[1] = li[2] + li[8] + li[9] + li[27] + li[37] + li[44] + li[45] + li[50] + li[54] + li[64]
    s[2] = li[5] + li[20] + li[33] + li[35] + li[36] + li[40] + li[60] + li[68] + li[72]
    s[3] = li[4] + li[13] + li[14] + li[19] + li[21] + li[25] + li[28] + li[29] + li[30] + li[31] + li[53] + li[70] + \
           li[78]
    s[4] = li[1] + li[16] + li[22] + li[32] + li[38] + li[56] + li[71] + li[77] + li[79] + li[85]
    s[5] = li[10] + li[23] + li[62] + li[66] + li[73] + li[80]
    s[6] = li[12] + li[24] + li[46] + li[49] + li[69] + li[74] + li[81]
    s[7] = li[7] + li[17] + li[42] + li[67] + li[75] + li[82]
    s[8] = li[6] + li[15] + li[34] + li[61] + li[76] + li[83] + li[84] + li[86] + li[87] + li[89]
    s[9] = li[18] + li[43] + li[58] + li[59] + li[63] + li[65] + li[88]
    # T分数-s/项目数
    t = [0,0,0,0,0,0,0,0,0,0]
    t[0] = s[0] / 12
    t[1] = s[1] / 10
    t[2] = s[2] / 9
    t[3] = s[3] / 13
    t[4] = s[4] / 10
    t[5] = s[5] / 6
    t[6] = s[6] / 7
    t[7] = s[7] / 6
    t[8] = s[8] / 10
    t[9] = s[9] / 7
    F_score = sum(t)

    # 阳性项目数
    x_yang = 0
    for i in range(90):
        if li[i] >= 2:
            x_yang += 1

    # 阴性项目数
    x_yin = 0
    for i in range(90):
        if li[i] == 1:
            x_yin += 1

    # 阳性症状均分
    x_yang_var = (score - x_yin) / x_yang

    scl_score = {}
    t_score = {}
    t_score['0'] = round(t[0],2)
    t_score['1'] = round(t[1],2)
    t_score['2'] = round(t[2],2)
    t_score['3'] = round(t[3],2)
    t_score['4'] = round(t[4],2)
    t_score['5'] = round(t[5],2)
    t_score['6'] = round(t[6],2)
    t_score['7'] = round(t[7],2)
    t_score['8'] = round(t[8],2)
    t_score['9'] = round(t[9],2)
    scl_score['sum'] = score
    scl_score['average'] = round(var_score,2)
    scl_score['t_score'] = t_score
    scl_score['factor'] = round(F_score,2)
    scl_score['yang'] = x_yang
    scl_score['yin'] = x_yin
    scl_score['yang_average'] = round(x_yang_var,2)
    return scl_score
