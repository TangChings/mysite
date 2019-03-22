# Generated by Django 2.1.1 on 2019-03-18 13:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('psychology', '0005_depressionscale'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserInfo',
            fields=[
                ('openid', models.CharField(max_length=40, primary_key=True, serialize=False, verbose_name='openid')),
                ('name', models.CharField(max_length=20, verbose_name='姓名')),
                ('gender', models.CharField(choices=[('male', '男'), ('female', '女')], default='male', max_length=10, verbose_name='性别')),
                ('stunum', models.CharField(max_length=20, verbose_name='学号')),
                ('tel', models.CharField(max_length=11, verbose_name='电话')),
            ],
            options={
                'verbose_name': '用户信息',
                'verbose_name_plural': '用户信息',
                'db_table': 'userinfo',
            },
        ),
    ]
