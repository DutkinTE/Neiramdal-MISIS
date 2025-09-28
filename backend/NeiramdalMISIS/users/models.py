from django.db import models


class Mission(models.Model):
    title = models.CharField("title", max_length=200)
    description = models.TextField("description")
    stage = models.CharField("stage", max_length=100)
    branch = models.CharField("branch", max_length=100)
    rank = models.CharField("rank", max_length=100)
    experience = models.IntegerField("experience")
    fragments = models.IntegerField("fragments")
    status = models.CharField("status", max_length=100)


class TableMissions(models.Model):
    mission = models.ForeignKey(Mission, on_delete=models.CASCADE, related_name="dependencies")
    dependentMissions = models.CharField("dependentMissions", max_length=100)


class TableSkills(models.Model):
    name = models.CharField("name", max_length=100)
    mission = models.ForeignKey(Mission, on_delete=models.CASCADE, related_name="skills")
    value = models.CharField("value", max_length=100)
