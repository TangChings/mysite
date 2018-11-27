import datetime
from django.shortcuts import render_to_response
from django.contrib.contenttypes.models import ContentType
from blog.models import Blog
from read_statistics.utils import get_seven_days_read_data

def home(request):
    blog_content_type = ContentType.objects.get_for_model(Blog)
    read_nums = get_seven_days_read_data(blog_content_type)
    blogs_all_list = Blog.objects.filter(created_time__month=datetime.datetime.now().month,created_time__year=datetime.datetime.now().year)
    context = {}
    context['read_nums'] = read_nums
    context['recent_blogs'] = blogs_all_list
    return render_to_response('home.html',context)
