from django.contrib import admin
from .models import Anxietyscale,Depressionscale

# Register your models here.
@admin.register(Anxietyscale)
class AnxietyscaleAdmin(admin.ModelAdmin):
    list_play = ('id','question')

@admin.register(Depressionscale)
class DepressionscaleAdmin(admin.ModelAdmin):
    list_play = ('id','question')