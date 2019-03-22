from django.contrib import admin
from .models import Depressionscale,Upi,SCL90,DepressionGrade,UpiGrade,SCLGrade

# Register your models here.
@admin.register(SCL90)
class SCL90Admin(admin.ModelAdmin):
    list_play = ('id','question')

@admin.register(SCLGrade)
class SCLGradeAdmin(admin.ModelAdmin):
    list_display = ('id','sum')

@admin.register(Depressionscale)
class DepressionscaleAdmin(admin.ModelAdmin):
    list_play = ('id')

@admin.register(DepressionGrade)
class DepressionGradeAdmin(admin.ModelAdmin):
    list_display = ('id','score')

@admin.register(Upi)
class UpiAdmin(admin.ModelAdmin):
    list_play = ('id','question')

@admin.register(UpiGrade)
class UpiGradeAdmin(admin.ModelAdmin):
    list_display = ('id','score')