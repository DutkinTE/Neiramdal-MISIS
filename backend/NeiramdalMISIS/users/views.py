from rest_framework import generics, permissions
from .models import Mission
from .serializers import MissionSerializer


# 1. Список всех Missions
class MissionListView(generics.ListAPIView):
    queryset = Mission.objects.all()
    serializer_class = MissionSerializer
    permission_classes = [permissions.AllowAny]


# 2. Создание Missions
class MissionCreateView(generics.CreateAPIView):
    queryset = Mission.objects.all()
    serializer_class = MissionSerializer
    permission_classes = [permissions.AllowAny]


# 3. Выдача Missions по rank
class MissionByRankView(generics.ListAPIView):
    serializer_class = MissionSerializer
    permission_classes = [permissions.AllowAny]

    def get_queryset(self):
        rank = self.kwargs['rank']
        return Mission.objects.filter(rank=rank)


# 4. Update Missions
class MissionUpdateView(generics.UpdateAPIView):
    queryset = Mission.objects.all()
    serializer_class = MissionSerializer
    permission_classes = [permissions.AllowAny]
    lookup_field = "id"  # обновление по id
