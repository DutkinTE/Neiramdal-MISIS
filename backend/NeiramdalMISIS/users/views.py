from django.http import Http404
from rest_framework import generics, permissions, status
from .models import Mission, TableMissions
from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth import login, logout, update_session_auth_hash
from .serializers import (
    RegisterSerializer, UserSerializer, ChangePasswordSerializer,
    LoginSerializer, MissionSerializer, TableMissionsSerializer
)
from django.contrib.auth.models import User


class RegisterView(generics.CreateAPIView):
    queryset = User.objects.all()
    serializer_class = RegisterSerializer
    permission_classes = [permissions.AllowAny]


class LoginView(APIView):
    permission_classes = [permissions.AllowAny]

    @staticmethod
    def post(request):
        serializer = LoginSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.validated_data['user']
            login(request, user)
            return Response({
                "message": "Успешный вход в систему",
                "user": UserSerializer(user).data
            })
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class LogoutView(APIView):
    permission_classes = [permissions.AllowAny]

    @staticmethod
    def post(request):
        logout(request)
        return Response({"message": "Успешный выход из системы"})


class UserProfileView(generics.RetrieveAPIView):
    serializer_class = UserSerializer
    permission_classes = [permissions.AllowAny]

    def get_object(self):
        user_id = self.kwargs['id']
        try:
            return User.objects.get(id=user_id)
        except User.DoesNotExist:
            raise Http404("User does not exist")


class ChangePasswordView(APIView):
    permission_classes = [permissions.AllowAny]

    def put(self, request):
        serializer = ChangePasswordSerializer(data=request.data, context={'request': request})
        if serializer.is_valid():
            user = request.user
            user.set_password(serializer.validated_data['new_password'])
            user.save()
            update_session_auth_hash(request, user)
            return Response({"message": "Пароль успешно изменен"})
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UserDeleteView(APIView):
    permission_classes = [permissions.AllowAny]

    def delete(self, request, id=None):
        if id:
            try:
                user_to_delete = User.objects.get(id=id)
            except User.DoesNotExist:
                return Response(
                    {"error": "Пользователь не найден"},
                    status=status.HTTP_404_NOT_FOUND
                )
        else:
            user_to_delete = request.user


        username = user_to_delete.username
        user_to_delete.delete()

        return Response(
            {"message": f"Пользователь {username} успешно удален"},
            status=status.HTTP_200_OK
        )


class UpdateUserStatsView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def patch(self, request, id=None):
        if id:
            try:
                user = User.objects.get(id=id)
            except User.DoesNotExist:
                return Response(
                    {"error": "Пользователь не найден"},
                    status=status.HTTP_404_NOT_FOUND
                )
        else:
            user = request.user

        # Проверка прав
        if id and id != request.user.id and not request.user.is_superuser:
            return Response(
                {"error": "У вас нет прав для изменения этого пользователя"},
                status=status.HTTP_403_FORBIDDEN
            )

        experience = request.data.get('experience')
        money = request.data.get('money')

        if experience is not None:
            user.profile.experience = experience
        if money is not None:
            user.profile.money = money

        user.profile.save()

        return Response({
            "message": "Данные обновлены",
            "user": UserSerializer(user).data
        })


class AddUserStatsView(APIView):
    permission_classes = [permissions.IsAuthenticated]

    def patch(self, request, id=None):
        if id:
            try:
                user = User.objects.get(id=id)
            except User.DoesNotExist:
                return Response(
                    {"error": "Пользователь не найден"},
                    status=status.HTTP_404_NOT_FOUND
                )
        else:
            user = request.user

        # Проверка прав
        if id and id != request.user.id and not request.user.is_superuser:
            return Response(
                {"error": "У вас нет прав для изменения этого пользователя"},
                status=status.HTTP_403_FORBIDDEN
            )

        experience = request.data.get('experience', 0)
        money = request.data.get('money', 0)

        user.profile.experience += experience
        user.profile.money += money
        user.profile.save()

        return Response({
            "message": "Данные добавлены",
            "added_experience": experience,
            "added_money": money,
            "user": UserSerializer(user).data
        })


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


# 5. Создание Missions
class TableMissionsCreateView(generics.CreateAPIView):
    queryset = TableMissions.objects.all()
    serializer_class = TableMissionsSerializer
    permission_classes = [permissions.AllowAny]
