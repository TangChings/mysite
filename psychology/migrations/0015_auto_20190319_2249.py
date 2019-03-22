# Generated by Django 2.1.1 on 2019-03-19 14:49

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('psychology', '0014_upi'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Anxietyscale',
            new_name='SCL90',
        ),
        migrations.AlterModelOptions(
            name='scl90',
            options={'verbose_name': '症状自评量表（SCL-90）', 'verbose_name_plural': '症状自评量表（SCL-90）'},
        ),
        migrations.AlterModelTable(
            name='scl90',
            table='scl90',
        ),
    ]
