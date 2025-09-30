from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth.models import User

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



class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='profile')
    experience = models.IntegerField(default=0, verbose_name="Опыт")
    money = models.IntegerField(default=0, verbose_name="Деньги")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Профиль {self.user.username}"

@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    if hasattr(instance, 'profile'):
        instance.profile.save()
