from django.shortcuts import render_to_response,get_object_or_404
from django.core.paginator import Paginator
from .models import Blog,BlogType

def blogs_public_functions(request,blogs_all_list):
    paginator = Paginator(blogs_all_list, 10)
    page_num = request.GET.get('page', 1)
    page_of_blogs = paginator.get_page(page_num)
    current_page_num = page_of_blogs.number  # 获取当前页面页码
    page_range = list(range(max(current_page_num - 2, 1), current_page_num)) + list(
        range(current_page_num, min(current_page_num + 2, paginator.num_pages) + 1))  # 分页器显示优化
    if page_range[0] - 1 >= 2:
        page_range.insert(0, '...')
    if paginator.num_pages - page_range[-1] >= 2:
        page_range.append('...')
    if page_range[0] != 1:
        page_range.insert(0, 1)
    if page_range[-1] != paginator.num_pages:
        page_range.append(paginator.num_pages)
    # page_range = [
    # i for i in range(int(current_page_num) - 2,int(current_page_num) + 3)
    # if 0 < i <= paginator.num_pages
    # ]
    context = {}
    context['blogs'] = page_of_blogs.object_list
    context['page_of_blogs'] = page_of_blogs
    context['page_range'] = page_range
    context['blog_types'] = BlogType.objects.all()
    context['blog_dates'] = Blog.objects.dates('created_time', 'month', order="DESC")
    return context

def blog_list(request):
    blogs_all_list = Blog.objects.all()
    context = blogs_public_functions(request,blogs_all_list)
    return render_to_response('blog/blog_list.html',context)

def blogs_with_type(request,blog_type_pk):
    blog_type = get_object_or_404(BlogType,pk=blog_type_pk)
    blogs_all_list = Blog.objects.filter(blog_type=blog_type)
    context = blogs_public_functions(request,blogs_all_list)
    context['blog_type'] = blog_type
    return render_to_response('blog/blogs_with_type.html',context)

def blogs_with_date(request,year,month):
    blogs_all_list = Blog.objects.filter(created_time__year=year,created_time__month=month)
    context = blogs_public_functions(request,blogs_all_list)
    context['blogs_with_date'] = '%s年%s月' % (year,month)
    return render_to_response('blog/blogs_with_date.html',context)

def blog_detail(request,blog_pk):
    context = {}
    blog = get_object_or_404(Blog,pk=blog_pk)
    context['previous_blog'] = Blog.objects.filter(created_time__gt=blog.created_time).last()
    context['next_blog'] = Blog.objects.filter(created_time__lt=blog.created_time).first()
    context['blog'] = blog
    return render_to_response('blog/blog_detail.html',context)

def blog_about(request):
    context = {}
    return render_to_response('blog/about.html',context)

