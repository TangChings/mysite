from django.shortcuts import render_to_response
from blog.models import Blog
import datetime

def home(request):
    blogs_all_list = Blog.objects.filter(created_time__month=datetime.datetime.now().month,created_time__year=datetime.datetime.now().year)
    context = {}
    context['recent_blogs'] = blogs_all_list
    return render_to_response('home.html',context)
