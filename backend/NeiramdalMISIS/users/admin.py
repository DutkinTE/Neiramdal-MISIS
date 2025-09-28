from django.contrib import admin
from .models import Mission, TableMissions, TableSkills


@admin.register(Mission)
class MissionAdmin(admin.ModelAdmin):
    list_display = ("id", "title", "rank", "stage", "branch", "experience", "fragments", "status")
    search_fields = ("title", "rank", "stage", "branch")
    list_filter = ("rank", "status", "stage")


@admin.register(TableMissions)
class TableMissionsAdmin(admin.ModelAdmin):
    list_display = ("id", "mission", "dependentMissions")


@admin.register(TableSkills)
class TableSkillsAdmin(admin.ModelAdmin):
    list_display = ("id", "name", "mission", "value")
