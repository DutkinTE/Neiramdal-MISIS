from django.urls import path
from .views import MissionListView, MissionCreateView, MissionByRankView, MissionUpdateView, TableMissionsCreateView

urlpatterns = [
    path('missions/', MissionListView.as_view(), name='mission-list'),               # GET
    path('missions/create/', MissionCreateView.as_view(), name='mission-create'),
    path('missions/create/TableMissions/', TableMissionsCreateView.as_view(), name='mission-create'),    # POST
    path('missions/rank/<str:rank>/', MissionByRankView.as_view(), name='mission-rank'),  # GET
    path('missions/update/<int:id>/', MissionUpdateView.as_view(), name='mission-update'),  # PUT/PATCH
]
