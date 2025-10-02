from django.urls import path
from .views import (
    MissionListView, MissionCreateView, MissionByRankView,
    MissionUpdateView, TableMissionsCreateView,
    RegisterView, UserProfileView, ChangePasswordView,
    LoginView, LogoutView, UserDeleteView, UpdateUserStatsView, AddUserStatsView
)

urlpatterns = [
    path('register', RegisterView.as_view(), name='register'),
    path('login', LoginView.as_view(), name='login'),
    path('logout', LogoutView.as_view(), name='logout'),
    path('profile/<int:id>', UserProfileView.as_view(), name='user-profile'),
    path('change-password', ChangePasswordView.as_view(), name='change-password'),
    path('user/delete/<int:id>', UserDeleteView.as_view(), name='user-delete'),
    path('user/stats/update/<int:id>', UpdateUserStatsView.as_view(), name='update-user-stats'),
    path('user/stats/update', UpdateUserStatsView.as_view(), name='update-current-user-stats'),
    path('user/stats/add/<int:id>', AddUserStatsView.as_view(), name='add-user-stats'),
    path('user/stats/add', AddUserStatsView.as_view(), name='add-current-user-stats'),

    path('missions', MissionListView.as_view(), name='mission-list'),
    path('missions/create', MissionCreateView.as_view(), name='mission-create'),
    path('missions/create/TableMissions', TableMissionsCreateView.as_view(), name='table-mission-create'),
    path('missions/rank/<str:rank>', MissionByRankView.as_view(), name='mission-rank'),
    path('missions/update/<int:id>', MissionUpdateView.as_view(), name='mission-update'),
]
