from django.db import models

class Anxietyscale(models.Model):
    question = models.TextField()

    def __str__(self):
        return self.question

class Depressionscale(models.Model):
    question = models.TextField()

    def __str__(self):
        return self.question