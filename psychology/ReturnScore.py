import json
from django.http import HttpResponse
from . import calculate

def score_response(request):
    if request.GET['type'] == 'anxiety':
        score = calculate.calculate_anxiety(request.GET['result'])
        return HttpResponse(json.dumps(score))
    if request.GET['type'] == 'depression':
        score = calculate.calculate_depression(request.GET['result'])
        return HttpResponse(json.dumps(score))