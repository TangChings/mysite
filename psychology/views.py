import http.client, urllib.request, urllib.parse, urllib.error, requests, json, random
from .models import Depressionscale, Upi, SCL90
from django.http import HttpResponse
from django.core import serializers
from . import calculate
from .models import UserInfo, StuInfo, DepressionGrade, UpiGrade, SCLGrade


# 前端请求题目数据和计算答题结果
def get_questions(request):
    if request.GET['type'] == 'sclScale':
        data = serializers.serialize('json', SCL90.objects.all())
        return HttpResponse(data)
    elif request.GET['type'] == 'depressionScale':
        data = serializers.serialize('json', Depressionscale.objects.all())
        return HttpResponse(data)
    elif request.GET['type'] == 'upiScale':
        data = serializers.serialize('json', Upi.objects.all())
        return HttpResponse(data)
    elif request.GET['type'] == 'depression':
        score = calculate.calculate_depression(request.GET['result'])
        return HttpResponse(json.dumps(score))
    elif request.GET['type'] == 'upi':
        score = calculate.calculate_upi(request.GET['result'])
        return HttpResponse(json.dumps(score))
    elif request.GET['type'] == 'scl90':
        score = calculate.calculate_scl90(request.GET['result'])
        return HttpResponse(json.dumps(score))


# 获得openid
def get_openid(request):
    req_params = {
        "appid": 'wxe1086dd33f0a0d5b',
        "secret": 'f5751357f9b0d5e8980818a65e284bf8',
        "js_code": request.GET['code'],
        "grant_type": 'authorization_code'
    }
    res_result = requests.get('https://api.weixin.qq.com/sns/jscode2session', params=req_params, timeout=5,
                              verify=False)
    return HttpResponse(res_result)


# 获取验证码
def get_vericode(request):
    phone = request.GET['phone']
    vericode = random.randint(99999, 1000000)
    string = str(vericode)
    msg = '您的验证码为：' + string

    # 兰州大学短信接口

    data = {"vericode": vericode, "phoneNum": phone}
    return HttpResponse(json.dumps(data))


# 提交个人信息并保存到数据库
def sub_info(request):
    if request.GET['type'] == 'subinfo':
        # 处理前端返回的数据
        info = json.loads(request.GET['info'])
        gender = info['sex']
        name = info['name']
        stunum = info['stu']
        tel = info['tel']
        openid = info['openid']
        # 与学生信息表中的信息进行比对
        # stuinfo = StuInfo.objects.filter(number=stunum).name
        # print(stuinfo)
        # for stuinfo in stuinfos:
        #     stu_name = stuinfo.name
        # if stu_name == name:
        #     user_info = UserInfo()
        #     user_info.name = name
        #     user_info.gender =gender
        #     user_info.stunum = stunum
        #     user_info.tel = tel
        #     user_info.openid =openid
        #     user_info.save()
        # else:
        user_info = UserInfo()
        user_info.name = name
        user_info.gender = gender
        user_info.stunum = stunum
        user_info.tel = tel
        user_info.openid = openid
        user_info.save()
        return HttpResponse('ok')


# 上传成绩数据到数据库
def up_grade(request):
    if request.GET['type'] == 'depression':
        usr = UserInfo.objects.get(openid=request.GET['openid'])
        DepressionGrade.objects.create(
            user_info = usr,
            score = (request.GET['score']),
            time = json.loads(request.GET['time']),
        )
        print(request.GET['score'])
        return HttpResponse('ok')
    elif request.GET['type'] == 'upi':
        usr = UserInfo.objects.get(openid=request.GET['openid'])
        UpiGrade.objects.create(
            user_info = usr,
            score = (request.GET['score']),
            time = json.loads(request.GET['time']),
            type = request.GET['other']
        )
        return HttpResponse('ok')
    elif request.GET['type'] == 'SCL90':
        usr = UserInfo.objects.get(openid=request.GET['openid'])
        SCLGrade.objects.create(
            user_info = usr,
            sum = request.GET['sum'],
            average = request.GET['average'],
            t_score = json.loads(request.GET['t_score']),
            factor = request.GET['factor'],
            yang = request.GET['yang'],
            yin = request.GET['yin'],
            yang_average = request.GET['yang_average'],
            time = json.loads(request.GET['time'])
        )
        return HttpResponse('ok')