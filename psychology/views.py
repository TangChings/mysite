import json
from .models import Anxietyscale,Depressionscale
from django.http import HttpResponse
from django.core import serializers
from . import calculate

def get_questions(request):
    if request.GET['type'] == 'anxietyScale':
        data = serializers.serialize('json',Anxietyscale.objects.all(),fields = ('question'))
        print(data)
        return HttpResponse(data)
    elif request.GET['type'] == 'depressionScale':
        data = serializers.serialize('json',Depressionscale.objects.all(),fields = ('question'))
        return HttpResponse(data)
    elif request.GET['type'] == 'anxiety':
        score = calculate.calculate_anxiety(request.GET['result'])
        return HttpResponse(json.dumps(score))
    elif request.GET['type'] == 'depression':
        score = calculate.calculate_depression(request.GET['result'])
        return HttpResponse(json.dumps(score))
