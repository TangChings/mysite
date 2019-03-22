from django.urls import path
from .views import get_openid,get_questions,get_vericode,sub_info,up_grade

urlpatterns = [
    path('',get_questions, name="get_questions"),
    path('openid/',get_openid, name="get_openid"),
    path('vericode/',get_vericode,name="get_vericode"),
    path('subinfo/',sub_info,name="sub_info"),
    path('upload/',up_grade,name="up_grade"),
]