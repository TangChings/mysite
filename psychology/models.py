from django.db import models


# 用户信息表，记录小程序用户的个人信息
class UserInfo(models.Model):
    openid = models.CharField(max_length=40, primary_key=True, verbose_name='openid')
    name = models.CharField(max_length=20, verbose_name='姓名')
    gender = models.CharField(max_length=10, choices=(('male', '男'), ('female', '女')), default='male',
                              verbose_name='性别')
    stunum = models.CharField(max_length=20, verbose_name='学号')
    tel = models.CharField(max_length=11, verbose_name='电话')

    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name
        db_table = 'userinfo'


# 学生信息表，用于对照学生姓名校园卡号的真实性
class StuInfo(models.Model):
    name = models.CharField(max_length=20, verbose_name='姓名')
    number = models.CharField(max_length=20, verbose_name='学号')

    class Meta:
        verbose_name = '学生信息'
        verbose_name_plural = verbose_name
        db_table = 'stuinfo'


# 贝克抑郁成绩表
class DepressionGrade(models.Model):
    user_info = models.ForeignKey(UserInfo, on_delete=models.CASCADE)
    score = models.IntegerField()
    time = models.TextField()
    created_time = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = '贝克抑郁分数'
        verbose_name_plural = verbose_name
        db_table = 'depressiongrade'

    def __str__(self):
        return str(self.user_info)


# 贝克抑郁量表
class Depressionscale(models.Model):
    question1 = models.TextField(max_length=100)
    question2 = models.TextField(max_length=100)
    question3 = models.TextField(max_length=100)
    question4 = models.TextField(max_length=100)

    class Meta:
        verbose_name = '贝克抑郁'
        verbose_name_plural = verbose_name
        db_table = 'depressionscale'

    def __str__(self):
        return str(self.id)


# UPI成绩表
class UpiGrade(models.Model):
    user_info = models.ForeignKey(UserInfo, on_delete=models.CASCADE)
    score = models.IntegerField()
    time = models.TextField()
    created_time = models.DateTimeField(auto_now=True)
    type = models.CharField(max_length=10)

    class Meta:
        verbose_name = 'UPI分数'
        verbose_name_plural = verbose_name
        db_table = 'upigrade'

    def __str__(self):
        return str(self.user_info)


# 大学生人格问卷UPI
class Upi(models.Model):
    question = models.TextField()

    class Meta:
        verbose_name = '大学生人格问卷'
        verbose_name_plural = verbose_name
        db_table = 'upi'

    def __str__(self):
        return self.question


# SCL90成绩表
class SCLGrade(models.Model):
    user_info = models.ForeignKey(UserInfo, on_delete=models.CASCADE)
    sum = models.IntegerField()
    average = models.FloatField()
    t_score = models.CharField(max_length=100)
    factor = models.FloatField()
    yang = models.IntegerField()
    yin = models.IntegerField()
    yang_average = models.FloatField()
    time = models.TextField()
    created_time = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name = 'SCL90分数'
        verbose_name_plural = verbose_name
        db_table = 'scl90grade'

    def __str__(self):
        return str(self.user_info)

# 症状自评量表SCL90
class SCL90(models.Model):
    question = models.TextField()

    class Meta:
        verbose_name = '症状自评量表（SCL-90）'
        verbose_name_plural = verbose_name
        db_table = 'scl90'

    def __str__(self):
        return self.question
