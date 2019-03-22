# Generated by Django 2.1.1 on 2019-03-19 03:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('psychology', '0010_auto_20190319_0911'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='anxietyscale',
            options={'verbose_name': '贝克抑郁'},
        ),
        migrations.RemoveField(
            model_name='anxietyscale',
            name='question',
        ),
        migrations.AddField(
            model_name='anxietyscale',
            name='question1',
            field=models.TextField(default='', max_length=100),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='anxietyscale',
            name='question2',
            field=models.TextField(default='', max_length=100),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='anxietyscale',
            name='question3',
            field=models.TextField(default='', max_length=100),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='anxietyscale',
            name='question4',
            field=models.TextField(default='', max_length=100),
            preserve_default=False,
        ),
        migrations.AlterModelTable(
            name='anxietyscale',
            table='anxietyscale',
        ),
    ]
