import 'package:dio/dio.dart';
import 'package:neiramdal_misis/core/network/dio_service.dart';
import '../auth.dart';

class AuthRepository {
  final UserStorage _userStorage;

  AuthRepository() : _userStorage = UserStorage();

  Future<UserModel> authenticate(AuthParamModel param) async {
    final Dio dio = DioService().client;
    try {
      final response = await dio.post(
        'register',
        data: {
          "username": param.username,
          "email": param.email,
          "password": param.password,
          "password2": param.password2,
          "first_name": param.firstName,
          "last_name": param.lastName,
          "initial_experience": param.initialExperience,
          "initial_money": param.initialMoney,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      return UserModel(
        id: response.data['id'],
        email: response.data['email'],
        firstName: response.data['first_name'],
        lastName: response.data['last_name'],
        experience: response.data['experience'],
        money: response.data['money'],
      );
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Ошибка аутентификации: ${e.response?.data}');
      } else {
        throw Exception('Ошибка сети: ${e.message}');
      }
    } catch (e) {
      throw Exception('Неизвестная ошибка: $e');
    }
  }

  Future<UserModel> login(String username, String password) async {
    final Dio dio = DioService().client;
    try {
      final response = await dio.post(
        '/login',
        data: {"username": username, "password": password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      final user = UserModel(
        id: response.data['user']['id'],
        email: response.data['user']['email'],
        firstName: response.data['user']['first_name'],
        lastName: response.data['user']['last_name'],
        experience: response.data['user']['profile']['experience'],
        money: response.data['user']['profile']['money'],
      );

      await _userStorage.saveUserData(user);

      return user;
    } on DioException catch (e) {
      if (e.response != null) {
        final errorData = e.response?.data;
        final errorMessage = errorData is Map
            ? errorData['message'] ?? errorData.toString()
            : errorData.toString();
        throw Exception('Ошибка входа: $errorMessage');
      } else {
        throw Exception('Ошибка сети: ${e.message}');
      }
    } catch (e) {
      throw Exception('Неизвестная ошибка: $e');
    }
  }

  Future<bool> checkAuthStatus() async {
    return false;
  }

  Future<UserModel> getCurrentUser() async {
    throw Exception('No saved user');
  }
}
