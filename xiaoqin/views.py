from django.shortcuts import render_to_response

# Create your views here.
def generate_picture(request):
	return render_to_response('xiaoqin.html')